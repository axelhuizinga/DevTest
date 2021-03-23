package view.table;

import react_virtualized.Types.ColumnSizerChildrenParam;
import react_virtualized.Types.CellRendererParams;
import view.shared.io.FormApi;
import js.html.Event;
import js.html.Element;
import js.Browser;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.ReactComponent;
import react.ReactMacro.jsx;
import react_virtualized.AutoSizer;
import react_virtualized.Table;
import react_virtualized.Column;
import react_virtualized.ColumnSizer;
import react_virtualized.Grid;
using Lambda;

typedef VCellRenderProps = {
	?className:String,
  columnIndex:Int, // Horizontal (column) index of cell
  ?isScrolling:Bool, // The Grid is currently being scrolled
  ?isVisible:Bool,   // This cell is visible within the grid (eg it is not an overscanned cell)
  key:String,         // Unique key within array of cells
  ?parent:Grid,      // Reference to the parent Grid (instance)
  rowIndex:Int,    // Vertical (row) index of cell
  style:Dynamic       // Style object to be applied to cell (to position it);
               // This must be passed through to the rendered cell element.
}

typedef IObj = {index:Int}

typedef RowClickParam = { event: Event, index:Int, rowData: Dynamic }

typedef VDataGridProps = 
{
	?autoSize:Bool,	
	?className:String,
	?columnClassName:String,
	?columnWidth:EitherType<Int,Function>,
	?columnMinWidth:EitherType<Int,Function>,
	?columnMaxWidth:EitherType<Int,Function>,
	?disableWidth:Bool,
	?disableHeight:Bool,
	?width:Int,
	?height:Int,	
	?id:String,
	?listColumns:Map<String,VDataColumn>,
	dataRows:Array<Dynamic>,
	
	?onResize:Function,
	?onRowClick:Function,
	?rowClassName:EitherType<String, Function>,
	?parentComponent:Dynamic,
	?renderPager:Void->ReactFragment
}

typedef VDataColumn = 
{
	?dbFormat:Function,
	?cellFormat:Function,
	?className:Dynamic,
	?editable:Bool,
	?flexGrow:Int,
	?headerClassName:String,
	?headerFormat:Function,
	?headerStyle:Dynamic,
	?label:String,
	?name:String,
	?title:String,
	?search:VSortDirection,
	?show:Bool,
	?style:Dynamic
}

typedef VDataGridState = 
{
	dataFields:Array<String>,
	?headerHeight:Int,
	?rowHeight:Int,
	?pageCount:Int,
	selectedRows:Array<Int>,
	size:VSize
}

typedef VSize = 
{
	height:Int,
	width:Int
}

class VDataGrid  extends ReactComponentOf<VDataGridProps, VDataGridState>{
	
	public function new(props:VDataGridProps) 
	{
		super(props);
		state = {
			dataFields: Reflect.fields(props.dataRows[0]),
			size:{width: 500, height:400},
			selectedRows:[]
		};
	}

	override public function componentDidMount():Void 
	{
		trace('ok');
		var container:Element = Browser.window.document.querySelector('#tableBox');//.parentElement;
		trace(container.offsetHeight);
		setState({size:{
			height:container.offsetHeight - container.lastElementChild.offsetHeight,
			width:container.offsetWidth
		}});
	}

	override public function render() 
	{
		return jsx('
			<div className="fixed-grid-container"  id="tableBox">
				${renderTable()}							
				${props.renderPager()}
			</div>	
		');	

		return jsx('
			<div className="fixed-grid-container"  id="tableBox">
				${renderColumnSizer()}							
				${props.renderPager()}
			</div>	
		');		
	}

	public function renderAutoSizer():ReactFragment
	{
		return react.ReactMacro.jsx('
			<$AutoSizer children=${
				function(size:Dynamic){
					trace(size);
					setState({size: size});
					return renderTable();
				}}
			/>
		');
	}

	public static function renderVirtualTable(props:VDataGridProps):VDataGrid
	{
		return new VDataGrid(props);
	}
	
/*	public function renderColumnSizerChildren(p:ColumnSizerChildrenParam):ReactFragment
	{
		return renderGrid({
			columnWidth:props.columnMinWidth,
			columnCount:state.dataFields.length,
			dataRows:props.dataRows,
			ref:p.registerChild
		});
	}*/

	public function renderGrid(p:ColumnSizerChildrenParam):ReactFragment	
	{
		return jsx('
		<div                    
                    style=${{
                      height: state.size.height,
                      width: state.size.width
                    }}>
		<$Grid cellRenderer=${renderCell}
		columnCount=${state.dataFields.length}
		columnWidth=${props.columnWidth}	
		rowHeight=${24}
		rowCount=${props.dataRows.length}
		height=${state.size.height} 
		width=${state.size.width}
		/></div>
		');
	}

	public function renderTable():ReactFragment
	{
		return react.ReactMacro.jsx('
			<$Table className="is-striped is-hoverable" width=${state.size.width}
			 onRowClick=${select}
			height=${state.size.height} rowHeight=${24}  headerHeight=${24} 
				rowGetter=${function(p:Dynamic){return props.dataRows[p.index];}} 
				rowCount=${props.dataRows.length} >
			${renderColumns(props.listColumns)}
			</$Table>
		');
	}//p:ColumnSizerChildrenParams
	public function renderColumnSizer():ReactFragment
	{
		return  jsx('
			<$ColumnSizer columnMinWidth=${props.columnMinWidth} columnMaxWidth=${props.columnMaxWidth}
				columnCount=${state.dataFields.length}  key="GridColumnSizer"
				width=${state.size.width}
				>
				${renderGrid}
			</$ColumnSizer>
		');
	/**
	 * ()
	 */
	}
	public function renderColumn(ki:Int,k:String,v:VDataColumn):ReactFragment	
	{
		return jsx('<$Column key=${'c_' + ki} dataKey=${k} label=${v.label} 
		flexGrow=${v.flexGrow} width=${100}/>');
	}
	
	public function renderCell(cellProps:Dynamic):ReactFragment
	{
		//CellRendererParams
		trace(cellProps.cellData);
		//trace(cellProps.columnData);//null why?
		trace(cellProps.rowData);
		//trace(cellProps.style);
		trace(Reflect.fields(cellProps));
		return jsx('
			<div className=${props.className} key=${cellProps.key} style=${cellProps.style}>
				${Reflect.field(props.dataRows[cellProps.rowIndex], state.dataFields[cellProps.columnIndex])}
			</div>		
		');
	}

	public function renderColumns(colProps:Map<String,VDataColumn>):ReactFragment
	{
		var ki:Int = 0;
		var style = {flex:"1 1"};
		//cellRenderer=${renderCell}
		return [for(k=>v in colProps.keyValueIterator())
		 jsx('<$Column key=${'c_' + ki++} dataKey=${k} label=${v.label} 
		 flexGrow=${v.flexGrow} flexShrink=${1} width=${100}  style=${style} />')
		];
	}

	public function select(mEvOrID:Dynamic)
	{
		trace('select from contructor:${mEvOrID.select}');
		var selected:Bool = state.selectedRows.has(mEvOrID.index);
		trace('${mEvOrID.rowData} selected:${selected}');
		trace(Reflect.fields(props));
		//trace(props.row +':' + props.data.toString());
		//select:function(id:Int,data:IntMap<Map<String,Dynamic>>,match:RouterMatch, ?selectType:SelectType)
		if(mEvOrID.event == null)
		{
			try{
				var evt:Event = cast(mEvOrID);
				var tEl:Element = cast(mEvOrID.target,Element);
				trace(tEl.closest('table'));
				//trace(Browser.window.document.querySelector('table'));
				/*TODO: IMPLEMENT MODIFIERS
				trace('altKey:${evt.altKey}');
				trace('ctrlKey:${evt.ctrlKey}');
				trace('shiftKey:${evt.shiftKey}');*/
				
				//var mEvt:MouseEvent = cast(evt.nativeEvent, MouseEvent);
			}
			catch(ex:Dynamic)
			{
				trace(ex);
			}
		}
		else 
		{
			var tEl:Element = (mEvOrID.event.target.classList.contains('ReactVirtualized__Table__row')?
				mEvOrID.event.target : mEvOrID.event.target.parentElement);
			if(!tEl.classList.contains('is-selected'))
			trace(tEl.classList.contains('is-selected'));
			{
				trace(FormApi.dyn2map(mEvOrID.rowData));
				props.parentComponent.props.select(mEvOrID.rowData.id, 
					[Std.int(mEvOrID.rowData.id)=>FormApi.dyn2map(mEvOrID.rowData)], props.parentComponent.props.match);
			}
			tEl.classList.toggle('is-selected');
		}
		if(props.parentComponent != null)
		{
			if(!selected)
			{
				/*props.parentComponent.props.select(props.data['id'], 
					[Std.int(props.data['id'])=>props.data], props.parentComponent.props.match);*/
			}//
			else
			{
				//props.parentComponent.props.select(props.data['id'], null,props.parentComponent.props.match, Unselect);
			}	
			
		}
		selected = mEvOrID.select ? true:!selected;
		trace('selected:$selected');
		//if(!mEvOrID.select)
			//forceUpdate();
	}	
}