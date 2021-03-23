package model;

typedef UserProps = {
	?contact:Int,
	?last_login:String,
	?user_name:String,
	?active:Bool,
	?edited_by:Int,
	?actions:String,
	?settings:String,
	?external:String,
	?user_group:Int,
	?change_pass_required:Bool,
	?online:Bool,
	?last_request_time:String,
	?last_error:String,
	?mandator:Int,
	?last_updated:String,
	?phash:String
};

@:rtti
class User extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("bigint")
	@:isVar public var contact(default,set):Int;

	function set_contact(contact:Int):Int{
		if(initialized('contact'))
			modified('contact');
		this.contact = contact ;
		return contact;
	}	
		
	@dataType("timestamp with time zone")
	@:isVar public var last_login(default,set):String;

	function set_last_login(last_login:String):String{
		if(initialized('last_login'))
			modified('last_login');
		this.last_login = last_login ;
		return last_login;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var user_name(default,set):String;

	function set_user_name(user_name:String):String{
		if(initialized('user_name'))
			modified('user_name');
		this.user_name = user_name ;
		return user_name;
	}	
		
	@dataType("boolean")
	@:isVar public var active(default,set):Bool;

	function set_active(active:Bool):Bool{
		if(initialized('active'))
			modified('active');
		this.active = active ;
		return active;
	}	
		
	@dataType("bigint")
	@:isVar public var edited_by(default,set):Int;

	function set_edited_by(edited_by:Int):Int{
		if(initialized('edited_by'))
			modified('edited_by');
		this.edited_by = edited_by ;
		return edited_by;
	}	
		
	@dataType("jsonb")
	@:isVar public var actions(default,set):String;

	function set_actions(actions:String):String{
		if(initialized('actions'))
			modified('actions');
		this.actions = actions ;
		return actions;
	}	
		
	@dataType("jsonb")
	@:isVar public var settings(default,set):String;

	function set_settings(settings:String):String{
		if(initialized('settings'))
			modified('settings');
		this.settings = settings ;
		return settings;
	}	
		
	@dataType("jsonb")
	@:isVar public var external(default,set):String;

	function set_external(external:String):String{
		if(initialized('external'))
			modified('external');
		this.external = external ;
		return external;
	}	
		
	@dataType("bigint")
	@:isVar public var user_group(default,set):Int;

	function set_user_group(user_group:Int):Int{
		if(initialized('user_group'))
			modified('user_group');
		this.user_group = user_group ;
		return user_group;
	}	
		
	@dataType("boolean")
	@:isVar public var change_pass_required(default,set):Bool;

	function set_change_pass_required(change_pass_required:Bool):Bool{
		if(initialized('change_pass_required'))
			modified('change_pass_required');
		this.change_pass_required = change_pass_required ;
		return change_pass_required;
	}	
		
	@dataType("boolean")
	@:isVar public var online(default,set):Bool;

	function set_online(online:Bool):Bool{
		if(initialized('online'))
			modified('online');
		this.online = online ;
		return online;
	}	
		
	@dataType("timestamp with time zone")
	@:isVar public var last_request_time(default,set):String;

	function set_last_request_time(last_request_time:String):String{
		if(initialized('last_request_time'))
			modified('last_request_time');
		this.last_request_time = last_request_time ;
		return last_request_time;
	}	
		
	@dataType("character varying(4096)")
	@:isVar public var last_error(default,set):String;

	function set_last_error(last_error:String):String{
		if(initialized('last_error'))
			modified('last_error');
		this.last_error = last_error ;
		return last_error;
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
		
	@dataType("character varying(64)")
	@:isVar public var phash(default,set):String;

	function set_phash(phash:String):String{
		if(initialized('phash'))
			modified('phash');
		this.phash = phash ;
		return phash;
	}	
	
}