package react_virtualized;
import react_virtualized.Types.Alignment;
import react_virtualized.Types.CellRenderer;
import react_virtualized.Types.CellRangeRenderer;
import react_virtualized.Types.CellSize;
import react_virtualized.Types.NoContentRenderer;
import react_virtualized.Types.OverscanIndicesGetter;
import react_virtualized.Types.ScalingCellSizeAndPositionManager;
import react_virtualized.Types.Scroll;
import react_virtualized.Types.ScrollbarPresenceChange;
import react_virtualized.Types.SortDirection;
import react_virtualized.Types.RenderedSection;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.ReactComponent.ReactComponentOf;
import react.ReactPropTypes;

/**
 * ...
 * @author axel@cunity.me
 */

typedef ScrollSyncProps = {
	?autoHeight:Bool,
	?callBack:Bool,
	children:Column,
	?className:String,
	?disableHeader:Bool,
	?estimatedRowSize:Int,	
	?gridClassName:String,
	?gridStyle:Dynamic,
	?headerClassName:String,
	headerHeight:Int,
	?headerRowRenderer:Function,
	?headerStyle:Dynamic,
	height:Int,
	?id:String,
	?onRowClick:Function,
	?onHeaderClick:Function,
	?overscanCount:Int,
	rowCount:Int,
	?rowGetter:Dynamic->Dynamic,// = ({index}) => this._getDatum(sortedList, index);
	rowHeight:EitherType<Function,Int>,
	?noRowsRenderer:Function,
    ?rowClassName:Function,
	?rowStyle:EitherType<Function,Dynamic>,
	?scrollToIndex:Int,
	?sortBy:String,
	?sortDirection:SortDirection,
	?style:Dynamic,
	?tabIndex:Int,
	width:Int	
}

typedef TableState = {
	scrollbarWidth:Int
}

@:jsRequire('react-virtualized', 'ScrollSync')
extern class ScrollSync extends ReactComponentOf<TableProps,TableState>
{
	public function new(?props:TableProps):Void;
	
	public function forceUpdateGrid():Void;
	
	public function getOffsetForRow (off:Dynamic):Int;
	
	public function measureAllRows():Void;
	
	public function recomputeRowHeights (index: Int):Void;
	
	public function scrollToPosition (scrollTop: Int):Void;
	
	public function scrollToRow (index: Int):Void;
}