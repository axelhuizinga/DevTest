package view.shared;


import view.shared.io.BaseForm;
import react.NumberFormatProps;
import react.ReactUtil;
import js.html.AbortController;
import js.html.Element;
import js.html.Event;
import bulma_components.Button;
import js.html.InputElement;
import react.DateControlTypes.DateTimeProps;
import react.NumberFormat;
import shared.Utils;
import haxe.ds.StringMap;

import react.React;
import react.ReactType;
import haxe.ds.StringMap;
import haxe.Constraints.Function;
//import macrotools.Macro.model;
import shared.DateFormat;
import shared.DBMetaData;
import shared.DbData;
import js.html.XMLHttpRequest;
import haxe.http.HttpJs;
import react.ReactComponent.ReactFragment;
import react.ReactMacro.jsx;
import view.shared.FormInputElement;
import state.FormState;
import view.shared.io.DataAccess;
import react.DateControl;
import react.DateTimeControl;

using Lambda;
using StringTools;

typedef BButton = bulma_components.Button;

class FormBuilder {
    public var requests:Array<OneOf<HttpJs, XMLHttpRequest>>;
	public var dataAccess:DataAccess;
	public var dbData:DbData;
	public var dbMetaData:DBMetaData;
	public var formColElements:Map<String,Array<FormField>>;
	public var _menuItems:Array<MItem>;
	public var fState:FormState;
	public var _fstate:FormState;
	public var initialState:Dynamic;
	public var section:String;
	var comp:Dynamic;
	var sM:MenuProps;
	var i:Int;
	
	public function new(rc:Dynamic)
	{
		comp = rc;
		i = 1;
		requests = [];
		if(rc.props != null)
		{
			trace(Reflect.fields(comp));
		}
		//dbData = new DbData();
		//trace('>>>${props.match.params.acton}<<<');
	}  


	function renderElement(el:ReactFragment, ki, label):ReactFragment
	{
		return	jsx('
			<div key=${i++} className="g_row_2" role="rowgroup">
				<div className="g_cell" role="cell">${label}</div>
				<div className="g_cell_r" role="cell">
				${el}
				</div>
			</div>
		');	
	}

	function renderOption(si:Int,label:String,?value:Dynamic) {
		return	
			value == null ? jsx('<option key=${i++}>$label</option>'):
			jsx('<option key=${i++} value=${value}>$label</option>');
	}

	function renderSelect(name:String,options:StringMap<String>):ReactFragment
	{
		var si:Int = 1;
		return [for (value=>label in options)
		{
			renderOption(si++, label,value);
		}].array();
	}

	function renderRadio(name:String,options:StringMap<String>, actValue:String):ReactFragment
	{
		var si:Int = 1;
		//onChange=${onChange} 
		return [for (value=>label in options)
		{			
			//var check:Bool = actValue==value;
			var check:String = (actValue==value ? 'on':'');
			//trace('$check $actValue $value');
			jsx('
			<>
				<label key=${i++} >${label}</label>
				<input key=${i++} type="radio" name=${name} defaultChecked=${check} onChange=${onChange} value=${value}/>
			</>');
		}].array();
	}


	function renderFormInputElements(fields:Map<String, FormField>, initialData:Dynamic, ?compOnChange:Function):ReactFragment
	{
		var ki:Int = 0;
		//trace(Utils.genKey(1));
		return [for(name => field in fields)
		{
			var value:Dynamic = Reflect.field(initialData,name);
			//if(name=='date_of_birth')trace (field.type +' $name:' + value);
			//trace(field.type);
			switch (field.type)
			{
				case FormInputElement.Hidden:
					jsx('<input key=${i++} type="hidden" name=${name} defaultValue=${value}/>');
				case FormInputElement.Button: 
					jsx('<button type="submit" key=${i++} >
						${value}
					</button>');
				case FormInputElement.Checkbox:		
					//trace(field);//disabled=${field.disabled} required=${field.required}//false;//true;
					//trace (field.type +' $name:' + value);
					var checked:Bool = switch(value)
					{
						case "TRUE"|true|"on"|"1":
							true; 
						default:
							false;
					};
					//trace(checked);
					renderElement(
						jsx('<input name=${name}  key=${i++} type="checkbox" defaultChecked=${checked} onChange=${onChange} />')
						/*(checked?
							jsx('<input name=${name}  key=${i++} type="checkbox" checked="checked" onChange=${onChange} />') :
							jsx('<input name=${name}  key=${i++} type="checkbox"  onChange=${onChange} />'	)
						)*/,
						ki++, field.label
					);
				case Radio:
					//trace (field.type +' $name:' + value);
					jsx('<div key=${i++} className="g_row_2" role="rowgroup">
						<div className="g_cell" role="cell">${field.label}</div>
						<div className="g_cell_r optLabel" role="cell">
							${renderRadio(name,field.options, value)}
						</div>
					</div>');				
				case Select:
				renderElement(
					jsx('<select name=${name} onChange=${onChange}  defaultValue=${value} key=${i++} 
						multiple=${field.multiple}>${renderSelect(name,field.options)}</select>'),
					ki++, field.label
				);
				case FormInputElement.DateTimePicker:
					var dTC:DateTimeProps = {
						comp:comp,
						name:name,
						disabled:field.disabled,
						onChange: onChange,						
						options:{
							dateFormat:field.displayFormat, 
							defaultDate: value,
							time_24hr:true,
							_inline:field.disabled
						},
						value:value
					};
					jsx('
					<div key=${i++} className="g_row_2" role="rowgroup">
						<div className="g_cell" role="cell">${field.label}</div>
						<div className="g_cell_r" role="cell">
							<$DateTimeControl ${...dTC}/>
						</div>
					</div>');								
				case FormInputElement.DatePicker:
					//trace(field.disabled);
					var dC:DateTimeProps = {
						comp:comp,
						disabled:field.disabled,
						name:name,
						onChange: onChange,
						options:{
							dateFormat:field.displayFormat,
							defaultDate:'00.00.0000',//Date.now(),
							_inline:field.disabled
						},
						value:value
					};
					jsx('
					<div key=${i++} className="g_row_2" role="rowgroup">
						<div className="g_cell" role="cell">${field.label}</div>
						<div className="g_cell_r" role="cell">
							<$DateControl ${...dC}/>
						</div>
					</div>');
				case FormInputElement.NFormat:
					var nfP:NumberFormatProps = {
						//getInputRef:React.createRef(),
						decimalScale:2,
						decimalSeparator:",",						
						fixedDecimalScale:true,
						/*format:function(nV:String) {
							return nV.replace('.',',');
						},*/
						isNumericString: true,
						name:name,
						onChange: onChange,
						onValueChange: function(values:Dynamic){
							trace(values);
						},
						removeFormatting: function(fV:String){
							
							trace(Std.string(Std.parseFloat(fV)));
							return Std.string(Std.parseFloat(fV));
						},
						suffix: ' €',
						value:value
					};
					jsx('
					<div key=${i++} className="g_row_2" role="rowgroup">
						<div className="g_cell" role="cell">${field.label}</div>
						<div className="g_cell_r" role="cell">
							<$NumberFormat ${...nfP}/>
						</div>
					</div>');			
				case FormInputElement.Upload:
					jsx('
					<div key=${i++} className="g_row_2" role="rowgroup">
						<div className="g_cell" role="cell">${field.label}</div>
						<div className="g_cell_r" role="cell">
							Dummy
						</div>
					</div>');
				default:
					renderElement(
						jsx('<input name=${name} onChange=${onChange} type="text" defaultValue=${value} disabled=${field.disabled} required=${field.required}/>'),
						ki++, field.label
					);
			}
		}].array();
		//trace(fields.array());
		return null;
	}	

    public function renderForm(props:FormState, initialState:Dynamic):ReactFragment
    {
		//trace(props.fields.toString());
		//trace(Std.string(props.fields));
		//return null;formField<div className="g_block" ></div>${renderForms(props.modals)}
		//trace(props); ref=${props.ref} <div className="g_footer" ></div>	
		var sK:Int = 0;
		
		return jsx('<form name=${props.model} key=${props.model} className="tabComponentForm formField" ref=${props.formRef}>
				<div className="grid_box" role="table" aria-label="Destinations">
					<div className="g_caption" >${props.title}</div>						
					${renderFormInputElements(props.fields, initialState)}						
				</div>			
			</form>
		');				
	}	

	/*function renderForms(props:FormState){
		return 
			for(m in props.modals)[
				jsx('<form name=${props.model} className="tabComponentForm" ref=${props.ref}>
					<div className="grid_box" role="table" aria-label="Destinations">
						<div className="g_caption" >${props.title}</div>						
						${renderFormInputElements(props.fields, props.initialState)}						
					</div>													
				</form>
			')];			
	}*/

	function renderButton(mItem:MItem, i:Int):ReactFragment {
		if(mItem.onlySm)
			return null;
		if(mItem.separator)
			return jsx('<hr className="menuSeparator"/>');
		return jsx('<$BButton key=${i++} onClick=${mItem.handler} 
		data-section=${mItem.section} disabled=${mItem.disabled} type="button" >${mItem.label}</$BButton>');	
	}

	public function itemHandler(e:Event)
		{
			//trace(e);
			e.preventDefault();
			var action:String = cast(e.target, Element).getAttribute('data-action');
			//trace(Reflect.field(_me,'callMethod'));
			trace(action);
			//callMethod(action, e);
			//trace(this.comp.state.formApi);
			var mP:Function = Reflect.field(this.comp.state.formApi,'callMethod');
			Reflect.callMethod(this.comp.state.formApi,mP,[action, e]);
		}

	public function  hidden(cm:String):ReactFragment
	{
		return jsx('<input type="hidden" name=${cm} />');
	}
	
	function onChange(ev:Dynamic) {
		trace(ev.target.type);
		switch (ev.target.type)
		{
			case 'checkbox':
				trace('${ev.target.name}:${ev.target.value}:${ev.target.checked?true:false}');
				//trace('doChange:${Reflect.isFunction(Reflect.field(comp,'doChange'))}');
				BaseForm.doChange(comp,ev.target.name, switch(ev.target.checked)
				{
					case "TRUE"|true|"on"|"1":
						1;
					default:
						0;
				});
				//ev.target.checked = !ev.target.checked;
				trace('${ev.target.name}:${ev.target.value}:${ev.target.checked?true:false}');
				//comp.setState({actualState:ReactUtil.copy({use_email:(ev.target.checked?1:0)})});
				//comp.forceUpdate();
			case 'select-multiple'|'select-one':
				//trace (ev.target.selectedOptions.length);
				BaseForm.doChange(comp,ev.target.name, ev.target.value);
			default:
				//trace('${ev.target.name}:${ev.target.value}');
				BaseForm.doChange(comp, ev.target.name, ev.target.value);
		}				
		
	}	
}

