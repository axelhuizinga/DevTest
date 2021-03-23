package react.intl;

@:enum abstract RelativeTimeFormatStyle(String) to String {
	var BestFit = 'best fit';
	var Numeric = 'numeric';
}

@:enum abstract TimeUnit(String) to String {
	var Second = 'second';
	var Minute = 'minute';
	var Hour = 'hour';
	var Day = 'day';
	var Month = 'month';
	var Year = 'year';
}

typedef RelativeTimeFormatOptions = {
	@:optional var style:RelativeTimeFormatStyle;
	@:optional var units:TimeUnit;
}

typedef RelativeTimeFormatOptionsWithFormat = {
	> RelativeTimeFormatOptions,
	@:optional var format:String;
	@:optional var now:Any;
}

