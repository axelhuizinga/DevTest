package react_virtualized;


import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.ReactComponent.ReactComponentOf;


/**
 * ...
 * @author axel@cunity.me
 */

typedef MultiGridProps = {
	?classNameBottomLeftGrid:String,
	?classNameBottomRightGrid:String,
	?classNameTopLeftGrid:String,
	?classNameTopRightGrid:String,
	?enableFixedColumnScroll:Bool,
	?enableFixedRowScroll:Bool,
	?fixedColumnCount:Int,
	?fixedRowCount:Int,
	?onScrollbarPresenceChange:Function,
	?style:Dynamic,
	?styleBottomLeftGrid:Dynamic,
	?styleBottomRightGrid:Dynamic,
	?styleTopLeftGrid:Dynamic,
	?styleTopRightGrid:Dynamic,
	?hideTopRightGridScrollbar:Bool,
	?hideBottomLeftGridScrollbar:Bool
}

typedef MultiGridState = {
	scrollLeft:Int,
	scrollTop:Int,
	scrollbarSize:Int,
	showHorizontalScrollbar:Bool,
	showVerticalScrollbar:Bool
};

@:jsRequire('react-virtualized', 'MultiGrid')
extern class MultiGrid extends ReactComponentOf<MultiGridProps,MultiGridState>
{
	public function new(?props:MultiGridProps):Void;
	
	public function forceUpdateGrids():Void;
	
	public function measureAllCells():Void;
	
	public function recomputeGridSize():Void;
	
}