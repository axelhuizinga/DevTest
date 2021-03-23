package model;

typedef ContactProps = {
	?mandator:Int,
	?creation_date:String,
	?status:String,
	?use_email:Bool,
	?company_name:String,
	?care_of:String,
	?phone_code:String,
	?phone_number:String,
	?fax:String,
	?title:String,
	?first_name:String,
	?last_name:String,
	?address:String,
	?address_2:String,
	?city:String,
	?postal_code:String,
	?country_code:String,
	?gender:String,
	?date_of_birth:String,
	?mobile:String,
	?email:String,
	?comments:String,
	?edited_by:Int,
	?merged:Array<Int>,
	?last_updated:String,
	?owner:Int
};

@:rtti
class Contact extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("bigint")
	@:isVar public var mandator(default,set):Int;

	function set_mandator(mandator:Int):Int{
		if(initialized('mandator'))
			modified('mandator');
		this.mandator = mandator ;
		return mandator;
	}	
		
	@dataType("timestamp(0) without time zone")
	@:isVar public var creation_date(default,set):String;

	function set_creation_date(creation_date:String):String{
		if(initialized('creation_date'))
			modified('creation_date');
		this.creation_date = creation_date ;
		return creation_date;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var status(default,set):String;

	function set_status(status:String):String{
		if(initialized('status'))
			modified('status');
		this.status = status ;
		return status;
	}	
		
	@dataType("boolean")
	@:isVar public var use_email(default,set):Bool;

	function set_use_email(use_email:Bool):Bool{
		if(initialized('use_email'))
			modified('use_email');
		this.use_email = use_email ;
		return use_email;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var company_name(default,set):String;

	function set_company_name(company_name:String):String{
		if(initialized('company_name'))
			modified('company_name');
		this.company_name = company_name ;
		return company_name;
	}	
		
	@dataType("character varying(100)")
	@:isVar public var care_of(default,set):String;

	function set_care_of(care_of:String):String{
		if(initialized('care_of'))
			modified('care_of');
		this.care_of = care_of ;
		return care_of;
	}	
		
	@dataType("character varying(10)")
	@:isVar public var phone_code(default,set):String;

	function set_phone_code(phone_code:String):String{
		if(initialized('phone_code'))
			modified('phone_code');
		this.phone_code = phone_code ;
		return phone_code;
	}	
		
	@dataType("character varying(18)")
	@:isVar public var phone_number(default,set):String;

	function set_phone_number(phone_number:String):String{
		if(initialized('phone_number'))
			modified('phone_number');
		this.phone_number = phone_number ;
		return phone_number;
	}	
		
	@dataType("character varying(18)")
	@:isVar public var fax(default,set):String;

	function set_fax(fax:String):String{
		if(initialized('fax'))
			modified('fax');
		this.fax = fax ;
		return fax;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var title(default,set):String;

	function set_title(title:String):String{
		if(initialized('title'))
			modified('title');
		this.title = title ;
		return title;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var first_name(default,set):String;

	function set_first_name(first_name:String):String{
		if(initialized('first_name'))
			modified('first_name');
		this.first_name = first_name ;
		return first_name;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var last_name(default,set):String;

	function set_last_name(last_name:String):String{
		if(initialized('last_name'))
			modified('last_name');
		this.last_name = last_name ;
		return last_name;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var address(default,set):String;

	function set_address(address:String):String{
		if(initialized('address'))
			modified('address');
		this.address = address ;
		return address;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var address_2(default,set):String;

	function set_address_2(address_2:String):String{
		if(initialized('address_2'))
			modified('address_2');
		this.address_2 = address_2 ;
		return address_2;
	}	
		
	@dataType("character varying(50)")
	@:isVar public var city(default,set):String;

	function set_city(city:String):String{
		if(initialized('city'))
			modified('city');
		this.city = city ;
		return city;
	}	
		
	@dataType("character varying(10)")
	@:isVar public var postal_code(default,set):String;

	function set_postal_code(postal_code:String):String{
		if(initialized('postal_code'))
			modified('postal_code');
		this.postal_code = postal_code ;
		return postal_code;
	}	
		
	@dataType("character varying(3)")
	@:isVar public var country_code(default,set):String;

	function set_country_code(country_code:String):String{
		if(initialized('country_code'))
			modified('country_code');
		this.country_code = country_code ;
		return country_code;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var gender(default,set):String;

	function set_gender(gender:String):String{
		if(initialized('gender'))
			modified('gender');
		this.gender = gender ;
		return gender;
	}	
		
	@dataType("date")
	@:isVar public var date_of_birth(default,set):String;

	function set_date_of_birth(date_of_birth:String):String{
		if(initialized('date_of_birth'))
			modified('date_of_birth');
		this.date_of_birth = date_of_birth ;
		return date_of_birth;
	}	
		
	@dataType("character varying(19)")
	@:isVar public var mobile(default,set):String;

	function set_mobile(mobile:String):String{
		if(initialized('mobile'))
			modified('mobile');
		this.mobile = mobile ;
		return mobile;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var email(default,set):String;

	function set_email(email:String):String{
		if(initialized('email'))
			modified('email');
		this.email = email ;
		return email;
	}	
		
	@dataType("character varying(4096)")
	@:isVar public var comments(default,set):String;

	function set_comments(comments:String):String{
		if(initialized('comments'))
			modified('comments');
		this.comments = comments ;
		return comments;
	}	
		
	@dataType("bigint")
	@:isVar public var edited_by(default,set):Int;

	function set_edited_by(edited_by:Int):Int{
		if(initialized('edited_by'))
			modified('edited_by');
		this.edited_by = edited_by ;
		return edited_by;
	}	
		
	@dataType("bigint[]")
	@:isVar public var merged(default,set):Array<Int>;

	function set_merged(merged:Array<Int>):Array<Int>{
		if(initialized('merged'))
			modified('merged');
		this.merged = merged ;
		return merged;
	}	
		
	@dataType("timestamp(0) without time zone")
	@:isVar public var last_updated(default,set):String;

	function set_last_updated(last_updated:String):String{
		if(initialized('last_updated'))
			modified('last_updated');
		this.last_updated = last_updated ;
		return last_updated;
	}	
		
	@dataType("bigint")
	@:isVar public var owner(default,set):Int;

	function set_owner(owner:Int):Int{
		if(initialized('owner'))
			modified('owner');
		this.owner = owner ;
		return owner;
	}	
	
}