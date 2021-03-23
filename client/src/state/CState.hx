package state;
import action.AppAction;
import haxe.ds.StringMap;
import history.Action;
import history.Location;
import state.AppState;
import react.ReactComponent;
import react.ReactUtil.copy;
import redux.Store;
import js.Promise;

/**
 * ...
 * @author axel@cunity.me
 */
class CState 
{
	static var store:Store<AppState>;
	
	public static function confirmTransition(message:String, callback:Bool->Void)
	{
		trace(message);
		if (store.getState().locationStore.history.location.pathname == '/')
		{
			return callback(true);
		}
		callback(true);
	}
	
	public static function blockTransition(location:Location, action:Action):String
	{
		trace(location.pathname);
		trace(action);
		return location.pathname;
	}
	
	public static function historyChange(location:Location, action:Action):Bool
	{
		trace(location);
		trace(action);
		return false;
	}
	
	public static function init(store:Store<AppState>)
	{
		CState.store = store;
		return;
		var state:AppState = store.getState();
		var unblock = state.locationStore.history.block(blockTransition);
		trace(unblock);
		state.locationStore.history.listen(CState.historyChange);
	}

}
