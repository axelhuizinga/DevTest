package store;

import db.DbUser;
import js.Browser;
import action.async.UserAccess;
import action.UserAction;
import js.Cookie;
import me.cunity.debug.Out;
import react.ReactUtil.copy;
import redux.IReducer;
import redux.IMiddleware;
import redux.StoreMethods;
import state.AppState;
import state.UserState;
using StringTools;
using shared.Utils;
/**
 * ...
 * @author axel@cunity.me
 */

class UserStore implements IReducer<UserAction, UserState>
	implements IMiddleware<UserAction, UserState>
{
	public var initState:UserState;
	
	public var store:StoreMethods<UserState>;
	
	public function new() 
	{		
		initState =  {
			loginTask:null,
			waiting:true,   				
			dbUser: new DbUser({
				first_name:Cookie.get('userState.dbUser.first_name')==null?'':Cookie.get('userState.dbUser.first_name'),
				id:Cookie.get('userState.dbUser.id')==null?0:Std.parseInt(Cookie.get('userState.dbUser.id')),
				last_name:Cookie.get('userState.dbUser.last_name')==null?'':Cookie.get('userState.dbUser.last_name'),
				mandator: Cookie.get('userState.dbUser.mandator')==null?1:Std.parseInt(Cookie.get('userState.dbUser.mandator')),
				user_name:Cookie.get('userState.dbUser.user_name')==null?'':Cookie.get('userState.dbUser.user_name'), 
				email:Cookie.get('userState.dbUser.email')==null?'':Cookie.get('userState.dbUser.email'),
				password:'',				
				change_pass_required:false,
				online:false,//Cookie.get('userState.dbUser.jwt')!=null,
				last_login:null,
				jwt:(Cookie.get('userState.dbUser.jwt')==null?'':Cookie.get('userState.dbUser.jwt'))
			})
		};
		//trace(initState);
		//Out.dumpObject(store);
	}
	
	public function reduce(state:UserState, action:UserAction):UserState
	{
		//Out.dumpObject(action);
		return switch(action)
		{
			case LoginChange(uState)|LoginRequired(uState):
				trace('...');
				//Out.dumpObject(uState);
				copy(state, uState);                             					
			case LoginError(err):
				trace(err);
				//if(err.id==state.user.id)
				copy(state, err);   
			case LoginExpired(uState):
				Out.dumpObject(uState);
				copy(state, uState);  
	                    
			case LoginComplete(uState):
					if(uState.dbUser != null)
						trace(uState.dbUser.id + ':' + uState.dbUser.online);
					//Out.dumpObject(state);
					copy(state, uState);                                             
			case LogOutComplete(uState):
				//Out.dumpObject(uState);
					copy(state, uState);   					
			case LogOut(uState):
				//Out.dumpObject(uState);
					copy(state, uState);      		
			default:
				state;
		}
	}

	public function middleware(action:UserAction, next:Void -> Dynamic)
	{
		trace(store);
		return switch(action)
		{		
			//case LoginError(state):
				//store.dispatch(UserAccess.loginReq(state));
			//store.dispatch(UserAction.LoginRequired(state));
			//next();
			//
			default: 
			next();
		}
	}	
}