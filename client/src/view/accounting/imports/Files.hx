package view.accounting.imports;

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
import view.grid.Grid;
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
class Files extends ReactComponentOf<DataFormProps,FormState>
{

	static var _instance:Files;//

	public static var menuItems:Array<MItem> = [		
		{label:'Rücklastschriften',action:'importReturnDebit',
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
					Files._instance.setState({data:['hint'=>'Zum Upload ausgewählt:${val}']});
				}
			},
			handler: function(_) {				
				var finput = cast Browser.document.getElementById('returnDebitFile');
				//var files = php.Lib.hashOfAssociativeArray(finput.files);
				
				trace(finput.files);
				trace(Reflect.fields(finput));
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
		dataDisplay = ReturnDebitModel.dataGridDisplay;
		//dataAccess = ReturnDebitModel.dataAccess(props.match.params.action);
		//formFields = ReturnDebitModel.formFields(props.match.params.action);
		//trace('...' + Type.getInstanceFields(Type.resolveClass('view.shared.MItem')));
		//trace('...' + Reflect.fields(props));
		//baseForm =new BaseForm(this);
		
		menuItems[0].handler = importReturnDebit;
		menuItems[0].formField.id = App._app.state.userState.dbUser.id;
		menuItems[0].formField.jwt = App._app.state.userState.dbUser.jwt;
		trace(menuItems[0].formField);
		state =  App.initEState({
			data:['hint'=>'Datei zum Hochladen auswählen'],
			action:(props.match.params.action==null?'importReturnDebit':props.match.params.action),
			sideMenu:FormApi.initSideMenu2( this,			
			[
				{
					dataClassPath:'admin.ImportCamt',
					label:"Liste",
					section: 'List',
					items: List.menuItems
				},
				{
					dataClassPath:'admin.ImportCamt',
					label:"Dateien",
					section: 'Files',
					items: Files.menuItems
				},

			],
			{	
				section: props.match.params.section==null? 'Files':props.match.params.section, 
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
			storeData:function(id:String, action:DataAction)
			{
				dispatch(LiveDataAccess.storeData(id, action));
			},
			select:function(id:Int = -1,data:StringMap<Map<String,Dynamic>>,me:Files, ?selectType:SelectType)
			{
				if(true) trace('select:$id selectType:${selectType}');
				trace(data);
				dispatch(LiveDataAccess.sSelect({id:id,data:data,match:me.props.match,selectType: selectType}));
			}						
        }
	}	

	override public function componentDidMount():Void 
	{	
		dataAccess = ReturnDebitModel.dataAccess;
		trace(props.match.params.action);
		state.formApi.doAction();
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
			fd.append('id',Std.string(App._app.state.userState.dbUser.id));
			fd.append('jwt',Std.string(App._app.state.userState.dbUser.jwt));
			fd.append('mandator',Std.string(App.mandator));

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
			trace(rD);
			var dT:Array<Map<String, Dynamic>> = new Array();
			for(dR in dd.rlData)
				dT.push(Utils.dynToMap(dR));
			setState({action:'showImportedReturnDebit',dataTable:dT,loading:false});
			trace(dT);
			state.loading = false;
			var baseUrl:String = props.match.path.split(':section')[0];			
			//props.history.push('${baseUrl}List');
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

	override function render():ReactFragment
	{
		//if(state.dataTable != null)	trace(state.dataTable[0]);
		//<></>
		trace(props.match.params.section);		
		return state.formApi.render(jsx('
		
			<form className="tabComponentForm"  >
				${renderResults()}
			</form>
		'));		
	}
	
	function renderResults():ReactFragment
	{
		trace(state.action + ':' + Std.string(state.dataTable != null));
		trace(dataDisplay["rDebitList"]);
		if(state.loading)
			return state.formApi.renderWait();
		trace('${state.action} ###########loading:' + state.loading);
		return switch(state.action)
		{
			case 'showImportedReturnDebit':
				(state.dataTable == null? state.formApi.renderWait():
				jsx('<Grid id="importedReturnDebit" data=${state.dataTable}
				${...props} dataState = ${dataDisplay["rDebitList"]} 
				parentComponent=${this} className="is-striped is-hoverable" fullWidth=${true}/>			
				'));	

			/*case 'importClientList':
				//trace(initialState);
				trace(state.actualState);
				/*var fields:Map<String,FormField> = [
					for(k in dataAccess['update'].view.keys()) k => dataAccess['update'].view[k]
				];
				(state.actualState==null ? state.formApi.renderWait():
				state.formBuilder.renderForm({
					mHandlers:state.mHandlers,
					fields:formFields,/*[
						for(k in dataAccess['update'].view.keys()) k => dataAccess['update'].view[k]
					],
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

			default:
				if(state.data != null && state.data.exists('hint')){
					jsx('<div className="hint"><h3>${state.data.get('hint')}</h3></div>');
				}
				else{
					null;
				}				
		}
		return null;
	}	
}