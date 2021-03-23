package view.data.accounts;

import js.html.Event;
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
import db.DbQuery.DBAccessProps;
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
class DebitReturnStatements extends ReactComponentOf<DataFormProps,FormState>
{

	static var _instance:DebitReturnStatements;

	public static var menuItems:Array<MItem> = [		
		{label:'Datei Rücklastschrift',action:'importReturnDebit',
			formField:{
				name:'returnDebitFile',
				submit:'Importieren',
				type:FormInputElement.Upload,
				handleChange: function(evt:Event) {
					//trace(Reflect.fields(evt));
					var finput = cast Browser.document.getElementById('returnDebitFile');
					trace(finput.value);
					//trace(_instance);
					var val = (finput.value == ''?'':finput.value.split('\\').pop());
					_instance.setState({data:['hint'=>'Zum Upload ausgewählt:${val}']});
				}
			},
			handler: function(_) {				
				var finput = cast Browser.document.getElementById('returnDebitFile');
				//var files = php.Lib.hashOfAssociativeArray(finput.files);
				
				trace(finput.files);
				trace(finput.files[0]);
				js.Syntax.code("console.log({0}[{1}])",finput.files,"returnDebitFile");
				trace(finput.value);
				//trace(finput.files.get('returnDebitFile'));
			}/**/
		}
	];	
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
		_instance = this;
		dataDisplay = ReturnDebitModel.dataDisplay;
		
		trace('...' + Reflect.fields(props));
		//baseForm =new BaseForm(this);
		
		menuItems[0].handler = importReturnDebit;
		state =  App.initEState({
			sideMenu:FormApi.initSideMenu( this,			
			{
				dataClassPath:'admin.ImportCamt',
				label:"Upload RüLa's",
				section: 'DebitReturnStatements',
				items: menuItems
			},
			{	
				section: props.match.params.section==null? 'DebitReturnStatements':props.match.params.section, 
				sameWidth: true					
			})
		},this);

		trace(props.match.path);
	}

	static function mapStateToProps(aState:AppState) 
	{
		return {
			userState:aState.userState
		};
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
        return {
			load: function(param:DBAccessProps) return dispatch(CRUD.read(param)),
			storeData:function(id:String, action:DataAction)
			{
				dispatch(LiveDataAccess.storeData(id, action));
			},
			select:function(id:Int = -1,data:StringMap<Map<String,Dynamic>>,match:react.router.RouterMatch, ?selectType:SelectType)
			{
				if(true) trace('select:$id selectType:${selectType}');
				trace(data);
				dispatch(LiveDataAccess.sSelect({id:id,data:data,match:match,selectType: selectType}));
			}						
        }
	}	
	
	public function delete(ev:ReactEvent):Void
	{
		trace(state.selectedRows.length);
		var data = state.formApi.selectedRowsMap(state);
		trace(data);
	}

	public function importReturnDebit(_):Void
	{
		var iPromise:Promise<Dynamic> = new Promise(function(resolve, reject){
			var finput = cast  Browser.document.getElementById('returnDebitFile');
			trace(props.userState.dbUser.first_name + '::' + finput.files[0]);
			//var reader:FileReader = new FileReader();
			var uFile:Blob = cast(finput.files[0], Blob);
			trace(uFile);
			var fd:FormData = new FormData();
			fd.append('devIP',App.devIP);
			fd.append('action','returnDebitFile');
			fd.append('returnDebitFile',uFile,finput.value);
			var xhr = new js.html.XMLHttpRequest();
			xhr.open('POST', '${App.config.api}', true);
			xhr.onerror = function(e) {
				trace(e);
				trace(e.type);
				reject({error:e});
			}
			xhr.withCredentials = true;
			xhr.onload = function(e) {
				trace(xhr.status);
				if (xhr.status != 200) {				
					trace(xhr.statusText);
					reject({error:xhr.statusText});
				}
				trace(xhr.response.length);
				resolve(xhr.response);
				//onLoaded(haxe.io.Bytes.ofData(xhr.response));
			}
			xhr.send(fd);
			setState({action:'importReturnDebit',loading:true});
		});
		
		iPromise.then(function (r:Dynamic) {
			trace(r);
			var rD:Json = Json.parse(r);
			var dd:{rlData:Array<Dynamic>} = Json.parse(r);
			//trace(rD);
			var dT:Array<Map<String, Dynamic>> = new Array();
			for(dR in dd.rlData)
				dT.push(Utils.dynToMap(dR));
			setState({dataTable:dT,loading:false});
			App.store.dispatch(Status(Update( 
				{	
					text:dT.count() + ' Rücklastschriften Importiert'
				}
			)));
		}, function (r:Dynamic) {
			trace(r);
			App.store.dispatch(Status(Update( 
				{	className:'',
					text:(r.error==null?'':r.error)
				}
			)));
		});
		
	}

	public static function upload(param:DBAccessProps) 
	{	trace(param.action);
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState):Promise<Dynamic>{
			trace(param);
			var dbData:DbData = DbDataTools.create();

			return new Promise(function(resolve, reject){
				if (!param.dbUser.online)
				{
					dispatch(User(LoginError(
					{
						dbUser:param.dbUser,
						lastError:'Du musst dich neu anmelden!'
					})));
					trace('LoginError');
					resolve(null);
				}	
				
				var bL:XMLHttpRequest = BinaryLoader.dbQuery(
					'${App.config.api}', 
					param,
					function(data:DbData)
					{				
						trace(data);
						if(data.dataErrors != null)
							trace(data.dataErrors);
						if(data.dataInfo != null && data.dataInfo.exists('dataSource'))
							trace(new Unserializer(data.dataInfo.get('dataSource')).unserialize());

						if(data.dataErrors.exists('lastError'))
						{
							dispatch(User(LoginError({lastError: data.dataErrors.get('lastError')})));
							resolve(null);
						}
						else{

							dispatch(Status(Update( 
								{	className:'',
									text:(param.resolveMessage==null?'':param.resolveMessage.success)				
								}
							)));
							resolve(data);
						}
					}
				);
				trace(bL);
			});	
		});
			
	}

	override function render():ReactFragment
	{
		//if(state.dataTable != null)	trace(state.dataTable[0]);
		trace(props.match.params.section);		
		return state.formApi.render(jsx('
		<>
			<form className="tabComponentForm"  >
				${renderResults()}
			</form>
		</>'));		
	}
	
	function renderResults():ReactFragment
	{
		trace(props.match.params.action + ':' + Std.string(state.dataTable != null));
		trace(state.loading);
		if(state.loading)
			return state.formApi.renderWait();
		trace('###########loading:' + state.loading);
		return switch(state.action)
		{
			case 'importReturnDebit':
				jsx('
					<Table id="importedReturnDebit" data=${state.dataTable}
					${...props} dataState=${dataDisplay["rDebitList"]} renderPager=${function()BaseForm.renderPager(this)} 
					className="is-striped is-hoverable"  parentComponent=${this} fullWidth=${true}/>
				');
			case 'importClientList':
				//trace(initialState);
				trace(state.actualState);
				/*var fields:Map<String,FormField> = [
					for(k in dataAccess['update'].view.keys()) k => dataAccess['update'].view[k]
				];*/
				(state.actualState==null ? state.formApi.renderWait():
				state.formBuilder.renderForm({
					mHandlers:state.mHandlers,
					fields:formFields,/*[
						for(k in dataAccess['update'].view.keys()) k => dataAccess['update'].view[k]
					],*/
					model:'importClientList',
					//ref:formRef,
					title: 'Stammdaten Import' 
				},state.actualState));	
			/*case 'showFieldList2':
				trace(dataDisplay["fieldsList"]);
				trace(state.dataTable[29]['id']+'<<<');
				jsx('
					<Table id="fieldsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["fieldsList"]} 
					className="is-striped is-hoverable" fullWidth=${true}/>				
				');	*/
			case 'shared.io.DB.editTableFields':
				null;
			default:
				if(state.data != null && state.data.exists('hint')){
					jsx('<div class="hint">${state.data.get('hint')}</div>');
				}
				else{
					null;
				}				
		}
		return null;
	}	
}