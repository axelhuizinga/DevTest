package view.shared.io;

class Param {

	public static function pInts(ints:Array<Int>):String
	{
		return ints.map(function(i)return Std.string(i)).join('|');
	}

	public static function pStrings(ids:Array<String>):String
		{
			return ids.map(function(i)return i).join('|');
		}	
	
}