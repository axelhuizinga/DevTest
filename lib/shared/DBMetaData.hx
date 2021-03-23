package shared;

import shared.FieldFormat;
import js.html.FormElement;
import haxe.ds.IntMap;
import haxe.ds.Map;
import hxbit.Schema;
import hxbit.Serializable;
import hxbit.Serializer;

/**
 * ...
 * @author axel@cunity.me
 */

class DBMetaData implements Serializable 
{

	@:s public var dataErrors:Map<String,Dynamic>;
	@:s public var dataInfo:Map<String,Dynamic>;
	@:s public var dataParams:Map<String,Map<String,Dynamic>>;
	@:s public var dataRows:Array<Map<String,Dynamic>>;
	@:s public var dataFields:IntMap<DataField>;
	
	public function new(server:Bool=false) 
	{
		if(server)
		{
			dataErrors = new Map();
			dataInfo = new Map();
			dataRows = new Array();
		}
		else 
		{
			dataFields= new IntMap();
		}
		
	}

	public function stateToDataParams(dT:Dynamic):IntMap<DataField>
	//public function stateToDataParams(dT:Dynamic):Map<String,Dynamic>
   	{
		var dM:IntMap<DataField> = new IntMap();
		//var dM:Map<String,Dynamic> = new Map();
        for(f in Reflect.fields(dT))
            //dM.set(f, dynToDataField(Reflect.field(dT, f)));
            dM.set(Std.parseInt(f), dynToDataField(Reflect.field(dT, f)));
		return dM;
   	}

   public function dynToDataField(d:Dynamic):DataField
   {
      	return {
			id:d.id,
			mandator:d.mandator,
			//element:d.element,
			table_name:d.table_name,
			field_name:d.field_name,
			field_type:d.field_type,
			format_display:d.format_display,
			format_store:d.format_store,
			admin_only:d.admin_only,
			required:d.required,
			readonly:d.readonly,
			use_as_index:d.use_as_index
			//primary:d.primary         	
		};
   }	
}

typedef DataField =
{
	id:Int,
	mandator:Int,
	//element:FormElement,
	table_name:String,
	field_name:String,
	field_type:String,
	format_display:String,
	format_store:String,
	admin_only:Bool,
	required:Bool,
	readonly:Bool,
	use_as_index:Bool
}

