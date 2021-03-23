package griddle.components;

import js.html.audio.DynamicsCompressorNode;
import react.Empty;
//import griddle.module.Module;
//import griddle.module.Module.GriddleComponent;
import griddle.Griddle;
import griddle.utils.Utils.*;
import griddle.utils.Utils.SortProperties;
import haxe.Constraints.Function;
import js.html.CSSStyleDeclaration;
import js.html.EventListener;
import react.ReactComponent;
import redux.Redux.Action;
import redux.Redux;

typedef RowDefinitionProps = {
	@:optional
	var rowKey : String;
	@:optional
	var childColumnName : String;
	@:optional
	var cssClassName : haxe.extern.EitherType<String, Dynamic -> String>;
};
extern class RowDefinition extends ReactComponentOf<RowDefinitionProps, Dynamic> {

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
extern class ColumnDefinition extends ReactComponentOf<ColumnDefinitionProps, Dynamic> {

}
typedef CellProps = {
	@:optional
	var griddleKey : Float;
	@:optional
	var columnId : String;
	@:optional
	var value : Dynamic;
	@:optional
	var onClick : Function;
	@:optional
	var onMouseEnter : Function;
	@:optional
	var onMouseLeave : Function;
	@:optional
	var className : String;
	@:optional
	var style : CSSStyleDeclaration;
};
extern class Cell extends ReactComponentOf<CellProps, Dynamic> {

}
typedef RowProps = {
	@:optional
	var Cell : Dynamic;
	@:optional
	var griddleKey : String;
	@:optional
	var columnIds : Array<Float>;
	@:optional
	var onClick : Function;
	@:optional
	var onMouseEnter : Function;
	@:optional
	var onMouseLeave : Function;
	@:optional
	var className : String;
	@:optional
	var style : CSSStyleDeclaration;
};
extern class Row extends ReactComponentOf<RowProps, Dynamic> {

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
extern class Table extends ReactComponentOf<TableProps, Dynamic> {
}
typedef TableBodyProps = {
	@:optional
	var rowIds : Array<Float>;
	@:optional
	var Row : Dynamic;
	@:optional
	var style : CSSStyleDeclaration;
	@:optional
	var className : String;
};
extern class TableBody extends ReactComponentOf<TableBodyProps, Dynamic> {

}
typedef TableHeadingProps = {
	@:optional
	var columnIds : Array<Float>;
	@:optional
	var columnTitles : Array<String>;
	var TableHeadingCell : Dynamic;
};
extern class TableHeading extends ReactComponentOf<TableHeadingProps, Dynamic> {

}
typedef TableHeadingCellProps = {
	@:optional
	var title : String;
	@:optional
	var columnId : Float;
	@:optional
	var onClick : Function;
	@:optional
	var onMouseEnter : Function;
	@:optional
	var onMouseLeave : Function;
	@:optional
	var icon : Dynamic;
	@:optional
	var className : String;
	@:optional
	var style : CSSStyleDeclaration;
};
extern class TableHeadingCell extends ReactComponentOf<TableHeadingCellProps, Dynamic> {

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
	var style : CSSStyleDeclaration;
};
extern class SettingsWrapper extends ReactComponentOf<SettingsWrapperProps, Dynamic> {

}
typedef SettingsToggleProps = {
	@:optional
	var onClick : Function;
	@:optional
	var text : Dynamic;
	@:optional
	var className : String;
	@:optional
	var style : CSSStyleDeclaration;
};
extern class SettingsToggle extends ReactComponentOf<SettingsToggleProps, Dynamic> {

}
typedef SettingsProps = {
	@:optional
	var settingsComponents : Array<GriddleComponent<Dynamic>>;
	@:optional
	var className : String;
	@:optional
	var style : CSSStyleDeclaration;
};
extern class Settings extends react.ReactComponent.ReactComponentOf<SettingsProps, Dynamic> {

}
typedef FilterProps = {
	@:optional
	var setFilter : GriddleFilter -> Void;
	@:optional
	var placeholder : String;
	@:optional
	var className : String;
	@:optional
	var style : CSSStyleDeclaration;
};
extern class Filter extends ReactComponentOf<FilterProps, Dynamic> {

}
extern class Components {
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
//typedef GriddleComponent<T> =   react.React.CreateElementType;//react.ReactComponentOfProps<T>;
typedef GriddleComponent<T> =   react.ReactType.ReactTypeOf<T>//react.ReactComponentOfProps<T>;
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
	var Filter : GriddleComponent<FilterProps>;
	@:optional
	var FilterEnhancer : GriddleComponent<FilterProps> -> GriddleComponent<FilterProps>;
	@:optional
	var FilterContainer : GriddleComponent<FilterProps> -> GriddleComponent<FilterProps>;
	@:optional
	var FilterContainerEnhancer : GriddleComponent<FilterProps> -> GriddleComponent<FilterProps>;
	@:optional
	var SettingsWrapper : GriddleComponent<SettingsWrapperProps>;
	@:optional
	var SettingsWrapperEnhancer : GriddleComponent<SettingsWrapperProps> -> GriddleComponent<SettingsWrapperProps>;
	@:optional
	var SettingsWrapperContainer : GriddleComponent<SettingsWrapperProps> -> GriddleComponent<SettingsWrapperProps>;
	@:optional
	var SettingsWrapperContainerEnhancer : GriddleComponent<SettingsWrapperProps> -> GriddleComponent<SettingsWrapperProps>;
	@:optional
	var SettingsToggle : GriddleComponent<SettingsToggleProps>;
	@:optional
	var SettingsToggleEnhancer : GriddleComponent<SettingsToggleProps> -> GriddleComponent<SettingsToggleProps>;
	@:optional
	var SettingsToggleContainer : GriddleComponent<SettingsToggleProps> -> GriddleComponent<SettingsToggleProps>;
	@:optional
	var SettingsToggleContainerEnhancer : GriddleComponent<SettingsToggleProps> -> GriddleComponent<SettingsToggleProps>;
	@:optional
	var Settings : GriddleComponent<SettingsProps>;
	@:optional
	var SettingsEnhancer : GriddleComponent<SettingsProps> -> GriddleComponent<SettingsProps>;
	@:optional
	var SettingsContainer : GriddleComponent<SettingsProps> -> GriddleComponent<SettingsProps>;
	@:optional
	var SettingsContainerEnhancer : GriddleComponent<SettingsProps> -> GriddleComponent<SettingsProps>;
	@:optional
	var SettingsComponents : PropertyBag<GriddleComponent<Dynamic>>;
	@:optional
	var Table : GriddleComponent<TableProps>;
	@:optional
	var TableEnhancer : GriddleComponent<TableProps> -> GriddleComponent<TableProps>;
	@:optional
	var TableContainer : GriddleComponent<TableProps> -> GriddleComponent<TableProps>;
	@:optional
	var TableContainerEnhancer : GriddleComponent<TableProps> -> GriddleComponent<TableProps>;
	@:optional
	var TableHeading : GriddleComponent<TableHeadingProps>;
	@:optional
	var TableHeadingEnhancer : GriddleComponent<TableHeadingProps> -> GriddleComponent<TableHeadingProps>;
	@:optional
	var TableHeadingContainer : GriddleComponent<TableHeadingProps> -> GriddleComponent<TableHeadingProps>;
	@:optional
	var TableHeadingContainerEnhancer : GriddleComponent<TableHeadingProps> -> GriddleComponent<TableHeadingProps>;
	@:optional
	var TableHeadingCell : GriddleComponent<TableHeadingCellProps>;
	@:optional
	var TableHeadingCellEnhancer : GriddleComponent<TableHeadingCellProps> -> GriddleComponent<TableHeadingCellProps>;
	@:optional
	var TableHeadingCellContainer : GriddleComponent<TableHeadingCellProps> -> GriddleComponent<TableHeadingCellProps>;
	@:optional
	var TableHeadingCellContainerEnhancer : GriddleComponent<TableHeadingCellProps> -> GriddleComponent<TableHeadingCellProps>;
	@:optional
	var TableBody : GriddleComponent<TableBodyProps>;
	@:optional
	var TableBodyEnhancer : GriddleComponent<TableBodyProps> -> GriddleComponent<TableBodyProps>;
	@:optional
	var TableBodyContainer : GriddleComponent<TableBodyProps> -> GriddleComponent<TableBodyProps>;
	@:optional
	var TableBodyContainerEnhancer : GriddleComponent<TableBodyProps> -> GriddleComponent<TableBodyProps>;
	@:optional
	var Row : GriddleComponent<RowProps>;
	@:optional
	var RowEnhancer : GriddleComponent<RowProps> -> GriddleComponent<RowProps>;
	@:optional
	var RowContainer : GriddleComponent<RowProps> -> GriddleComponent<RowProps>;
	@:optional
	var RowContainerEnhancer : GriddleComponent<RowProps> -> GriddleComponent<RowProps>;
	@:optional
	var Cell : GriddleComponent<CellProps>;
	@:optional
	var CellEnhancer : GriddleComponent<CellProps> -> GriddleComponent<CellProps>;
	@:optional
	var CellContainer : GriddleComponent<CellProps> -> GriddleComponent<CellProps>;
	@:optional
	var CellContainerEnhancer : GriddleComponent<CellProps> -> GriddleComponent<CellProps>;
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
typedef PropertyBag<T> = { 
    propName:Map<String,T>
};
typedef GriddleActions = {
	//>PropertyBag<haxe.extern.EitherType<ActionCreator<Dynamic>, Undefined>>,//TODO: DEFINE ActionCreator
	>PropertyBag<Dynamic>,
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
	var setSortProperties : SortProperties -> Void -> Void;
};
typedef GriddleFilter = Dynamic;

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
	var styles : GriddleStyleElements<Dynamic>;
};//CSSStyleDeclaration
typedef GriddlePageProperties = {
	@:optional
	var currentPage : Float;
	@:optional
	var pageSize : Float;
	@:optional
	var recordCount : Float;
};
typedef RowRenderProperties = {
	>RowDefinitionProps,
};
typedef ColumnRenderProperties = {
	>ColumnDefinitionProps,
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

typedef Reducer = Dynamic->Dynamic->Void;
typedef Selector = Dynamic->Dynamic->Dynamic;
typedef Listener = Function;

