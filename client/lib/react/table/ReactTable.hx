package react.table;

import haxe.extern.EitherType;
import react.Partial;
import react.ReactType;
import react.ReactComponent.ReactFragment;
import react.ReactComponent.ReactComponentOfProps;

typedef ReactTableFunction = Any->Void;
typedef AccessorFunction = Any->Any;
typedef Accessor = EitherType<String, EitherType<Array<String>, AccessorFunction>>;
typedef Aggregator = Array<Any>->Array<Any>->Any;
typedef TableCellRenderer = EitherType<CellInfo->Any->ReactFragment, ReactFragment>;
typedef FilterRenderParams =
{
    column: Column, filter: Any, onChange: ReactTableFunction, ?key: String
}
typedef FilterRender = FilterRenderParams->ReactFragment;
typedef PivotRenderer = EitherType<CellInfo->ReactFragment, EitherType<Void->Any, EitherType<String, ReactFragment>>>;

typedef ComponentPropsGetterParam =
{
    finalState: Any, rowInfo: RowInfo, column: Column, ?instance: Any
}
typedef ComponentPropsGetter0 = ComponentPropsGetterParam->Any;
typedef ComponentPropsGetterR = ComponentPropsGetterParam->Any;
typedef ComponentPropsGetterC = ComponentPropsGetterParam->Any;
typedef ComponentPropsGetterRC = ComponentPropsGetterParam->Any;

typedef DefaultFilterFunction = Filter->Any->Any->Bool;
typedef FilterFunction = Filter->Array<Any>->Any->Array<Any>;
typedef SubComponentFunction = RowInfo->ReactFragment;
typedef PageChangeFunction = Int->Void;
typedef PageSizeChangeFunction = Int->Int->Void;
typedef SortedChangeFunction = Array<SortingRule>->Any->Bool->Void;
typedef FilteredChangeFunction = Array<Filter>->Any->Any->Void;
typedef ExpandedChangeFunction = Any->Any->Bool->Void;
typedef ResizedChangeFunction = Array<Resize>->Any->Void;
typedef SortFunction = Any->Any->Any->Int;

typedef Basics = {
	var sortable : Bool;
	var show : Bool;
	var minWidth : Float;
	var resizable : Bool;
	var filterable : Bool;
	var sortMethod : SortFunction;
	var defaultSortDesc : Bool;
	var Aggregated : TableCellRenderer;
	var Pivot : PivotRenderer;
	var PivotValue : TableCellRenderer;
	var Expander : TableCellRenderer;
};
typedef CellProps = {
	var Cell : TableCellRenderer;
	var className : String;
	var style : Dynamic;
	var getProps : ReactTableFunction;
};
typedef HeaderProps = {
	var Header : TableCellRenderer;
	var headerClassName : String;
	var headerStyle : Dynamic;
	var getHeaderProps : ReactTableFunction;
};
typedef FooterProps = {
	var Footer : TableCellRenderer;
	var footerClassName : String;
	var footerStyle : Dynamic;
	var getFooterProps : ReactTableFunction;
};
typedef FilterProps = {
	var filterAll : Bool;
	var filterMethod : haxe.extern.EitherType<FilterFunction, DefaultFilterFunction>;
	var hideFilter : Bool;
	var Filter : FilterRender;
};
typedef ExpanderDefaults = {
	var sortable : Bool;
	var resizable : Bool;
	var filterable : Bool;
	var width : Float;
};
typedef PivotDefaults = {
	var render : TableCellRenderer;
};
typedef Resize = {
	var id : String;
	var value : Dynamic;
};
typedef Filter = {
	var id : String;
	var value : Dynamic;
	@:optional
	var pivotId : String;
};
typedef SortingRule = {
	var id : String;
	@:optional
	var sort : haxe.extern.EitherType<String, String>;
	@:optional
	var asc : Bool;
	@:optional
	var desc : Bool;
};

typedef Column = {
	>Partial<Basics>,
	>Partial<CellProps>,
	>Partial<FilterProps>,
	>Partial<FooterProps>,
	>Partial<HeaderProps>,
	@:optional
	var accessor : Accessor;
	@:optional
	var id : String;
	@:optional
	var aggregate : Aggregator;
	@:optional
	var width : Float;
	@:optional
	var maxWidth : Float;
	@:optional
	var expander : Bool;
	@:optional
	var columns : Array<Column>;
	@:optional
	var pivot : Bool;
};
typedef ColumnRenderProps = {
	var data : Array<Any>;
	var column : Column;
};
typedef RowRenderProps = {
	>Partial<RowInfo>,
	@:optional
	var isExpanded : Bool;
	@:optional
	var value : Dynamic;
};
typedef RowInfo = {
	var row : Dynamic;
	var rowValues : Dynamic;
	var index : Float;
	var viewIndex : Float;
	var pageSize : Float;
	var page : Float;
	var level : Float;
	var nestingPath : Array<Float>;
	var aggregated : Bool;
	var groupedByPivot : Bool;
	var subRows : Array<Dynamic>;
	var original : Dynamic;
};
typedef CellInfo = {
	>RowInfo,
    >var resized:Array<Resize>;
	//>ControlledStateOverrideProps.resized,
	var isExpanded : Bool;
	var column : Column;
	var value : Dynamic;
	var pivoted : Bool;
	var expander : Bool;
	var show : Bool;
	var width : Float;
	var maxWidth : Float;
	var tdProps : Dynamic;
	var columnProps : Dynamic;
	var classes : Array<String>;
	var styles : Dynamic;
};
typedef FinalState = {
	>TableProps,
	var frozen : Bool;
	var startRow : Float;
	var endRow : Float;
	var pageRows : Float;
	var padRows : Float;
	var hasColumnFooter : Bool;
	var hasHeaderGroups : Bool;
	var canPrevious : Bool;
	var canNext : Bool;
	var rowMinWidth : Float;
	var allVisibleColumns : Array<Column>;
	var allDecoratedColumns : Array<Column>;
	var resolvedData : Array<DerivedDataObject>;
	var sortedData : Array<DerivedDataObject>;
	var headerGroups : Array<Dynamic>;
};
//typedef TableProps<D, Any> = {
typedef TableProps = {
	>Partial<TextProps>,
	>Partial<ComponentDecoratorProps>,
	>Partial<ControlledStateCallbackProps>,
	>Partial<PivotingProps>,
	>Partial<ControlledStateOverrideProps>,
	>Partial<ComponentProps>,
	var data : Array<Any>;
	@:optional
	var resolveData : Array<Any>->Array<Any>;
	var loading : Bool;
	var showPagination : Bool;
	var showPaginationTop : Bool;
	var showPaginationBottom : Bool;
	var manual : Bool;
	var multiSort : Bool;
	var showPageSizeOptions : Bool;
	var pageSizeOptions : Array<Float>;
	var defaultPageSize : Float;
	var minRows :Float;
	var showPageJump : Bool;
	var sortable : Bool;
	var collapseOnSortingChange : Bool;
	var collapseOnPageChange : Bool;
	var collapseOnDataChange : Bool;
	var freezeWhenExpanded : Bool;
	var defaultSorting : Array<SortingRule>;
	var showFilters : Bool;
	var defaultFiltering : Array<Filter>;
	var defaultFilterMethod : DefaultFilterFunction;
	var defaultSortMethod : SortFunction;
	var resizable : Bool;
	var filterable : Bool;
	var defaultResizing : Array<Resize>;
	var defaultSortDesc : Bool;
	var defaultSorted : Array<SortingRule>;
	var defaultFiltered : Array<Filter>;
	var defaultResized : Array<Resize>;
	var defaultExpanded : { };
	var onChange : ReactTableFunction;
	var className : String;
	var style : Dynamic;
	var column : Partial<GlobalColumn>;
	@:optional
	var columns : Array<Column>;
	var expanderDefaults : Partial<ExpanderDefaults>;
	var pivotDefaults : Partial<PivotDefaults>;
	var PadRowComponent : Void -> ReactFragment;
	var onFetchData : Dynamic -> Dynamic -> Void;
	var children : FinalState-> (Void -> ReactFragment) -> Instance-> ReactFragment;
};
typedef ControlledStateOverrideProps = {
	var page : Float;
	var pageSize : Float;
	var pages : Float;
	var sorting : Float;
	var sorted : Array<SortingRule>;
	var filtered : Array<Filter>;
	var resized : Array<Resize>;
	var expanded : { };
	var SubComponent : SubComponentFunction;
};
typedef PivotingProps = {
	var pivotBy : Array<String>;
	var pivotColumnWidth : Float;
	var pivotValKey : String;
	var pivotIDKey : String;
	var subRowsKey : String;
	var aggregatedKey : String;
	var nestingLevelKey : String;
	var originalKey : String;
	var indexKey : String;
	var groupedByPivotKey : String;
	var expandedRows : ExpandedRows;
	var onExpandRow : ReactTableFunction;
};
typedef ExpandedRows = { };
typedef DerivedDataObject = {
	var _index : Float;
	var _nestingLevel : Float;
	var _subRows : Dynamic;
	var _original : Dynamic;
};
typedef ControlledStateCallbackProps = {
	var onPageChange : PageChangeFunction;
	var onPageSizeChange : PageSizeChangeFunction;
	var onSortedChange : SortedChangeFunction;
	var onFilteredChange : FilteredChangeFunction;
	var onExpandedChange : ExpandedChangeFunction;
	var onResizedChange : ResizedChangeFunction;
};
typedef ComponentDecoratorProps = {
	var getProps : haxe.extern.EitherType<ComponentPropsGetterRC, haxe.extern.EitherType<ComponentPropsGetterC, ComponentPropsGetter0>>;
	var getTableProps : ComponentPropsGetter0;
	var getTheadGroupProps : ComponentPropsGetter0;
	var getTheadGroupTrProps : ComponentPropsGetter0;
	var getTheadGroupThProps : ComponentPropsGetterC;
	var getTheadProps : ComponentPropsGetter0;
	var getTheadTrProps : ComponentPropsGetter0;
	var getTheadThProps : ComponentPropsGetterC;
	var getTheadFilterProps : ComponentPropsGetter0;
	var getTheadFilterTrProps : ComponentPropsGetter0;
	var getTheadFilterThProps : ComponentPropsGetterC;
	var getTbodyProps : ComponentPropsGetter0;
	var getTrGroupProps : haxe.extern.EitherType<ComponentPropsGetterR, ComponentPropsGetter0>;
	var getTrProps : haxe.extern.EitherType<ComponentPropsGetterR, ComponentPropsGetter0>;
	var getTdProps : haxe.extern.EitherType<ComponentPropsGetterRC, ComponentPropsGetterR>;
	var getTfootProps : ComponentPropsGetter0;
	var getTfootTrProps : ComponentPropsGetter0;
	var getPaginationProps : ComponentPropsGetter0;
	var getLoadingProps : ComponentPropsGetter0;
	var getNoDataProps : ComponentPropsGetter0;
	var getResizerProps : ComponentPropsGetter0;
};
typedef ComponentProps = {
	var TableComponent : ReactFragment;
	var TheadComponent : ReactFragment;
	var TbodyComponent : ReactFragment;
	var TrGroupComponent : ReactFragment;
	var TrComponent : ReactFragment;
	var ThComponent : ReactFragment;
	var TdComponent : ReactFragment;
	var TfootComponent : ReactFragment;
	var ExpanderComponent : ReactFragment;
	var AggregatedComponent : ReactFragment;
	var PivotValueComponent : ReactFragment;
	var PivotComponent : ReactFragment;
	var FilterComponent : ReactFragment;
	var PaginationComponent : ReactFragment;
	var PreviousComponent : ReactFragment;
	var NextComponent : ReactFragment;
	var LoadingComponent : ReactFragment;
	var NoDataComponent : ReactFragment;
	var ResizerComponent : ReactFragment;
};
typedef TextProps = {
	var previousText : ReactFragment;
	var nextText : ReactFragment;
	var loadingText : ReactFragment;
	var noDataText :ReactFragment;
	var pageText : ReactFragment;
	var ofText : ReactFragment;
	var rowsText : String;
};
typedef GlobalColumn = {
	>Basics,
	>CellProps,
	>FilterProps,
	>FooterProps,
	>HeaderProps,
};
typedef Instance = {
	//>ReactTable,
	var context : Dynamic;
	var props : Partial<TableProps>;
	var refs : Dynamic;
	var state : FinalState;
	function filterColumn(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function filterData(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function fireFetchData(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function getDataModel(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function getMinRows(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function getPropOrState(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function getResolvedState(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function getSortedData(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function getStateOrProp(props:haxe.extern.Rest<Dynamic>):Dynamic;
	var onPageChange : PageChangeFunction;
	var onPageSizeChange : PageSizeChangeFunction;
	function resizeColumnEnd(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function resizeColumnMoving(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function resizeColumnStart(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function sortColumn(props:haxe.extern.Rest<Dynamic>):Dynamic;
	function sortData(props:haxe.extern.Rest<Dynamic>):Dynamic;
};
@:jsRequire('react-table', 'default')
extern class ReactTable extends ReactComponentOfProps<Partial<TableProps>> {

}


