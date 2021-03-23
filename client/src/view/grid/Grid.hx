package view.grid;

import js.Syntax;
import action.DataAction.SelectType;
import haxe.ds.IntMap;
import js.Browser;
import haxe.Constraints.Function;
import haxe.Timer;
import haxe.ds.StringMap;
import haxe.extern.EitherType;
import js.html.DOMRect;
import js.html.DOMRectList;
import js.html.Element;
import js.html.Event;
import js.html.MouseEvent;
import js.html.Node;
import js.html.NodeList;
import js.html.TableCellElement;
import js.html.TableElement;
import js.html.TableRowElement;
import js.html.DivElement;
import me.cunity.debug.Out;
import react.React;
import react.ReactEvent;
import react.ReactRef;
import react.ReactComponent.ReactFragment;
import react.ReactComponent;
import react.ReactComponent.*;
import react.ReactMacro.jsx;
import shared.Utils;

/**
 * ...
 * @author axel@cunity.me
 */

typedef DataColumn = 
{
	?altGroupPos:Int,
	?cellFormat:Function,
	?className:String,
	?displayFormat:String,
	?editable:Bool,
	?flexGrow:Int,
	?headerClassName:String,
	?headerFormat:Function,
	?headerStyle:Dynamic,
	?label:String,
	?name:String,
	?search:SortDirection,
	?show:Bool,
	?useAsIndex:Bool,
	?style:Dynamic,
	?tip:String
}

typedef DataCellPos =
{
	column:Int,
	row:Int
}
typedef DataCell =
{
	@:optional var cellFormat:Function;
	@:optional var className:String;
	@:optional var data:Dynamic;// CELL CONTENT VALUE
	@:optional var dataDisplay:Dynamic;// CELL CONTENT DISPLAY VALUE
	@:optional var dataType:Dynamic;// CELL CONTENT VALUE TYPE
	@:optional var name:String;
	var id:Int;
	@:optional var pos:DataCellPos;
	@:optional var show:Bool;
	@:value(true)
	@:optional var style:Dynamic;
	@:optional var title:String;
	@:optional var flexGrow:Int;
}

typedef DataState =
{
	columns:StringMap<DataColumn>,
	?defaultSearch:StringMap<DataColumn>,
	?search:StringMap<DataColumn>
}

typedef Size =
{
	?height:Int,
	?width:Int
}

@:enum
abstract SortDirection(String){
	var ASC = 'ASC';
	var DESC = 'DESC';
	var NONE = '';
}

typedef SortProps =
{
	column:String,
	direction:SortDirection
}

typedef GridProps =
{
	?className:String,
	data:Array<Dynamic>,
	dataState:DataState,
	?disableHeader:Bool,
	?oddClassName: String,
    ?evenClassName:String,	
	?defaultSort:Dynamic,	
	?defaultSortDescending:Bool,
	?fullWidth:Bool,
	?filterable:Dynamic,
	?id:String,
	?itemsPerPage:Int,
	?onFilter:String->Void,
	?onPageChange:SortProps->Void,	
	?onDoubleClick:Event->Void,
	?onSort:Int->Void,
	?parentComponent:Dynamic,
	?sortable:EitherType<Bool, Array<EitherType<String,Dynamic>>>
}

typedef GridState =
{
	?enteredRow:Int,
	?selectedRow:Int,
	?selectedRows:IntMap<Bool>,
	?selectTimer:Timer,
	?_rowCells:Array<Element>,
	?_prevent:Bool,
	?_selecting:Bool,
	?_selectedCells:Array<Element>,
}

class Grid extends ReactComponentOf<GridProps, GridState>
{
	var fieldNames:Array<String>;
	var gridRef:ReactRef<DivElement>;
	var headerRef:ReactRef<DivElement>;
	var gridStyle:String;
	var visibleColumns:Int;
	var headerUpdated:Bool;
	static var clickDelay:Int = 200;
	
	public function new(?props:GridProps)
	{
		super(props);		
		headerUpdated = false;
		gridRef = React.createRef();
		headerRef = React.createRef();
		visibleColumns = 0;
		fieldNames = [];
		for (k in props.dataState.columns.keys())
		{
			//trace(k);
			fieldNames.push(k);
		}	
		trace(fieldNames);
		state = {
			_prevent:false,
			_selecting:false,
			selectedRow:null,
			selectedRows:new IntMap(),
			_rowCells:[],
			_selectedCells:[]
		}
	}
	
	override public function render():ReactFragment
	{
		if(props.data != null)
		trace(props.data.length);
		trace(props.className);
		
		if (props.data == null || props.data.length == 0)
		{
			return jsx('
			<section className="hero is-alt">
			  <div className="hero-body">
			  <div className="loader"  style=${{width:'3rem', height:'3rem', margin:'auto', borderWidth:'0.58rem'}}/>
			  </div>
			</section>
			');					
		}		
		//className="${props.className} sort-decoration"
		//return jsx('<div>1</div>');

		//renderRows();
		//var rows:ReactFragment = jsx('<div>1</div>');// ${renderHeaderDisplay()}		
		var headerRows:ReactFragment = renderHeaderDisplay();
		//return headerRows;
		//var rows:ReactFragment = renderHeaderDisplay();
		trace(gridStyle);
		//return rows; style="{{grid-template-columns:$gridStyle}}"
		return jsx('		
			<div className="grid-container" ref=${gridRef}>			
					${headerRows}
					${renderRows()}
			</div>					
		');		
	}
	
	function renderHeaderDisplay():ReactFragment
	{
		if(props.dataState==null)
			return null;
		var headerRow:Array<ReactFragment> = [];
		//var headerRow:String = '';
		//trace(props.dataState.columns.keys());
		gridStyle = '';
		for (field in props.dataState.columns.keys())
		{
			var hC:DataColumn = props.dataState.columns.get(field);
			if (hC.show == false)
				continue;
			visibleColumns++;
			gridStyle +=  (hC.flexGrow !=null ?' ${hC.flexGrow}fr':' max-content');
			headerRow.push(jsx('	
			<div key={field} className=${"gridHeadItem " + (hC.headerClassName != null? hC.headerClassName : (hC.className!= null?hC.className:''))}>
			${hC.label != null? hC.label : hC.name}<span className="sort-box fa fa-sort"></span>
			</div>
			'));
		}
		trace('$visibleColumns $gridStyle');
		return headerRow;
	}	

	function map2DataCell(rdMap:Map<String,Dynamic>,fN:String, column:Int, row:Int, rowClass:String):DataCell {
		var columnDataState:DataColumn = props.dataState.columns.get(fN);
		if(rdMap[fN]=='')
			rdMap[fN] = null;
		//trace(fN + '::' + rdMap[fN] + '::' + columnDataState.cellFormat);
		//trace(rdMap);
		return {
			cellFormat:columnDataState.cellFormat,
			className:(columnDataState.className==null?rowClass:columnDataState.className +' '+ rowClass),
			data:rdMap[fN],
			dataDisplay:columnDataState.cellFormat != null ? columnDataState.cellFormat(rdMap[fN]):rdMap[fN],
			id:rdMap['id'],
			name:fN,
			pos:{column:column, row:row},
			show:columnDataState.show != false
		};
	}

	function renderCells(rdMap:Map<String,Dynamic>, row:Int):ReactFragment
	{
		//trace(fieldNames.join('|'));
		//trace('|'+rdMap['h'].keys().next()+'|');
		//trace(state.selectedRows.toString());
		var column:Int = 0;
		//var isSelected:Bool = state.selectedRows.exists(row);
		var rowClass = (row % 2 == 0?'gridItem even':'gridItem odd');
		//if(isSelected)
			//rowClass += ' selected';
		if(state.selectedRows.exists(rdMap.get('id')))
			rowClass += ' selected';		
		var cells:Array<DataCell> = fieldNames.map(function(fN:String){
			return map2DataCell(rdMap, fN, column++, row, rowClass);
		});

		var rCs:Array<ReactFragment> = [];
		//trace(cells.length);
		for (cD in cells)
		{
			//trace(cD);"r"+cD.pos.row+"c"+cD.pos.column
			//trace(row + ':' + cD.id + '_' + cD.pos.column);
			if (!cD.show)
			 continue;
			rCs.push(
			jsx('<div className=${cD.className} key=${cD.id + '_' + cD.name} data-value=${cD.data} 
			data-id=${cD.id} data-name=${cD.name} 
			data-gridpos=${cD.pos.row+"_"+cD.pos.column} onClick=${select} onDoubleClick=${editRow}>
				${(cD.dataDisplay==null||cD.dataDisplay==''?<span>&nbsp;</span>:cD.dataDisplay)}
			</div>'));
		}
		return rCs;
	}
	
	function renderRows(?dRows:Array<Dynamic>):ReactFragment
	{
		if (dRows == null)
			dRows = props.data;
		var dRs:Array<ReactFragment> = [];
		var row:Int = 0;
		for (dR in dRows)
		{			
			//trace(dR);
			dRs.push(renderCells(dR, row++));
		}
		return dRs;
	}
	
	override function componentDidMount() {
		if(gridRef == null ||gridRef.current == null){
			trace(Type.getClassName(Type.getClass(props.parentComponent)));
			return;
		}
		trace('ok ${gridRef}');
		props.parentComponent.state.dataGrid=this;
		var grid:Element = gridRef.current;
		grid.style.setProperty('grid-template-columns', gridStyle);
	}

	override function componentDidUpdate(prevProps:Dynamic, prevState:Dynamic)	
	{
		trace(headerUpdated+ ':' + headerRef +' cmp state:' + (prevState==state?'Y':'N')); 
	}
	
	function editRow(ev:Event) {
		state.selectTimer.stop();
		state._prevent = true;
		var el:Element = cast(ev.target,Element);
		if(!el.classList.contains('selected'))
			highLightRow(ev);
		Timer.delay(function() {
			state._prevent = false;
		},clickDelay*2);
		trace('here we go :)');
		if(props.onDoubleClick != null){
			props.onDoubleClick(ev);
		}
	}

	function select(e:ReactEvent){
		//trace(e);
		untyped e.persist();
		state.selectTimer = Timer.delay(function() {
			if(!state._prevent)
				highLightRow(e);
		},clickDelay);
	}

	function highLightRow(evtOrId:Dynamic)
	{			
		trace('evtOrId');
		if (state._selecting)
			return;		
		state._selecting = true;
		//trace(evtOrId);
		var el:Element = (Std.is(evtOrId, Int)?
		Browser.window.document.querySelector('.gridItem[data-id="${evtOrId}"]'):
		cast (evtOrId._targetInst.stateNode, Element));
		var rN:Int = Std.parseInt(el.dataset.id);
		var selectedNow:IntMap<Bool> = state.selectedRows.copy();

		trace (el.dataset.id + ':' + state._selecting + ' ctrlKey:' + evtOrId.ctrlKey);
		//rN = Std.parseInt(el.dataset.id);             
		//rN = Std.parseInt(el.dataset.gridpos.split("_")[0]);
		if(!evtOrId.ctrlKey && !evtOrId.shiftKey){
			//clear selection only
			state.selectedRows = new IntMap();	
			if(selectedNow.exists(rN)){
				setState({selectedRows:state.selectedRows});		
				state._selecting = false;
				return;				
			}
			else{
				state.selectedRows.set(rN, true);
				trace(state.selectedRows);
			}
		}
		else {
			//TODO: HANDLE SELECTION WITH MODIFIERS
		}
		
		var rowCells = Browser.window.document.querySelectorAll('.gridItem[data-id="${el.dataset.id}"]');
		//trace(rowCells.length + ':' + untyped rowCells.item(0).innerHTML);
		var rowEls:Array<Element> = Syntax.code("Array.from({0})",rowCells);
		setState({selectedRows:state.selectedRows});
		//trace(el.dataset.id + ':' + rowEls[0].innerHTML + getRowData(rowEls).toString());
		props.parentComponent.props.select(el.dataset.id,[el.dataset.id => getRowData(rowEls)], props.parentComponent, SelectType.One);
		state._selecting = false;
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
	
	//function getRowData(rCs:NodeList):StringMap<Dynamic> {
	function getRowData(rCs:Array<Element>):StringMap<Dynamic> {
		if(rCs.length==0)
			return null;
		/*for (el in rCs){
			trace(el.dataset.id+':'+el.innerHTML);
		}*/
		return [
			for (el in rCs)
				el.dataset.name => el.dataset.value
		];
	}
}
