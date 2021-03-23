package model;

typedef BookingRequestProps = {
	?ag_name:String,
	?ag_konto_or_iban:String,
	?ag_blz_or_bic:String,
	?zahlpfl_name:String,
	?zahlpfl_name2:String,
	?zahlpfl_strasse:String,
	?zahlpfl_name_ort:String,
	?zahlpfl_name_kto_or_iban:String,
	?zahlpfl_name_blz_or_bic:String,
	?betrag:String,
	?currency:String,
	?zahlart:String,
	?termin:String,
	?vwz1:String,
	?vwz2:String,
	?vwz3:String,
	?vwz4:String,
	?vwz5:String,
	?vwz6:String,
	?vwz7:String,
	?vwz8:String,
	?vwz9:String,
	?ba_id:Int,
	?tracking_status:String,
	?anforderungs_datum:String,
	?rueck_datum:String,
	?cycle:String,
	?ref_id:String,
	?mandat_id:String,
	?mandat_datum:String,
	?ag_creditor_id:String,
	?sequenz:String,
	?super_ag_name:String
};

@:rtti
class BookingRequest extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("character varying(64)")
	@:isVar public var ag_name(default,set):String;

	function set_ag_name(ag_name:String):String{
		if(initialized('ag_name'))
			modified('ag_name');
		this.ag_name = ag_name ;
		return ag_name;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var ag_konto_or_iban(default,set):String;

	function set_ag_konto_or_iban(ag_konto_or_iban:String):String{
		if(initialized('ag_konto_or_iban'))
			modified('ag_konto_or_iban');
		this.ag_konto_or_iban = ag_konto_or_iban ;
		return ag_konto_or_iban;
	}	
		
	@dataType("character varying(11)")
	@:isVar public var ag_blz_or_bic(default,set):String;

	function set_ag_blz_or_bic(ag_blz_or_bic:String):String{
		if(initialized('ag_blz_or_bic'))
			modified('ag_blz_or_bic');
		this.ag_blz_or_bic = ag_blz_or_bic ;
		return ag_blz_or_bic;
	}	
		
	@dataType("character varying(21)")
	@:isVar public var zahlpfl_name(default,set):String;

	function set_zahlpfl_name(zahlpfl_name:String):String{
		if(initialized('zahlpfl_name'))
			modified('zahlpfl_name');
		this.zahlpfl_name = zahlpfl_name ;
		return zahlpfl_name;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var zahlpfl_name2(default,set):String;

	function set_zahlpfl_name2(zahlpfl_name2:String):String{
		if(initialized('zahlpfl_name2'))
			modified('zahlpfl_name2');
		this.zahlpfl_name2 = zahlpfl_name2 ;
		return zahlpfl_name2;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var zahlpfl_strasse(default,set):String;

	function set_zahlpfl_strasse(zahlpfl_strasse:String):String{
		if(initialized('zahlpfl_strasse'))
			modified('zahlpfl_strasse');
		this.zahlpfl_strasse = zahlpfl_strasse ;
		return zahlpfl_strasse;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var zahlpfl_name_ort(default,set):String;

	function set_zahlpfl_name_ort(zahlpfl_name_ort:String):String{
		if(initialized('zahlpfl_name_ort'))
			modified('zahlpfl_name_ort');
		this.zahlpfl_name_ort = zahlpfl_name_ort ;
		return zahlpfl_name_ort;
	}	
		
	@dataType("character varying(22)")
	@:isVar public var zahlpfl_name_kto_or_iban(default,set):String;

	function set_zahlpfl_name_kto_or_iban(zahlpfl_name_kto_or_iban:String):String{
		if(initialized('zahlpfl_name_kto_or_iban'))
			modified('zahlpfl_name_kto_or_iban');
		this.zahlpfl_name_kto_or_iban = zahlpfl_name_kto_or_iban ;
		return zahlpfl_name_kto_or_iban;
	}	
		
	@dataType("character varying(11)")
	@:isVar public var zahlpfl_name_blz_or_bic(default,set):String;

	function set_zahlpfl_name_blz_or_bic(zahlpfl_name_blz_or_bic:String):String{
		if(initialized('zahlpfl_name_blz_or_bic'))
			modified('zahlpfl_name_blz_or_bic');
		this.zahlpfl_name_blz_or_bic = zahlpfl_name_blz_or_bic ;
		return zahlpfl_name_blz_or_bic;
	}	
		
	@dataType("double precision")
	@:isVar public var betrag(default,set):String;

	function set_betrag(betrag:String):String{
		if(initialized('betrag'))
			modified('betrag');
		this.betrag = betrag ;
		return betrag;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var currency(default,set):String;

	function set_currency(currency:String):String{
		if(initialized('currency'))
			modified('currency');
		this.currency = currency ;
		return currency;
	}	
		
	@dataType("character varying(5)")
	@:isVar public var zahlart(default,set):String;

	function set_zahlart(zahlart:String):String{
		if(initialized('zahlart'))
			modified('zahlart');
		this.zahlart = zahlart ;
		return zahlart;
	}	
		
	@dataType("date")
	@:isVar public var termin(default,set):String;

	function set_termin(termin:String):String{
		if(initialized('termin'))
			modified('termin');
		this.termin = termin ;
		return termin;
	}	
		
	@dataType("character varying(22)")
	@:isVar public var vwz1(default,set):String;

	function set_vwz1(vwz1:String):String{
		if(initialized('vwz1'))
			modified('vwz1');
		this.vwz1 = vwz1 ;
		return vwz1;
	}	
		
	@dataType("character varying(256)")
	@:isVar public var vwz2(default,set):String;

	function set_vwz2(vwz2:String):String{
		if(initialized('vwz2'))
			modified('vwz2');
		this.vwz2 = vwz2 ;
		return vwz2;
	}	
		
	@dataType("character varying(64)")
	@:isVar public var vwz3(default,set):String;

	function set_vwz3(vwz3:String):String{
		if(initialized('vwz3'))
			modified('vwz3');
		this.vwz3 = vwz3 ;
		return vwz3;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var vwz4(default,set):String;

	function set_vwz4(vwz4:String):String{
		if(initialized('vwz4'))
			modified('vwz4');
		this.vwz4 = vwz4 ;
		return vwz4;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var vwz5(default,set):String;

	function set_vwz5(vwz5:String):String{
		if(initialized('vwz5'))
			modified('vwz5');
		this.vwz5 = vwz5 ;
		return vwz5;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var vwz6(default,set):String;

	function set_vwz6(vwz6:String):String{
		if(initialized('vwz6'))
			modified('vwz6');
		this.vwz6 = vwz6 ;
		return vwz6;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var vwz7(default,set):String;

	function set_vwz7(vwz7:String):String{
		if(initialized('vwz7'))
			modified('vwz7');
		this.vwz7 = vwz7 ;
		return vwz7;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var vwz8(default,set):String;

	function set_vwz8(vwz8:String):String{
		if(initialized('vwz8'))
			modified('vwz8');
		this.vwz8 = vwz8 ;
		return vwz8;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var vwz9(default,set):String;

	function set_vwz9(vwz9:String):String{
		if(initialized('vwz9'))
			modified('vwz9');
		this.vwz9 = vwz9 ;
		return vwz9;
	}	
		
	@dataType("bigint")
	@:isVar public var ba_id(default,set):Int;

	function set_ba_id(ba_id:Int):Int{
		if(initialized('ba_id'))
			modified('ba_id');
		this.ba_id = ba_id ;
		return ba_id;
	}	
		
	@dataType("bank_transfers_tracking_status")
	@:isVar public var tracking_status(default,set):String;

	function set_tracking_status(tracking_status:String):String{
		if(initialized('tracking_status'))
			modified('tracking_status');
		this.tracking_status = tracking_status ;
		return tracking_status;
	}	
		
	@dataType("date")
	@:isVar public var anforderungs_datum(default,set):String;

	function set_anforderungs_datum(anforderungs_datum:String):String{
		if(initialized('anforderungs_datum'))
			modified('anforderungs_datum');
		this.anforderungs_datum = anforderungs_datum ;
		return anforderungs_datum;
	}	
		
	@dataType("date")
	@:isVar public var rueck_datum(default,set):String;

	function set_rueck_datum(rueck_datum:String):String{
		if(initialized('rueck_datum'))
			modified('rueck_datum');
		this.rueck_datum = rueck_datum ;
		return rueck_datum;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var cycle(default,set):String;

	function set_cycle(cycle:String):String{
		if(initialized('cycle'))
			modified('cycle');
		this.cycle = cycle ;
		return cycle;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var ref_id(default,set):String;

	function set_ref_id(ref_id:String):String{
		if(initialized('ref_id'))
			modified('ref_id');
		this.ref_id = ref_id ;
		return ref_id;
	}	
		
	@dataType("character varying(11)")
	@:isVar public var mandat_id(default,set):String;

	function set_mandat_id(mandat_id:String):String{
		if(initialized('mandat_id'))
			modified('mandat_id');
		this.mandat_id = mandat_id ;
		return mandat_id;
	}	
		
	@dataType("date")
	@:isVar public var mandat_datum(default,set):String;

	function set_mandat_datum(mandat_datum:String):String{
		if(initialized('mandat_datum'))
			modified('mandat_datum');
		this.mandat_datum = mandat_datum ;
		return mandat_datum;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var ag_creditor_id(default,set):String;

	function set_ag_creditor_id(ag_creditor_id:String):String{
		if(initialized('ag_creditor_id'))
			modified('ag_creditor_id');
		this.ag_creditor_id = ag_creditor_id ;
		return ag_creditor_id;
	}	
		
	@dataType("character varying(4)")
	@:isVar public var sequenz(default,set):String;

	function set_sequenz(sequenz:String):String{
		if(initialized('sequenz'))
			modified('sequenz');
		this.sequenz = sequenz ;
		return sequenz;
	}	
		
	@dataType("character varying(32)")
	@:isVar public var super_ag_name(default,set):String;

	function set_super_ag_name(super_ag_name:String):String{
		if(initialized('super_ag_name'))
			modified('super_ag_name');
		this.super_ag_name = super_ag_name ;
		return super_ag_name;
	}	
	
}