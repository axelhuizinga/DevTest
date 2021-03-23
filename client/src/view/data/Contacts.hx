package view.data;

import action.DataAction;
import haxe.Constraints.Function;
import state.DataAccessState;
import haxe.macro.Expr.Catch;
import action.AppAction;
import react.ReactRef;
import react.router.RouterMatch;
import react.router.ReactRouter;
import comments.StringTransform;
import haxe.CallStack;
import haxe.Serializer;
import haxe.ds.IntMap;
import haxe.ds.StringMap;
import haxe.Json;
import js.html.XMLHttpRequest;
import haxe.http.HttpJs;
import macrotools.Macro.model;
import me.cunity.debug.Out;
import state.AppState;
import react.ReactEvent;
import react.Fragment;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.ReactUtil;
import react.ReactType;
import redux.Redux.Dispatch;
import action.async.LiveDataAccess;
import view.data.contacts.List;
import view.data.contacts.Edit;
import model.contacts.ContactsModel;
import action.async.DBAccess;
import shared.DbData;
import shared.DBMetaData;
import model.Contact;
import view.shared.FormField;
import loader.BinaryLoader;
import view.shared.io.DataAccess;
import view.shared.io.DataFormProps;
import view.shared.io.FormApi;
import state.FormState;
import view.shared.OneOf;
import view.shared.Menu;
import view.shared.MItem;

import view.shared.MenuProps;
import view.table.Table;
using  shared.Utils;

/**
 * ...
 * @author axel@cunity.me
 */

@:connect
class Contacts extends ReactComponentOf<DataFormProps,FormState>
{
	
	var dataDisplay:Map<String,DataState>;
	var dataAccess:DataAccess;	
	var dbData: shared.DbData;
	var dbMetaData:shared.DBMetaData;
	var _trace:Bool;
	static  var _strace:Bool;
	public static var initialState:Contact;

	public function new(props) 
	{
		super(props);
		_strace = _trace = true;
		dataAccess = ContactsModel.dataAccess;
		dataDisplay = ContactsModel.dataDisplay;
		if(_trace) trace('...' + Reflect.fields(props));
		if(_trace) trace(props.match.params);
		state =  App.initEState({
			dataTable:[],loading:false,contactData:new IntMap(), selectedRows:[],values:new Map<String,Dynamic>(),
		},this);		
		if(props.match.params.section==null)
		{
			//SET DEFAULT SECTION
			if(_trace) trace('reme');
			var baseUrl:String = props.match.path.split(':section')[0];
			if(props.dataStore.contactData.iterator().hasNext())
			{
				if(_trace) trace(props.dataStore.contactData.keys().keysList());
			}
			
			props.history.push('${baseUrl}List');
			//props.history.push('${baseUrl}List/get${props.dataStore.contactData.iterator().hasNext()?'/'+props.dataStore.contactData.keys().keysList():''}');
		}		
		

		//if(_trace) trace(state.contactData);
		//if(_trace) trace(state.loading);		
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

	static function mapDispatchToProps(dispatch:Dispatch):Dynamic
    {
		if(_strace) trace('ok');
        return {			
			//select:function(id:Int = -1,data:IntMap<Map<String,Dynamic>>,match:RouterMatch, ?selectType:SelectType)
			select:function(id:Int = -1,data:IntMap<Map<String,Dynamic>>,component:Contacts, ?selectType:SelectType)			
			{
				if(_strace) trace('select:$id selectType:${selectType}');
				//dispatch(DataAction.CreateSelect(id,data,match));
				dispatch(LiveDataAccess.select({id:id,data:data,match:component.props.match,selectType: selectType}));
			}
		};
    }
	
	static function mapStateToProps(aState:AppState) 
	{
		//if(_strace) trace(aState.dataStore.contactData);
		if(_strace) trace(Reflect.fields(aState));
		//if(aState.dataStore.contactData != null)
		//if(_strace) trace(aState.dataStore.contactData.keys().next());
		/*if(aState.dataStore.contactsDbData != null)
		if(_strace) trace(aState.dataStore.contactsDbData.dataRows[0]);
		if(_strace) trace(App.store.getState().dataStore.contactsDbData);*/
		var bState =  {
			dataStore:aState.dataStore,
			userState:aState.userState,
			//idLoaded:aState.dataStore.contactData.keys().next()
		};
		//if(_strace) trace(bState);
		//if(_strace) trace(bState.dataStore.contactData.keys().hasNext()?bState.dataStore.contactData.keys().next():null);
		return bState;
	}
		
	override public function componentDidMount():Void 
	{	
		if(_trace) trace(props.location.pathname);
		//setState({mounted:true});
		/*return;
		var baseUrl:String = props.match.path.split(':section')[0];
		if(_trace) trace(props.match);*/
	}
	
	override function render():ReactFragment
	{
		//if(state.dataTable != null)	
		if(_trace) trace(state.sideMenu);
		if(_trace) trace(props.match.params.section);					
		if(_trace) trace(props.match.params.action);	
		return switch(props.match.params.section)
		{
			case "List":
				jsx('
					<$List ${...props} limit=${100} parentComponent=${this} formApi=${state.formApi} fullWidth={true} sideMenu=${state.sideMenu}/>
					');					
			case "Edit":
				jsx('
					<$Edit ${...props} parentComponent=${this} formApi=${state.formApi} fullWidth={true} sideMenu=${state.sideMenu}/>
				');				
			default:
				null;					
		}		
	}

	public function setStateFromChild(cState:FormState) {
		setState(cState);
	}

	public function importClientList(_):Void
		{
			//FormApi.requests.push( 
			/*BinaryLoader.create(
				'${App.config.api}', 
				{
					id:props.user.id,
					jwt:props.user.jwt,
					fields:'id,table_name,field_name,disabled,element,required,use_as_index',
					classPath:'admin.SyncExternalClients',
					action:'importClientDetails',
					devIP:App.devIP
				},
				function(data:DbData)
				{
					UserAccess.jwtCheck(data);
					trace(data);
					//trace(data.dataRows[data.dataRows.length-2]['phone_data']);
					trace(data.dataErrors.keys().hasNext());
					if(!data.dataErrors.keys().hasNext())
					{
						setState({values: ['loadResult'=>'Verarbeite Importdaten...','closeAfter'=>8000]});
					}
					else 
						setState({values: ['loadResult'=>'Kein Ergebnis','closeAfter'=>-1]});
				}
			);*/
			trace('setState loading true => ${state.loading}');
			setState({loading: true});
		}

}