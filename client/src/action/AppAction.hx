package action;

import action.DataAction;
import action.ConfigAction;
import action.LocationAction;
import action.UserAction;
import action.StatusAction;
import state.AppState;
import haxe.ds.IntMap;
import react.router.RouterMatch;
//import state.FormState;
//import view.shared.io.User;

import state.UserState;

/**
 * @author axel@cunity.me
 */

enum AppAction 
{
	ApplySubState(state:AppState);
	AppWait;
	Config(action:ConfigAction);
	Data(action:DataAction);
	GlobalState(key:String,value:Dynamic);
	Location(action:LocationAction);
	Status(action:StatusAction);
	User(action:UserAction);
}

