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
import react_virtualized.Types.RenderedSection;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.ReactComponent.ReactComponentOfProps;

/**
 * ...
 * @author axel@cunity.me
 */

typedef GridProps = {
	?aria_label:String,
	?autoContainerWidth:Bool,
	?autoHeight:Bool,
	?autoWidth:Bool,
	?cellRangeRenderer:CellRangeRenderer,
	cellRenderer:CellRenderer,
	?className:String,
	columnCount:Int,
	columnWidth:EitherType<Int,Function>,
	?containerProps:Dynamic,
	?containerStyle:Dynamic,
	?containerRole:String,
	?deferredMeasurementCache:Dynamic,
	?estimatedColumnSize:Int,
	?estimatedRowSize:Int,	
    height: Int,
	?id:String,
	?isScrolling:Bool,
	?isScrollingOptOut:Bool,
	?noContentRenderer:NoContentRenderer,
	?onScroll:{params:Scroll}->Void, //Dynamic->Void{params:Scroll}->Void,
	?onScrollbarPresenceChange:{params:ScrollbarPresenceChange}->Void,
	?onSectionRendered: {params: RenderedSection}->Void,
    ?overscanColumnCount: Int,
	?overscanIndicesGetter: OverscanIndicesGetter,
    ?overscanRowCount: Int,
    rowHeight: Int,
    rowCount: Int,
	?scrollToAlignment: Alignment,
    ?scrollToColumn: Int,
    ?scrollToRow: Int,
    ?scrollTop: Int,
	?scrollingResetTimeInterval:Int,
	?scrollLeft:Int,
	?style:Dynamic,
	?tabIndex:Int,
	width:Int	
}

/*typedef InstanceProps = {
  prevColumnWidth: CellSize,
  prevRowHeight: CellSize,
  prevColumnCount: Int,
  prevRowCount: Int,
  prevIsScrolling: Bool,
  prevScrollToColumn: Int,
  prevScrollToRow: Int,
  columnSizeAndPositionManager: ScalingCellSizeAndPositionManager,
  rowSizeAndPositionManager: ScalingCellSizeAndPositionManager,
  scrollbarSize: Int,
  scrollbarSizeMeasured: Bool,
}

typedef GridState = {
	instanceProps: InstanceProps,
	isScrolling: Bool,
	@range(-1, 1) var	scrollDirectionHorizontal: Int,
	@range(-1, 1) var	scrollDirectionVertical: Int,
	scrollLeft: Int,
	scrollTop: Int,
	scrollPositionChangeReason: String,//'observed' | 'requested' | null,
	needToResetStyleCache: Bool,
	useDynamicRowHeight:Bool
}*/

@:jsRequire('react-virtualized', 'Grid')
extern class Grid implements Dynamic extends ReactComponentOfProps<GridProps>
{
	public function new(props:GridProps):Void;
	
	public static function 	scrollbarSize():Int;
}
