package react.data;

import react.ReactComponent.ReactFragment;
import haxe.Constraints.Function;

/**
 * ...
 * @author axel@cunity.me
 */
enum abstract CellNavigationMode(String){
	var none;
	var loopOverRow;
	var changeRow;
}

enum abstract DefineSort(String) {
	var ASC;
	var DESC;
	var NONE;
}

typedef Cell =
{
	cellMetaData:Dynamic,
	column:Dynamic,
	expandableOptions:Dynamic,
	idx:Int,
	rowData:Dynamic,
	rowIdx:Int,
	scrollLeft:Int,
	?cellControls:Any,
	?children:ReactFragment,
	?className:String,
	?forceUpdate:Bool,
	?handleDragStart:Function,
	?height:Int,
	?isCellValueChanging:Function,//defaultValue: (value, nextValue) => value !== nextValue
	?isEditorEnabled:Bool,
	?isExpanded:Bool,
	?isRowSelected:Bool,
	?isScrolling:Bool,
	?isSelected:Bool,
	?selectedColumn:Dynamic,
	?tooltip:String,
	?value:Dynamic,
	?wasPreviouslySelected:Bool
}

typedef CellRangeSelection =
{	
	?onStart:Function,
	?onUpdate:Function,
	?onComplete:Function,
} 

typedef Column = {
	name:ReactFragment,
	key:String,
	?width:Int,
	?filterable:Bool,
	?filterRenderer:ReactFragment,
	?resizable:Bool,	
	?sortDescendingFirst:Bool,
	?dragable:Bool,
	?editable:Bool,
	
	?editor:ReactFragment,
	
	?formatter:ReactFragment,
	?frozen:Bool,
	?headRenderer:ReactFragment,
	?events:Dynamic
}

typedef OverScan =
{	
	colsStart:Int,
	colsEnd:Int,
	rowsStart:Int,
	rowsEnd:Int,
}

typedef Row = 
{
	colOverscanEndIdx:Int,
	colOverscanStartIdx:Int,	
	colVisibleStartIdx:Int,
	colVisibleEndIdx:Int,
	columns:Column,
	idx:Int,
	isScrolling:Bool,
	row:Dynamic,
	?cellMetaData:Dynamic,
	?cellRenderer:Function,
	?expandedRows:Array<Dynamic>,
	?extraClasses:String,
	?type:String,
	?forceUpdate:Bool,
	?height:Int,//defaultValue: 35
	?isRowHovered:Bool,
	?isSelected:Bool,//defaultValue: false
	?lastFrozenColumnIndex:Int,
	?scrollLeft:Int,
	?subRowDetails:Dynamic
}

typedef RowSelection = 
{
	?enableShiftSelect:Bool,
	?onRowsSelected:Function,
	?onRowsDeselected:Function,
	?showCheckbox:Bool,
	selectBy:Dynamic
}

typedef ReactDataGridProps={
	columns:Column,
	rowGetter:Function,
	rowCount:Int,
	?cellNavigationMode:CellNavigationMode,
	?cellRangeSelection:CellRangeSelection,
	?columnEquality:Dynamic,
	?contextMenu:ReactFragment,
	?draggableHeaderCell:Function,
	?enableCellAutoFocus:Bool,
	?enableCellSelect:Bool,	
	?enableDragAndDrop:Bool,
	?enableRowSelect:Bool,
	?getCellActions:Function,
	?getValidFilterValues:Function,
	?headerFiltersHeight:Int,
	?headerRowHeight:Int,
	?minColumnWidth:Int,
	?minHeight:Int,
	?minWidth:Int,
	?onAddFilter:Function,
	?onAddSubRow:Function,
	?onBeforeEdit:Function,
	?onCellCopyPaste:Function,
	?onCellDeSelected:Function,
	?onCellExpand:Function,
	?onCellSelected:Function,
	?onCellsDragged:Function,
	?onCheckCellIsEditable:Function,
	?onClearFilters:Function,
	?onColumnResize:Function,
	?onDeleteSubRow:Function,
	?onFilter:Function,
	?onGridKeyDown:Function,
	?onGridRowsUpdated:Function,
	?onGridSort:Function,
	?onRowClick:Function,
	?onRowDoubleClick:Function,
	?onRowExpandToggle:Function,
	?onRowSelect:Function,
	?onScroll:Function,
	?overScan:OverScan,
	?rowActionsCell:Function,
	?rowGroupRenderer:Function,	
	?rowHeight:Int,
	?rowKey:String,//default 'id'
	?rowSelection:RowSelection,
	?scrollToRowIndex:Int,
	?selectAllRenderer:Dynamic,	
	?sortColumn:String,
	?sortDirection:DefineSort,
	?toolbar:ReactFragment
};

@:jsRequire('react-data-grid', 'ReactDataGrid')
extern class ReactDataGrid extends ReactComponent 
{}