package store;
import debug.Out;
import action.StatusAction;
import action.async.UserAccess;
import state.UserState;
import action.DataAction;
import react.ReactSharedInternals.Update;
import App;
import action.AppAction;
import haxe.Http;
import haxe.Json;
import haxe.Constraints.Function;
import haxe.ds.StringMap;
import js.Browser;
import js.Cookie;
import js.Promise;
import react.ReactUtil.copy;
import redux.IMiddleware;
import redux.IReducer;
import redux.StoreMethods;
import react.router.ReactRouter;
import history.BrowserHistory;
import history.History;
import state.CState;
import state.AppState;
import state.StatusState;
import Webpack.*;
using StringTools;
using shared.Utils;
/**
 * ...
 * @author axel@cunity.me
 */

class AppStore 
	implements IReducer<AppAction, AppState>
	implements IMiddleware<AppAction, AppState>
{
	public var initState:AppState;
		
	public var store:StoreMethods<AppState>;
	
	public function new() 
	{
		initState = {			 
			status: {
				date:Date.now(),
				path: Browser.location.pathname,
				text: ''
			}
		};
		trace(store);
	}
	
	public function reduce(state:AppState, action:AppAction):AppState
	{
		trace(Reflect.fields(state));
		trace(action);
		return switch(action)
		{
			case ApplySubState(subState):
				copy(state,subState);
			case Data(dataAction):
				trace(dataAction);
				switch (dataAction)
				{
					case ContactsLoaded(data):
					trace(data.dataRows);
					copy(state,
						{dataStore:{contactsDbData:data}});

					default:
						state;
				}
			default:
				state;
		}
	}
	
	public function middleware(action:AppAction, next:Void -> Dynamic)
	{
		return switch(action)
		{			
			case Status(action):				
				store.dispatch(action);			
			case Location(action):
				store.dispatch(action);
			default: 
				next();
		}
	}
	
}