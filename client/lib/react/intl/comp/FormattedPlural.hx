package react.intl.comp;

import react.ReactComponent;
import react.intl.PluralFormatOptions;

typedef FormattedPluralProps = {
	> PluralFormatOptions,
	var value:Any;
	var other:ReactElement;
	@:optional var zero:ReactElement;
	@:optional var one:ReactElement;
	@:optional var two:ReactElement;
	@:optional var few:ReactElement;
	@:optional var many:ReactElement;
	@:optional var children:ReactElement->ReactElement;
}

/**
	This component uses the `formatPlural` API.

	By default `<FormattedPlural>` will select a plural category (`zero`,
	`one`, `two`, `few`, `many`, or `other`) and render the corresponding React
	element into a `<span>`. If you need to customize rendering, you can either
	wrap it with another React element (recommended), or pass a function as the
	child.
**/
@:jsRequire('react-intl', 'FormattedPlural')
extern class FormattedPlural extends ReactComponentOfProps<FormattedPluralProps> {}

