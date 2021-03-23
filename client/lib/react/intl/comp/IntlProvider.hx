package react.intl.comp;

import react.ReactComponent;
import react.intl.IntlConfig;

typedef IntlProviderProps = {
	> IntlConfig,
	var children:ReactElement;
	@:optional var initialNow:Any;
}

/**
	This component is used to setup the i18n context for a tree. Usually, this
	component will wrap an app's root component so that the entire app will be
	within the configured i18n context.

	`locale`, `formats`, and `messages` are for the user's current locale and
	what the app should be rendered in. While `defaultLocale` and
	`defaultFormats` are for fallbacks or during development and represent the
	app's default. Notice how there is no `defaultMessages`, that's because
	each Message Descriptor provides a `defaultMessage`.

	`textComponent` provides a way to configure React Intl to work with React
	Native. React Intl's `<Formatted*>` components are required to render React
	elements, by default they render `<span>` elements. However in React
	Native, there is no `<span>`, there's `<Text>`; therefore if you're using
	React Intl in React Native set: `<IntlProvider textComponent={Text}>`.

	`initialNow` should be set for universal/isomorphic apps. This value should
	be capture on the server before the app is rendered and transmitted to the
	client to use at its `initialNow` as well. This stabilizes the "current
	time" for the initial rendering of the app, which affects relative time
	formatting.

	Finally, a single child element must be supplied to `<IntlProvider>`.

	Multiple Intl Contexts
	Nested `<IntlProvider>` components can be used to provide a different, or
	modified i18n context to a subtree of the app. In these cases, the nested
	`<IntlProvider>` will inherit from its nearest ancestor `<IntlProvider>`. A
	nested strategy can be employed to provide a subset of translations to a
	subtree.

	Dynamic Language Selection
	By default, changes to the `locale` at runtime may not trigger a re-render
	of child elements. To solve this, and enable dynamic locale modification,
	add a `key` property to the `<IntlProvider>` and set it to the locale,
	which persuades React that the component has been modified.
**/
@:jsRequire('react-intl', 'IntlProvider')
extern class IntlProvider extends ReactComponentOfProps<IntlProviderProps> {
	public function getChildContext():{intl:IntlShape};
}

