package react.intl.comp;

import react.ReactComponent;
import react.intl.DateTimeFormatOptions;

typedef FormattedTimeProps = {
	> DateTimeFormatOptions,
	var value:Any;
	@:optional var format:String;
	@:optional var children:String->ReactElement;
}

/**
	This component uses the `formatDate` and `Intl.DateTimeFormat` [1] APIs and
	has `props` that correspond to `DateTimeFormatOptions`, with the following
	defaults:

	```
	{
		hour: 'numeric',
		minute: 'numeric'
	}
	```

	By default `<FormattedTime>` will render the formatted time into a
	`<span>`. If you need to customize rendering, you can either wrap it with
	another React element (recommended), or pass a function as the child.

	[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
**/
@:jsRequire('react-intl', 'FormattedTime')
extern class FormattedTime extends ReactComponentOfProps<FormattedTimeProps> {}

