package react;

import js.lib.intl.DateTimeFormat;
import js.html.InputElement;
import js.html.KeyboardEvent;
//import js.lib.Date;
import react.ReactComponent.ReactFragment;
import react.ReactRef;
import react.ReactMacro.jsx;
import react.DateControlTypes;
import react.PureComponent.PureComponentOfProps;
import view.shared.io.Tooltip;

using shared.DateFormat;

/**
 * ...
 * @author axel@cunity.me
 */

class DateTimeControl extends  PureComponentOfProps<DateTimeProps>
{
	var fpRef:ReactRef<InputElement>;
	var fpInstance:Dynamic;//FlashPicker instance
	var tip:Tooltip;

	public function new(props:DateTimeProps) 
	{
		//trace( props.value );
		super(props);
		//trace(Reflect.fields(props));
		fpRef = React.createRef();
	}

	//public function createFlatPicker():Void 
	override public function componentDidMount():Void 
	{
		var fP:Dynamic = App.flatpickr;
		var val:Date = (props.value == null ? null:parseTimestampz(props.value));
		trace('given:${props.value} got:$val format:${props.options.dateFormat}');
		fpInstance = fP(fpRef.current,{
				allowInput:!props.disabled,
				altFormat:props.options.dateFormat,
				dateFormat:'Y-m-d H:i:S',
				//dateFormat:props.options.dateFormat,
				altInput:true,//props.options.allowInput,
				altInputClass: "form-control input",
				defaultValue:props.value, 
				//onChange:onChange,
				onClose:onClose,
				onReady:onReady
		});

		var altInput:InputElement = fpInstance.altInput;
		
		//trace(untyped  fpRef.current.value);
		if(!props.disabled)
		{
		//	altInput.value = props.value == null? '': fpInstance.formatDate(new Date(props.value), 
			altInput.value = props.value == null? '': fpInstance.formatDate(Date.fromString(props.value), 
			fpInstance.config.altFormat);
			trace(fpInstance.input.value);			
			altInput.addEventListener('keyup', function(ev:KeyboardEvent){
				//trace(ev.key);
				fpInstance.close();
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
						return;		
					}

				}
				//trace(fP.input);
				//trace(fP.input.value);
				var val:String = altInput.value;
				var pd:Date = fpInstance.parseDate(val, fpInstance.config.altFormat);
				//trace('$val === ${pd.toString()}');
				var fD:String = fpInstance.formatDate(pd, fpInstance.config.altFormat);
				//trace('$val==$fD');
				if(val==fD)
				{
					fpInstance.setDate(val,true,fpInstance.config.altFormat);
				}
			});

			altInput.addEventListener('blur', function(ev:KeyboardEvent){
				//trace(ev.key);
	//			fpInstance.close();	
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

				//trace(fpInstance.input);
				//trace(fpInstance.input.value);
				var val:String = altInput.value;
				var pd:Date = fpInstance.parseDate(val, fpInstance.config.altFormat);
				//trace('$val === ${pd.toString()}');
				var fD:String = fpInstance.formatDate(pd, fpInstance.config.altFormat);
				trace('$val==$fD');
				if(val==fD)
				{
					fpInstance.setDate(val,true,fpInstance.config.altFormat);
					if(tip != null)
						tip.clear();
				}
			});		
		}
	}


	public static function parseTimestampz(tz:String):Date {
		var b:Array<Int> = ~/[^0-9]/g.split(tz).map(function(t) return Std.parseInt(t));
		b[1] = b[1]-1;
		//b[6] = 0;//Math.floor(b[6].substr(0,3);
		trace(b.join('-'));
		b.pop();
		trace('DateTools has makeUtc:' + (Type.getClassFields(DateTools).contains('makeUtc')?'Y':'N'));
		//return Date.fromTime(Reflect.callMethod(DateTools, Reflect.field(DateTools, 'makeUtc'),b));
		return Date.fromTime(DateTools.makeUtc(b[0],b[1],b[2],b[3],b[4],b[5]));
		//return new Date('05.05.1954');

	}
 
	function onChange(_) {
		if(props.comp != null)
		{
			props.comp.doChange(props.name, fpInstance.input.value);
		}
	}

	function onClose (sDates:Array<Dynamic>,val:String,me:DateTimePicker)
	{
		//trace(tip);
		//trace(fpInstance.altInput.value);
		//if(fpInstance.altInput.value!=null)
		//trace(val + '==' + fpInstance.formatDate(fpInstance.parseDate(fpInstance.altInput.value), fpInstance.config.altFormat));
		if(tip != null)
			tip.clear();
		if(fpInstance.altInput.value==null)
		if(val==fpInstance.formatDate(fpInstance.parseDate(fpInstance.altInput.value), fpInstance.config.altFormat))
		{

		}
		else 
		{
			fpInstance.altInput.value = fpInstance.formatDate(fpInstance.input.value, fpInstance.config.altFormat);
			tip = new Tooltip(fpInstance.altInput.parentElement, {data: 'DateFormat',classes:['danger','active']});

		}		

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
		//trace('${props.name}:${props.value}');
		return  jsx('<input className="h100"  name=${props.name} id=${props.name} ref=${fpRef} disabled=${props.disabled}
			defaultValue=${props.value}/>');
	}	
}