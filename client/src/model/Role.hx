package model;

typedef RoleProps = {
	?name:String,
	?description:String,
	?permissions:String,
	?edited_by:Int,
	?mandator:Int,
	?last_updated:String
};

@:rtti
class Role extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("character varying(64)")
	@:isVar public var name(default,set):String;

	function set_name(name:String):String{
		if(initialized('name'))
			modified('name');
		this.name = name ;
		return name;
	}	
		
	@dataType("character varying(2048)")
	@:isVar public var description(default,set):String;

	function set_description(description:String):String{
		if(initialized('description'))
			modified('description');
		this.description = description ;
		return description;
	}	
		
	@dataType("jsonb")
	@:isVar public var permissions(default,set):String;

	function set_permissions(permissions:String):String{
		if(initialized('permissions'))
			modified('permissions');
		this.permissions = permissions ;
		return permissions;
	}	
		
	@dataType("bigint")
	@:isVar public var edited_by(default,set):Int;

	function set_edited_by(edited_by:Int):Int{
		if(initialized('edited_by'))
			modified('edited_by');
		this.edited_by = edited_by ;
		return edited_by;
	}	
		
	@dataType("bigint")
	@:isVar public var mandator(default,set):Int;

	function set_mandator(mandator:Int):Int{
		if(initialized('mandator'))
			modified('mandator');
		this.mandator = mandator ;
		return mandator;
	}	
		
	@dataType("timestamp with time zone")
	@:isVar public var last_updated(default,set):String;

	function set_last_updated(last_updated:String):String{
		if(initialized('last_updated'))
			modified('last_updated');
		this.last_updated = last_updated ;
		return last_updated;
	}	
	
}