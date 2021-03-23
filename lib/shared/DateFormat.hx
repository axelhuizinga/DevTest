package shared;

import js.lib.RegExp;
using DateTools;

enum abstract DateFormatResult(String)
{
	var OK;
	var IsEmpty;
	var PartMisMatch;
	var DateFormat;
	var DayFormatRange;
	var DayFormatSize;
	var MonthFormatRange;
	var MonthFormatSize;
	var YearFormatRange;
	var YearFormatSize;
}

typedef DateFormatted = 
{
	?date:Date,
	result:DateFormatResult
}

class DateFormat {

	public static function parseDE(dS:String, ?required:Bool):DateFormatted
	{
		dS = StringTools.trim(dS);
		if(dS == '')			
			return {result:(required?IsEmpty:OK)};
		if(dS.length!=10 || ~/\s|[a-zA-Z]/.match(dS))
			return {result:DateFormat};
		var dP:Array<Int> = dS.split('.').map(function (p:String) return Std.parseInt(p));
		
		if(dP.length!=3)
		{
			//VERIFY PARTS COUNT
			return {result:DateFormat};
		}

		if(dP[1] == null || dP[1] == 0 || dP[1] >12)
		{
			//VERIFY MONTH FORMAT MM
			return {result:MonthFormatRange};
		}
		if(dP[2] == null || dP[2] == 0 || dP[2] <1000 || dP[2]>2999)
		{
			//VERIFY YEAR FORMAT YYYY
			return {result:YearFormatRange};
		}		
		var day:String = App.sprintf('%02d',dP[0]);
		var month:String = App.sprintf('%02d', dP[1]);
		var year:String = App.sprintf('%d', dP[2]);
		var checkDayDate:Date = Date.fromString('01-$month-$year');
		var lastDay:Int = checkDayDate.getMonthDays();
		if(dP[0] == null  || dP[0] == 0 || dP[0]>lastDay)
		{
			return {result:DayFormatRange};
		}
		return {date:Date.fromString('$year-$month-$day'),result:OK};
	}

	public static function parseTimestampz(tz:String):Date {
		var b:Array<Int> = ~/[^0-9]/g.split(tz).map(function(t) return Std.parseInt(t));
		b[1] = b[1]-1;
		b[6] = 0;//Math.floor(b[6].substr(0,3);
		trace(b.join('-'));
		b.pop();
		return Date.fromTime(Reflect.callMethod(DateTools, Reflect.field(DateTools, 'makeUtc'),b));
	}
	
}