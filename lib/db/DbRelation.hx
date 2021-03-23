package db;
import haxe.ds.StringMap;
import hxbit.Serializable;

class DbRelation implements hxbit.Serializable{

	@:s public var alias:String;
	@:s public var fields:Array<String>;
	@:s public var filter:Dynamic;
	@:s public var jCond:String;

	public function new(p:Dynamic){
		
		for(f in Type.getInstanceFields(DbRelation)){
			switch (f){
				case '__uid'|'getCLID'|'serialize'|'unserialize'|'getSerializeSchema':
					//SKIP
				default:
					if(Reflect.hasField(p, f))
						Reflect.setField(this, f, Reflect.field(p,f));
			}
		}	
	};	
}