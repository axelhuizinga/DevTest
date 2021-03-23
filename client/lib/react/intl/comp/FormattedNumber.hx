package react.intl.comp;

import react.ReactComponent;
import react.intl.NumberFormatOptions;

typedef FormattedNumberProps = {
	> NumberFormatOptions,
	var value:Any;
	@:optional var format:String;
	@:optional var children:String->ReactElement;
}

/**
	This component uses the `formatNumber` and `Intl.NumberFormat` [1] APIs.

	By default `<FormattedNumber>` will render the formatted number into a
	`<span>`. If you need to customize rendering, you can either wrap it with
	another React element (recommended), or pass a function as the child.

	[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat
**/
@:jsRequire('react-intl', 'FormattedNumber')
extern class FormattedNumber extends ReactComponentOfProps<FormattedNumberProps> {}

