package view;
import react.ReactType;
import action.async.UserAccess;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react.router.Route;
import react.router.Route.RouteComponentProps;
import react.router.Link;
import react.router.NavLink;
import bulma_components.Tabs;
import view.shared.SLink;
import view.shared.TabLink;

/**
 * ...
 * @author axel@cunity.me
 */
typedef NavProps =
{
	> RouteComponentProps,
	debug:String
}

@:wrap(react.router.ReactRouter.withRouter)
class NavTabs extends ReactComponentOfProps<NavProps>
{
	static var tabsRendered:Int=0;
	
	public function new(?props:NavProps, ?context:Dynamic) 
	{
		trace(Reflect.fields(props));
		super(props);		
	}
	
	override public function render()
	{
		return jsx('
			<Tabs className="is-centered" >				
				${cast buildNav()}
			</Tabs>		
		');
	}		

	function buildNav()
	{
		return jsx('
		<>
			<$TabLink to="/DevTest" ${...props}>DevTest</$TabLink>			
		</>
		');
	}
}