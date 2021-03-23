package react.intl;

@:enum abstract NumberStyle(String) to String {
	var Decimal = 'decimal';
	var Currency = 'currency';
	var Percent = 'percent';
}

@:enum abstract CurrencyDisplay(String) to String {
	var Symbol = 'symbol';
	var Code = 'code';
	var Name = 'name';
}

typedef NumberFormatOptions = {
	@:optional var localeMatcher:LocaleMatcher;
	@:optional var style:NumberStyle;
	@:optional var currency:String;
	@:optional var currencyDisplay:CurrencyDisplay;
	@:optional var useGrouping:Bool;
	@:optional var minimumIntegerDigits:Int;
	@:optional var minimumFractionDigits:Int;
	@:optional var maximumFractionDigits:Int;
	@:optional var minimumSignificantDigits:Int;
	@:optional var maximumSignificantDigits:Int;
}

typedef NumberFormatOptionsWithFormat = {
	> NumberFormatOptions,
	@:optional var format:String;
}

