package view;
import haxe.Constraints.Function;
import react.ReactType;
import bulma_components.Tabs;
import state.LocationState;
//import view.shared.io.UserState;
import react.Partial;
import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;
import redux.Redux.Dispatch;
import react.router.Route;
import react.router.RouterMatch;
import react.router.Redirect;
import react.router.Switch;
import react.router.NavLink;
import view.shared.io.FormApi;
import view.shared.DataProps;
import view.shared.RouteTabProps;
import view.shared.CompState;
import view.shared.TabLink;
import view.StatusBar;
import redux.Redux;
import redux.thunk.Thunk;
import state.AppState;
using state.CState;
using shared.Utils;


@:connect
class DevTest extends ReactComponentOf<DataProps,CompState>
{
	//static var user = {first_name:'dummy'};
	public var mounted:Bool = false;
	var rendered:Bool = false;
	var renderCount:Int = 0;
	var _trace:Bool;
	static  var _strace:Bool;

	public function new(?props:Dynamic)
	{
		state = {hasError:false,mounted:false};
		super(props);	
		_trace = true;	
		if(_trace) trace(props.match);
		if(_trace) trace(props.store);

	}
	
	override public function componentDidMount():Void 
	{
		mounted = true;
	}
	
	override function componentDidCatch(error, info) {
		// Display fallback UI
		if(mounted)
			this.setState({ hasError: true });
		if(_trace) trace(error);
		if(_trace) trace(info);
	}		
	
	override function shouldComponentUpdate(nextProps:DataProps, nextState:CompState):Bool
	{
		if(_trace) trace('propsChanged:${nextProps!=props}');
		if(nextProps!=props)			props.compare(nextProps);
		if(_trace) trace('stateChanged:${nextState!=state}');
		if(nextState!=state || nextProps!=props)
		{
			return true;
		}
			
		return nextProps!=props;
	}
	
	static function mapDispatchToProps(dispatch:Dispatch):Dynamic
    {
		
        return {
			
		};
    }
		
    override function render() 
	{	
		if(_trace) trace(Reflect.fields(props));
		if(_trace) trace(Reflect.fields(state));
		return jsx('
		<>
			<div className="tabContent2" >
				HelloWorld
			</div>
			<$StatusBar ${...props}/>
		</>
			');			
    }
	
}
