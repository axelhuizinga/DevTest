package bulma_components;

import react.ReactComponent;
import react.ReactType;

/**
 * ...
 * @author axel@cunity.me
 */

//@:jsRequire('reactbulma', 'Tabs')
@:jsRequire('react-bulma-components', 'Tabs')
extern class Tabs extends ReactComponentOfProps<TabsProps>
{
}
typedef TabsProps = {
	?className:String,
	?right:Bool,		
	?centered:Bool,		
	?children:ReactType,
	?boxed:Bool,		
	?fullwidth:Bool,		
	?small:Bool,		
	?medium:Bool,		
	?large:Bool,		
	?toggle:Bool
}