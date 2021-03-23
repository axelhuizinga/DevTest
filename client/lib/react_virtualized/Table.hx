package react_virtualized;

import react.ReactComponent.ReactFragment;
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

/**
 * ...
 * @author axel@cunity.me
 */

typedef TableProps = {
	?autoHeight:Bool,
	?callBack:Bool,
	children:ReactFragment, //EitherType<Column, Array<Column>>,
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
	?sort:Function,
	?sortBy:String,
	?sortDirection:VSortDirection,
	?style:Dynamic,
	?tabIndex:Int,
	width:Int	
}

enum abstract VSortDirection(String){
	var ASC = 'ASC';
	var DESC = 'DESC';
	var NONE = '';
}

typedef TableState = {
	scrollbarWidth:Int
}

@:jsRequire('react-virtualized', 'Table')
extern class Table extends ReactComponentOf<TableProps,TableState>
{
	public function new(?props:TableProps):Void;
	
	public function forceUpdateGrid():Void;
	
	public function getOffsetForRow (off:Dynamic):Int;
	
	public function measureAllRows():Void;
	
	public function recomputeRowHeights (index: Int):Void;
	
	public function scrollToPosition (scrollTop: Int):Void;
	
	public function scrollToRow (index: Int):Void;
}