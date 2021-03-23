package view.table;

import view.shared.io.BaseForm;
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
using Lambda;
using StringTools;

/**
 * ...
 * @author axel@cunity.me
 */

typedef DataState =
{
	?altGroupPos:Int,
	columns:Map<String,DataColumn>,
	?defaultSearch:Map<String,DataColumn>,
	?search:Map<String,DataColumn>
}

typedef DataColumn = 
{
	@:optional var dbFormat:Function;
	@:optional var cellFormat:Function;
	@:optional var className:Dynamic;
	@:optional var editable:Bool;
	@:optional var flexGrow:Int;
	@:optional var headerClassName:String;
	@:optional var headerFormat:Function;
	@:optional var headerStyle:Dynamic;
	@:optional var label:String;
	@:optional var name:String;	
	@:optional var title:String;
	@:optional var search:SortDirection;
	@:optional var show:Bool;	
	@:optional var style:Dynamic;
	@:optional var useAsIndex:Bool;
	@:optional var useInTooltip:Int;//-1 = not, n = position
}

typedef DataCellPos =
{
	column:Int,
	row:Int
}
typedef DataCell =
{
	@:optional var cellFormat:Function;
	@:optional var className:Dynamic;
	@:optional var data:Dynamic;// CELL CONTENT VALUE
	@:optional var dataDisplay:Dynamic;// CELL CONTENT DISPLAY VALUE
	@:optional var dataType:Dynamic;// CELL CONTENT VALUE TYPE
	@:optional var name:String;
	@:optional var id:String;
	@:optional var pos:DataCellPos;
	//@:value(true)
	@:optional var show:Bool;
	@:optional var style:Dynamic;
	@:optional var title:String;
	@:optional var flexGrow:Int;
}

typedef Size =
{
	?height:Int,
	?width:Int
}

@:enum
abstract SortDirection(String){
	var ASC;// = 'ASC';
	var DESC;// = 'DESC';
	var NONE;// = '';
}

typedef SortProps =
{
	column:String,
	direction:SortDirection
}

typedef TableProps =
{
	?className:String,
	data:Array<Map<String,Dynamic>>,
	dataState:DataState,
	?disableHeader:Bool,
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
	?parentComponent:Dynamic,
	?primary:String,//defaults to 'id'
	?renderPager:Function,
	?selectAble:Bool,
	?sortable:EitherType<Bool, Array<EitherType<String,Dynamic>>>,
	//?setStateFromChild:FormState->Void,
}

typedef TableState =
{
	?enteredRow:Int,
	?selectedRow:Int,
	?selectedTrs:Array<Tr>,
	?selectedRows:Array<TableRowElement>,
	?_rowCells:Array<Element>,
	?_selectedCells:Array<Element>,
	?loading:Bool,
	?_isSelected:Bool
}

//class Table extends PureComponentOf<TableProps, TableState>
class Table extends ReactComponentOf<TableProps, TableState>
{
	var fieldNames:Array<String>;
	var tableRef:ReactRef<TableElement>;
	var fixedHeader:ReactRef<DivElement>;
	var firstRowRef:ReactRef<TableRowElement>;
	var id:String;
	var tHeadRef:ReactRef<TableRowElement>;
	var visibleColumns:Int;
	var headerUpdated(default, set):Bool;
	var _timer:Timer;
	var _trace:Bool;
	var trs:Array<Tr>;
	//var defaultProps:Dynamic;
	
	public function new(?props:TableProps)
	{
		//defaultProps = {selectAble:true};
		//trace(props);
		//props.selectAble = props.selectAble == null ? true:props.selectAble;
		super(props);		
		headerUpdated = false;
		fieldNames = [];
		trs = [];
		_trace = true;
		//if(_trace) trace(props.parentComponent);
		id = 'id';
		if(props.dataState!=null)
		for (k in props.dataState.columns.keys())
		{			
			//if(_trace) trace(k+':'+props.dataState.columns.get(k).useAsIndex);
			//if(_trace) trace(k);
			if(props.dataState.columns.get(k).useAsIndex)
				id = k;
			fieldNames.push(k);
		}
		if(_trace) trace(props.parentComponent.props.id);

		state = {selectedRows:[]};

		tableRef = React.createRef();
		fixedHeader = React.createRef();
		tHeadRef = React.createRef();
		//trace(tHeadRef);
		firstRowRef = React.createRef();		
	}
	
	function set_headerUpdated(hU) {
		trace(hU);
		//if(hU)
		//	Out.dumpStack(Out.aStack());
		return headerUpdated = hU;
	}

	override public function render():ReactFragment
	{
		if(_trace && props.data != null)
		 trace(props.data.length);
		if(props.renderPager !=null) props.renderPager();
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
		//if(_trace) trace(props.data);

		//var comp = props.parentComponent;
		/**
		 * 				
		 */
		return jsx('		
					<div className="fixed-grid-container" >
				<div className="header-background" >
					<table className="tableHead head">
						<thead>
							<tr ref={fixedHeader}>
								${renderHeaderDisplay()}
							</tr>
						</thead>
					</table>				
				</div>				
				<div className="grid-container-inner" >							
					<table id=${props.id}className=${"table " + props.className} ref={tableRef}>
						<thead>
							<tr ref=${tHeadRef}>
								${renderHeaderRow()}
							</tr>
						</thead>
						<tbody>
							${renderRows()}
						</tbody>
					</table>					
				</div>
				${renderPager(props.parentComponent)}	
			</div>
		');		
	}

	public function renderPager(comp:Dynamic):ReactFragment
	{
		trace('pageCount=${comp.state.pageCount}');		
		if(Math.isNaN(comp.state.pageCount) || comp.state.pageCount<2)
			return null;
		//trace(comp.props);
		//trace(props);
		//trace(jsx('<div className="paginationContainer">React Paginate</div>'));
		return jsx('
		<div id="pct" className="paginationContainer">
			<nav>
				<$ReactPaginate previousLabel=${'<'} breakLinkClassName=${'pagination-link'}
					pageLinkClassName=${'pagination-link'}					
					nextLinkClassName=${'pagination-next'}
					previousLinkClassName=${'pagination-previous'}
					nextLabel=${'>'}
					breakLabel=${'...'}
					breakClassName=${'break-me'}
					pageCount=${comp.state.pageCount}
					marginPagesDisplayed={2}
					pageRangeDisplayed={5}
					onPageChange=${function(data){
						trace('${comp.props.match.params.action}  ${data.selected}');
						var fun:Function = Reflect.field(comp,comp.props.match.params.action);
						if(Reflect.isFunction(fun))
						{
							Reflect.callMethod(comp,fun,[{page:data.selected}]);
						}
					}}
					containerClassName=${'pagination is-small'}
					subContainerClassName=${'pages pagination'}
					activeLinkClassName=${'is-current'}/>
			</nav>	
		</div>		
		');
	}
			
	/**${props.renderPager()}
	   @return
	**/

	function renderHeaderRow():ReactFragment
	{
		if(props.dataState==null)
			return null;
		//if(_trace) trace(props.dataState.columns.keys());
		var headerRow:Array<ReactFragment> = [];
		for (field in props.dataState.columns.keys())
		{
			var hC:DataColumn = props.dataState.columns.get(field);
			if (hC.show == false)
				continue;
			//if(_trace) trace(hC);
			/*if(hC.className != null && StringTools.contains(hC.className,'euro'))
			{
				hC.className = 'th-box tRight';
				trace(hC);
			}
			else {
				//"th-box " + (hC.headerClassName != null? hC.headerClassName :hC.className)
				hC.className = "th-box " + (hC.className != null? hC.className :'');
			}*/
			headerRow.push(jsx('	
			<th key={field}>
				<div  className=${hC.headerClassName}>
				{hC.label != null? hC.label : hC.name}<span className="sort-box fa fa-sort"></span>
				</div>
			</th>
			'));
		}
		if(_trace) trace(headerRow.length);
		return headerRow;
	}	
	
	function renderHeaderDisplay():ReactFragment
	{
		if(props.dataState==null)
			return null;
		if(_trace) trace(props.dataState.columns.keys());
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
			if(row==0)
				trace('$id key=' + dR);
			dRs.push(
			jsx('<$Tr key=${dR.get("id")} columns=${props.dataState.columns} data=${dR} firstTableRow=${fRRef} fieldNames=${fieldNames} selectAble=${props.selectAble!=false} row=${row++} parentComponent=${props.parentComponent}/>')
			);//
		}
		if(_trace) trace(dRs.length);
		return dRs;
	}
	
	public function select(mEv:MouseEvent, tr:Tr)
	{
		if(_trace) trace(mEv.altKey);
		if(_trace) trace(mEv.currentTarget);
		var htRow:TableRowElement = cast(mEv.currentTarget, TableRowElement);
		var rows:HTMLCollection = htRow.parentElement.children;
		if (mEv.altKey)
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
		//props.parentForm.setStateFromChild({selectedRows:selRows});
	}

	/*public function select2(mEv:MouseEvent)
	{
		if(_trace) trace(mEv.altKey);
		if(_trace) trace(mEv.currentTarget);
		var htRow:TableRowElement = cast(mEv.currentTarget, TableRowElement);
		var rows:HTMLCollection = htRow.parentElement.children;
		if (mEv.altKey)
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
		//props.parentForm.setStateFromChild({selectedRows:selRows});
	}*/
	
	function selectAltGroup(altGroupPos:Int, cRow:TableRowElement):Void
	{
		var groupName:String = cRow.cells.item(altGroupPos).textContent;
		var tEl:TableElement = cast cRow.parentElement;
		for (i in 0...tEl.children.length)
		{
			var row:TableRowElement = cast tEl.children.item(i);
			if(_trace) trace(row.cells.item(altGroupPos).nodeValue + '==' + groupName);
			if(row.cells.item(altGroupPos).textContent==groupName)
				row.classList.toggle('is-selected');
		}
		
	}

	/*function selectAltGroup2(altGroupPos:Int, cRow:TableRowElement):Void
	{
		var groupName:String = cRow.cells.item(altGroupPos).textContent;
		var tEl:TableElement = cast cRow.parentElement;
		for (i in 0...tEl.children.length)
		{
			var row:TableRowElement = cast tEl.children.item(i);
			if(_trace) trace(row.cells.item(altGroupPos).nodeValue + '==' + groupName);
			if(row.cells.item(altGroupPos).textContent==groupName)
				row.classList.toggle('is-selected');
		}
		
	}*/

	function selectedRowsMap():Array<Map<String,String>>
	{
		return [for (r in state.selectedRows) selectedRowMap(r)];
	}
	
	function selectedRowMap(row:TableRowElement):Map<String,String>
	{
		var rM:Map<String,String> = [
			for (c in row.cells)
				c.dataset.name => c.innerHTML
		];
		rM['id'] = row.dataset.id;
		return rM;
	}

	public function layOut():Void
	{
		if(_trace) trace('firstCall: ${props.id + " " + props.fullWidth} $headerUpdated $tHeadRef: ${tHeadRef != null && tHeadRef.current != null}');
		//return;
		var freeWidth:Float = 0;

		if(tHeadRef == null || tHeadRef.current == null)
		{
			if(_trace) trace('$tHeadRef: ${tHeadRef != null && tHeadRef.current != null}');
			if(_timer != null)
				return;
			var _max = 13;
			_timer = App.await(250,function():Dynamic
			{
				if(_max--<0)
					return -1;
				if(_trace){
					trace(_max);
				} 
				return tHeadRef != null && tHeadRef.current != null;
			}, layOut);
			return;
		}
			
		headerUpdated = true;			
		//var tableHeight:Float = tableRef.current.clientHeight;
		//var leftMargin:Int = 
		var scrollBarWidth:Float = App.config.getScrollbarWidth(true);
		//
		var hasScrollbar:Bool = false;//tableRef.current.parentElement.offsetHeight < (tableRef.current.parentElement.offsetHeight-tHeadRef.current.offsetHeight);
		freeWidth = tableRef.current.parentElement.offsetWidth - tableRef.current.offsetWidth - (hasScrollbar?scrollBarWidth:0);
		freeWidth = tableRef.current.parentElement.offsetWidth - tableRef.current.offsetWidth;
		//if(_trace) trace('table.offsetWidth: ${tableRef.current.offsetWidth} parentElement.offsetWidth: ${tableRef.current.parentElement.offsetWidth} ');
		//if(_trace) trace('table.offsetWidth: ${tableRef.current.offsetWidth} tHeadRef.offsetWidth: ${tHeadRef.current.offsetWidth} ');
		if(_trace) trace('firstRowRef.current.offsetWidth:${firstRowRef.current.offsetWidth} scrollBarWidth:$scrollBarWidth');
		tableRef.current.setAttribute('style','margin-top:${tHeadRef.current.offsetHeight*-1}px');
					
		var i:Int = 0;
		var grow:Array<Int> = [];
		if (props.fullWidth)
		{
			for (cell in firstRowRef.current.children)
			{
				var cGrow = cell.getAttribute('data-grow');
				if (cGrow != null)
				{
					grow[i] = Std.parseInt(cGrow);
					//if(_trace) trace(grow[i]);
				}
				i++;
			}		
			var growSum:Int = 0;
			grow.iter(function(el) growSum += (el==null?0:el));
			//trace (grow +':' + growSum );
			if (growSum > 0)
			{
				var growUnit:Float = Math.ceil(freeWidth / growSum);
				//if(_trace) trace(growSum);		
				for (i in 0...grow.length)
				{
					if (grow[i] != null && grow[i] !=0)
					{
						//if(_trace) trace(grow[i] * growUnit + firstRowRef.current.children.item(i).offsetWidth);
						//if(_trace) trace('$i ${grow[i]} * $growUnit + ${firstRowRef.current.children.item(i).offsetWidth}');
						firstRowRef.current.children.item(i).setAttribute(
							'width', Std.string(grow[i] * growUnit + firstRowRef.current.children.item(i).offsetWidth) + 'px'
						);
					}
				}					
			}	
		//}
		i = 0;
		for (cell in tHeadRef.current.children)
		{
			var w:Int = cell.offsetWidth;
			//if(_trace) trace(w +':' + cell.clientWidth);
			var fixedHeaderCell = cast(fixedHeader.current.childNodes[i],Element);
			fixedHeaderCell.setAttribute('style', 'width:${i==0?w+1:w}px');
			i++;
		}}
		//if(_trace) trace('table.offsetWidth: ${tableRef.current.offsetWidth} tHeadRef.offsetWidth: ${tHeadRef.current.offsetWidth} ');
		var firstSelectedRow = firstRowRef.current.parentElement.querySelector('[class="is-selected"]');
		if(firstSelectedRow!=null)
		{
			//Browser.document.querySelector('[class="grid-container-inner"]').scrollTo(0,0);
			if(_trace) trace(firstSelectedRow.offsetTop);
			//Browser.document.querySelector('[class="grid-container-inner"]').scrollTop = firstSelectedRow.offsetTop - 100;
			firstSelectedRow.scrollIntoView();

		}
	}
	
	override function componentDidMount()//,snapshot:Dynamic
	{
		if(_trace && props.parentComponent.props.formRef!=null && props.parentComponent.props.formRef.current!=null) trace(props.parentComponent.props.formRef.current.name);	
		if(_trace && props.data!=null && props.data[0]!=null)
			trace(props.data[0].get('id'));
		//App.onResizeComponents.add(this);//TODO: IMPLEMENT LISTENER
		Browser.window.requestAnimationFrame(function (t:Float)
		{
			if(_trace) trace(t);
			layOut();
		});
	}

	override function componentDidUpdate(prevProps:Dynamic, prevState:Dynamic)//,snapshot:Dynamic
	{
		if(_trace) trace(headerUpdated + ':' + tHeadRef); 
		//if(_trace) trace(prevProps);
		if (tHeadRef != null)
		{
			//if (headerUpdated)
				//return;
			layOut();
			//showDims(tHeadRef);
			//nodeDims(fixedHeader.current);
		}
	}

	override public function componentWillUnmount():Void 
	{
		if(_trace) trace('leaving...');
		if(_timer != null)
			_timer.stop();
		//App.onResizeComponents.remove(this);//TODO: Implement Listener
	}

	override function shouldComponentUpdate(nextProps, nextState):Bool
	{
    	//if(_trace) trace(nextProps);
    	//if(_trace) trace(nextState);
		return true;
	}
	
	function showDims(ref:Dynamic)
	{
		var i:Int = 0;
		var s:Float = 0;
		var cells:Array<TableCellElement> = (ref.current != null? ref.current.cells : ref.cells);
		for (cell in cells)
		{
			if(_trace) trace(untyped cell.getBoundingClientRect().toJSON());
			s += cell.getBoundingClientRect().width;
		}
		if(_trace) trace(' sum:$s');
	}

	function nodeDims(n:Node)
	{
		var i:Int = 0;
		var s:Float = 0;
		var cells:NodeList = n.childNodes;
		for (cell in cells)
		{
			var dRect:DOMRect = untyped cast(cell, Element).getBoundingClientRect().toJSON();
			if(_trace) trace(dRect);
			//Out.dumpObject(cast(cell, Element).getBoundingClientRect());
			s += cast(cell, Element).getBoundingClientRect().width;
		}
		if(_trace) trace(' sum:$s');
	}
	



}
