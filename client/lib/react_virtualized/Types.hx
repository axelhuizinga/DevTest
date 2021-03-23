package react_virtualized;

/**
 * ...
 * @author axel@cunity.me
 */
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.ReactComponent.ReactElement;
import react.ReactComponent.ReactFragment;
/* CellSizeAndPositionManager.js */

typedef  CellSizeAndPositionManagerParams = {
	var batchAllCells: Bool;
	var cellCount: Int;
	var cellSizeGetter: Int;// CellSizeGetter;
	var estimatedCellSize: Float;
};

typedef  ConfigureParams = {
	var cellCount: Int;
	var estimatedCellSize: Float;
};

typedef ColumnSizerChildrenParam = 
{
      ?adjustedWidth:Int,
      columnWidth:Int,
      ?getColumnWidth: Void->Int,
      registerChild: Function,
    }

typedef  GetUpdatedOffsetForIndex = {
	var align: Alignment;
	var containerSize: Float;
	var currentOffset: Int;
	var targetIndex: Int;
};

typedef  GetVisibleCellRangeParams = {
	var containerSize: Int;
	var offset: Int;
};

typedef  SizeAndPositionData = {
	var offset: Int;
	var size: Int;
};

typedef ScalingCellSizeAndPositionManager = Dynamic;

/* types.js */

typedef CellPosition = {
	var columnIndex: Int;
	var rowIndex: Int;
};

typedef CellRendererParams = {
	var columnIndex: Int;
	@:optional var isScrolling: Bool;
	@:optional var isVisible: Bool;
	var key: String;
	@:optional var parent: Dynamic;
	var rowIndex: Int;
	@:optional var style: Dynamic;
};

typedef CellRenderer = CellRendererParams->ReactFragment;

typedef CellRangeRendererParams = {
	var cellCache: Dynamic;
	var cellRenderer: CellRangeRendererParams->react.ReactComponent.ReactElement;
	var columnSizeAndPositionManager: ScalingCellSizeAndPositionManager;
	var columnStartIndex: Int;
	var columnStopIndex: Int;
	@:optional var deferredMeasurementCache: Dynamic;
	var horizontalOffsetAdjustment: Int;
	var isScrolling: Bool;
	var parent: Dynamic;
	var rowSizeAndPositionManager: ScalingCellSizeAndPositionManager;
	var rowStartIndex: Int;
	var rowStopIndex: Int;
	var scrollLeft: Int;
	var scrollTop: Int;
	var styleCache: Dynamic;
	var verticalOffsetAdjustment: Int;
	var visibleColumnIndices: Dynamic;
	var visibleRowIndices: Dynamic;
};

typedef CellRangeRenderer = CellRangeRendererParams->ReactElement;

//typedef CellSizeGetter = (params: {index: Int}) => Int;

typedef CellSize = Int;

typedef NoContentRenderer = Void->ReactElement;

typedef Scroll = {
	var clientHeight: Int;
	var clientWidth: Int;
	var scrollHeight: Int;
	var scrollLeft: Int;
	var scrollTop: Int;
	var scrollWidth: Int;
};

typedef ScrollbarPresenceChange = {
	var horizontal: Bool;
	var vertical: Bool;
	var size: Int;
};

@:enum
abstract SortDirection(String){
	var ASC = 'ASC';
	var DESC = 'DESC';
}

typedef RenderedSection = {
	var columnOverscanStartIndex: Int;
	var columnOverscanStopIndex: Int;
	var columnStartIndex: Int;
	var columnStopIndex: Int;
	var rowOverscanStartIndex: Int;
	var rowOverscanStopIndex: Int;
	var rowStartIndex: Int;
	var rowStopIndex: Int;
};

typedef OverscanIndicesGetterParams = {
  // One of SCROLL_DIRECTION_HORIZONTAL or SCROLL_DIRECTION_VERTICAL
  var direction: String;// 'horizontal' | 'vertical',

  // One of SCROLL_DIRECTION_BACKWARD or SCROLL_DIRECTION_FORWARD
  var scrollDirection: Int;// -1 | 1,

  // Number of rows or columns in the current axis
  var cellCount: Int;

  // Maximum Int of cells to over-render in either direction
  var overscanCellsCount: Int;

  // Begin of range of visible cells
  var startIndex: Int;

  // End of range of visible cells
  var stopIndex: Int;
};

typedef OverscanIndices = {
  var overscanStartIndex: Int;	
  var overscanStopIndex: Int;
};

typedef OverscanIndicesGetter = {params: OverscanIndicesGetterParams}->OverscanIndices;

//typedef Alignment = enum{
typedef Alignment = {
	@:value('auto')
	var auto:String;
	@:value('end')
	var end:String;
	@:value('start')
	var start:String;
	@:value('center')
	var center:String;
}

typedef VisibleCellRange = {
  @:optional var start: Int;
  @:optional var stop: Int;
};

typedef RowRendererParams = {
  className: String,
  columns: Array<Any>,
  index: Int,
  isScrolling: Bool,
  ?onRowClick: Function,
  ?onRowDoubleClick: Function,
  ?onRowMouseOver: Function,
  ?onRowMouseOut: Function,
  rowData: Any,
  style: Any
};