package reactable;

import haxe.extern.EitherType;
import react.ReactComponent;
import react.ReactComponent.*;

/**
 * ...
 * @author axel@cunity.me
 */

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
	data:Array<Dynamic>,
	?defaultSort:Dynamic,
	?defaultSortDescending:Bool,
	?filterable:Dynamic,
	?itemsPerPage:Int,
	?onFilter:String->Void,
	?onPageChange:SortProps->Void,
	?onSort:Int->Void,
	?pageButtonLimit:Int,
	?sortable:EitherType<Bool, Array<EitherType<String,Dynamic>>>
}

@:jsRequire('reactable', 'Table')
extern class Table extends ReactComponentOf<TableProps, Dynamic>
{

	public function new(?props:TableProps); 
	/*{
		super(props);		
	}*/
	
	override public function render():ReactFragment;
	
}