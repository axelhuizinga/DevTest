package model;

typedef DealProps = {
	?contact:Int,
	?creation_date:String,
	?account:Int,
	?target_account:Int,
	?booking_run:String,
	?start_date:String,
	?cycle:String,
	?amount:String,
	?product:Int,
	?agent:Int,
	?project:Int,
	?active:Bool,
	?pay_method:String,
	?end_date:String,
	?end_reason:Int,
	?repeat_date:String,
	?edited_by:Int,
	?mandator:Int,
	?old_active:Bool,
	?cycle_start_date:String,
	?last_updated:String,
	?booking_day:String
};

@:rtti
class Deal extends ORM
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
		
	@dataType("timestamp(0) without time zone")
	@:isVar public var creation_date(default,set):String;

	function set_creation_date(creation_date:String):String{
		if(initialized('creation_date'))
			modified('creation_date');
		this.creation_date = creation_date ;
		return creation_date;
	}	
		
	@dataType("bigint")
	@:isVar public var account(default,set):Int;

	function set_account(account:Int):Int{
		if(initialized('account'))
			modified('account');
		this.account = account ;
		return account;
	}	
		
	@dataType("bigint")
	@:isVar public var target_account(default,set):Int;

	function set_target_account(target_account:Int):Int{
		if(initialized('target_account'))
			modified('target_account');
		this.target_account = target_account ;
		return target_account;
	}	
		
	@dataType("booking_runs")
	@:isVar public var booking_run(default,set):String;

	function set_booking_run(booking_run:String):String{
		if(initialized('booking_run'))
			modified('booking_run');
		this.booking_run = booking_run ;
		return booking_run;
	}	
		
	@dataType("date")
	@:isVar public var start_date(default,set):String;

	function set_start_date(start_date:String):String{
		if(initialized('start_date'))
			modified('start_date');
		this.start_date = start_date ;
		return start_date;
	}	
		
	@dataType("deals_cycle")
	@:isVar public var cycle(default,set):String;

	function set_cycle(cycle:String):String{
		if(initialized('cycle'))
			modified('cycle');
		this.cycle = cycle ;
		return cycle;
	}	
		
	@dataType("numeric(10,2)")
	@:isVar public var amount(default,set):String;

	function set_amount(amount:String):String{
		if(initialized('amount'))
			modified('amount');
		this.amount = amount ;
		return amount;
	}	
		
	@dataType("bigint")
	@:isVar public var product(default,set):Int;

	function set_product(product:Int):Int{
		if(initialized('product'))
			modified('product');
		this.product = product ;
		return product;
	}	
		
	@dataType("bigint")
	@:isVar public var agent(default,set):Int;

	function set_agent(agent:Int):Int{
		if(initialized('agent'))
			modified('agent');
		this.agent = agent ;
		return agent;
	}	
		
	@dataType("bigint")
	@:isVar public var project(default,set):Int;

	function set_project(project:Int):Int{
		if(initialized('project'))
			modified('project');
		this.project = project ;
		return project;
	}	
		
	@dataType("boolean")
	@:isVar public var active(default,set):Bool;

	function set_active(active:Bool):Bool{
		if(initialized('active'))
			modified('active');
		this.active = active ;
		return active;
	}	
		
	@dataType("pay_methods")
	@:isVar public var pay_method(default,set):String;

	function set_pay_method(pay_method:String):String{
		if(initialized('pay_method'))
			modified('pay_method');
		this.pay_method = pay_method ;
		return pay_method;
	}	
		
	@dataType("date")
	@:isVar public var end_date(default,set):String;

	function set_end_date(end_date:String):String{
		if(initialized('end_date'))
			modified('end_date');
		this.end_date = end_date ;
		return end_date;
	}	
		
	@dataType("bigint")
	@:isVar public var end_reason(default,set):Int;

	function set_end_reason(end_reason:Int):Int{
		if(initialized('end_reason'))
			modified('end_reason');
		this.end_reason = end_reason ;
		return end_reason;
	}	
		
	@dataType("date")
	@:isVar public var repeat_date(default,set):String;

	function set_repeat_date(repeat_date:String):String{
		if(initialized('repeat_date'))
			modified('repeat_date');
		this.repeat_date = repeat_date ;
		return repeat_date;
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
		
	@dataType("boolean")
	@:isVar public var old_active(default,set):Bool;

	function set_old_active(old_active:Bool):Bool{
		if(initialized('old_active'))
			modified('old_active');
		this.old_active = old_active ;
		return old_active;
	}	
		
	@dataType("date")
	@:isVar public var cycle_start_date(default,set):String;

	function set_cycle_start_date(cycle_start_date:String):String{
		if(initialized('cycle_start_date'))
			modified('cycle_start_date');
		this.cycle_start_date = cycle_start_date ;
		return cycle_start_date;
	}	
		
	@dataType("timestamp(0) without time zone")
	@:isVar public var last_updated(default,set):String;

	function set_last_updated(last_updated:String):String{
		if(initialized('last_updated'))
			modified('last_updated');
		this.last_updated = last_updated ;
		return last_updated;
	}	
		
	@dataType("deals_booking_day")
	@:isVar public var booking_day(default,set):String;

	function set_booking_day(booking_day:String):String{
		if(initialized('booking_day'))
			modified('booking_day');
		this.booking_day = booking_day ;
		return booking_day;
	}	
	
}