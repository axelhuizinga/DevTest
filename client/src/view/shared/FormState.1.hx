package view.shared;
import redux.Redux.Dispatch;
import haxe.Constraints.Function;
import haxe.ds.IntMap;
import history.History;
import history.Location;
import js.html.FormElement;
import js.html.InputEvent;
import js.html.TableRowElement;
import react.ReactRef;
import react.ReactType;
import react.ReactComponent;
import view.shared.FormBuilder;
import view.shared.MenuProps;
import view.shared.io.FormApi;

enum Loading
{
	Component;
	Data(action:Function);
	State;
}

typedef FormState =
{
	?action:String,
	?actualState:Dynamic,
	?dataClassPath:String,
	?data:Map<String,Dynamic>,
	?dataTable:Array<Map<String,Dynamic>>,
	?formApi:FormApi,
	?formBuilder:FormBuilder,
	?formStateKey:String,
	?clean:Bool,
	?ref:ReactRef<FormElement>,
	?contactData:IntMap<Map<String,Dynamic>>,
	?selectedRows:Array<TableRowElement>,
	?selectedRowIDs:Array<Int>,
	?handleChange:InputEvent->Void,
	?mHandlers:Dynamic->Void,	
	?hasError:Bool,
	?mounted:Bool,
	?isConnected:Bool,
	?loading:Bool,
	?initialState:Dynamic,
	?model:String,
	?modelClass:Dynamic,
	?fields:Map<String,FormField>,//VIEW FORMFIELDS
	?valuesArray:Array<Map<String,Dynamic>>,//FORMATTED DISPLAY VALUES
	?values:Map<String,Dynamic>,//FORMATTED DISPLAY VALUES
	?section:String,
	?sideMenu:MenuProps,
	?submitted:Bool,
	?errors:Map<String,String>,
	?title:String
}