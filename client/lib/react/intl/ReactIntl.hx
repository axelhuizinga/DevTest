package react.intl;

import haxe.extern.EitherType;
import react.ReactType;
import react.intl.DateTimeFormatOptions;
import react.intl.NumberFormatOptions;
import react.intl.RelativeTimeFormatOptions;

@:jsRequire('react-intl')
extern class ReactIntl {
	/**
		This function provides a way to register locale data with the library.
		The locale data added with this function supports plural and
		relative-time formatting features as described in Loading Locale Data
		[1].

		Note:
		This function mutates a shared locale data registry which is used by
		all importers of the module instance.

		[1]: https://github.com/yahoo/react-intl/wiki#loading-locale-data
	**/
	static function addLocaleData<LocaleData:{locale:String}>(data:EitherType<LocaleData, Array<LocaleData>>):Void;

	/**
		This function is simply a hook for the babel-plugin-react-intl [1]
		package to use when extracting default messages defined in JavaScript
		source files. This function simply returns the Message Descriptor map
		object that's passed-in.

		[1]: https://github.com/yahoo/babel-plugin-react-intl
	**/
	static function defineMessages(messageDescriptors:Dynamic<MessageDescriptor>):Dynamic<MessageDescriptor>;

	/**
		This function is a High-Order Component (HOC) factory. It will wrap the
		passed-in React component with another React component which provides
		the imperative formatting API into the wrapped component via its
		`props`. (This is similar to the connect-to-stores pattern found in
		many Flux implementations.)

		By default, the formatting API will be provided to the wrapped
		component via `props.intl`, but this can be overridden when specifying
		`options.intlPropName`. The value of the prop will be of type
		`IntlShape`.
	**/
	static function injectIntl(wrappedComponent:ReactType, ?options:InjectIntlOptions):ReactType;

	/**
		This function will return a formatted date string. It expects a `value`
		which can be parsed as a date (i.e., `isFinite(new Date(value))`), and
		accepts `options` that conform to `DateTimeFormatOptions`.
	**/
	static function formatDate(value:Any, ?options:DateTimeFormatOptionsWithFormat):String;

	/**
		This function will return a formatted date string, but it differs from
		`formatDate` by having the following default options:

		```
		{
			hour: 'numeric',
			minute: 'numeric'
		}
		```

		It expects a `value` which can be parsed as a date (i.e.,
		`isFinite(new Date(value))`), and accepts `options` that conform to
		`DateTimeFormatOptions`.
	**/
	static function formatTime(value:Any, ?options:DateTimeFormatOptionsWithFormat):String;

	/**
		This function will return a formatted relative time string (e.g., "1
		hour ago"). It expects a `value` which can be parsed as a date (i.e.,
		`isFinite(new Date(value))`), and accepts `options` that conform to
		`RelativeFormatOptions`.

		By default, the `value` is compared with the current time at the time
		the function is called, but this reference time value can be explicitly
		specified via the `now` option.

		```
			var now = Date.now().getTime();
			formatRelative(now); // "now"
			formatRelative(now - 1000); // "1 second ago"
			formatRelative(now + 1000 * 60 * 60); // "in 1 hour"
			formatRelative(now - 1000 * 60 * 60 * 24); // "yesterday"
			formatRelative(now - 1000 * 60 * 60 * 24, {style: 'numeric'}); // "1 day ago"
			formatRelative(now - 1000 * 60 * 60 * 24, {units: 'hour'}); // "24 hours ago"
		```
	**/
	static function formatRelative(value:Any, ?options:RelativeTimeFormatOptionsWithFormat):String;

	/**
		This function uses `Intl.NumberFormat` [1] which allows them to provide
		options.

		This function will return a formatted number string. It expects a
		`value` which can be parsed as a number, and accepts `options` that
		conform to `NumberFormatOptions`.

		[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat
	**/
	static function formatNumber(value:Any, ?options:NumberFormatOptionsWithFormat):String;

	/**
		This function will return a plural category string: `"zero"`, `"one"`,
		`"two"`, `"few"`, `"many"`, or `"other"`. It expects a `value` which
		can be parsed as a number, and accepts `options` that conform to
		`PluralFormatOptions`.

		This is a low-level utility whose output could be provided to a
		`switch` statement to select a particular string to display.

		```
		formatPlural(0); // "other"
		formatPlural(1); // "one"
		formatPlural(2); // "other"
		formatPlural(2, {style: 'ordinal'}); // "two"
		formatPlural(3, {style: 'ordinal'}); // "few"
		formatPlural(4, {style: 'ordinal'}); // "other"
		```

		Note:
		This function should only be used in apps that only need to support one
		language. If your app supports multiple languages use `formatMessage`
		instead.
	**/
	static function formatPlural(value:Any, ?options:PluralFormatOptions):PluralResult;

	/**
		This function will return a formatted message string. It expects a
		`MessageDescriptor` with at least an `id` property, and accepts a
		shallow `values` object which are used to fill placeholders in the
		message.

		If a translated message with the `id` has been passed to the
		`<IntlProvider>` via its `messages` prop it will be formatted,
		otherwise it will fallback to formatting `defaultMessage`.
	**/
	static function formatMessage(messageDescriptor:MessageDescriptor, ?values:{}):String;

	/**
		Note:
		This API is provided to format legacy string message that contain HTML,
		but is not recommended, use `<FormattedMessage>` instead.
	**/
	static function formatHTMLMessage(messageDescriptor:MessageDescriptor, ?values:{}):String;
}

