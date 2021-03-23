package react.intl;

@:enum abstract FormatMatcher(String) to String {
	var Basic = 'basic';
	var BestFit = 'best fit';
}

@:enum abstract EraFormat(String) to String {
	var Narrow = 'narrow';
	var Short = 'short';
	var Long = 'long';
}

@:enum abstract NumericFormat(String) to String {
	var Numeric = 'numeric';
	var TwoDigit = '2-digit';
}

@:enum abstract MonthFormat(String) to String {
	var Numeric = 'numeric';
	var TwoDigit = '2-digit';
	var Narrow = 'narrow';
	var Short = 'short';
	var Long = 'long';
}

@:enum abstract TimezoneFormat(String) to String {
	var Short = 'short';
	var Long = 'long';
}

typedef DateTimeFormatOptions = {
	@:optional var localeMatcher:LocaleMatcher;
	@:optional var formatMatcher:FormatMatcher;
	@:optional var timeZone:String;
	@:optional var hour12:Bool;
	@:optional var weekday:EraFormat;
	@:optional var era:EraFormat;
	@:optional var year:NumericFormat;
	@:optional var month:MonthFormat;
	@:optional var day:NumericFormat;
	@:optional var hour:NumericFormat;
	@:optional var minute:NumericFormat;
	@:optional var second:NumericFormat;
	@:optional var timeZoneName:TimezoneFormat;
}

typedef DateTimeFormatOptionsWithFormat = {
	> DateTimeFormatOptions,
	@:optional var format:String;
}
