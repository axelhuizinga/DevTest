package out.module.Components.hx;
typedef RowDefinitionProps = {
	@:optional
	var rowKey : String;
	@:optional
	var childColumnName : String;
	@:optional
	var cssClassName : haxe.extern.EitherType<String, Dynamic -> String>;
};
extern class RowDefinition extends React.Component<RowDefinitionProps, Dynamic> {

}
typedef ColumnDefinitionProps = {
	var id : String;
	@:optional
	var order : Float;
	@:optional
	var locked : Bool;
	@:optional
	var headerCssClassName : haxe.extern.EitherType<String, Dynamic -> String>;
	@:optional
	var cssClassName : haxe.extern.EitherType<String, Dynamic -> String>;
	@:optional
	var title : String;
	@:optional
	var customComponent : GriddleComponent<Dynamic>;
	@:optional
	var customHeadingComponent : GriddleComponent<Dynamic>;
	@:optional
	var filterable : Bool;
	@:optional
	var sortable : Bool;
	@:optional
	var sortMethod : Array<Dynamic> -> String -> ?Bool -> Float;
	@:optional
	var sortType : String;
	@:optional
	var extraData : Dynamic;
	@:optional
	var width : haxe.extern.EitherType<Float, String>;
	@:optional
	var colSpan : Float;
	@:optional
	var visible : Bool;
	@:optional
	var isMetadata : Bool;
};
extern class ColumnDefinition extends React.Component<ColumnDefinitionProps, Dynamic> {

}
typedef CellProps = {
	@:optional
	var griddleKey : Float;
	@:optional
	var columnId : String;
	@:optional
	var value : Dynamic;
	@:optional
	var onClick : React.MouseEventHandler<Element>;
	@:optional
	var onMouseEnter : React.MouseEventHandler<Element>;
	@:optional
	var onMouseLeave : React.MouseEventHandler<Element>;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class Cell extends React.Component<CellProps, Dynamic> {

}
typedef RowProps = {
	@:optional
	var Cell : Dynamic;
	@:optional
	var griddleKey : String;
	@:optional
	var columnIds : Array<Float>;
	@:optional
	var onClick : React.MouseEventHandler<Element>;
	@:optional
	var onMouseEnter : React.MouseEventHandler<Element>;
	@:optional
	var onMouseLeave : React.MouseEventHandler<Element>;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class Row extends React.Component<RowProps, Dynamic> {

}
typedef TableProps = {
	@:optional
	var visibleRows : Float;
	@:optional
	var TableHeading : Dynamic;
	@:optional
	var TableBody : Dynamic;
	@:optional
	var NoResults : Dynamic;
};
extern class Table extends React.Component<TableProps, Dynamic> {

}
typedef TableBodyProps = {
	@:optional
	var rowIds : Array<Float>;
	@:optional
	var Row : Dynamic;
	@:optional
	var style : React.CSSProperties;
	@:optional
	var className : String;
};
extern class TableBody extends React.Component<TableBodyProps, Dynamic> {

}
typedef TableHeadingProps = {
	@:optional
	var columnIds : Array<Float>;
	@:optional
	var columnTitles : Array<String>;
	var TableHeadingCell : Dynamic;
};
extern class TableHeading extends React.Component<TableHeadingProps, Dynamic> {

}
typedef TableHeadingCellProps = {
	@:optional
	var title : String;
	@:optional
	var columnId : Float;
	@:optional
	var onClick : React.MouseEventHandler<Element>;
	@:optional
	var onMouseEnter : React.MouseEventHandler<Element>;
	@:optional
	var onMouseLeave : React.MouseEventHandler<Element>;
	@:optional
	var icon : Dynamic;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class TableHeadingCell extends React.Component<TableHeadingCellProps, Dynamic> {

}
typedef SettingsWrapperProps = {
	@:optional
	var SettingsToggle : GriddleComponent<SettingsToggleProps>;
	@:optional
	var Settings : GriddleComponent<SettingsProps>;
	@:optional
	var isEnabled : Bool;
	@:optional
	var isVisible : Bool;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class SettingsWrapper extends React.Component<SettingsWrapperProps, Dynamic> {

}
typedef SettingsToggleProps = {
	@:optional
	var onClick : React.MouseEventHandler<Element>;
	@:optional
	var text : Dynamic;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class SettingsToggle extends React.Component<SettingsToggleProps, Dynamic> {

}
typedef SettingsProps = {
	@:optional
	var settingsComponents : Array<GriddleComponent<Dynamic>>;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class Settings extends React.Component<SettingsProps, Dynamic> {

}
typedef FilterProps = {
	@:optional
	var setFilter : GriddleFilter -> Void;
	@:optional
	var placeholder : String;
	@:optional
	var className : String;
	@:optional
	var style : React.CSSProperties;
};
extern class Filter extends React.Component<FilterProps, Dynamic> {

}
extern class ComponentsTopLevel {
	static var TableContainer : Dynamic -> Dynamic;
	static var SettingsWrapperContainer : Dynamic -> Dynamic;
	static var SettingsToggleContainer : Dynamic -> Dynamic;
	static var SettingsContainer : Dynamic -> Dynamic;
	static var SettingsComponents : PropertyBag<GriddleComponent<Dynamic>>;
	static var actions : GriddleActions;
	static var constants : PropertyBag<String>;
	static var selectors : PropertyBag<Selector>;
	static var settingsComponentObjects : PropertyBag<SettingsComponentObject>;
	static var connect : Dynamic;
}
typedef GriddleComponents = {
	@:optional
	var Layout : GriddleComponent<Dynamic>;
	@:optional
	var LayoutEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var LayoutContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var LayoutContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var Style : GriddleComponent<Dynamic>;
	@:optional
	var StyleEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var StyleContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var StyleContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var Filter : GriddleComponent<components.FilterProps>;
	@:optional
	var FilterEnhancer : GriddleComponent<components.FilterProps> -> GriddleComponent<components.FilterProps>;
	@:optional
	var FilterContainer : GriddleComponent<components.FilterProps> -> GriddleComponent<components.FilterProps>;
	@:optional
	var FilterContainerEnhancer : GriddleComponent<components.FilterProps> -> GriddleComponent<components.FilterProps>;
	@:optional
	var SettingsWrapper : GriddleComponent<components.SettingsWrapperProps>;
	@:optional
	var SettingsWrapperEnhancer : GriddleComponent<components.SettingsWrapperProps> -> GriddleComponent<components.SettingsWrapperProps>;
	@:optional
	var SettingsWrapperContainer : GriddleComponent<components.SettingsWrapperProps> -> GriddleComponent<components.SettingsWrapperProps>;
	@:optional
	var SettingsWrapperContainerEnhancer : GriddleComponent<components.SettingsWrapperProps> -> GriddleComponent<components.SettingsWrapperProps>;
	@:optional
	var SettingsToggle : GriddleComponent<components.SettingsToggleProps>;
	@:optional
	var SettingsToggleEnhancer : GriddleComponent<components.SettingsToggleProps> -> GriddleComponent<components.SettingsToggleProps>;
	@:optional
	var SettingsToggleContainer : GriddleComponent<components.SettingsToggleProps> -> GriddleComponent<components.SettingsToggleProps>;
	@:optional
	var SettingsToggleContainerEnhancer : GriddleComponent<components.SettingsToggleProps> -> GriddleComponent<components.SettingsToggleProps>;
	@:optional
	var Settings : GriddleComponent<components.SettingsProps>;
	@:optional
	var SettingsEnhancer : GriddleComponent<components.SettingsProps> -> GriddleComponent<components.SettingsProps>;
	@:optional
	var SettingsContainer : GriddleComponent<components.SettingsProps> -> GriddleComponent<components.SettingsProps>;
	@:optional
	var SettingsContainerEnhancer : GriddleComponent<components.SettingsProps> -> GriddleComponent<components.SettingsProps>;
	@:optional
	var SettingsComponents : PropertyBag<GriddleComponent<Dynamic>>;
	@:optional
	var Table : GriddleComponent<components.TableProps>;
	@:optional
	var TableEnhancer : GriddleComponent<components.TableProps> -> GriddleComponent<components.TableProps>;
	@:optional
	var TableContainer : GriddleComponent<components.TableProps> -> GriddleComponent<components.TableProps>;
	@:optional
	var TableContainerEnhancer : GriddleComponent<components.TableProps> -> GriddleComponent<components.TableProps>;
	@:optional
	var TableHeading : GriddleComponent<components.TableHeadingProps>;
	@:optional
	var TableHeadingEnhancer : GriddleComponent<components.TableHeadingProps> -> GriddleComponent<components.TableHeadingProps>;
	@:optional
	var TableHeadingContainer : GriddleComponent<components.TableHeadingProps> -> GriddleComponent<components.TableHeadingProps>;
	@:optional
	var TableHeadingContainerEnhancer : GriddleComponent<components.TableHeadingProps> -> GriddleComponent<components.TableHeadingProps>;
	@:optional
	var TableHeadingCell : GriddleComponent<components.TableHeadingCellProps>;
	@:optional
	var TableHeadingCellEnhancer : GriddleComponent<components.TableHeadingCellProps> -> GriddleComponent<components.TableHeadingCellProps>;
	@:optional
	var TableHeadingCellContainer : GriddleComponent<components.TableHeadingCellProps> -> GriddleComponent<components.TableHeadingCellProps>;
	@:optional
	var TableHeadingCellContainerEnhancer : GriddleComponent<components.TableHeadingCellProps> -> GriddleComponent<components.TableHeadingCellProps>;
	@:optional
	var TableBody : GriddleComponent<components.TableBodyProps>;
	@:optional
	var TableBodyEnhancer : GriddleComponent<components.TableBodyProps> -> GriddleComponent<components.TableBodyProps>;
	@:optional
	var TableBodyContainer : GriddleComponent<components.TableBodyProps> -> GriddleComponent<components.TableBodyProps>;
	@:optional
	var TableBodyContainerEnhancer : GriddleComponent<components.TableBodyProps> -> GriddleComponent<components.TableBodyProps>;
	@:optional
	var Row : GriddleComponent<components.RowProps>;
	@:optional
	var RowEnhancer : GriddleComponent<components.RowProps> -> GriddleComponent<components.RowProps>;
	@:optional
	var RowContainer : GriddleComponent<components.RowProps> -> GriddleComponent<components.RowProps>;
	@:optional
	var RowContainerEnhancer : GriddleComponent<components.RowProps> -> GriddleComponent<components.RowProps>;
	@:optional
	var Cell : GriddleComponent<components.CellProps>;
	@:optional
	var CellEnhancer : GriddleComponent<components.CellProps> -> GriddleComponent<components.CellProps>;
	@:optional
	var CellContainer : GriddleComponent<components.CellProps> -> GriddleComponent<components.CellProps>;
	@:optional
	var CellContainerEnhancer : GriddleComponent<components.CellProps> -> GriddleComponent<components.CellProps>;
	@:optional
	var NoResults : GriddleComponent<Dynamic>;
	@:optional
	var NoResultsEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var NoResultsContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var NoResultsContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var Pagination : GriddleComponent<Dynamic>;
	@:optional
	var PaginationEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PaginationContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PaginationContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var NextButton : GriddleComponent<Dynamic>;
	@:optional
	var NextButtonEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var NextButtonContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var NextButtonContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PageDropdown : GriddleComponent<Dynamic>;
	@:optional
	var PageDropdownEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PageDropdownContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PageDropdownContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PreviousButton : GriddleComponent<Dynamic>;
	@:optional
	var PreviousButtonEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PreviousButtonContainer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
	@:optional
	var PreviousButtonContainerEnhancer : GriddleComponent<Dynamic> -> GriddleComponent<Dynamic>;
};
typedef GriddleActions = {
	>PropertyBag<haxe.extern.EitherType<ActionCreator<Dynamic>, Undefined>>,
	@:optional
	var onSort : Dynamic -> Void;
	@:optional
	var onNext : Void -> Void;
	@:optional
	var onPrevious : Void -> Void;
	@:optional
	var onGetPage : Float -> Void;
	@:optional
	var setFilter : GriddleFilter -> Void;
};
typedef GriddleEvents = {
	>GriddleActions,
	@:optional
	var onFilter : String -> Void;
	@:optional
	var setSortProperties : utils.SortProperties -> Void -> Void;
};
typedef GriddleSortKey = {
	var id : String;
	var sortAscending : Bool;
};
typedef GriddleStyleElements<T> = {
	@:optional
	var Cell : T;
	@:optional
	var Filter : T;
	@:optional
	var Layout : T;
	@:optional
	var Loading : T;
	@:optional
	var NextButton : T;
	@:optional
	var NoResults : T;
	@:optional
	var PageDropdown : T;
	@:optional
	var Pagination : T;
	@:optional
	var PreviousButton : T;
	@:optional
	var Row : T;
	@:optional
	var RowDefinition : T;
	@:optional
	var Settings : T;
	@:optional
	var SettingsToggle : T;
	@:optional
	var Table : T;
	@:optional
	var TableBody : T;
	@:optional
	var TableHeading : T;
	@:optional
	var TableHeadingCell : T;
	@:optional
	var TableHeadingCellAscending : T;
	@:optional
	var TableHeadingCellDescending : T;
};
typedef GriddleStyleIcons = {
	@:optional
	var sortAscendingIcon : Dynamic;
	@:optional
	var sortDescendingIcon : Dynamic;
};
typedef GriddleStyleConfig = {
	@:optional
	var classNames : GriddleStyleElements<String>;
	@:optional
	var icons : GriddleStyleElements<GriddleStyleIcons>;
	@:optional
	var styles : GriddleStyleElements<React.CSSProperties>;
};
typedef GriddlePageProperties = {
	@:optional
	var currentPage : Float;
	@:optional
	var pageSize : Float;
	@:optional
	var recordCount : Float;
};
typedef RowRenderProperties = {
	>components.RowDefinitionProps,
};
typedef ColumnRenderProperties = {
	>components.ColumnDefinitionProps,
};
typedef GriddleRenderProperties = {
	@:optional
	var rowProperties : RowRenderProperties;
	@:optional
	var columnProperties : PropertyBag<ColumnRenderProperties>;
};
typedef SettingsComponentObject = {
	var order : Float;
	@:optional
	var component : GriddleComponent<Dynamic>;
};
typedef GriddleExtensibility = {
	@:optional
	var components : GriddleComponents;
	@:optional
	var events : GriddleEvents;
	@:optional
	var reducer : PropertyBag<Reducer>;
	@:optional
	var renderProperties : GriddleRenderProperties;
	@:optional
	var selectors : PropertyBag<Selector>;
	@:optional
	var settingsComponentObjects : PropertyBag<SettingsComponentObject>;
	@:optional
	var styleConfig : GriddleStyleConfig;
	@:optional
	var listeners : PropertyBag<Listener>;
};
typedef GriddleInitialState = {
	@:optional
	var enableSettings : Bool;
	@:optional
	var pageProperties : GriddlePageProperties;
	@:optional
	var sortMethod : Array<Dynamic> -> String -> ?Bool -> Float;
	@:optional
	var sortProperties : Array<GriddleSortKey>;
	@:optional
	var textProperties : { @:optional
	var next : String; @:optional
	var previous : String; @:optional
	var settingsToggle : String; @:optional
	var filterPlaceholder : String; };
};
typedef GriddlePlugin = {
	>GriddleExtensibility,
	@:optional
	var initialState : GriddleInitialState;
	@:optional
	var reduxMiddleware : Array<Middleware>;
};
typedef GriddleProps<T> = {
	>GriddlePlugin,
	>GriddleInitialState,
	@:optional
	var core : GriddlePlugin;
	@:optional
	var plugins : Array<GriddlePlugin>;
	@:optional
	var data : Array<T>;
	@:optional
	var storeKey : String;
};
extern class Griddle<T> extends React.Component<GriddleProps<T>, Dynamic> {
	static var storeKey : String;
}
