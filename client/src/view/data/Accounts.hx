package view.data;

import action.DataAction.SelectType;
import haxe.ds.IntMap;
import react.ReactRef;
import react.router.RouterMatch;
import react.router.ReactRouter;
import comments.StringTransform;
import haxe.Serializer;
import haxe.ds.StringMap;
import haxe.Json;
import js.html.XMLHttpRequest;
import haxe.http.HttpJs;
import me.cunity.debug.Out;
import state.AppState;
import react.Fragment;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.ReactUtil;
import react.ReactType;
import redux.Redux.Dispatch;
import action.async.LiveDataAccess;
import model.accounting.ReturnDebitModel;
import loader.AjaxLoader;
import view.data.accounts.Edit;
import view.data.accounts.List;
import view.shared.io.DataFormProps;
import view.shared.io.FormApi;
import state.FormState;
import view.shared.OneOf;
import view.shared.Menu;
import view.shared.MenuProps;
import view.table.Table;

/**
 * ...
 * @author axel@cunity.me
 */

@:connect
class Accounts extends ReactComponentOf<DataFormProps,FormState>
{
	//var requests:Array<OneOf<HttpJs, XMLHttpRequest>>;
	var _trace:Bool;
	static  var _strace:Bool;

	public function new(?props:DataFormProps) 
	{
		super(props);	
		_strace = true;
		trace(Reflect.fields(props));
		trace(props.match.params.section);
		state = {
			clean:true,
			//formApi: new FormApi(this),
			hasError:false,
			mounted:false,
			loading:true,
			sideMenu:FormApi.initSideMenu2( this,
				[
					{
						dataClassPath:'data.Contacts',
						label:'Konten',
						section: 'List',
						items: List.menuItems
					},
					{
						dataClassPath:'contact.Deals',
						label:'Aufträge',
						section: 'Edit',
						items: Edit.menuItems
					}
				]
				,{	
					section: props.match.params.section==null? 'DBSync':props.match.params.section, 
					sameWidth: true}					
			)
		};
		trace(Reflect.fields(props));		
	}
	
	static function mapDispatchToProps(dispatch:Dispatch):Dynamic
	{
		if(_strace) trace('ok');
		return {	 
			//select:function(id:Int = -1,data:IntMap<Map<String,Dynamic>>,match:RouterMatch, ?selectType:SelectType)
			select:function(id:Int = -1,data:IntMap<Map<String,Dynamic>>,component:Accounts, ?selectType:SelectType)
			{
				if(_strace) trace('select:$id selectType:${selectType}');
				//dispatch(DataAction.CreateSelect(id,data,match));
				dispatch(LiveDataAccess.select({id:id,data:data,match:component.props.match,selectType: selectType}));
			}
		};
	}
	
	override function componentDidCatch(error, info) {
		// Display fallback UI
		if(state.mounted)
		this.setState({ hasError: true });
		trace(error);
	}	
	
	override public function componentDidMount():Void 
	{
		//
		setState({mounted:true});
		if (props.match.params.section == null)
		{
			var basePath:String = props.match.url;
			props.history.push('$basePath/List');
			trace(props.history.location.pathname);
			trace('setting section to:List');
		}		
		trace('${1}');
		//TODO: AUTOMATE CREATE HISTORY TRIGGER IF DB TABLES CHANGED
		/*AjaxLoader.loadData('${App.config.api}', 
			{
				id:props.user.id,
				jwt:props.user.jwt,
				classPath:'admin.CreateHistoryTrigger',
				action:'run'				
			}, 
			function(data:String){
				trace(data); 
				if (data != null && data.length > 0)
				{
					var sData:StringMap<Dynamic> = state.data;
					sData.set('historyTrigger', Json.parse(data).data.rows);
					setState(ReactUtil.copy(state, {data:sData}));				
				}
			});	
			*/		
	}
	
	override public function render() 
	{
		trace(props.match.params.section);
		//trace(state.sideMenu); 
		return switch(props.match.params.section)
		{
			case "Edit":
				jsx('
					<$Edit ${...props} fullWidth={true} sideMenu=${state.sideMenu}/>
				');					
			case "List":
				jsx('
					<$List ${...props}  limit=${100} fullWidth={true} sideMenu=${state.sideMenu}/>
				');						
			default:
				null;				
		}
	}
	
}