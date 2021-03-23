package view.data;

import haxe.ds.IntMap;
import action.async.LiveDataAccess;
import action.DataAction;
import redux.Redux.Dispatch;
import view.data.deals.Edit;
import view.data.deals.List;

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
import view.table.Table;
using  shared.Utils;
/**
 * ...
 * @author axel@cunity.me
 */

@:connect
class Deals extends ReactComponentOf<DataFormProps,FormState>
{
	//var requests:Array<OneOf<HttpJs, XMLHttpRequest>>;
	static var _trace:Bool;
	public function new(?props:DataFormProps) 
	{
		super(props);
		_trace = true;	
		trace(Reflect.fields(props));
		trace(props.match.params.section);
		if(props.match.params.section==null)
			{
				//SET DEFAULT SECTION
				if(_trace) trace('reme');
				var baseUrl:String = props.match.path.split(':section')[0];
				if(props.dataStore.dealData.iterator().hasNext())
				{
					if(_trace) trace(props.dataStore.dealData.keys().keysList());
				}
				
				props.history.push('${baseUrl}List/');
				//props.history.push('${baseUrl}List/get${props.dataStore.contactData.iterator().hasNext()?'/'+props.dataStore.contactData.keys().keysList():''}');
			}				
		state = {
			clean:true,
			//formApi: new FormApi(this),
			hasError:false,
			mounted:false,
			loading:true,
			sideMenu:FormApi.initSideMenu2( this,
				[
					{
						dataClassPath:'data.deals.List',
						label:'Spenden',
						section: 'List',
						items: List.menuItems
					},
					{
						dataClassPath:'data.deals.Edit',
						label:'Spenden',
						section: 'Edit',
						items: Edit.menuItems
					}
				]
				,{	
					section: props.match.params.section==null? 'List':props.match.params.section, 
					sameWidth: true}					
			)
		};
		trace(Reflect.fields(props));		
	}
	
	static function mapStateToProps(aState:AppState) {
		var bState =  {
			dataStore:aState.dataStore,
			userState:aState.userState,
			//idLoaded:aState.dataStore.contactData.keys().next()
		};
		//if(_strace) trace(bState);
		if(_trace) trace(bState.dataStore.dealData);
		return bState;
	}

	static function mapDispatchToProps(dispatch:Dispatch):Dynamic
		{
			if(_trace) trace('ok');
			return {
				storeData:function(id:String, action:DataAction)
				{
					dispatch(LiveDataAccess.storeData(id, action));
				},
				select:function(id:Int = -1,data:IntMap<Map<String,Dynamic>>,component:Contacts, ?selectType:SelectType)
				{
					if(_trace) trace('select:$id selectType:${selectType}');
					trace(data);
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
		//setState({mounted:true});
		/*if (props.match.params.section == null)
		{
			var basePath:String = props.match.url;
			props.history.push('$basePath/List/get', props.location);
			trace(props.history.location.pathname);
			trace('redirecting to $basePath/List/get');
		}		
		trace('${}');*/
	
	}
	
	override public function render() 
	{
		trace(props.match.params.section);
		if(_trace) trace(props.match.params.action);	
		//trace(state.sideMenu); 
		return switch(props.match.params.section)
		{
			case "Edit":
				jsx('
					<$Edit ${...props} fullWidth={true}  parentComponent=${this} formApi=${state.formApi} sideMenu=${state.sideMenu}/>
				');					
			case "List":
				jsx('
					<$List ${...props}  limit=${100}   parentComponent=${this} formApi=${state.formApi} fullWidth={true} sideMenu=${state.sideMenu}/>
				');						
			default:
				null;					
		}
	}
	
}