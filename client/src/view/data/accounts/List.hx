package view.data.accounts;

import model.accounting.AccountsModel;
import js.Browser;
import db.DBAccessProps;
import action.async.CRUD;
import haxe.ds.IntMap;
import redux.Redux.Dispatch;
import view.shared.io.BaseForm;
import js.lib.Promise;
import state.AppState;
import haxe.Constraints.Function;
import react.ReactComponent;
import react.ReactEvent;
import react.ReactMacro.jsx;
import shared.DbData;
import shared.DBMetaData;
import view.shared.FormField;
import state.FormState;
import view.data.accounts.model.Accounts;
import view.shared.MItem;
import view.shared.MenuProps;
import view.shared.io.FormApi;
import view.shared.io.DataFormProps;
import view.shared.io.DataAccess;
import loader.BinaryLoader;
import view.grid.Grid;
import model.Account;

@:connect
class List extends ReactComponentOf<DataFormProps,FormState>
{
	public static var menuItems:Array<MItem> = [
		{label:'Anzeigen',action:'get'},
		{label:'Bearbeiten',action:'edit'},
		//{label:'Finden',action:'get'},
		{label:'Neu', action:'insert'},
		{label:'Löschen',action:'delete'}
	];
	var baseForm:BaseForm;
	var dataDisplay:Map<String,DataState>;
	var dataAccess:DataAccess;	
	var dbData: shared.DbData;
	var dbMetaData:shared.DBMetaData;
	public function new(props) 
	{
		super(props);
		//baseForm =new BaseForm(this);
		dataDisplay = AccountsModel.dataGridDisplay;
		trace('...' + Reflect.fields(props));
		state =  App.initEState({
			dataTable:[],
			loading:false,
			accountsData:new IntMap(),			
			selectedRows:[],
			sideMenu:FormApi.initSideMenu( this,
				{
					dataClassPath:'data.Accounts',
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
		//state =  App.initEState({loading:false,values:new Map<String,Dynamic>()},this);
		trace(state.loading);
		if(props.match.params.action==null)
			{
				//var sData = App.store.getState().dataStore.contactData;	props.match.params.section==null||		
				var baseUrl:String = props.match.path.split(':section')[0];
				trace('redirecting to ${baseUrl}List/get');
				props.history.push('${baseUrl}List/get');
				get(null);
			}
			else 
			{
				//
				trace(props.match.params);
			}		
			trace(state.loading);		
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
        return {
			load: function(param:DBAccessProps) return dispatch(CRUD.read(param)),
			//select:
        };
	}
	
	static function mapStateToProps(aState:AppState) 
	{
		trace(aState.userState);
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
		trace('hi :)');
		var offset:Int = 0;
		state.loading = true;
		//setState({loading:true});
		if(ev != null && ev.page!=null)
		{
			offset = Std.int(props.limit * ev.page);
		}		
		//var contact = (props.location.state.contact);
		trace(props.userState);
		var p:Promise<DbData> = props.load(
			{
				classPath:'data.Accounts',
				action:'get',
				filter:(props.match.params.id!=null?{id:props.match.params.id, mandator:'1'}:{mandator:'1'}),
				limit:props.limit,
				offset:offset>0?offset:0,
				table:'accounts',
				dbUser:props.userState.dbUser,
				devIP:App.devIP
			}
		);
		p.then(function(data:DbData){
			trace(data.dataRows.length); 
			if(data.dataRows != null && data.dataRows.length > 0)
			setState({loading:false, dataTable:data.dataRows, pageCount: Math.ceil(Std.parseInt(data.dataInfo['count']) / props.limit)});
		});
	}
	
	public function edit(ev:ReactEvent):Void
	{
		trace(ev);
		trace(state.selectedRows.length);				
		var selected = Browser.document.querySelector('.gridItem.selected');
		if(selected!=null)
		trace(selected.dataset.id);
		var baseUrl:String = props.match.path.split(':section')[0];
		props.history.push('${baseUrl}Edit/update/${selected.dataset.id}');
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
		//dbData = FormApi.init(this, props);
		if(props.match.params.action != null)
		{
			var fun:Function = Reflect.field(this,props.match.params.action);
			if(Reflect.isFunction(fun))
			{
				Reflect.callMethod(this,fun,null);
			}
		}
		else 
			setState({loading: false});
	}
	
	function renderResults():ReactFragment
	{
		trace(props.match.params.section + ':' + Std.string(state.dataTable != null));
		//trace(dataDisplay["userList"]);
		trace(state.loading);
		if(state.loading || state.dataTable == null || state.dataTable.length == 0)
			return state.formApi.renderWait();
		trace('###########loading:' + state.loading);
		return switch(props.match.params.action)
		{
			case 'get':
				jsx('				
				<Grid id="accountsList" data=${state.dataTable}
				${...props} dataState = ${dataDisplay["accountsList"]} 
				parentComponent=${this} className="is-striped is-hoverable" fullWidth=${true}/>
				');
				/*jsx('
					<Table id="accountsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["accountsList"]} renderPager=${function()BaseForm.renderPager(this)}
					parentComponent=${this} className="is-striped is-hoverable" fullWidth=${true}/>
				');*/
			/*case 'update':
				jsx('
					<Table id="accountsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["clientList"]} 
					className="is-striped is-hoverable" fullWidth=${true}/>
				');			
			case 'insert':
				trace(dataDisplay["accountsList"]);
				trace(state.dataTable[29]['id']+'<<<');
				jsx('
					<Table id="accountsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["accountsList"]} 
					className="is-striped is-hoverable" fullWidth=${true}/>				
				');	*/
			case 'delete':
				null;
			default:
				null;
		}
		return null;
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
	
	function updateMenu(?viewClassPath:String):MenuProps
	{
		var sideMenu = state.sideMenu;
		trace(sideMenu.section);
		for(mI in sideMenu.menuBlocks['Contact'].items)
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