package model;

typedef ViewProps = {
	?key:String,
	?classPath:String,
	?component:String,
	?edited_by:String,
	?last_updated:String,
	?locale:String,
	?mandator:Int,
	?content:String
};

@:rtti
class View extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("character varying(64)")
	@:isVar public var key(default,set):String;

	function set_key(key:String):String{
		if(initialized('key'))
			modified('key');
		this.key = key ;
		return key;
	}	
		
	@dataType("character varying(512)")
	@:isVar public var classPath(default,set):String;

	function set_classPath(classPath:String):String{
		if(initialized('classPath'))
			modified('classPath');
		this.classPath = classPath ;
		return classPath;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var component(default,set):String;

	function set_component(component:String):String{
		if(initialized('component'))
			modified('component');
		this.component = component ;
		return component;
	}	
		
	@dataType("integer")
	@:isVar public var edited_by(default,set):String;

	function set_edited_by(edited_by:String):String{
		if(initialized('edited_by'))
			modified('edited_by');
		this.edited_by = edited_by ;
		return edited_by;
	}	
		
	@dataType("timestamp with time zone")
	@:isVar public var last_updated(default,set):String;

	function set_last_updated(last_updated:String):String{
		if(initialized('last_updated'))
			modified('last_updated');
		this.last_updated = last_updated ;
		return last_updated;
	}	
		
	@dataType("character varying(8)")
	@:isVar public var locale(default,set):String;

	function set_locale(locale:String):String{
		if(initialized('locale'))
			modified('locale');
		this.locale = locale ;
		return locale;
	}	
		
	@dataType("bigint")
	@:isVar public var mandator(default,set):Int;

	function set_mandator(mandator:Int):Int{
		if(initialized('mandator'))
			modified('mandator');
		this.mandator = mandator ;
		return mandator;
	}	
		
	@dataType("jsonb")
	@:isVar public var content(default,set):String;

	function set_content(content:String):String{
		if(initialized('content'))
			modified('content');
		this.content = content ;
		return content;
	}	
	
}