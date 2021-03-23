package view.dashboard;
import haxe.Constraints.Function;
import shared.DbParam;
import shared.Utils;
import action.AppAction;
import redux.Redux.Dispatch;
import action.async.CRUD;
import js.lib.Promise;
import db.DBAccessProps;
import action.async.LivePBXSync;
import state.AppState;
import haxe.ds.Map;
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
import view.dashboard.model.DBSyncModel;
import view.table.Table.DataState;
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
class DBSync extends ReactComponentOf<DataFormProps,FormState>
{

	static var _instance:DBSync;

	public static var menuItems:Array<MItem> = [		
		//{label:'BenutzerDaten ',action:'showUserList'},
		
		//{label:'BenutzerDaten Abgleich',action:'syncUserDetails'},
		//{label:'BuchungsDaten',action:'importAllBookingRequests'},
		
		//{label:'Stammdaten Import ',action:'importContacts'},
		{label:'BuchungsAnforderungen ',action:'checkBookingRequests'},
		{label:'Kontakt Daten ',action:'checkContacts'},		
		{label:'Spenden Daten ',action:'checkDeals'},
		{label:'Konto Daten ',action:'checkAccounts'}
		
		/*{label:'Spenden Import ',action:'importDeals'},
		{label:'Spenden Update ',action:'syncDeals'},
		{label:'Konten Import ',action:'importAccounts'},
		{label:'Speichern', action:'save'},
		{label:'Löschen',action:'delete'}*/
	];
	var dataAccess:DataAccess;	
	var dataDisplay:Map<String,DataState>;
	var formApi:FormApi;
	var formBuilder:FormBuilder;
	var formFields:DataView;
	//var formRef:ReactRef<FormElement>;
	var fieldNames:Array<String>;
	var baseForm:BaseForm;
	var contact:Contact;
	var dbData: shared.DbData;
	var dbMetaData:shared.DBMetaData;	

	public function new(props) 
	{
		super(props);
		dataDisplay = DBSyncModel.dataDisplay;
		dataAccess = DBSyncModel.dataAccess(props.match.params.action);
		formFields = DBSyncModel.formFields(props.match.params.action);
		trace('...' + Reflect.fields(props));
		state =  App.initEState({
			loading:false,
			dataTable:[],
			formBuilder:new FormBuilder(this),
			actualState:{
				edited_by: props.userState.dbUser.id,
				mandator: props.userState.dbUser.mandator
			},
			initialState:{
				edited_by: props.userState.dbUser.id,
				mandator: props.userState.dbUser.mandator
			},values:new Map<String,Dynamic>()},this);
	}

	static function mapStateToProps(aState:AppState) 
	{
		return {
			userState:aState.userState
		};
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
        return {
			load: function(param:DBAccessProps) return dispatch(CRUD.update(param))			
        }
	}			
	public function createFieldList(ev:ReactEvent):Void
	{
		trace('hi :)');
		return;
		trace(props.history);
		trace(props.match);
		//setState({viewClassPath:viewClassPath});
	}
	
	public function editTableFields(ev:ReactEvent):Void
	{
		trace(state.selectedRows.length);				
	}

	function initStateFromDataTable(dt:Array<Map<String,String>>):Dynamic
	{
		var iS:Dynamic = {};
		for(dR in dt)
		{
			var rS:Dynamic = {};
			for(k in dR.keys())
			{
				trace(k);
				if(dataDisplay['fieldsList'].columns[k].cellFormat == DBSyncModel.formatBool)
				{
					Reflect.setField(rS,k, dR[k] == 'Y');
				}
				else
					Reflect.setField(rS,k, dR[k]);
			}
			Reflect.setField(iS, dR['id'], rS);			
		}
		trace(iS);
		return iS;
	}
	
	public function saveTableFields(vA:Dynamic):Void
	{
		trace(vA);
		//Out.dumpObject(vA);
		/*dbMetaData = new  DBMetaData();
		dbMetaData.dataFields = dbMetaData.stateToDataParams(vA);
		trace(dbMetaData.dataFields.get(111));
		var s:hxbit.Serializer = new hxbit.Serializer();*/
		
		return;
		props.formApi.requests.push( /*BinaryLoader.insert(
			'${App.config.api}', 
			{
				id:props.userState.id,
				jwt:props.userState.jwt,
				fields:'disabled:disabled,element=:element,required=:required,use_as_index=:use_as_index',
				classPath:'tools.DB',
				action:'saveTableFields',
				dbData:s.serialize(dbData),
				devIP:App.devIP
			},
			function(data:DbData)
			{		
				UserAccess.jwtCheck(data);		
				trace(data);
			}
		)*/null);
	}
	
	public function importAccounts2(_):Void
	{
		trace(props.userState.dbUser.first_name);
		setState({loading:true});
		doSyncAll2(			
		{
			classPath:'admin.SyncExternalAccounts',
			action:'importContacts',
			extDB: true,
			filter:{mandator:'1'},
			limit:1000,
			offset:0,
			table:'accounts',
			dbUser:props.userState.dbUser,
			devIP:App.devIP,
			maxImport:4000,
			//relations:new Map()
		});
	}

	function doSyncAll2(dbQueryParam:DBAccessProps) {
		
		var p:Promise<DbData> = props.load(dbQueryParam);
		p.then(function(data:DbData){
			if(data.dataInfo['offset']==null)
			{
				return App.store.dispatch(Status(Update(
				{
					className:'error',
					text:'Fehler 0  Aktualisiert'}
				)));//${data.dataInfo['classPath']}
			}					
			var offset = Std.parseInt(data.dataInfo['offset']);
			App.store.dispatch(Status(Update(
				{
					className:' ',
					text:'${offset} von ${data.dataInfo['maxImport']} aktualisiert'
				}
			)));

			trace('${offset} < ${data.dataInfo['maxImport']}');
			if(offset < data.dataInfo['maxImport']){
				//LOOP UNTIL LIMIT
				trace('next loop:${data.dataInfo}');
				return doSyncAll2(cast data.dataInfo);
			}					
			else{
				setState({loading:false});
				return App.store.dispatch(Status(Update(
					{
						className:' ',
						text:'${offset} von ${data.dataInfo['maxImport']} aktualisiert'
					}
				)));
			}

		});//*/
		return p;
	}

	
	public function importContacts2(_):Void
	{
		trace(props.userState.dbUser.first_name);
		App.store.dispatch(action.async.LivePBXSync.importContacts({
			devIP:App.devIP,
			limit:4000,
			maxImport:4000,
			userState:props.userState,
			offset:0,
			classPath:'admin.SyncExternalContacts',
			action:'importContacts'
		}));
	}

	public function importAllBookingRequests2(_):Void
	{
		trace(props.userState.dbUser.first_name);
		//var p:Promise<DbData> = cast 
		App.store.dispatch(action.async.LivePBXSync.importContacts({
			limit:50000,
			maxImport:50000,
			userState:props.userState,
			offset:100000,
			table:'bank_transfers',
			classPath:'admin.SyncExternalBookings',
			action:'importContacts'
		}));
	}

	public function importBookingRequests2() {
		App.store.dispatch(LivePBXSync.importBookingRequests({
			limit: 25000,
			offset:0,
			classPath: 'admin.SyncExternalBookings',
			action: 'syncBookingRequests',
			userState:props.userState
		}));
	}	

	public function checkBookingRequests():Void
	{
		App.store.dispatch(Status(Update(
		{
			className:'',
			text:'Aktualisiere Buchungsanforderungen'}
		)));
		var pro:Promise<Dynamic> = action.async.LivePBXSync.check({
			limit:1000,
			userState:props.userState,
			offset:0,
			//onlyNew: true,
			//filter:"anforderungs_datum<2021-01-01",
			classPath:'data.SyncExternal',
			action:'bookingRequestsCount'
		});
		pro.then(function(props:DbData) {
			trace(props);
			setState({data:[
				'action'=>'bookingRequestsCount',
				'buchungsAnforderungenCount'=>props.dataInfo.get('buchungsAnforderungenCount'),
				'bookingRequestsCount'=>props.dataInfo.get('bookingRequestsCount')
			]});
			trace(state.data);
		},function(whatever:Dynamic) {
			trace(whatever);
		});
	}

	public function checkAccounts():Void
	{
		App.store.dispatch(Status(Update(
		{
			className:'',
			text:'Aktualisiere Konten'}
		)));
		var pro:Promise<Dynamic> = action.async.LivePBXSync.check({
			limit:1000,
			userState:props.userState,
			offset:0,
			//onlyNew: true,
			classPath:'data.SyncExternal',
			action:'accountsCount'
		});
		pro.then(function(props:DbData) {
			trace(props);
			setState({data:[
				'action'=>'accountsCount',
				'pay_sourceCount'=>props.dataInfo.get('pay_sourceCount'),
				'accountsCount'=>props.dataInfo.get('accountsCount')
			]});
		},function(whatever:Dynamic) {
			trace(whatever);
		});
	}

	public function checkContacts():Void
	{
		App.store.dispatch(Status(Update(
		{
			className:'',
			text:'Aktualisiere Kontakte'}
		)));
		var pro:Promise<Dynamic> = action.async.LivePBXSync.check({
			limit:1000,
			userState:props.userState,
			offset:0,
			//onlyNew: true,
			classPath:'data.SyncExternal',
			action:'clientsCount'
		});
		pro.then(function(props:DbData) {
			trace(props);
			setState({data:[
				'action'=>'contactsCount',
				'clientsCount'=>props.dataInfo.get('clientsCount'),
				'contactsCount'=>props.dataInfo.get('contactsCount')
			]});		
		},function(whatever:Dynamic) {
			trace(whatever);
		});
	}

	public function checkDeals():Void
	{
		App.store.dispatch(Status(Update(
		{
			className:'',
			text:'Aktualisiere Spenden'}
		)));
		var pro:Promise<DbData> = action.async.LivePBXSync.check({
			limit:1000,
			userState:props.userState,
			offset:0,
			//onlyNew: true,
			classPath:'data.SyncExternal',
			action:'dealsCount'
		});
		pro.then(function(props:DbData) {
			trace(props);
			setState({data:[
				'action'=>'dealsCount',
				'pay_planCount'=>props.dataInfo.get('pay_planCount'),
				'dealsCount'=>props.dataInfo.get('dealsCount')
			]});
		},function(whatever:Dynamic) {
			trace(whatever);
			App.store.dispatch(User(LoginError(
			{
				dbUser:props.userState.dbUser,
				lastError:'Du musst dich neu anmelden!'
			})));			
		});
	}
	
	public function checkAll():Void
	{
		//trace(props.userState.dbUser.first_name);
		App.store.dispatch(Status(Update(
		{
			className:' ',
			text:'Synchronisiere Kontakte, Spenden + Konten'}
		)));
		var pro:Promise<Dynamic> = App.store.dispatch(action.async.LivePBXSync.checkAll({
			limit:1000,
			//maxImport:4000,
			userState:props.userState,
			offset:0,
			//onlyNew: true,
			classPath:'admin.SyncExternal',
			action:'checkAll'
		}));
		pro.then(function(props:DBAccessProps) {
			trace(props);
		},function(whatever:Dynamic) {
			trace(whatever);
		});
	}

	public function displaySummary() {
		
	}

	public function importDeals2() {
		App.store.dispatch(Status(Update(
			{
				className:' ',
				text:'Importiere Spenden'})));		
		App.store.dispatch(LivePBXSync.importDeals({
			limit: 1000,//00,
			offset:0,
			onlyNew:true,
			classPath: 'admin.SyncExternalDeals',
			action: 'importAll',
			userState:props.userState
		}));
	}

	public function syncDeals2() {
		App.store.dispatch(Status(Update(
		{
			className:' ',
			text:'Aktualisiere Spenden'
		})));	

		App.store.dispatch(LivePBXSync.importDeals({
			limit: 1000,
			offset:0,
			classPath: 'admin.SyncExternalDeals',
			action: 'importAll',
			userState:props.userState
		}));
	}	

	public function syncUserDetails2(_):Void
	{
		trace(App.config.api);
		trace(props.userState.dbUser);
		//FormApi.requests.push( 
		BinaryLoader.create(
			'${App.config.api}', 
			{
				id:props.userState.dbUser.id,
				jwt:props.userState.dbUser.jwt,
				fields:'id,table_name,field_name,disabled,element,required,use_as_index',
				classPath:'admin.SyncExternal',
				action:'syncUserDetails',
				devIP:App.devIP,
				dbUser:props.userState.dbUser
			},
			function(data:DbData)
			{
				//UserAccess.jwtCheck(data);
				trace(data);
				//trace(data.dataRows[data.dataRows.length-2]['phone_data']);
				trace(data.dataRows.length);
				if(data.dataRows.length>0)
				setState({dataTable:data.dataRows});
				App.store.dispatch(Status(Update( 
					{	className:'',
						text:'aktualisiert: '+ data.dataInfo.get('updated') + ' Benutzer'
					}
				)));				
			}
		);
	}

	public function proxy_showUserList(_):Void
	{
		//FormApi.requests.push( 
		trace(App.config.api);
		BinaryLoader.create(
			//'${App.config.api}', 
			'https://pitverwaltung.de/sync/proxy.php', 
			{
				id:props.userState.dbUser.id,
				jwt:props.userState.dbUser.jwt,
				fields:'id,table_name,field_name,disabled,element,required,use_as_index',
				classPath:'admin.SyncExternal',
				action:'syncUserDetails',
				target: 'syncUsers.php',
				devIP:App.devIP
			},
			function(data:DbData)
			{
				//UserAccess.jwtCheck(data);
				//trace(data);
				//trace(data.dataRows[data.dataRows.length-2]['phone_data']);
				trace(data.dataRows.length);
				if(data.dataRows.length>0)
				setState({dataTable:data.dataRows});
			}
		);
	}

	/*function untilDone(fn:Dispatch, check:DbData->Bool, isDone = false):Dispatch {
		if(isDone) return fn;
		var p = fn();
		return fn.then(function(data:DbData)return untilDone(fn, check, check(data)));
	}*/
	
	override public function componentDidMount():Void 
	{				
		//
		if(props.userState != null)
		trace('yeah: ${props.userState.dbUser.first_name}');
	}

	function go(aState:Dynamic)
	{
		trace(Reflect.fields(aState));
		var dbaProps:DBAccessProps = 
		{
			action:props.match.params.action,
			classPath:'data.Contacts',
			dataSource:null,
			table:'contacts',
			userState:props.userState
		};
		switch (props.match.params.action)
		{
			case 'insert':
				for(f in fieldNames)
				{
					trace('$f =>${Reflect.field(aState,f)}<=');
					if(Reflect.field(aState,f)=='')
						Reflect.deleteField(aState,f);
				}
				Reflect.deleteField(aState,'id');
				Reflect.deleteField(aState,'creation_date');				
				dbaProps.dataSource = [
					"contacts" => [
						"data" => aState,
						"fields" => Reflect.fields(aState).join(',')
					]
				];
			case 'delete'|'get':
			//#
		}
	}

	override function render():ReactFragment
	{
		//if(state.dataTable != null)	trace(state.dataTable[0]);
		trace(props.match.params.section);		
		return state.formApi.render(jsx('
		<>
			<form className="tabComponentForm" >
				${renderResults()}
			</form>
		</>'));		
	}
	
	function renderResults():ReactFragment
	{
		if(state.data!=null)
			trace(state.data.get('action') + ':' );
		trace(state.loading);
		if(state.data==null)
			return jsx('<div className="flex0 cCenter">${state.formApi.renderWait()}</div>');
		trace('###########loading:' + state.loading);
		return switch(state.data.get('action'))
		{
			case 'importClientList':
				trace(state.actualState);
				(state.actualState==null ? state.formApi.renderWait():
				state.formBuilder.renderForm({
					mHandlers:state.mHandlers,
					fields:formFields,
					model:'importClientList',
					title: 'Stammdaten Import' 
				},state.actualState));	
			case 'bookingRequestsCount':
				(state.data.get('bookingRequestsCount')==null ? state.formApi.renderWait():
				jsx('<div className="flex0 cCenter">
					<ul>					
					<li><h3>BuchungsAnforderungen</h3></li>
					<li><div>Live System:</div><div className="tRight tableNums">${state.data.get('buchungsAnforderungenCount')}</div></li>
					<li><div>Neues System:</div><div className="tRight tableNums">${state.data.get('bookingRequestsCount')}</div></li>
					</ul>
				</div>')
				);
			case 'accountsCount':
				(state.data.get('accountsCount')==null ? state.formApi.renderWait():
				jsx('<div className="flex0 cCenter">
					<ul>					
					<li><h3>Konten</h3></li>
					<li><div>Live System:</div><div className="tRight tableNums">${state.data.get('pay_sourceCount')}</div></li>
					<li><div>Neues System:</div><div className="tRight tableNums">${state.data.get('accountsCount')}</div></li>
					</ul>
				</div>')
				);
			case 'contactsCount':
				(state.data.get('contactsCount')==null ? state.formApi.renderWait():
				jsx('<div className="flex0 cCenter">
					<ul>					
					<li><h3>Kontakte</h3></li>
					<li><div>Live System:</div><div className="tRight tableNums">${state.data.get('clientsCount')}</div></li>
					<li><div>Neues System:</div><div className="tRight tableNums">${state.data.get('contactsCount')}</div></li>
					</ul>
				</div>')
				);
			case 'dealsCount':
				(state.data.get('dealsCount')==null ? state.formApi.renderWait():
				jsx('<div className="flex0 cCenter">
					<ul>					
					<li><h3>Spenden</h3></li>
					<li><div>Live System:</div><div className="tRight tableNums">${state.data.get('pay_planCount')}</div></li>
					<li><div>Neues System:</div><div className="tRight tableNums">${state.data.get('dealsCount')}</div></li>
					</ul>
				</div>')
				);				
			default:
				null;
		}
		return null;
	}
	
	
	function updateMenu(?viewClassPath:String):MenuProps
	{
		var sideMenu = state.sideMenu;
		trace(sideMenu.section);
		//sideMenu.menuBlocks['DBSync'].handlerInstance = this;
		for(mI in sideMenu.menuBlocks['DBSync'].items)
		{
			switch(mI.action)
			{
				case 'editTableFields':
					mI.disabled = state.selectedRows.length==0;
				case 'save':
					mI.disabled = state.clean;
				default:

			}			
		}
		return sideMenu;
	}
}