package view.shared;

import haxe.Constraints.Function;
import action.LocationAction;
import state.AppState;
import react.ReactComponent.ReactComponentOfProps;
import react.ReactComponent.ReactFragment;
import react.ReactMacro.jsx;
import react.ReactMouseEvent;
import react.ReactPropTypes;
import react.router.NavLink;
import redux.Redux.Dispatch;

/**
 * ...
 * @author axel@cunity.me
 */
typedef SLinkProps = 
{
	>NavLinkProps,
	action:action.LocationAction,
	onClick:Dynamic->Void,
	children: ReactFragment,
	dispatch:Dispatch
}

//@:expose('default')
@:connect
class SLink extends ReactComponentOfProps<SLinkProps>
{

	public function new(?props:SLinkProps) 
	{
		super(props);
		
	}
	
	function handleClick(event:ReactMouseEvent){
		if ((event.button != null && event.button != 0)
			|| event.metaKey
			|| event.altKey
			|| event.ctrlKey
			|| event.shiftKey
			|| event.defaultPrevented){
				return;
			}
		event.preventDefault();
		if (props.onClick != null)
			props.onClick(event);
			
		trace('to: ${props.to}');
		props.dispatch(Push(props.to));	
	}
	
	static function mapStateToProps(state:AppState) {
		return {
			//counter: state.data.counter
		};
	}
	
	override public function render()
	{
		return  jsx('<a href={props.to} onClick={handleClick} >{props.children}</a>');
	}
}
	
