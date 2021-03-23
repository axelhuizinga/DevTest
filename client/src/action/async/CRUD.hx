package action.async;
import haxe.Exception;
import me.cunity.debug.Out;
import haxe.Json;
import db.DBAccessProps;
import js.lib.Promise;
import haxe.Unserializer;
import action.AppAction;
import action.StatusAction;
import js.html.Blob;
import state.UserState;
import state.AppState;
import haxe.Serializer;
import haxe.http.HttpJs;
import state.DataAccessState;

import js.html.XMLHttpRequest;

import redux.Redux.Dispatch;
import redux.thunk.Thunk;
import loader.BinaryLoader;
import shared.DbData;
import shared.DbDataTools;
import view.shared.OneOf;
import db.DBAccessProps;
using shared.Utils;
/**
 * ...
 * @author axel@cunity.me
 */


class CRUD
{
	public static function create() {
		
	}

	public static function delete() {
		
	}

	public static function read(param:DBAccessProps) 
	{
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			//trace(getState());
			Out.dumpObject(param);
			return new Promise(function(resolve, reject){
				if (!param.dbUser.online)
				{
					param.dbUser.last_error = 'Du musst dich neu anmelden!';
					dispatch(User(LoginError(
					{
						dbUser:param.dbUser,
						lastError:'Du musst dich neu anmelden!'
					})));
					trace('LoginError');
					var dbData:DbData = DbDataTools.create(['LoginError'=>'Du musst dich neu anmelden!']);
					reject(dbData);
				}
				var bl:XMLHttpRequest = BinaryLoader.dbQuery(
					'${App.config.api}', 
					param,
					function(data:DbData)
					{			
						trace(data.dataInfo);
						trace(data.dataRows.length);
						if(data.dataRows.length>0) 
						{
							if(!data.dataErrors.keys().hasNext())
							{
								trace(data.dataRows[0]);
								dispatch(Status(Update( 
									{	className:'',
										text:(param.resolveMessage==null?'':param.resolveMessage.success)
									}
								)));								
								resolve(data);
							}
							else 
							{
								//TODO: IMPLEMENT GENERIC FAILURE FEEDBACK
								dispatch(Status(Update(
									{
										className:'error',
										text:Json.stringify(data.dataErrors),
									})));
								reject(data);
							}				
						}
						else
							dispatch(Status(Update(
							{
								className: 'warn',
								text: 'Keine Daten für ${Json.stringify(param.filter)} gefunden'
							}))); 
					}
				);
			});
		});
	}
	
	public static function update(param:DBAccessProps) 
	{	
		Out.dumpObjectRSafe(param);
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState):Promise<Dynamic>{
			//trace(param);
			//if(param.dataSource != null)
				//trace(param.dataSource.get('contacts').get('data'));
			
			var dbData:DbData = DbDataTools.create();
			//trace(getState());
			return new Promise<Dynamic>(function(resolve, reject){
				try{
				if (!param.dbUser.online)
				{
					dispatch(User(LoginError(
					{
						dbUser:param.dbUser,
						lastError:'Du musst dich neu anmelden!'
					})));
					trace('LoginError');
					reject('Du musst dich neu anmelden!');
				}	
				
				var bL:XMLHttpRequest = BinaryLoader.dbQuery(
					'${App.config.api}', 
					param,
					function(data:DbData)
					{				
						//trace(data);
						if(data.dataErrors != null)
							trace(data.dataErrors);
						if(data.dataInfo != null && data.dataInfo.exists('dataSource'))
							trace(new Unserializer(data.dataInfo.get('dataSource')).unserialize());

						if(data.dataErrors.exists('lastError'))
						{
							dispatch(User(LoginError({lastError: data.dataErrors.get('lastError')})));
							reject(data.dataErrors.get('lastError'));
						}
						if(data.dataErrors.toString() != '{}')
						{
							dispatch(Status(Update( 
								{	className:'error',
									text:(param.resolveMessage==null?'':param.resolveMessage.failure)				
								}
							)));							
							reject(param.resolveMessage);
						}
						else{

							dispatch(Status(Update( 
								{	className:'',
									text:(param.resolveMessage==null?'':param.resolveMessage.success)				
								}
							)));
							resolve('updated');
						}
					}
				);
				trace(bL);
				}
				catch(ex:Exception){
					trace(ex.stack);
				}
			});	
		});
			
	}

}