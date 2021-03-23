package react.intl.comp;

import react.ReactComponent;
import react.intl.MessageDescriptor;

typedef FormattedMessageProps = {
	> MessageDescriptor,
	@:optional var values:{};
	@:optional var tagName:String;
	@:optional var children:Dynamic;
}

/**
	This component uses the `formatMessage` API.

	By default `<FormattedMessage>` will render the formatted string into a
	`<span>`. If you need to customize rendering, you can either wrap it with
	another React element (recommended), specify a different `tagName` (e.g.,
	`'div'`), or pass a function as the child.

	See `<FormattedMessage>` documentation on React Intl:
	https://github.com/yahoo/react-intl/wiki/Components#formattedmessage
**/
@:jsRequire('react-intl', 'FormattedMessage')
extern class FormattedMessage extends ReactComponentOfProps<FormattedMessageProps> {}

