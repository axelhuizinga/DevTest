package store;

import me.cunity.debug.Out;
import history.Location;
import history.History;
import js.Browser;
import js.html.BroadcastChannel;
import action.LocationAction;
import react.ReactUtil.copy;
import redux.IReducer;
import redux.IMiddleware;
import redux.StoreMethods;
import state.AppState;
import state.LocationState;

using StringTools;
using  shared.Utils;

class LocationStore implements IReducer<LocationAction,LocationState> 
	implements IMiddleware<LocationAction,AppState> 
{
	public var initState:LocationState;
	public var store:StoreMethods<AppState>;
	var _trace:Bool;

	public function new(history:History) 
	{
		_trace = false;
		initState = {
			history:history,
			lastModified:Date.now(),
			redirectAfterLogin: switch(Browser.location.pathname.startsWith('/ChangePassword'))
			{
				default:
					(Browser.location.pathname=='/'?'/DashBoard':Browser.location.pathname);
				case true:
					var args:Map<String,Dynamic> = Browser.location.pathname.argList(['action','jwt','user_name','opath']);
					if(_trace) trace(args);
					args.get('opath');
			}
			// (Browser.location.pathname=='/'?'/DashBoard':Browser.location.pathname)
		};	
		Out.dumpObject(initState);
	}

	public function reduce(state:LocationState, action:LocationAction):LocationState
	{
		if(_trace) trace(state.history.location);
		if(store != null)
		if(_trace) trace(Reflect.fields(store));
		return switch(action)
		{
			case InitHistory(history):
				if(_trace) Out.dumpObject(state);
				copy(state, {
					history:history
				});
			case LocationChange(location):
				if(false&&_trace) trace(location.pathname);
				copy(state, location);				
			default:
				state;
		}
	}

	public function middleware(action:LocationAction, next:Void -> Dynamic):Dynamic
	{
		if(_trace) trace(action);
		if(_trace) trace(Reflect.fields(store.getState()));
		
		var history = store.getState().locationStore.history;//App._app.state.locationState.history;
		//var history = App._app.state.locationStore.history;
		return switch(action)
		{
			/*case LocationChange(location):
				if(_trace) trace(location.pathname);
				history.push(location.pathname);
				{};
			case Pop(url, state):
				history.push(url, state);
				{};				
			case Push(url, state):
				history.push(url, state);
				{};
			case Replace(url, state):
				history.replace(url, state);
				{}
			case Go(to):
				history.go(to);
				{}
			case Back:
				history.goBack();
				{};
			case Forward:
				history.goForward();
				{};*/
			default:
				next();
		}
	}
	
}