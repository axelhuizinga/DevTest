package react.intl.comp;

import react.ReactComponent;
import react.intl.comp.FormattedMessage.FormattedMessageProps;

/**
	Note:
	This component is provided for apps that have legacy external strings which
	contain HTML, but is not recommended, use `<FormattedMessage>` instead, if
	you can.

	This component uses the `formatHTMLMessage` API and has the same props as
	`<FormattedMessage>`, but it will accept messages that contain HTML. In
	order to protect against XSS, all string `values` will be HTML-escaped and
	the resulting formatted message will be set via `dangerouslySetInnerHTML`.
	This means that `values` cannot contain React element like
	`<FormattedMessage>` and this component will be less performant.

	See `<FormattedHTMLMessage>` documentation on React Intl:
	https://github.com/yahoo/react-intl/wiki/Components#formattedhtmlmessage
**/
@:jsRequire('react-intl', 'FormattedHTMLMessage')
extern class FormattedHTMLMessage extends ReactComponentOfProps<FormattedMessageProps> {}

