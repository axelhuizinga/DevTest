package react.intl;

@:enum abstract PluralResult(String) to String {
	var Zero = 'zero';
	var One = 'one';
	var Two = 'two';
	var Few = 'few';
	var Many = 'many';
	var Other = 'other';
}
