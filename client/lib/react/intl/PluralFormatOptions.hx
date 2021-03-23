package react.intl;

@:enum abstract PluralStyle(String) to String {
	var Cardinal = 'cardinal';
	var Ordinal = 'ordinal';
}

typedef PluralFormatOptions = {
	@:optional var style:PluralStyle;
}

