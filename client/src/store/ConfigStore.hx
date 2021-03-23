package store;
import redux.IReducer;
import action.AppAction;
import action.ConfigAction;
import js.Browser;
import react.ReactUtil.copy;
import state.ConfigState;

class ConfigStore 
	implements IReducer<ConfigAction, ConfigState>
{
	public var initState:ConfigState;
	
	public function new(p:Dynamic) {
		
		initState = p;
		trace('ok');
	}

	public function reduce(state:ConfigState, action:ConfigAction):ConfigState
	{		
		trace(state);
		trace(action);
		return switch(action)
		{
			case Loaded(p):
				trace(p);
				copy(state, p);
			default:
				state;
		}
	}
	
}