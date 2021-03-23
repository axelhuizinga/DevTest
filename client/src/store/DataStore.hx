package store;

import action.AppAction;
import action.async.LivePBXSync;
import haxe.ds.IntMap;
import state.AppState;
import js.Cookie;
import redux.StoreMethods;
import redux.IMiddleware;
import action.DataAction;
import action.async.DBAccess;
import action.async.LiveDataAccess;
import state.DataAccessState;
import react.ReactUtil.copy;
import redux.IReducer;
import shared.DbData;
import view.shared.io.FormApi;
using shared.Utils;

class DataStore
	implements IReducer<DataAction, DataAccessState>
	implements IMiddleware<DataAction, AppState>
{
	public var initState:DataAccessState;
	public var store:StoreMethods<AppState>;	

	public function new() 
	{ 
		initState = {
			//dbData:new DbData(),			
			contactData: new IntMap(),
			dealData: new IntMap(),
			accountData: new IntMap()
		};
		trace('ok');
	}
	
	public function reduce(state:DataAccessState, action:DataAction):DataAccessState
	{
		trace(action);
		trace(Reflect.fields(state));
		//return nul018l;
		return switch(action)
		{
			case ContactsLoaded(data):
				if(data.dataRows != null)
				{
					trace(data.dataRows.length);
					trace(copy(state, {
						contactsDbData:data,
					}).contactsDbData.dataRows.length);
				}			
				copy(state, {
					contactsDbData:data,
				});
			case Restore:
				state;
			case SelectAccounts(sData):
				//trace(sData.keys().keysList());
				copy(state,{
					contactData:sData
				});
			case SelectActContacts(sData):
				//trace(sData.keys().keysList());
				trace(sData);
				
				copy(state,{
					contactActData:sData
				});				
			case SelectContacts(sData):				
				trace(sData);
				//trace(sData.keys().keysList());
				copy(state,{
					contactData:sData
				});
			case SelectDeals(sData):
				trace(sData.keys().keysList());
				copy(state,{
					dealData:sData
				});
			case Update(uData):
				trace(uData);
				var cData = state.contactData;
				var uDataIt = uData.iterator();
				var row:Map<String,Dynamic> = null;
				for (i => row in uData.keyValueIterator())
				{
					cData.set(i, row);
				}
				copy(state,{
					contactData:cData
				});
			default:
				state;
		}
	}
	
	public function middleware(action:DataAction, next:Void -> Dynamic)
	{
		trace(Type.enumConstructor(action));
		return switch(action)
		{
			/*case CreateSelect(id, data, match):
				//next();
				store.dispatch(LiveDataAccess.select({id:id,data:data,match:match}));
				//next();*/
			case ContactsLoaded(data):
				store.dispatch(Data(action));
				next();
			case Execute(data):
				store.dispatch(DBAccess.execute(data));
				//next();
			case Sync(data):
				store.dispatch(LivePBXSync.importContacts(data));
			default: next();
		}
	}	

}