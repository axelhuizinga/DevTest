package view.dashboard;

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
import loader.AjaxLoader;

import view.shared.io.DataFormProps;
import view.shared.io.FormApi;
import state.FormState;
import view.shared.OneOf;
import view.shared.Menu;
import view.shared.MenuProps;
import view.dashboard.DB;
import view.dashboard.DBSync;
import view.table.Table;

/**
 * ...
 * @author axel@cunity.me
 */

class Setup extends ReactComponentOf<DataFormProps,FormState>
{
	//var requests:Array<OneOf<HttpJs, XMLHttpRequest>>;
	public function new(?props:DataFormProps) 
	{
		trace(props.userState);
		super(props);	
		trace(Reflect.fields(props));
		trace(props.match.params.section);
		state = /*{
			clean:true,
			//formApi: new FormApi(this),
			hasError:false,
			mounted:false,
			loading:true,*/
		App.initEState({
			//dataTable:[],loading:false,selectedData:new IntMap(), selectedRows:[],values:new Map<String,Dynamic>(),
			sideMenu:FormApi.initSideMenu2( this,
				[
					{
						dataClassPath:'admin.SyncExternal',
						label:'DB Abgleich',
						section: 'DBSync',
						items: DBSync.menuItems
					},
					{
						dataClassPath:'tools.DB',
						label:'DB Design',
						section: 'DB',
						items: DB.menuItems
					}
				]
				,{	
					section: props.match.params.section==null? 'DBSync':props.match.params.section, 
					sameWidth: true}					
			)
		},this);
		trace(Reflect.fields(props));		
	}
	
	override function componentDidCatch(error, info) {
		trace(info);
		// TODO:Display fallback UI
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
			props.history.push('$basePath/DB');
			trace(props.history.location.pathname);
			trace('setting section to:DB');
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
			case "DBSync":
				jsx('
					<$DBSync ${...props} fullWidth={true} sideMenu=${state.sideMenu}/>
					');					
				case "DB":
				jsx('
					<$DB ${...props} fullWidth={true} sideMenu=${state.sideMenu}/>
				');				
			default:
				null;					
		}
	}

	public function syncUserDetails() {
		trace('ooo');
	}
	
}