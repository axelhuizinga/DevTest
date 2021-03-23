package view;
import react.router.RouterMatch;


import comments.StringTransform;
import haxe.Timer;
import history.History;
import history.BrowserHistory;
import state.AppState;
import react.Fragment;
import react.ReactComponent.ReactFragment;
import react.React;
import react.ReactComponent;
import react.ReactComponent.*;
import react.ReactMacro.jsx;
import react.React.ReactChildren;
import react.ReactPropTypes;
import react.ReactRef;
import redux.Store;
import redux.Redux;
import react.router.NavLink;
import react.router.Redirect;
import react.router.Route;
import react.router.Router;
import react.router.Route.RouteRenderProps;
import react.router.bundle.Bundle;

import bulma_components.Tabs;

import state.AppState;
import App;
import view.DevTest;

/**
 * ...
 * @author axel@cunity.me
 */

typedef UIProps =
{
	?store:Store<AppState>
}

typedef UIState =
{
	?hasError:Bool,
	?rFlag:Int
}

@:connect
class UiView extends ReactComponentOf<UIProps, UIState>
{
	var browserHistory:History;
	var dispatchInitial:Dispatch;
	var mounted:Bool;
	//static var _me:UiView;

	static function mapStateToProps(aState:AppState):UIProps
	{		
		//trace(aState.user.id);
		//trace(Reflect.fields(aState));
		return {
			
		};
	}
	
	public function new(props:Dynamic) {
		trace(Reflect.fields(props));
        super(props);
		state = {hasError:false};
		browserHistory = App.store.getState().locationStore.history;// BrowserHistory.create({basename:"/"});
		//ApplicationStore.startHistoryListener(App.store, browserHistory);
		//trace(this.props.userState.state.last_name);
		mounted = false;
		//_me = this;
		App.modalBox = React.createRef();
    }

	override function componentDidCatch(error, info) {
		// Display fallback UI
		if(mounted)
		this.setState({ hasError: true });
		// You can also log the error to an error reporting service
		//logErrorToMyStore(error, info);
		trace(error);
	}

    override function componentDidMount() {
		mounted = true;
    }

	override function render()
	{
		//if(props.userState.dbUser !=null)trace(props.userState.dbUser.id);
		if (state.hasError) {
		  return jsx('<h1>Something went wrong.</h1>');
		}
				
		return
		#if debug 
			jsx('
		<$Router history={browserHistory} >
		<>
			<div className="topNav">
				<$Route path="/DevTest" {...props} component=${NavTabs}/>
			</div>
			
			<div className="tabComponent" id="development">
				<$Route path="/"  render=${renderRedirect} exact={true}/>								
				<$Route path="/DevTest" component=${DevTest}/>
			</div>
		</>
		</$Router>
		');
		#else 
			jsx('
		<$Router history={browserHistory} >
		<>
			<div className="topNav">
				<$Route path="/DevTest" {...props} component=${NavTabs}/>
			</div>
			<div className="tabComponent">
				<$Route path="/"  render=${renderRedirect} exact={true}/>								
				<$Route path="/DevTest" component=${Bundle.load(DevTest)}/>
			</div>				
		</>
		</$Router>
		');		
		#end
		
	}
	
	function renderRedirect(?p:Dynamic)
	{
		trace('...');
		return jsx('<Redirect to=${'/DevTest'}/>');
	}
}