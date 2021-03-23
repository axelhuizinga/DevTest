package react;

import js.html.InputEvent;
import haxe.Timer;
import js.html.Element;
import js.html.FilePropertyBag;
import js.html.Event;
import js.html.InputElement;
import js.html.KeyboardEvent;
import js.html.Document;
import react.ReactComponent.ReactFragment;
import react.ReactRef;
import js.Lib;
import react.ReactComponent.ReactComponentOfProps;
import react.ReactMacro.jsx;
import react.DateControlTypes;
import react.Flatpickr;
import shared.DateFormat;
import view.shared.io.Tooltip;
import haxe.EnumTools.EnumValueTools;

using haxe.EnumTools;
using shared.DateFormat;

/**
 * ...
 * @author axel@cunity.me
 */

class DateControl2 extends ReactComponentOfProps<DateTimeProps>
{
	static var css = js.Lib.require('react-datepicker/dist/react-datepicker.css');
	static var flat = js.Lib.require('flatpickr/dist/themes/light.css');
	static var flatpickr = js.Lib.require('flatpickr');
	static var German = js.Lib.require('flatpickr/dist/l10n/de.js');	

	var fpRef:ReactRef<InputElement>;
	var fP:FlatpickrJS;
	var tip:Tooltip;

	public function new(props) 
	{
		//trace( props.value );
		super(props);
		flatpickr.localize(German);
		trace(props);
	}

	function onClose (sDates:Array<Dynamic>,val:String,me:DateTimePicker)
		{
			trace(sDates);
			trace(val);
			if(tip != null)
				tip.clear();
		}
	override public function componentDidMount():Void 
	{
		//get flatpickr instance);
		fP = Reflect.field(fpRef, 'flatpickr');
		if(fP==null)
			return;
		var altInput:InputElement = fP.altInput;
		trace(Reflect.fields(fP));
		trace(Reflect.fields(altInput));

		altInput.addEventListener('keyup', function(ev:KeyboardEvent){
			//trace(ev.key);
			fP.close();
			if(ev.key=='Enter')
			{
				var dF:DateFormatted = altInput.value.parseDE();
				//if(dF.result.getName() != DateFormatResult.OK)
				switch (dF.result)//,DateFormatResult.OK))
				{
					case DateFormatResult.OK:
						if(tip != null)
							tip.clear();
					default:
					ev.preventDefault();
					ev.stopImmediatePropagation();
					tip = new Tooltip(altInput.parentElement, {data: Std.string(dF.result),classes:['danger','active']});			
				}

			}
			//trace(fP.input);
			//trace(fP.input.value);
			var val:String = altInput.value;
			var pd:Date = fP.parseDate(val, fP.config.altFormat);
			//trace('$val === ${pd.toString()}');
			var fD:String = fP.formatDate(pd, fP.config.altFormat);
			trace('$val==$fD');
			if(val==fD)
			{
				fP.setDate(val,true,fP.config.altFormat);
			}
		});

		altInput.addEventListener('blur', function(ev:KeyboardEvent){
			//trace(ev.key);
//			fP.close();	
			var dF:DateFormatted = altInput.value.parseDE();
			//if(dF.result.getName() != DateFormatResult.OK)
			switch (dF.result)//,DateFormatResult.OK))
			{
				case DateFormatResult.OK:
					if(tip != null)
						tip.clear();
				default:
				ev.preventDefault();
				ev.stopImmediatePropagation();
				tip = new Tooltip(altInput.parentElement, {data: Std.string(dF.result),classes:['danger','active']});			
			}

			//trace(fP.input);
			//trace(fP.input.value);
			var val:String = altInput.value;
			var pd:Date = fP.parseDate(val, fP.config.altFormat);
			//trace('$val === ${pd.toString()}');
			var fD:String = fP.formatDate(pd, fP.config.altFormat);
			trace('$val==$fD');
			if(val==fD)
			{
				fP.setDate(val,true,fP.config.altFormat);
			}
		});		
		if(props.comp != null)
		fP.input.addEventListener('change', function (evt:InputEvent)
		{
			trace(props.comp);
			props.comp.onChange(evt);
		});
	}

	override public function render():ReactFragment
	{
		trace( props.value );
		var val = (props.value == null ?'0000.00.00':props.value);
		//var val:String = props.value;
		//val = val.split('+')[0];
		return  jsx('
		<$Flatpickr     
			options=${{
				allowInput:true,
				altFormat:props.options.dateFormat,
				dateFormat:'Y-m-d',
				altInput:true,
				altInputClass: "form-control input",
				defaultValue:val,
				locale:'de',
				onChange:onChange,
				onClose:onClose
			}}
			ref=${function(fP)this.fpRef = fP}
			value=${Date.fromString(val)}
			name=${props.name}
			
			className="h100" 
			/>
		');
	}	
	
	 /* [Description]
	 * @param sDates 
	 * @param val 
	 * @param me 
	 */

	function onChange(sDates:Array<Dynamic>,val:String,me:DateTimePicker) {
		trace(val);
		trace(props.name);
		//fP.close();onChange=${props.onChange} 
		trace(props.onChange);
		//props.onChange({target:{name:props.name,value:val}});/****/
	}
}