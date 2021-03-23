package action.async;

import db.DBAccessProps;
import haxe.Json;
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

import shared.DbDataTools;
import shared.DbData;
import loader.BinaryLoader;
import view.shared.OneOf;

using shared.Utils;
/**
 * ...
 * @author axel@cunity.me
 */


class DBAccess
{
	public static function create() {
		
	}

	public static function delete() {
		
	}

	public static function get(props:DBAccessProps) 
	{
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			//trace(getState());
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
			//return;
			var bl:XMLHttpRequest = BinaryLoader.create(
				'${App.config.api}', 
				{
					id:props.userState.dbUser.id,
					jwt:props.userState.dbUser.jwt,
					classPath:props.classPath,
					action:props.action,
					filter:props.filter,
					//dataSource:Serializer.run(props.dataSource),
					table:props.table,
					devIP:App.devIP
				},
				function(data:DbData)
				{			
					trace(data.dataInfo);
					trace(data.dataRows.length);
					if(data.dataRows.length>0) 
					{
						if(!data.dataErrors.keys().hasNext())
						{
							trace(data.dataRows);
							dispatch(AppAction.Data(SelectContacts([
								for(row in data.dataRows)
									Std.parseInt(row['id']) => row
							])));//.then(function()trace('yeah'));
							return dispatch(Status(Update({className:'', text:switch ('${props.classPath}.${props.action}')
							{
								case "data.Contacts.get":
									'Kontakt ${props.filter.substr(3)} geladen';
								case "data.Contacts.update":
									'Kontakt ${props.filter.substr(3)} wurde gespeichert';
								default:
									"Unbekannter Vorgang"; 
							}})));
						}
						else 
						{
							//TODO: IMPLEMENT GENERIC FAILURE FEEDBACK
							return dispatch(Status(Update(
								{
									className:'error',
									text:'${data.dataErrors.get(props.action)}',
								})));
						
						}				
					}
					else
						return dispatch(Status(Update(
							{
								className: 'warn',
								text: 'Keine Daten für ${props.filter.substr(3)} gefunden'
							})));
				}
			);
			return null;
		});
	}

	public static function execute(props:DBAccessProps) 
	{	//trace(props);
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState):Promise<Dynamic>{
			trace(props);
			//trace(getState());
			if (!props.userState.dbUser.online)
			{
				return dispatch(User(LoginError(
				{
					dbUser:props.userState.dbUser,
					lastError:'Du musst dich neu anmelden!'
				})));
			}	
			//var spin:Dynamic = dispatch(AppWait);
			//trace(spin);
			var params:Dynamic = {		
				id:props.userState.dbUser.id,
				jwt:props.userState.dbUser.jwt,
				classPath:props.classPath,
				action:props.action,				
				dataSource:Serializer.run(props.dataSource),
				//dataSource:props.dataSource,
				devIP:App.devIP
			};
			if(props.table != null)
				params.table = props.table;
			var bL:XMLHttpRequest = BinaryLoader.dbQuery(
			'${App.config.api}', 
			params,
			function(data:DbData)
			{				
				//trace(data);
				if(data.dataErrors != null)
					trace(data.dataErrors);
				if(data.dataInfo != null && data.dataInfo.exists('dataSource'))
					trace(new Unserializer(data.dataInfo.get('dataSource')).unserialize());

				if(data.dataErrors.exists('lastError'))
				{
					return dispatch(User(LoginError({lastError: data.dataErrors.get('lastError')})));
				}

				return dispatch(Status(Update({
					className:'',
					text:switch ('${props.classPath}.${props.action}')
				{
					case "data.Contacts.edit":
						'Kontakt ${props.dataSource["contacts"]["filter"].substr(3)} geladen';
					case "data.Contacts.update":
						'Kontakt ${props.dataSource["contacts"]["filter"].substr(3)} wurde gespeichert';
					default:
						"Unbekannter Vorgang";

				}})));
			});
			return null;
		});
	}

	public static function upload(param:DBAccessProps) 
	{	trace(param.action);
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState):Promise<Dynamic>{
			trace(param);
			//if(param.dataSource != null)
				//trace(param.dataSource.get('contacts').get('data'));
			
			//var dbData:DbData = DbDataTools.create();
			//trace(getState());
			return new Promise(function(resolve, reject){
				if (!param.dbUser.online)
				{
					dispatch(User(LoginError(
					{
						dbUser:param.dbUser,
						lastError:'Du musst dich neu anmelden!'
					})));
					trace('LoginError');
					resolve(null);
				}	
				
				var bL:XMLHttpRequest = BinaryLoader.dbQuery(
					'${App.config.api}', 
					param,
					function(data:DbData)
					{				
						trace(data);
						if(data.dataErrors != null)
							trace(data.dataErrors);
						if(data.dataInfo != null && data.dataInfo.exists('dataSource'))
							trace(new Unserializer(data.dataInfo.get('dataSource')).unserialize());

						if(data.dataErrors.exists('lastError'))
						{
							dispatch(User(LoginError({lastError: data.dataErrors.get('lastError')})));
							resolve(null);
						}
						else{

							dispatch(Status(Update( 
								{	className:'',
									text:(param.resolveMessage==null?'':param.resolveMessage.success)				
								}
							)));
							resolve(data);
						}
					}
				);
				trace(bL);
			});	
		});
			
	}
}