package react.intl;

typedef IntlFormat = {
	var formatDate:Any->?{}->String;
	var formatTime:Any->?{}->String;
	var formatRelative:Any->?{}->String;
	var formatNumber:Any->?{}->String;
	var formatPlural:Any->?{}->String;
	var formatMessage:MessageDescriptor->?{}->String;
	var formatHTMLMessage:MessageDescriptor->?{}->String;
}

