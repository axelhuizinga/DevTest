package gigatables_react;

import react.ReactComponent;
import react.ReactComponent.ReactFragment;
	
/**
 * ...
 * @author axel@cunity.me
 */

typedef ReactableSettingsStruct =
{
	search: Array<String>,//['top', 'bottom'],
        rowsSelector: Array<String>,//['asc', 'top', 'bottom'],
        pagination: Array<String>//['bottom']
}

typedef ReactableSettings =
{
	struct: ReactableSettingsStruct,
    ?ajax: String,
    // or u can set local json data
    // data: localData, 
    ?data: Array<Dynamic>,
    ?columns: Array<Dynamic>
}

typedef ReactableProps =
{
    ?editor: Dynamic,
    settings: ReactableSettings	
}
 
typedef ReactableState =
{
	dataRows: Array<Dynamic>,
	countRows: Int,
	perPage: Int,
	page: Int,
	fromRow: Int,
	dataSearch: String,
	sortButtons: Array<Dynamic>,
	action: String,//'create', // optimized - not importing EditorConstants
	active: Bool,
	selectedRows: Array<Dynamic>,
	selectedIds: Array<Int>,
	// key-board
	ctrlDown: Bool,
	shiftDown: Bool,
	arrowDown: Bool,
	arrowUp: Bool,
	arrowLeft: Bool,
	arrowRight: Bool,
	minRow: Int,
	maxRow: Int,
	opacity: Int,
	search: String,
	fieldsEdit: Dynamic,
	columnsSearch: Dynamic,
	discreteFocus: Bool,
	scrolledDown: Bool,
	editedCell: String,
	footerCounted: Bool,
	footerSum: Int,
	footerAvg: Int,
	footerMinLength: Int,
	footerMaxLength: Int,
	footerFrequency: String,
	popup_button: String,
	popup_title: String	
}

@:jsRequire("gigatables-react", "Reactables") 
extern class Reactables extends ReactComponentOf<ReactableProps,ReactableState>
{

	public function new();
		
	override function render():ReactFragment;
	
}