package view.shared;
import view.shared.FormField;
import state.FormState.HandlerAction;
import react.ReactType;
import haxe.Constraints.Function;

typedef MItem =
{
	?action:String,
	?actions:Array<Function>,
	?className:String,
	?classPath:String,
	?formField:FormField,
	?section:String,
	?disabled:Bool,	
	?handler:Function,//default:action
	?img:String,
	?info:String,
	?label:String,
	?separator:Bool,	
	?then:String,	
	?onlySm:Bool	
}