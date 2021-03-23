package view.data.contacts;

import haxe.Exception;
import model.ORM;
import react.ReactUtil;
import model.Account;
import me.cunity.debug.Out;
import action.DataAction.SelectType;
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
import view.shared.MItem;
import view.shared.MenuProps;
import view.shared.io.FormApi;
import view.shared.io.DataFormProps;
import view.shared.io.DataAccess;
import loader.BinaryLoader;
import view.grid.Grid;
//import view.table.Table;
import model.accounting.AccountsModel;

@:connect
class Accounts extends ReactComponentOf<DataFormProps,FormState>
{
	public static var classPath = Type.getClassName(Accounts);	
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
			actualStates:new IntMap<ORM>(),
			dataTable:[],
			loading:true,
			model:'accounts',
			accountsData:new IntMap(),			
			selectedRows:[],
			sideMenu:null,
			values:new Map<String,Dynamic>()
		},this);
		trace(state.loading);	
		props.parentComponent.state.relDataComps.set(Type.getClassName(Type.getClass(this)),this);
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
        return {
			load: function(param:DBAccessProps) return dispatch(CRUD.read(param)),
			loadData:function(id:Int = -1, me:Dynamic) return me.loadData(id),
			save: function(me:Dynamic) return me.update(),
			select:function(id:Int = -1, me:Dynamic, pComp:Dynamic, ?sType:SelectType)
				{
					//if(true) trace('select:$id dbUser:${dbUser}');
					if(true) trace('select:$id me:${Type.getClassName(Type.getClass(me))} SelectType:${sType} parentComponent:${Type.getClassName(Type.getClass(pComp.props.parentComponent))}');
				//dispatch(DataAction.CreateSelect(id,data,match));${Type.typeof(me)}
				//dispatch(LiveDataAccess.select({id:id,data:data,match:match,selectType: selectType}));
			}
        };
	}
	
	static function mapStateToProps(aState:AppState) 
	{		
		//trace(aState.userState);
		trace(Reflect.fields(aState));
		return {
			userState:aState.userState
		};
	}
	
	public function delete(ev:ReactEvent):Void
	{
		trace(state.selectedRows.length);
		var data = state.formApi.selectedRowsMap(state);
	}

	public function get():Void
	{
		//trace('hi :)');
		trace(props.filter);
		var offset:Int = 0;
		//setState({loading:true});
		//var contact = (props.location.state.contact);
		Out.dumpObject(props.userState);
		var p:Promise<DbData> = props.load(
			{
				classPath:'data.Accounts',
				action:'get',
				filter:(props.filter!=null?props.filter:{mandator:'1'}),
				limit:props.limit,
				offset:offset>0?offset:0,
				table:state.model,
				resolveMessage:{					
					success:'Kontenliste wurde geladen',
					failure:'Kontenliste konnte nicht geladen werden'
				},					
				dbUser:props.userState.dbUser,
				devIP:App.devIP
			}
		);
		p.then(function(data:DbData){
			trace(data.dataRows.length); 
			setState({loading:false, dataTable:data.dataRows});
		});
	}
	
	public function edit(ev:ReactEvent):Void
	{
		trace(state.selectedRows.length);				
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
		trace('ok');
		props.parentComponent.registerOrmRef(this);
		get();
	}
	
	public function loadData(id:Int):Void
	{
		trace('loading:$id');
		if(id == null)
			return;
		var p:Promise<DbData> = props.load(
			{
				classPath:'data.Accounts',
				action:'get',
				filter:{id:id,mandator:1},
				resolveMessage:{
					success:'Konto ${id} wurde geladen',
					failure:'Konto ${id} konnte nicht geladen werden'
				},
				table:'accounts',
				dbUser:props.userState.dbUser,
				devIP:App.devIP
			}
		);
		p.then(function(data:DbData){
			trace(data.dataRows.length); 
			if(data.dataRows.length==1)
			{
				var data = data.dataRows[0];
				//trace(data);	
				//if( mounted)
				var account:Account = new Account(data);
				trace(account.id);	
				state.actualStates.set(account.id, account);
				state.loading = false;
				account.state.actualState = account;
				trace(untyped account.state.actualState.id + ':' + account.state.actualState.fieldsInitalized.join(','));
				props.parentComponent.registerORM('accounts',account);
			}
		});
	}	
	
	//renderPager=${function()BaseForm.renderPager(this)}
	function renderResults():ReactFragment
	{
		trace(state.loading + ':' + props.action);
		if(state.loading || state.dataTable == null || state.dataTable.length == 0)
			return state.formApi.renderWait();
		trace('###########loading:' + props.action);
		return switch(props.action)
		{
			case 'get':
				trace(state.dataTable);
				//jsx('<div>dummy</div>');
				jsx('
					<Grid id="accountsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["accountsList"]} 
					parentComponent=${this} className="is-striped is-hoverable" fullWidth=${true}/>
				');
			case 'update':
				jsx('
					<Grid id="accountsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["accountsList"]} 
					className="is-striped is-hoverable" fullWidth=${true}/>
				');			
			case 'insert':
				trace(dataDisplay["accountsList"]);
				trace(state.dataTable[29]['id']+'<<<');
				jsx('
					<Grid id="accountsList" data=${state.dataTable}
					${...props} dataState = ${dataDisplay["accountsList"]} 
					className="is-striped is-hoverable" fullWidth=${true}/>				
				');	
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
		trace(props.action);				
		//return state.formApi.render(jsx('
		return jsx('
		<div className="t_caption">Konten
			<form className="tabComponentForm" name="accountsList" >				
				${renderResults()}
			</form>
		</div>
		');		
	}

	public function select(mEvOrID:Dynamic)
	{		
		trace(Reflect.fields(props));
		trace(mEvOrID);
	}	
	
	function update()
	{
		var changed:Int = 0;
		try{	
			//var it:Iterator<Deal> = props.parentComponent.state.ormRefs.get(state.model).orms.iterator();
			var it:Iterator<ORM> = state.actualStates.iterator();
			while(it.hasNext()){
				var account:ORM = it.next();
				if(account.fieldsModified.length>0){
					changed++;
					var data2save = account.allModified();
					var dbQ:DBAccessProps = {
						classPath:'data.Accounts',
						action:'update',
						data:data2save,
						filter:{id:account.id,mandator:1},
						resolveMessage:{
							success:'Konto ${account.id} wurde aktualisiert',
							failure:'Konto ${account.id} konnte nicht aktualisiert werden'
						},
						table:'accounts',
						dbUser:props.userState.dbUser,
						devIP:App.devIP
					}
					var p:Promise<Dynamic> = App.store.dispatch(CRUD.update(dbQ));
					p.then(function(d:Dynamic){
						trace(d);
						get();
					});
				}				
			}
		}
		catch(ex:Exception){
			trace(ex.details);
		}
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