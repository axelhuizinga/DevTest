package model;

typedef TableFieldProps = {
	?table_name:String,
	?mandator:Int,
	?field_name:String,
	?readonly:Bool,
	?element:String,
	?any:String,
	?required:Bool,
	?use_as_index:Bool,
	?admin_only:Bool,
	?field_type:String
};

@:rtti
class TableField extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("character varying")
	@:isVar public var table_name(default,set):String;

	function set_table_name(table_name:String):String{
		if(initialized('table_name'))
			modified('table_name');
		this.table_name = table_name ;
		return table_name;
	}	
		
	@dataType("bigint")
	@:isVar public var mandator(default,set):Int;

	function set_mandator(mandator:Int):Int{
		if(initialized('mandator'))
			modified('mandator');
		this.mandator = mandator ;
		return mandator;
	}	
		
	@dataType("character varying")
	@:isVar public var field_name(default,set):String;

	function set_field_name(field_name:String):String{
		if(initialized('field_name'))
			modified('field_name');
		this.field_name = field_name ;
		return field_name;
	}	
		
	@dataType("boolean")
	@:isVar public var readonly(default,set):Bool;

	function set_readonly(readonly:Bool):Bool{
		if(initialized('readonly'))
			modified('readonly');
		this.readonly = readonly ;
		return readonly;
	}	
		
	@dataType("element")
	@:isVar public var element(default,set):String;

	function set_element(element:String):String{
		if(initialized('element'))
			modified('element');
		this.element = element ;
		return element;
	}	
		
	@dataType("jsonb")
	@:isVar public var any(default,set):String;

	function set_any(any:String):String{
		if(initialized('any'))
			modified('any');
		this.any = any ;
		return any;
	}	
		
	@dataType("boolean")
	@:isVar public var required(default,set):Bool;

	function set_required(required:Bool):Bool{
		if(initialized('required'))
			modified('required');
		this.required = required ;
		return required;
	}	
		
	@dataType("boolean")
	@:isVar public var use_as_index(default,set):Bool;

	function set_use_as_index(use_as_index:Bool):Bool{
		if(initialized('use_as_index'))
			modified('use_as_index');
		this.use_as_index = use_as_index ;
		return use_as_index;
	}	
		
	@dataType("boolean")
	@:isVar public var admin_only(default,set):Bool;

	function set_admin_only(admin_only:Bool):Bool{
		if(initialized('admin_only'))
			modified('admin_only');
		this.admin_only = admin_only ;
		return admin_only;
	}	
		
	@dataType("data_type")
	@:isVar public var field_type(default,set):String;

	function set_field_type(field_type:String):String{
		if(initialized('field_type'))
			modified('field_type');
		this.field_type = field_type ;
		return field_type;
	}	
	
}