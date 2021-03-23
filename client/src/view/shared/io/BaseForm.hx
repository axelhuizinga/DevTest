package view.shared.io;
import model.ORM;
import haxe.Constraints.Function;
import model.Contact;
import haxe.Json;
import action.async.DBAccess;
import state.AppState;
import haxe.ds.Map;
import js.html.Document;
import js.html.Event;
import js.html.FormElement;
import js.html.HTMLCollection;
import js.html.HTMLOptionsCollection;
import js.Browser;
import me.cunity.debug.Out;
import react.ReactComponent;
import react.ReactEvent;
import react.ReactMacro.jsx;
import react.ReactPaginate;
import react.ReactRef;
import react.ReactUtil;
import react.ReactUtil.copy;
import view.shared.FormBuilder;
import state.FormState;
import view.dashboard.model.DBSyncModel;
import view.shared.MItem;
import view.shared.io.FormApi;
import view.shared.io.DataFormProps;
import view.shared.io.DataAccess;
import view.table.Table;

class BaseForm
{
	var comp:ReactComponentOf<DataFormProps,FormState>;

	/*public function new(comp:Dynamic) {
		this.comp = comp;		
	}*/

	public static function compareStates(comp:Dynamic) {
		var dObj:ORM = cast(comp.state.actualState, ORM);
		for(f in Reflect.fields(dObj))
		{
			trace('$f:${Reflect.field(comp.state.actualState,f)}<==>${Reflect.field(comp.state.initialState,f)}<');
		}
	}

	public static function doChange(comp:Dynamic,name:String,value:Dynamic) {		
		//trace(comp.state.actualState);
		trace(Type.getClassName(Type.getClass(comp)));
		trace('$name: $value ');
		//if(comp.state.actual)
		//trace('$name: $value ' + Type.typeof(untyped comp.state.ormRefs.get('deals').orms.get(75)));
		if(name!=null && name!=''){
			trace(Reflect.getProperty(comp.state.actualState,name));
			Reflect.setProperty(comp.state.actualState,name,value);
		}
		//Reflect.setProperty(comp.state.actualState,name,value);
		/*trace(untyped comp.state.ormRefs.get('deals').orms.get(75).cycle +':'+comp.state.actualState.cycle);
		untyped Reflect.setProperty(comp.state.ormRefs.get('deals').orms.get(75),'cycle',value);
		trace(untyped comp.state.ormRefs.get('deals').orms.get(75).cycle +':'+
		comp.state.actualState.cycle);*/
		return;
		//Reflect.setProperty(comp.state.actualState,name,value);
		trace(Reflect.field(comp.state.actualState, name));
		//Reflect.set(comp.state.actualState,name,value);
		//setState({comp.state.initialState:comp.state.actualState});
	}

	public function handleChange(e:Event) 
	{
		var el:Dynamic = e.target;
		trace(Type.typeof(el));
		//trace('${el.name}:${el.value}');
		if(el.name != '' && el.name != null)
		{
			trace('>>${el.name}=>${el.value}<<');
			//trace(comp.state.actualState);
			Reflect.setField(comp.state.actualState,el.name,el.value);
			trace(Reflect.field(comp.state.actualState, el.name));
		}	

		//trace(comp.state.actualState);
	}		

	public static function initFieldNames(keys:Iterator<String>):Array<String> {
		var fieldNames = new Array();
		for(k in keys)
		{
			fieldNames.push(k);
		}		
		return fieldNames;
	}
	
	/*public function sessionStore(classPath:String){
		trace(comp.state.actualState);
		Browser.window.sessionStorage.setItem(classPath,Json.stringify(comp.state.actualState));
		Browser.window.removeEventListener('beforeunload', sessionStore);
	}*/

	public function storeParams(path:String, params:Dynamic):Map<String,Map<String,String>>
	{
		var pMap = [
			for(f in Reflect.fields(params))
				f => Reflect.field(params, f)
		];
		return [path=>pMap];
	}

	public function restoreParams(m:Map<String,String>):Dynamic
	{
		var p:Dynamic = {};
		for(k=>v in m.keyValueIterator())
			Reflect.setField(p,k,v);
		return p;
	}

	/**
	 * PAGER HANDLING
	 */

	public static function renderPager(comp:Dynamic):ReactFragment
	{
		trace('pageCount=${comp.state.pageCount}');
		
		//trace(jsx('<div className="paginationContainer">React Paginate</div>'));
		return jsx('
		<div className="paginationContainer">
			<nav>
				<$ReactPaginate previousLabel=${'<'} breakLinkClassName=${'pagination-link'}
					pageLinkClassName=${'pagination-link'}					
					nextLinkClassName=${'pagination-next'}
					previousLinkClassName=${'pagination-previous'}
					nextLabel=${'>'}
					breakLabel=${'...'}
					breakClassName=${'break-me'}
					pageCount=${comp.state.pageCount}
					marginPagesDisplayed={2}
					pageRangeDisplayed={5}
					onPageChange=${function(data){
						trace('${comp.props.match.params.action}  ${data.selected}');
						var fun:Function = Reflect.field(comp,comp.props.match.params.action);
						if(Reflect.isFunction(fun))
						{
							Reflect.callMethod(comp,fun,[{page:data.selected}]);
						}
						//onPageChange(comp);
					}}
					containerClassName=${'pagination  is-small'}
					subContainerClassName=${'pages pagination'}
					activeLinkClassName=${'is-current'}/>
			</nav>	
		</div>		
		');
	}
	
}