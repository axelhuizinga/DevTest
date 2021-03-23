package view.shared;

class Format
{
	public static var formatBool = function(v:Dynamic) {return (v?'Y':'N'); }
	public static var formatElementSelection = function(v:Dynamic) {return (v?'Y':'N'); }
    static var formatPhone = function(v:String){return (~/^(+|0)/.match(v)?v:'0$v');};    
}