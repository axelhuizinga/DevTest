package model;

typedef AccountProps = {
	?contact:Int,
	?bank_name:String,
	?bic:String,
	?account:String,
	?iban:String,
	?account_holder:String,
	?sign_date:String,
	?status:String,
	?creation_date:String,
	?edited_by:Int,
	?last_updated:String,
	?mandator:Int
};

@:rtti
class Account extends ORM
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
		
	@dataType("character varying(64)")
	@:isVar public var bank_name(default,set):String;

	function set_bank_name(bank_name:String):String{
		if(initialized('bank_name'))
			modified('bank_name');
		this.bank_name = bank_name ;
		return bank_name;
	}	
		
	@dataType("character varying(11)")
	@:isVar public var bic(default,set):String;

	function set_bic(bic:String):String{
		if(initialized('bic'))
			modified('bic');
		this.bic = bic ;
		return bic;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var account(default,set):String;

	function set_account(account:String):String{
		if(initialized('account'))
			modified('account');
		this.account = account ;
		return account;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var iban(default,set):String;

	function set_iban(iban:String):String{
		if(initialized('iban'))
			modified('iban');
		this.iban = iban ;
		return iban;
	}	
		
	@dataType("text")
	@:isVar public var account_holder(default,set):String;

	function set_account_holder(account_holder:String):String{
		if(initialized('account_holder'))
			modified('account_holder');
		this.account_holder = account_holder ;
		return account_holder;
	}	
		
	@dataType("date")
	@:isVar public var sign_date(default,set):String;

	function set_sign_date(sign_date:String):String{
		if(initialized('sign_date'))
			modified('sign_date');
		this.sign_date = sign_date ;
		return sign_date;
	}	
		
	@dataType("accounts_state")
	@:isVar public var status(default,set):String;

	function set_status(status:String):String{
		if(initialized('status'))
			modified('status');
		this.status = status ;
		return status;
	}	
		
	@dataType("timestamp with time zone")
	@:isVar public var creation_date(default,set):String;

	function set_creation_date(creation_date:String):String{
		if(initialized('creation_date'))
			modified('creation_date');
		this.creation_date = creation_date ;
		return creation_date;
	}	
		
	@dataType("bigint")
	@:isVar public var edited_by(default,set):Int;

	function set_edited_by(edited_by:Int):Int{
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
		
	@dataType("bigint")
	@:isVar public var mandator(default,set):Int;

	function set_mandator(mandator:Int):Int{
		if(initialized('mandator'))
			modified('mandator');
		this.mandator = mandator ;
		return mandator;
	}	
	
}