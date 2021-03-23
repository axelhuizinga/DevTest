package view.shared;
import react.ReactComponent.ReactFragment;
import react.ReactMacro.jsx;
import react.ReactComponent.ReactComponentOfProps;
import react.router.NavLink;
import react.router.ReactRouter.withRouter;
import react.router.RouterMatch;
import view.shared.RouteTabProps;

typedef TabLinkProps = 
{
	>NavLinkProps,
	?match:RouterMatch,
	?toParams:String->String
}

class TabLink extends ReactComponentOfProps<TabLinkProps>
{
	override function render()
	{
		//trace(Type.typeof(props.to));
		var toCheck:String = (Type.typeof(props.to)==TObject?untyped props.to.pathname:props.to);
		return jsx('
		<li className=${props.location.pathname.indexOf(toCheck) == 0 ?"is-active":""}>
		<$NavLink to=${props.to}>${props.children}</$NavLink></li>
		');		
	}
}