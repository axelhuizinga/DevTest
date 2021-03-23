package react_virtualized;
import react.ReactComponent;

/**
 * ...
 * @author axel@cunity.me
 */



@:jsRequire('react-virtualized', 'Grid')
@:native('Grid')
@:keepSub
@:autoBuild(react.ReactMacro.buildComponent())
@:autoBuild(react.ReactTypeMacro.alterComponentSignatures())
#if (debug && react_render_warning)
@:autoBuild(react.ReactDebugMacro.buildComponent())
#end
extern class A1_Grid implements Dynamic extends ReactComponent{}
