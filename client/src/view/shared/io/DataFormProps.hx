package view.shared.io;

import js.html.FormElement;
import react.ReactRef;
import db.DBAccessProps;
import action.DataAction;
import view.shared.io.FormApi;
import haxe.Constraints.Function;
import haxe.ds.IntMap;
import js.lib.Promise;
import react.ReactComponent;
import react.ReactComponent.ReactFragment;
import state.AppState;
import state.FormState;
import react.router.RouterMatch;
import react.router.Route;
import redux.Redux.Dispatch;
import redux.Store;
import shared.DbData;
import state.UserState;

typedef DataFormProps =
{
	>ChildrenRouteProps,
	>ReactComponentProps,
	?action:String,
	?dataStore:state.DataAccessState,
    ?formApi:FormApi,
	?filter:String,
	?fullWidth:Bool,	
	?isActive:Bool,	
	?limit:Int,	
	?load:DBAccessProps->Promise<DbData>,
	?loadData:Int->ReactComponentOf<DataFormProps,FormState>->Void,
	?formRef:ReactRef<FormElement>,
	?parentComponent:Dynamic,
	?select:Function, // Int->IntMap<Map<String,Dynamic>>->RouterMatch->SelectType,
	?setStateFromChild:FormState->Void,
	?setFormState:FormState->Void,
	?sideMenu:MenuProps,
	//?store:Store<AppState>,
	//?storeContactsList:DbData->Void,
	?storeData:String->DataAction->Void,
	?storeFormChange:String->FormState->Void,
	?render:FormState->ReactFragment,
	?save:ReactComponentOf<DataFormProps,FormState>->Promise<DbData>,
	?update:DBAccessProps->Promise<DbData>,	
	userState:UserState,
	model:String
}