package view.data.contacts;
import action.async.CRUD;
import db.DBAccessProps;
import redux.Redux.Dispatch;
import js.lib.Promise;
import db.DBAccessProps;
import react.router.RouterMatch;
import js.Browser;
import js.html.NodeList;
import js.html.TableRowElement;
import action.DataAction;
import state.AppState;
import haxe.Constraints.Function;
import haxe.ds.IntMap;
import react.data.ReactDataGrid;
import react.ReactComponent;
import react.ReactEvent;
import react.ReactMacro.jsx;
import react.ReactUtil.copy;
import shared.DbData;
import shared.DBMetaData;
import view.shared.FormBuilder;
import view.shared.FormField;
import state.FormState;
import model.contacts.ContactsModel;
import view.shared.MItem;
import view.shared.MenuProps;
import view.shared.io.BaseForm;
import view.shared.io.FormApi;
import view.shared.io.DataFormProps;
import view.shared.io.DataAccess;
import view.grid.Grid;
//import view.table.Table;
import loader.BinaryLoader;
import model.Contact;

@:connect
class List extends ReactComponentOf<DataFormProps,FormState>
{
	public static var menuItems:Array<MItem> = [
		//{label:'Anzeigen',action:'get'},
		{label:'Bearbeiten',action:'update',section: 'Edit'},
		{label:'Neu', action:'insert',section: 'Edit'},		
		{label:'Löschen',action:'delete'},
		{label:'Auswahl aufheben',action:'selectionClear'},
	//	{label:'Auswahl umkehren',action:'selectionInvert'},
	//	{label:'Auswahl alle',action:'selectionAll'},
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
		//baseForm =new BaseForm(this);
		dataDisplay = ContactsModel.dataGridDisplay;
		//trace('...' + Reflect.fields(props));
		state =  App.initEState({
			dataTable:[],
			loading:true,
			contactData:new IntMap(),			
			selectedRows:[],
			sideMenu:FormApi.initSideMenu( this,
				{
					dataClassPath:'data.Contacts',
					label:'Liste',
					section: 'List',
					items: menuItems
				}					
				,{
					section: props.match.params.section==null? 'List':props.match.params.section, 
					sameWidth: true
				}),
			values:new Map<String,Dynamic>()
		},this);
		if(props.match.params.section==null||props.match.params.action==null)
		{
			//var sData = App.store.getState().dataStore.contactData;			
			var baseUrl:String = props.match.path.split(':section')[0];
			trace('redirecting to ${baseUrl}List/get');
			props.history.push('${baseUrl}List/get');
			//get(null);
		}
		else 
		{
			//
			trace(props.match.params);
		}		
		trace(state.loading);
	}
	
	static function mapStateToProps(aState:AppState) 
	{
		return {
			userState:aState.userState
		};
	}
	
	public function delete(ev:ReactEvent):Void
	{
		trace(state.selectedRows.length);
		var data = state.formApi.selectedRowsMap(state);
	}

	public function get(ev:Dynamic):Void
	{
		trace('hi $ev');
		var offset:Int = 0;
		if(ev != null && ev.page!=null)
		{
			offset = Std.int(props.limit * ev.page);
		}
		trace(props.match.params);
		var p:Promise<DbData> = props.load(
			{
				classPath:'data.Contacts',
				action:'get',
				filter:(props.match.params.id!=null?{id:props.match.params.id, mandator:'1'}:{mandator:'1'}),
				limit:props.limit,
				offset:offset>0?offset:0,
				table:'contacts',
				resolveMessage:{					
					success:'Kontaktliste wurde geladen',
					failure:'Kontaktliste konnte nicht geladen werden'
				},
				dbUser:props.userState.dbUser,
				devIP: App.devIP
			}
		);
		p.then(function(data:DbData){
			trace(data.dataRows.length); 
			//setState({loading:false, dataTable:data.dataRows});
			setState({
				loading:false,
				dataTable:data.dataRows,
				dataCount:Std.parseInt(data.dataInfo['count']),
				pageCount: Math.ceil(Std.parseInt(data.dataInfo['count']) / props.limit)
			});			
		});
	}
	
	public function edit(ev:ReactEvent):Void
	{
		trace(state.selectedRows.length);	
		trace(Reflect.fields(ev));
	}

	public function restore() {
		trace(Reflect.fields(props.dataStore));
		if(props.dataStore != null && props.dataStore.contactsDbData != null)
		{
			setState({
			//props.parentComponent.setStateFromChild({props.match.params.id!=null?'id|${props.match.params.id}'
				//rows:dRows,
				dataTable:props.dataStore.contactsDbData.dataRows,
				dataCount:Std.parseInt(props.dataStore.contactsDbData.dataInfo['count']),
				pageCount: Math.ceil(Std.parseInt(props.dataStore.contactsDbData.dataInfo['count']) / props.limit)
			}, function (){
				trace(state.dataTable);
				props.history.push(
					'${props.match.path.split(':section')[0]}List/get/${props.match.params.id!=null?props.match.params.id:''}'
				);
				//trace(props.history.)
				//forceUpdate();
			});			
		}
		else 
		{
			props.history.push(
				'${props.match.path.split(':section')[0]}List/get/${props.match.params.id!=null?props.match.params.id:''}'
			);
			get(null);			
		}
		//props.storeData('Contacts', DataAction.Restore);
	}

	public function selectionClear() {
		var match:RouterMatch = copy(props.match);
		match.params.action = 'get';
		trace(state.dataTable.length);
		props.select(0, null,match, UnselectAll);	
		//trace(formRef !=null);

		var trs:NodeList = Browser.document.querySelectorAll('.tabComponentForm tr');				
		trace(trs.length);
		for(i in 0...trs.length){
			var tre:TableRowElement = cast(trs.item(i), TableRowElement);
			if(tre.classList.contains('is-selected')){
				trace('unselect:${tre.dataset.id}');
				tre.classList.remove('is-selected');
			}
		};
		Browser.document.querySelector('[class="grid-container-inner"]').scrollTop = 0;
	}
		
	override public function componentDidMount():Void 
	{	
		dataAccess = [
			'get' =>{
				source:[
					"contacts" => []
				],
				view:[]
			},
		];			
		//
		if(props.userState != null)
		trace('yeah: ${props.userState.dbUser.first_name}');
		trace(props.match.params.action);
		state.formApi.doAction();

	}
	
	function renderResults():ReactFragment
	{
		trace(props.match.params.section + ':${props.match.params.action}::' + Std.string(state.dataTable != null));
		//trace(dataDisplay["userList"]);
		var pState:FormState = props.parentComponent.state;
		trace(state.dataTable.length);
		if(props.dataStore.contactsDbData != null)
		trace(props.dataStore.contactsDbData.dataRows[0]);
		else trace(props.dataStore.contactsDbData);
		trace(state.loading);
		if( state.dataTable.length==0)
			return state.formApi.renderWait();
		//trace('###########loading:' + state.rows[0]);
		return switch(props.match.params.action)
		{//  ${...props}
			case 'get':
				jsx('				
				<Grid id="contactList" data=${state.dataTable}
				${...props} dataState = ${dataDisplay["contactList"]} 
				parentComponent=${this} className="is-striped is-hoverable" fullWidth=${true}/>			
				');			
				/*				
				jsx('
					<form className="tabComponentForm" >
						<$Table id="contactsList" data=${state.dataTable}  parentComponent=${this}
						${...props} dataState=${dataDisplay["contactList"]} renderPager=${{function()trace(Reflect.fields(props));}}
						className="is-striped is-hoverable" fullWidth=${true}/>
					</form>
				');*/
			default:
				null;
		}
		return null;
	}

	function getCellData(cP:Dynamic) {
		trace(cP);
	}
//cellDataGetter=${getCellData}
	
	override function render():ReactFragment
	{
		//if(state.dataTable != null)	trace(state.dataTable[0]);
		trace(props.match.params.section);		
		return state.formApi.render(jsx('
				${renderResults()}
		'));		
	}

	override public function componentWillUnmount() {
		trace('...');
	}

	function updateMenu(?viewClassPath:String):MenuProps
	{
		var sideMenu = state.sideMenu;
		trace(sideMenu.section);
		for(mI in sideMenu.menuBlocks['List'].items)
		{
			switch(mI.action)
			{
				case 'update'|'delete':
					mI.disabled = state.selectedRows.length==0;
				default:
			}			
		}
		return sideMenu;
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
        return {
            load: function(param:DBAccessProps) return dispatch(CRUD.read(param))
        };
	}

}