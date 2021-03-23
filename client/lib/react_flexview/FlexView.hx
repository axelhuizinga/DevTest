package react_flexview;

import haxe.extern.EitherType;
import react.React.ReactChildren;
import react.ReactComponent;

/**
 * ...
 * @author axel@cunity.me
 */

typedef IProps = 
{
	?children:ReactChildren,
	?basis: EitherType<String,Int>,
	?className: String,
	?style: Dynamic,
	?width: EitherType<String,Int>,
	?height: EitherType<String,Int>,
	?column: EitherType <Bool,String>,
	?grow: EitherType <Bool,String>,
	?shrink: EitherType <Bool,String>,
	?vAlignContent: String,
	?hAlignContent: String,
	?marginLeft: EitherType<String,Int>,
	?marginRight: EitherType<String,Int>,
	?marginTop: EitherType<String,Int>,
	?marginBottom: EitherType<String,Int>,
	?wrap: Bool
}
 
@:jsRequire("react-flexview",'default')
@:keepSub
@:autoBuild(react.ReactMacro.buildComponent())
@:autoBuild(react.ReactTypeMacro.alterComponentSignatures())
#if (debug && react_render_warning)
@:autoBuild(react.ReactDebugMacro.buildComponent())
#end
extern class FlexView extends  ReactComponentOfProps<IProps>{}