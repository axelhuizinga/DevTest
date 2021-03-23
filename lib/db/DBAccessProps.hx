package db;

import shared.DbData;
import db.DbRelation;
import db.DbUser;
import state.UserState;

typedef DBAccessAction = {
	action:String,
	?classPath:String,
	?action_id:Int,
	?offset:Int,
	?onlyNew:Bool,
	?limit:Int,	
	?maxImport:Int,
	?totalRecords:Int
}

typedef DBAccessResolveMessage = {
	?success:String,
	?failure:String
}

typedef DBAccessJsonResponse = {
	?data:String,
	?message:DBAccessResolveMessage
}

typedef DBAccessProps = {	
	>DBAccessAction,	
	?relations:Map<String,DbRelation>,
	?dataSource:Map<String,Map<String,Dynamic>>,	
	?dbUser:DbUser,
	?devIP:String,	
	?extDB:Bool,	
	?filter:Dynamic,
	?data:Dynamic,	
	?jThen:DBAccessJsonResponse->Void,
	?mandator:Int,
	?pages:Int,
	?resolveMessage:DBAccessResolveMessage,
	?table:String,
	?then:DbData->Void,
	?userState:UserState
}