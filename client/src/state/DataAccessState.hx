package state;
import haxe.ds.IntMap;
import shared.DbData;
import state.UserState;

typedef DataSource =
{
    ?dataBase:String,
    ?dbTable:String,
    ?host:String,
    ?port:Int,
    ?url:String,
    ?userState:String,
    ?password:String, 
}

typedef 
DataAccessState =  
{
	?contactsDbData:DbData,
	?contactActData:IntMap<Map<String,Dynamic>>,
	?contactData:IntMap<Map<String,Dynamic>>,
	?dealActData:IntMap<Map<String,Dynamic>>,
	?dealData:IntMap<Map<String,Dynamic>>,
	?accountActData:IntMap<Map<String,Dynamic>>,
	?accountData:IntMap<Map<String,Dynamic>>,	
	?accountsDbData:DbData,
	?dealsDbData:DbData,
    ?source:DataSource,
    ?waiting:Bool
}
