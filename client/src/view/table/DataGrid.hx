package view.table;

import react.ReactPaginate;
import js.Browser;
import haxe.Constraints.Function;
import haxe.Timer;
//import haxe.ds.Map;
import haxe.extern.EitherType;
import js.html.DOMRect;
import js.html.Element;
import js.html.HTMLCollection;
import js.html.MouseEvent;
import js.html.Node;
import js.html.NodeList;
import js.html.TableCellElement;
import js.html.TableElement;
import js.html.TableRowElement;
import js.html.DivElement;
import me.cunity.debug.Out;
import react.data.ReactDataGrid;
import react.React;
import react.ReactRef;
import react.ReactComponent.ReactFragment;
import react.ReactComponent;
import react.PureComponent;
import react.ReactMacro.jsx;
import shared.Utils;

import state.FormState;
import view.shared.io.FormApi;
import view.shared.OneOf;
import view.table.Table.DataState;

using Lambda;

/**
 * ...
 * @author axel@cunity.me
 */


typedef DataGridProps =
{
	>ReactDataGridProps,
	?className:String,
	data:Array<Map<String,Dynamic>>,
	dataState:DataState,
	?parentComponent:Dynamic,
	?renderPager:Function,
	?fullWidth:Bool,
	/*?disableHeader:Bool,
	?oddClassName: String,
  	?evenClassName:String,	
	?defaultSort:Dynamic,
	?defaultSortDescending:Bool,
	?filterable:Dynamic,
	?fullWidth:Bool,
	?id:String,
	?itemsPerPage:Int,
	?isConnected:Bool,
	?onFilter:String->Void,
	?onPageChange:SortProps->Void,
	?onSort:Int->Void,
	?pageButtonLimit:Int,
	//?parentForm:DataAccessForm,	
	?primary:String,//defaults to 'id'
	?sorDataGrid:EitherType<Bool, Array<EitherType<String,Dynamic>>>,
	//?setStateFromChild:FormState->Void,*/
}

typedef DataGridState =
{
	?rows:Array<Dynamic>,
	?selectedIndexes:Array<Int>,
	?loading:Bool
}

class DataGrid extends ReactComponentOf<DataGridProps, DataGridState>
{
	var columns:Dynamic;//{key:String,name:String};
	var fieldNames:Array<String>;
	var DataGridRef:ReactRef<TableElement>;
	var fixedHeader:ReactRef<DivElement>;
	var firstRowRef:ReactRef<TableRowElement>;
	var tHeadRef:ReactRef<TableRowElement>;
	var visibleColumns:Int;
	var headerUpdated:Bool;
	var _timer:Timer;
	
	public function new(?props:DataGridProps)
	{
		super(props);		
		/*if(props.dataState!=null)
		columns = [for (k => v in props.dataState.columns.keyValueIterator())
		{
			{
				key:k,
				name:v.label
			}
		}];	
		//
		trace(columns);
		state = {
			rows:[],
			selectedIndexes:[]
		};*/
		 this.columns = [
		{
			key: "id",
			name: "ID"
		},
		{
			key: "title",
			name: "Title"
		},
		{
			key: "count",
			name: "Count"
		}
		];

		var rows:Array<Dynamic> = [];
		for (i in 1...1000) {
		rows.push({
			id: i,
			title: "Title " + i,
			count: i * 1000
		});
		}
		state = { loading:false, rows:rows, selectedIndexes: [] };
	}
	
	override public function render():ReactFragment
	{
		if(props.data != null)
		trace(props.data.length);
		trace(props.className);
		if (props.data == null || props.data.length == 0)
		{
			return state.loading ? jsx('
			<section className="hero is-alt" style={{flexGrow:1}}>
	<div className="loader-box">
			  <div className="loader"  style=${{width:'6rem', height:'6rem', margin:'auto', borderWidth:'0.64rem'}}/>
			  </div>
			</section>
			'): null;					
		}		
		trace(state.rows[0]);
		/*tableRef = React.createRef();
		fixedHeader = React.createRef();
		tHeadRef = React.createRef();onRowClick=${select}
		firstRowRef = React.createRef();*/
		return jsx('		
			<div className="fixed-grid-container" >
				<$ReactDataGrid
				columns=${columns}
				
				rowGetter=${function(i:Int)return state.rows[i]}
				rowsCount=${state.rows.length}
				/>
			</div>
		');		
	}
			
	/**
	   @return
	**/

	/*function renderHeaderRow():ReactFragment
	{
		if(props.dataState==null)
			return null;
		//trace(props.dataState.columns.keys());
		var headerRow:Array<ReactFragment> = [];
		for (field in props.dataState.columns.keys())
		{
			var hC:DataColumn = props.dataState.columns.get(field);
			if (hC.show == false)
				continue;
			//trace(hC);
			headerRow.push(jsx('	
			<th key={field}>
				<div  className={"th-box " + (hC.headerClassName != null? hC.headerClassName :hC.className)}>
				{hC.label != null? hC.label : hC.name}<span className="sort-box fa fa-sort"></span>
				</div>
			</th>
			'));
		}
		trace(headerRow.length);
		return headerRow;
	}	
	
	function renderHeaderDisplay():ReactFragment
	{
		if(props.dataState==null)
			return null;
		//trace(props.dataState.columns.keys());
		var headerRow:Array<ReactFragment> = [];
		for (field in props.dataState.columns.keys())
		{
			var hC:DataColumn = props.dataState.columns.get(field);
			if (hC.show == false)
				continue;
			visibleColumns++;	
			var sortClass:String = switch (hC.search)
			{
				case ASC:	'fa-sort-up';
				case DESC:	'fa-sort-down';
				default: 	'fa-sort';
			}
			headerRow.push(jsx('	
			<th key={field}>
			<div  className={"th-box " + (hC.headerClassName != null? hC.headerClassName :hC.className)}>
			{hC.label != null? hC.label : hC.name}<span className="sort-box fa $sortClass"></span>
			</div>
			</th>
			'));
		}
		return headerRow;
	}	

	function renderRows(?dRows:Array<Map<String,Dynamic>>):ReactFragment
	{
		if (dRows == null)
			dRows = props.data;
		var dRs:Array<ReactFragment> = [];
		var row:Int = 0;
		var primary:String = (props.primary!=null && props.primary.length > 0?props.primary:'id');
		for (dR in dRows)
		{			
			var fRRef:ReactRef<TableRowElement> = (row==0?firstRowRef:null);
			dRs.push(
			jsx('<$Tr key=${dR.get("id")} columns=${props.dataState.columns} data=${dR} firstTableRow=${fRRef} fieldNames=${fieldNames} row=${row++} parentComponent=${props.parentComponent}/>')
			);//
		}
		trace(dRs.length);
		return dRs;
	}*/
	
	public function select(rid:Int)
	{
		trace(rid);
/*		if (mEv.altKey)
		{
			selectAltGroup(props.dataState.altGroupPos, htRow);
		}
		else if (mEv.ctrlKey)
		{			
			for (r in rows)
				r.classList.toggle('is-selected');
		}
		else 
			htRow.classList.toggle('is-selected');
		var selRows:Array<TableRowElement> = new Array();
		for (r in rows)
		{
			if (r.classList.contains('is-selected'))
				selRows.push(cast r);
		}
		setState({selectedRows:selRows});
		//props.parentForm.setStateFromChild({selectedRows:selRows});*/
	}

	
	function selectAltGroup(altGroupPos:Int, cRow:TableRowElement):Void
	{
		var groupName:String = cRow.cells.item(altGroupPos).textContent;
		var tEl:TableElement = cast cRow.parentElement;
		for (i in 0...tEl.children.length)
		{
			var row:TableRowElement = cast tEl.children.item(i);
			trace(row.cells.item(altGroupPos).nodeValue + '==' + groupName);
			if(row.cells.item(altGroupPos).textContent==groupName)
				row.classList.toggle('is-selected');
		}
		
	}


	/*function selectedRowsMap():Array<Map<String,String>>
	{
		return [for (r in state.selectedRows) selectedRowMap(r)];
	}*/
	
	function selectedRowMap(row:TableRowElement):Map<String,String>
	{
		var rM:Map<String,String> = [
			for (c in row.cells)
				c.dataset.name => c.innerHTML
		];
		rM['id'] = row.dataset.id;
		return rM;
	}
	
	override function componentDidMount()//,snapshot:Dynamic
	{
		//App.onResizeComponents.add(this);//TODO: IMPLEMENT LISTENER
		Browser.window.requestAnimationFrame(function (t:Float)
		{
			trace(t);
		});
	}

	override function componentDidUpdate(prevProps:Dynamic, prevState:Dynamic)//,snapshot:Dynamic
	{
		trace(headerUpdated + ':' + tHeadRef); 

		if (tHeadRef != null)
		{
			if (headerUpdated)
				return;
			
			//showDims(tHeadRef);
			//nodeDims(fixedHeader.current);
		}
	}

	override public function componentWillUnmount():Void 
	{
		trace('leaving...');
		if(_timer != null)
			_timer.stop();
		//App.onResizeComponents.remove(this);//TODO: Implement Listener
	}

	override function shouldComponentUpdate(nextProps, nextState):Bool
	{
    	//trace(nextProps);
    	//trace(nextState);
		return true;
	}
	
	function showDims(ref:Dynamic)
	{
		var i:Int = 0;
		var s:Float = 0;
		var cells:Array<TableCellElement> = (ref.current != null? ref.current.cells : ref.cells);
		for (cell in cells)
		{
			trace(untyped cell.getBoundingClientRect().toJSON());
			s += cell.getBoundingClientRect().width;
		}
		trace(' sum:$s');
	}

	function nodeDims(n:Node)
	{
		var i:Int = 0;
		var s:Float = 0;
		var cells:NodeList = n.childNodes;
		for (cell in cells)
		{
			var dRect:DOMRect = untyped cast(cell, Element).getBoundingClientRect().toJSON();
			trace(dRect);
			//Out.dumpObject(cast(cell, Element).getBoundingClientRect());
			s += cast(cell, Element).getBoundingClientRect().width;
		}
		trace(' sum:$s');
	}
	
}
