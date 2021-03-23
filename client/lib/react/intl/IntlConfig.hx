package react.intl;

import react.ReactType;

typedef IntlConfig = {
	@:optional var locale:String;
	@:optional var formats:{}; // TODO: more precise type?
	@:optional var messages:Dynamic<String>;
	@:optional var defaultLocale:String;
	@:optional var defaultFormats:{}; // TODO: more precise type?
	@:optional var textComponent:ReactType;
}

