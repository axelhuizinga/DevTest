package view.shared;
import haxe.Constraints.Function;
import js.html.InputEvent;
import view.shared.FormInputElement;

typedef BaseField =
{
	?className:String,
	?classPath:String,
	?name:String,
	?label:String,
	?dataBase:String, 
	?options:Map<String,String>,
	?value:String,
	?dataTable:String,
	?dataField:String,
	?preset:Bool,
	?displayFormat:String,
	?type:FormInputElement,
	?primary:Bool,
	?disabled:Bool,
	?multiple:Bool,
	?required:Bool,
	//?handleChange:Function,
	?placeholder:String,
	?submit:String,
}

typedef FormField = {
	>BaseField,
	?handleChange:Function,
	?id:Int,
	?jwt:String,
	?validate:String->Bool

}