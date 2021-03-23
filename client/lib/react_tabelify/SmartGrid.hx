package react_tabelify;

import haxe.ds.StringMap;
import react.ReactComponent.ReactComponentOf;
import react.ReactComponent.ReactFragment;
import haxe.Constraints.Function;


/**
 * ...
 * @author axel@cunity.me
 */

typedef TDProps =
{
	?className:String,
	?headerClassName:String,
	?data:Dynamic,// ARRAY OF PLAIN CELL CONTENT VALUES
	?fieldName:String,
	?id:Dynamic,
	?style:Dynamic,
	?flexGrow:Int
}

typedef Size =
{
	?height:Int,
	?width:Int
}

@:enum
abstract SortDirection(String){
	var ASC = 'asc';
	var DESC = 'desc';
}

typedef SortProps =
{
	column:String,
	direction:SortDirection
}

typedef TableProps =
{
	?className:String,
	?currentPage: Int,
	data:Array<Dynamic>,
	?dataColumns:StringMap<TDProps>,// FORMAT + STYLE
	?disableHeader:Bool,
	?headerColumns:StringMap<TDProps>,// FORMAT + STYLE	
	?oddClassName: String,
    ?evenClassName:String,	
	//?filterable:Dynamic,
	//?onFilter:String->Void,
	//?onPageChange:SortProps->Void,
	//?onSort:Int->Void,
	//?pageButtonLimit:Int,
	//?sortable:EitherType<Bool, Array<EitherType<String,Dynamic>>>
	?resultsPerPage: Int,
	?sortColumn: String,
	?sortDirection: SortDirection,
	?forceRender: Bool,
	loading: Bool,
	layout: String, //'row',
	actionList: Array<Dynamic>,
	onActionClick: Function,
	onHeaderClick: Function,
	onFooterClick: Function,
	showHeader: Bool,
	showFooter: Bool,
	selectedRows: Dynamic,
	elementId: String,
	transform: Function
        	
}

@:jsRequire('react-tabelify/Tabelify.js', 'default')
extern class SmartGrid extends ReactComponentOf<TableProps,TableProps>
{

	public function new(props:TableProps);
	
	override public function render():ReactFragment; 

}