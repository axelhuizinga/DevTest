package model;
import view.shared.FormBuilder;
import me.cunity.tools.StringTool;
import haxe.rtti.Meta;
import view.shared.io.DataAccess.DataView;
import haxe.Constraints.Function;
import haxe.rtti.CType.ClassField;
import haxe.rtti.CType.Classdef;
import haxe.rtti.Rtti.getRtti;
import js.lib.RegExp;
import react.ReactUtil.copy;

using Lambda;

@:keep
class ORM {
	@dataType("bigint")
	@:isVar public var id(default,null):Int;

	function set_id(id:Int):Int{
		if(initialized('id'))
			modified('id');
		this.id = id ;
		return id;
	}
	
	//TODO: LOAD DSEP FROM CONFIG
	static var dsep:String = ',';

	public var fieldsInitalized(default,null):Array<String>;
	public var fieldsModified(default,null):Array<String>;
	
	public var fieldFormat:Map<String, Function>;
	public var formBuilder:FormBuilder;
	public var propertyNames:Array<String>;
	public var state:Dynamic;
	var fields:Dynamic<Dynamic<Array<Dynamic>>>;

	public function new(data:Map<String,Dynamic>) {
		fields = Meta.getFields(Type.getClass(this));	
		fields.id = {
			dataType : ['bigint']
		};
		//trace(Std.string(fields));
		fieldsInitalized = new Array();
		fieldsModified = new Array();
		formBuilder = new FormBuilder(this);
		propertyNames = Reflect.fields(fields);
		state = {};
		//trace('data.id: ${data.get('id')}');
		fieldsInitalized = new Array();
		fieldsModified = new Array();
		for(f in propertyNames)
		{
			if(data.exists(f)){
				var nv:Dynamic = data.get(f);
				//trace('$f => $nv');
				Reflect.setProperty(this, f, switch(Reflect.field(fields, f).dataType[0]){				
					case('bigint[]'):
						nv==null?[]:nv;
					case _.indexOf('timestamp') => 0:
						nv == null? '': nv;
					case('date'):
						nv == null? '': nv;
					default:
						nv;
				});				
			}
		}
		//trace(this.id +':' + data.get('id'));
	}

	public function allModified():Dynamic {
		var data:Dynamic = {};
		for(f in fieldsModified)
		{
			//TODO: ADD FORMAT SWITCH BEFORE ADDING DATA TO STORAGE
			var nv:String = Reflect.field(this, f);
			var dType:String = Reflect.field(fields,f).dataType[0];			
			trace(nv + ' => $dsep : $dType::'+dType.indexOf('numeric'));
			//Reflect.setField(data, f, Reflect.field(this, f));
			Reflect.setField(data, f, switch(dType){
				case('bigint[]'):
				nv==null?[]:nv;
				case _.indexOf('timestamp') => 0:
					nv == null? '': nv;
				case('date'):
					nv == null? '': nv;
				case _.indexOf('numeric') => 0:
					nv = nv.split(' ')[0];
					var dvals:Array<String> = nv.split(dsep);
					trace(dvals);
					'${dvals[0]}.${dvals[1]}';
				default:
					nv;
			});
			
		}
		return data;
	}

	public function initFields() {
		//var pNames:Array<String> = propertyNames.split(',');
		var me:Dynamic = Type.getClass(this);
		var rtti:Classdef = getRtti(me);
		var rttiFields:Array<haxe.rtti.CType.ClassField> = rtti.fields;
		//trace(rttiFields[0]);
		//trace(propertyNames);
		var dTypes:Array<String> = [];
		for(fld in rttiFields)
		{
			//var fld:ClassField = rttiFields[fi];
			//trace(fld.name);
			if(propertyNames.has(fld.name))
			{
				//trace('${fld.name}:${fld.type} ${fld.meta[0].params}');
				if(!dTypes.has(fld.meta[0].params[0]))
				{
					dTypes.push(fld.meta[0].params[0]);
				}
				//trace(fld.type);//HAXE TYPE
				//trace(fld.meta[0].params);//DB FIELD DATATYPE
			}
		}
		//trace(dTypes);
	}

	public function initialized(?attName:String):Bool {
		if(attName==null)			
			return fieldsInitalized.length>0;
		if(!fieldsInitalized.has(attName)){
			fieldsInitalized.push(attName);
			return false;
		}
		return true;
	}

	public function modified(?attName:String):Bool {
		if(attName==null)			
			return fieldsModified.length>0;
		if(!fieldsModified.has(attName)){
			fieldsModified.push(attName);
			return false;
		}
		return true;
	}

	public function reset(?attName:String):Int {
		var r:Int = fieldsModified.length;
		if(fieldsModified.length == 0)
			return 0;
		if(attName!=null)
		{
			return (fieldsModified.remove(attName)?1:0);
		}
		fieldsModified = new Array();
		return r;
	}

	public function save():Void{

	}
}