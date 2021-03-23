package react;

import haxe.Timer;
import js.Lib;
import react.ReactComponent.ReactComponentOfProps;
import react.ReactMacro.jsx;
import react.DateTimePicker;

/**
 * ...
 * @author axel@cunity.me
 */

typedef DateTimeProps2 =
{
	?className:String,
	?locale:String,
	?input:Bool,
	value:Any
}

class ReactDateTimeClock extends ReactComponentOfProps<DateTimeProps2>
{
	
	public function new(props) 
	{
		//trace( props.value );
		super(props);
		
	}
	
	override public function render()
	{
		//trace( props.value );
		return jsx('
			<DateTimePicker value={props.value} className={props.className} locale="de-DE" disabled={true} clearIcon={null} calendarIcon={null} />
		');
	}
}