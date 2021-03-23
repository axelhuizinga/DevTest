package react_virtualized;

import haxe.Constraints.Function;
import react.PureComponent.PureComponentOfProps;
import react.ReactComponent.ReactFragment;
/**
 * ...
 * @author axel@cunity.me
 */

typedef ColumnSizerChildrenParams =
{
	adjustedWidth:Int,
	columnWidth:Int,
	?getColumnWidth:Function,
	registerChild:Function	
}

typedef ColumnSizerProps =
{
	children:ColumnSizerChildrenParams->ReactFragment,
	?columnCount:Int,
	?columnMaxWidth:Int,	
	?columnMinWidth:Int,
	width:Int
}

@:jsRequire('react-virtualized', 'ColumnSizer')
extern class ColumnSizer extends PureComponentOfProps<ColumnSizerProps>
{

	public function new(props:ColumnSizerProps):Void;
	
}