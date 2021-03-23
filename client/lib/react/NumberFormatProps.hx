package react;

import js.html.InputElement;
import js.html.Element;
import react.ReactComponent.ReactElement;
import react.ReactRef;
import haxe.ds.Either;
import haxe.Constraints.Function;
import react.ControlTypes;

/**
 * ...
 * @author axel@cunity.me
 */

enum abstract DisplayType(String) {
	var input;
	var text;
}

enum abstract ThousandsGroupStyle(String) {
	var thousand;
	var lakh;
	var wan;
}

enum abstract NFInputType(String) {
	var password;
	var tel;
	var text;
}

typedef NumberFormatProps = {
	>InputProps,
	?thousandSeparator: Either<String,Bool>,	
	?decimalScale:Int,
	?decimalSeparator: String,
	?thousandsGroupStyle: ThousandsGroupStyle,
	?fixedDecimalScale:Bool,
	?allowNegative:Bool,
	?allowEmptyFormatting:Bool,
	?allowLeadingZeros:Bool,
	?prefix:String,
	?suffix:String,
	?value:Dynamic,//Either<String, Float>,
	?defaultValue:Either<String, Float>,
	?isNumericString:Bool,
	?displayType:DisplayType,
	?type:NFInputType,
	
	?format:Dynamic,
	//?format:Either<String, String->String>,
	?removeFormatting:String->String,
	?mask:String,
	?customInput:ReactRef<InputElement>,
	?onValueChange:Dynamic->Void,
	?isAllowed:Dynamic->Bool,
	?renderText:String->ReactElement,
	?getInputRef:Element->Void,
	?allowedDecimalSeparators:Array<String>
}