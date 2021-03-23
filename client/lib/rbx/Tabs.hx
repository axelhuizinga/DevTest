package rbx;

import react.ReactComponent;

/**
 * ...
 * @author axel@cunity.me
 */

//@:jsRequire('reactbulma', 'Tabs')
@:jsRequire('rbx', 'Tab')
@:native('Tab')
extern class Tabs extends ReactComponentOfProps<TabsProps>
{
}
typedef TabsProps = {
	?className:String,
	?right:Bool,		
	?centered:Bool,		
	?boxed:Bool,		
	?fullwidth:Bool,		
	?small:Bool,		
	?medium:Bool,		
	?large:Bool,		
	?toggle:Bool
}