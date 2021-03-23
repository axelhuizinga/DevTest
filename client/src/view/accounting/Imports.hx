package view.accounting;

import haxe.CallStack;
import action.DataAction;
import action.DataAction.SelectType;
import action.async.LiveDataAccess;
import shared.Utils;
import model.accounting.ReturnDebitModel;
import haxe.Json;
import js.html.Blob;
import js.html.File;
import js.Syntax;
import js.html.FormData;
import view.shared.FormInputElement;
import js.Browser;
import js.html.FileReader;
import haxe.Unserializer;
import js.html.XMLHttpRequest;
import shared.DbDataTools;
import action.AppAction;
import redux.Redux.Dispatch;
import redux.thunk.Thunk;
import action.async.CRUD;
import js.lib.Promise;
import db.DBAccessProps;
import action.async.LivePBXSync;
import state.AppState;
import haxe.ds.StringMap;
import haxe.ds.IntMap;
import loader.BinaryLoader;
import me.cunity.debug.Out;
import model.Contact;
import react.ReactComponent;
import react.ReactEvent;
import react.ReactMacro.jsx;
import react.ReactUtil;
import shared.DbData;
import state.FormState;
import view.accounting.imports.Files;
import view.accounting.imports.List;
import view.shared.FormBuilder;
import view.shared.MItem;
import view.shared.MenuProps;
import view.table.Table.DataState;
import view.table.Table;
import view.shared.io.BaseForm;
import view.shared.io.DataAccess;
import view.shared.io.DataFormProps;
import view.shared.io.FormApi;

using Lambda;
/**
 * ...
 * @author axel@cunity.me
 */
@:connect
class Imports extends ReactComponentOf<DataFormProps,FormState>
{

	static var _instance:Imports;
	var _trace:Bool;

	var dataAccess:DataAccess;	
	var dataDisplay:Map<String,DataState>;
	var formApi:FormApi;
	var formBuilder:FormBuilder;
	var formFields:DataView;
	var fieldNames:Array<String>;
	var baseForm:BaseForm;
	var contact:Contact;
	var dbData: shared.DbData;
	var dbMetaData:shared.DBMetaData;	

	public function new(props) 
	{
		super(props);
		//dataDisplay = ReturnDebitModel.dataDisplay;
		//dataAccess = ReturnDebitModel.dataAccess(props.match.params.action);
		//formFields = ReturnDebitModel.formFields(props.match.params.action);
		_trace = true;
		//if(_trace) trace('...' + Reflect.fields(props));
		state =  App.initEState({
			dataTable:[],loading:false,importData:new IntMap(), selectedRows:[],values:new Map<String,Dynamic>()
		},this);
		if(props.match.params.section==null)
		{
				//SET DEFAULT SECTION
			var baseUrl:String = props.match.path.split(':section')[0];			
			if(_trace) trace('reme2${baseUrl}Files/');
			props.history.push('${baseUrl}Files/');
			//props.history.push('${baseUrl}List/get${props.dataStore.contactData.iterator().hasNext()?'/'+props.dataStore.contactData.keys().keysList():''}');
		}		
	}
	
	static function mapStateToProps(aState:AppState) 
	{
		return {
			userState:aState.userState
		};
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
        return {
			/*load: function(param:DBAccessProps) return dispatch(Imports.upload(param)),
			storeData:function(id:String, action:DataAction)
			{
				dispatch(LiveDataAccess.storeData(id, action));
			},*/
			select:function(id:Int = -1,data:StringMap<Map<String,Dynamic>>,match:react.router.RouterMatch, ?selectType:SelectType)
			{
				if(true) trace('select:$id selectType:${selectType}');
				trace(data);
				dispatch(LiveDataAccess.sSelect({id:id,data:data,match:match,selectType: selectType}));
			}						
        }
	}	
	
	override function componentDidCatch(error, info) {
		// Display fallback UI
		//if(state.mounted)
		try{
			this.setState({ hasError: true });
		}
		catch(ex:Dynamic)
		{if(_trace) trace(ex);}
		
		if(_trace) trace(error);
		Out.dumpStack(CallStack.callStack());
	}

	override function render():ReactFragment
	{		
		trace(props.match.params.action + ':' + props.match.params.section);
		trace(state.loading);
		if(state.loading)
			return state.formApi.renderWait();
		trace('###########loading:' + state.sideMenu);
		return switch(props.match.params.section)
		{
			case "List":
				trace('render List');
				jsx('
					<$List ${...props} limit=${100} parentComponent=${this} formApi=${state.formApi} fullWidth={true}/>
				');					
			case "Files":
				jsx('
					<$Files ${...props} parentComponent=${this} formApi=${state.formApi} fullWidth={true}/>
				');				
			default:
				null;	
		}	
	}
}