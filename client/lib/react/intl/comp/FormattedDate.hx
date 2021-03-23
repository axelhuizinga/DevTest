package react.intl.comp;

import react.ReactComponent;
import react.intl.DateTimeFormatOptions;

typedef FormattedDateProps = {
	> DateTimeFormatOptions,
	var value:Any;
	@:optional var format:String;
	@:optional var children:String->ReactElement;
	@:optional var className:String;

}

/**
	This component uses the `formatDate` and `Intl.DateTimeFormat` [1] APIs and
	has `props` that correspond to `DateTimeFormatOptions`.

	By default `<FormattedDate>` will render the formatted date into a
	`<span>`. If you need to customize rendering, you can either wrap it with
	another React element (recommended), or pass a function as the child.

	[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
**/
@:jsRequire('react-intl', 'FormattedDate')
extern class FormattedDate extends ReactComponentOfProps<FormattedDateProps> {}

