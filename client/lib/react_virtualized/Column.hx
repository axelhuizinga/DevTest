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
import react.ReactComponent.ReactComponentOfProps;
import react.ReactPropTypes;

/**
 * ...
 * @author axel@cunity.me 
 */

typedef ColumnProps = {
	?cellDataGetter:Function,
	?cellRenderer:Function,
	?className:String,
	?columnData: Dynamic,
	dataKey: Dynamic,
	?defaultSortDirection:SortDirection,
	?disableSort:Bool,	
	?flexGrow:Int,
	?flexShrink:Int,
	?headerClassName:String,
	?headerRenderer:Function,
	?headerStyle:Dynamic,
	?id:String,
	?label:Dynamic,
    ?maxHeight: Int,
    ?maxWidth: Int,
	?style:Dynamic,
	width:Int	
}

@:jsRequire('react-virtualized', 'Column')
@:native('Column')
extern class Column extends ReactComponentOfProps<ColumnProps>
{
	public function new(?props:ColumnProps):Void;
}
