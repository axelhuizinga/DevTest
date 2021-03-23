package shared;
import db.DbQuery;
import state.DataAccessState.DataSource;
import state.UserState;
import haxe.ds.Map;
import hxbit.Schema;
import hxbit.Serializable;
import hxbit.Serializer;

/**
 * ...
 * @author axel@cunity.me
 */

typedef DbRequestParam = {
	?action:String,	
	?classPath:String,
	?dataSource:Map<String,DbQuery>,
	?devIP:String,	
	?filter:Dynamic,
	?limit:Int,
	?maxImport:Int,
//	?pages:Int,
	?offset:Int,
	?table:String,
	?userState:UserState
};

class DbParam implements Serializable 
{

	@:s public var dataParams:Map<String,Dynamic>;
	@:s public var dbQuery:Map<String,DbQuery>;
	@:s public var userState:UserState;

	public function new() 
	{
		dataParams = new Map();
		dbQuery = new Map();		
	}	

	public static function create(drp:DbRequestParam)
	{
		var dbp:DbParam = new DbParam();
		for(f in Reflect.fields(drp)){

		}
	}

}