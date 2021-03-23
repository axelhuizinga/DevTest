package react;

import view.shared.io.BaseForm;
import react.PureComponent.PureComponentOfProps;
import js.lib.intl.DateTimeFormat;
import js.html.InputElement;
import js.html.KeyboardEvent;
import js.lib.Date;
import react.ReactComponent.ReactFragment;
import react.ReactRef;
import react.ReactMacro.jsx;
import react.DateControlTypes;
import view.shared.io.Tooltip;

using shared.DateFormat;

/**
 * ...
 * @author axel@cunity.me
 */

class DateControl extends PureComponentOfProps<DateTimeProps>
{
	var fpRef:ReactRef<InputElement>;
	var fpInstance:Dynamic;//FlashPicker instance
	var tip:Tooltip;

	public function new(props:DateTimeProps) 
	{
		trace( props.value );
		super(props);
		//this.props = props;
		//trace(Reflect.fields(props));
		fpRef = React.createRef();
	}

	//public function createFlatPicker():Void 
	override public function componentDidMount():Void 
	{
		var fP:Dynamic = App.flatpickr;
		
		//var val = (props.value == null ?'':props.value);
		var val = (props.value == null ?'':'00.00.0000');
		trace('$val =>${props.value}<<');
		fpInstance = fP(fpRef.current,{
				allowInput:!props.disabled,
				altFormat:props.options.dateFormat,
				clickOpens:!props.disabled,
				dateFormat:'Y-m-d',//props.options.dateFormat,//'Y-m-d',
				altInput:true,
				//altInputClass: "form-control input",
				defaultValue:props.value,
				locale:'de',
				onChange:onChange,
				onClose:onClose,
				onOpen:onOpen,
				onReady:onReady
		});
		trace('fpInstance.input.value:${fpInstance.input.value}');			
	}

	function onOpen(e:Dynamic) {
		trace(e);
	}

	function onChange(_) {
		if(props.comp != null)
		{
			BaseForm.doChange(props.comp, props.name, fpInstance.input.value);
		}
	}

	function onClose (sDates:Array<Dynamic>,val:String,me:DateTimePicker)
	{
		trace(val);
		//trace(fpInstance.altInput.value);

		if(tip != null)
			tip.clear();
	}

	function onReady(sDates:Array<Dynamic>,val:String,me:Dynamic)
	{
		trace('${sDates} $val ');
		//trace(me);
	}
	
	override public function render():ReactFragment
	{
		if(props == null)
		{
			trace(null);
			return null;
		}

		return  jsx('<input className="h100" name=${props.name} id=${props.name} ref=${fpRef} 
			defaultValue=${props.value}/>');
	}	
}