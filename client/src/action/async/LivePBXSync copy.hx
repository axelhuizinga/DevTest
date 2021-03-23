package action.async;

import db.DBAccessProps;
//import db.DBAccessProps;
import react.ReactUtil;
import js.lib.Promise;
import haxe.ds.IntMap;
import state.UserState;
import state.AppState;
import action.AppAction;
import action.DataAction;
import haxe.ds.Either;
import haxe.Serializer;
import state.DataAccessState;

import js.html.XMLHttpRequest;

import redux.Redux.Dispatch;
import redux.thunk.Thunk;
import shared.DbData;
import shared.DbDataTools;
import loader.BinaryLoader;

using shared.Utils;

/**
 * ...
 * @author axel@cunity.me
 */

class LivePBXSync
{
	public static function create() {
		
	}

	public static function delete() {
		
	}

	/*static function createOrUpdateAction(props:DBAccessProps):DBAccessAction{
		
		var actionFields:Array<String> = [
			'action','classPath','offset','onlyNew','id','limit','maxImport'//,'totalRecords'
		];		
		//return '{"action":${props.action}, "classP}'
	}*/

	public static function importContacts(props:DBAccessProps) 
	{
		trace('${props.table} ${props.maxImport} ${props.limit} ${props.offset}');
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			var aState:AppState = getState();
			trace(props.offset);
			if (!props.userState.dbUser.online)
			{
				return dispatch(User(LoginError(
				{
					dbUser:props.userState.dbUser,
					lastError:'Du musst dich neu anmelden!'
				})));
			}				
			trace('creating BinaryLoader ${App.config.api}');
			var bl:XMLHttpRequest = BinaryLoader.dbQuery(
				'${App.config.api}', 
				{
					dbUser:props.userState.dbUser,
					classPath:props.classPath,
					action:props.action,
					extDB:true,
					action_id:(props.action_id == null?0:props.action_id),
					limit:props.limit,
					offset:props.offset,
					table:props.table,
					filter:props.filter,
					maxImport:props.maxImport==null?1000:props.maxImport,
					devIP:App.devIP
				},
				function(data:DbData)
				{			
					trace(data.dataInfo);
					trace(data.dataRows.length);
					if(data.dataErrors.keys().hasNext())
					{
						trace(data.dataErrors.toString());
						return dispatch(Status(Update(
							{
								className:'error',
								text:data.dataErrors.iterator().next()
							}							
						)));
						//return resolve(DbDataTools.create(['Error'=>'?']));
					} 
					if(data.dataInfo['offset']==null||data.dataInfo['offset']==0)
					{
						return dispatch(Status(Update(
							{
								className:'error',
								text:'Fehler 0 ${props.classPath} Aktualisiert'})));
					}
					else
					//if(data.dataInfo['offset']!=null)
					{
						props.offset = Std.parseInt(data.dataInfo['offset']);
						return dispatch(Status(Update(
						{
							className:' ',
							text:'${props.offset} Contacts von ${props.maxImport} aktualisiert'
						})));
					}
					trace('${props.offset} < ${props.maxImport}');
					if(props.offset < props.maxImport){
						//LOOP UNTIL LIMIT
						trace('next loop:${props}');
						return dispatch(importContacts(props));
					}
					
					return null;
				}
			);
			return null;
		});
	}

	public static function importBookingRequests(props:DBAccessProps) 
	{
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			var aState:AppState = getState();
			trace(props.offset);
			if (!props.userState.dbUser.online)
			{
				return dispatch(User(LoginError(
				{
					dbUser:props.userState.dbUser,
					lastError:'Du musst dich neu anmelden!'
				})));
			}				
			trace('creating BinaryLoader ${App.config.api}');
			var bl:XMLHttpRequest = BinaryLoader.create(
				'${App.config.api}', 
				{
					id:props.userState.dbUser.id,
					jwt:props.userState.dbUser.jwt,
					classPath:props.classPath,
					action:props.action,
						extDB:true,
					limit:props.limit,
					offset:props.offset,
					filter:props.filter,
					//firstBatch:props.offset==0, 
					maxImport:props.maxImport==null?1000:props.maxImport,
					devIP:App.devIP
				},
				function(data:DbData)
				{			
					trace(data);
					trace(data.dataRows.length);
					if(data.dataErrors.keys().hasNext())
					{
						return dispatch(Status(Update(
							{
								className:'error',
								text:data.dataErrors.iterator().next()
							}							
						)));
					} 
					trace(data.dataInfo);
					if(data.dataInfo['offset']==null)
					{
						return dispatch(Status(Update(
							{
								className:'error',
								text:'Fehler 0 Buchungsanforderungen Aktualisiert'})));
					}
					//props.batchCount += data.dataInfo['offset'];
					if(data.dataInfo['offset']!=null)
					{
						props.offset = Std.parseInt(data.dataInfo['offset']);
						dispatch(Status(Update(
							{
								className:' ',
								text:'${props.offset} Kontakte von ${props.maxImport} aktualisiert'})));
					}
					trace('${props.offset} < ${props.maxImport}');
					if(props.offset < props.maxImport){
						//LOOP UNTIL LIMIT
						trace('next loop:${props}');
						return dispatch(importContacts(props));
					}
						
					return null;
				}
			);
			return null;
		});

	}

	public static function mergeContacts(props:DBAccessProps) 
	{
		trace('${props.maxImport} ${props.limit} ${props.offset}');
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			var aState:AppState = getState();
			trace(props);
			if (!props.userState.dbUser.online)
			{
				return dispatch(User(LoginError(
				{
					dbUser:props.userState.dbUser,
					lastError:'Du musst dich neu anmelden!'					
				})));
			}				
			trace('creating BinaryLoader ${App.config.api}');
			var bl:XMLHttpRequest = BinaryLoader.create(
				'${App.config.api}', 
				{
					dbUser:props.userState.dbUser,
					id:props.userState.dbUser.id,
					jwt:props.userState.dbUser.jwt,
					classPath:props.classPath,
					action:props.action,
						extDB:true,
					limit:props.limit,
					offset:props.offset,
					filter:props.filter,
					//firstBatch:props.offset==0, 
					maxImport:props.maxImport==null?1000:props.maxImport,
					devIP:App.devIP
				},
				function(data:DbData)
				{			
					trace(data);
					trace(data.dataRows.length);
					if(data.dataErrors.keys().hasNext())
					{
						return dispatch(Status(Update(
							{
								className:'error',
								text:data.dataErrors.iterator().next()
							}							
						)));
					} 
					trace(data.dataInfo);
					if(data.dataInfo['offset']==null)
					{
						return dispatch(Status(Update(
							{
								className:'error',
								text:'Fehler 0 Kontakte Aktualisiert'})));
					}
					//props.batchCount += data.dataInfo['offset'];
					if(data.dataInfo['offset']!=null)
					{
						props.offset = Std.parseInt(data.dataInfo['offset']);
						dispatch(Status(Update(
							{
								className:'',
								text:'${props.offset} Kontakte von ${props.maxImport} aktualisiert'})));
					}
					trace('${props.offset} < ${props.maxImport}');
					if(props.offset < props.maxImport){
						//LOOP UNTIL LIMIT
						trace('next loop:${props}');
						return dispatch(importContacts(props));
					}
						
					return null;
				}
			);
			return null;
		});
	}	

	/* GET NEW CONTACTS FROM OLD fly_crm server */

	public static function checkAll(props:DBAccessProps) 
	{
		trace('${props.table} ${props.maxImport} ${props.limit} ${props.offset}');
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			var aState:AppState = getState();
			trace(props.offset);
			//return new Promise(function(resolve, reject){
				if (!props.userState.dbUser.online)
				{
					return dispatch(User(LoginError(
					{
						dbUser:props.userState.dbUser,
						lastError:'Du musst dich neu anmelden!'
					})));
					//resolve(DbDataTools.create(['LoginError'=>'Du musst dich neu anmelden!']));
				}				
				trace('creating BinaryLoader ${App.config.api}');
				var bl:XMLHttpRequest = BinaryLoader.dbQuery(
					'${App.config.api}',
					{
						dbUser:props.userState.dbUser,
						classPath:props.classPath,
						action:props.action,
						extDB:true,
						limit:props.limit,
						offset:props.offset,
						onlyNew:props.onlyNew,
						table:props.table,
						filter:props.filter,
						maxImport:props.maxImport==null?1000:props.maxImport,
						devIP:App.devIP
					},
					function(data:DbData)
					{			
						trace(data.dataInfo);
						//trace(data.dataRows.length);
						if(data.dataErrors.keys().hasNext())
						{
							return dispatch(Status(Update(
								{
									className:'error',
									text:data.dataErrors.iterator().next()
								}							
							)));
						} 
						trace(data.dataInfo);
						if(data.dataInfo['missing'] >0 && data.dataInfo['got'] != data.dataInfo['missing'])
						{
							return dispatch(Status(Update(
							{
								className:'error',
								text:'Fehler ${data.dataInfo['got']} von ${data.dataInfo['missing']} Aktualisiert'})));
							}

						trace('got:' + Std.parseInt(untyped 666));
						if(data.dataInfo['got']>0 && data.dataInfo['last_import_cid'] == data.dataInfo['max_client_id'])
						{
							return dispatch(Status(Update(
							{
								className:' ',
								text:'${data.dataInfo['got']} von ${data.dataInfo['missing']} aktualisiert'
							})));
						}	
						if(data.dataInfo['got']>0)
						{
							//LOOP UNTIL LIMIT
							dispatch(Status(Update(
								{
									className:' ',
									text:'${data.dataInfo['got']} von ${data.dataInfo['missing']} aktualisiert - lade weitere'
								})));
							if(!props.onlyNew){
								props.offset += data.dataInfo['got'];
							}																							
							trace('next loop:${props}');
							return dispatch(importContacts(props));
						}
						trace((data.dataInfo['got'] >0 && data.dataInfo['last_import_cid'] != data.dataInfo['max_client_id'] ? 'loop':'no'));
						return null;
					}
				);
			return null;
		});
	}
		
	public static function importDeals(props:DBAccessProps) 
	{
		trace('${props.maxImport} ${props.limit} ${props.offset}');
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			var aState:AppState = getState();
			trace(props);
			if (!props.userState.dbUser.online)
			{
				return dispatch(User(LoginError(
				{
					dbUser:props.userState.dbUser,
					lastError:'Du musst dich neu anmelden!'					
				})));
			}				
			trace('creating BinaryLoader ${App.config.api}');
			var bl:XMLHttpRequest = BinaryLoader.create(
				'${App.config.api}', 
				{
					dbUser:props.userState.dbUser,
					id:props.userState.dbUser.id,
					jwt:props.userState.dbUser.jwt,
					classPath:props.classPath,
					action:props.action,
						extDB:true,
					limit:props.limit,
					offset:props.offset,
					onlyNew:props.onlyNew,
					filter:props.filter,
					min_age:70,
					//param['min_age']firstBatch:props.offset==0, 
					maxImport:props.maxImport==null?1000:props.maxImport,
					devIP:App.devIP
				},
				function(data:DbData)
				{			
					//trace(data);
					//trace(data.dataRows.length);
					if(data.dataErrors.keys().hasNext())
					{
						return dispatch(Status(Update(
							{
								className:'error',
								text:data.dataErrors.iterator().next()
							}							
						)));
					} 
					trace(data.dataInfo);
					if(data.dataInfo['missing'] >0 && data.dataInfo['got'] != data.dataInfo['missing'])
						{
							return dispatch(Status(Update(
							{
								className:'error',
								text:'Fehler ${data.dataInfo['got']} von ${data.dataInfo['missing']} Aktualisiert'})));
							}

						if(data.dataInfo['got']>0 && data.dataInfo['last_import_cid'] == data.dataInfo['max_client_id'])
						{
							return dispatch(Status(Update(
							{
								className:' ',
								text:'${data.dataInfo['got']} von ${data.dataInfo['missing']} aktualisiert'
							})));
						}	
						if(data.dataInfo['got']>0)
						{
							//LOOP UNTIL LIMIT
							dispatch(Status(Update(
								{
									className:' ',
									text:'${data.dataInfo['got']} von ${data.dataInfo['missing']} aktualisiert - lade weitere'
								})));
							if(!props.onlyNew){
								props.offset += data.dataInfo['got'];
							}																							
							trace('next loop:${props}');
							return dispatch(importContacts(props));
						}
						trace((data.dataInfo['got'] >0 && data.dataInfo['last_import_cid'] != data.dataInfo['max_client_id'] ? 'loop':'no'));
						return null;
					// first=>
					/*if(data.dataInfo['got']==null)
					{
						return dispatch(Status(Update(
						{
							className:'error',
							text:'Fehler 0 Deals Aktualisiert'
						})));
					}
					//props.batchCount += data.dataInfo['offset'];
					var nProps:Dynamic = {};
					if(data.dataInfo.get('got')!=null)
					{
						nProps = ReactUtil.copy(props,{
							got:data.dataInfo['got'],
							maxImport:data.dataInfo['maxImport'],
							offset:data.dataInfo['offset']
						});
						
						trace(nProps);
						dispatch(Status(Update(
						{
							className:' ',
							text:'${nProps.offset} Deals von ${nProps.maxImport} geladen oder aktualisiert'
						})));
					}
					trace('${nProps.offset} < ${nProps.maxImport}');
					if(nProps.offset < nProps.maxImport){
						//LOOP UNTIL LIMIT
						//trace('next loop:${props}');
						return dispatch(importDeals(nProps));
					}						
					return null;*/
				}
			);
			return null;
		});
	}		
}