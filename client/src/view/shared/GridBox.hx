package view.shared;

import react.ReactComponent.ReactComponentOf;
import react.ReactMacro.*;
import react_tabelify.SmartGrid;
import shared.Utils;

/**
 * 
 * @author axel@cunity.me
 */

 typedef BaseGridProps =
 {
	>TableProps,
	autoSize:Bool,
	data:Array<Dynamic>,
	?headerHeight: Int,
	?headerClassName: String,
	height: Int,
	width: Int,
	?hideIndexRow: Bool,
	overscanRowCount: Int,
	rowCount: Int,
	sortBy:String,
	scrollToIndex: Int,
	?defaultSort:Dynamic, 	
	?id:String,
	?jwt:String,
	?first_name:String
}

typedef BaseGridState =
{
	clean:Bool,
	tableConfig:Dynamic,
	loading:Bool,
	scrollbarWidth:Int,
	hasError:Bool
}
class GridBox extends ReactComponentOf<BaseGridProps,BaseGridState> 
{
	
	public function new(?props:BaseGridProps) 
	{
		this.state = 
		{
			clean:false,
			loading:false,
			hasError:false,
			scrollbarWidth:0,
			tableConfig: {
                columnMetadata: [
                    {
                        "columnName": "cgpa",
                        "displayName": "CGPA",
                    },
                    {
                        "columnName": "name",
                        "displayName": "Name"
                    },
                ],
                currentPage: 1,
                showCheckbox:true,
                data:props.data,
                onChangeGrid: this.onChangeGrid,
                selectedRows: {},
                onRowClick: this.onRowClick,
                resultsPerPage: 10,
                // CustomRow: require('./CustomRow.js')
                // CustomHeader: require('./CustomHeader')
                // showHeader:false,
                // showFooter: false
                localSearch: true,
                // fixedHeight:100,
                // width: '1000px'
            }
		}
		//props.;
		super(props);
		trace(state.clean);
	}	
	
	function onRowClick(event:Dynamic, data:Dynamic) {
			trace(event);
			trace(data);
	}
	
	function onChangeGrid(event:Dynamic, data:Dynamic) {
        var tableConfig = this.state.tableConfig;
		trace(data);
        Utils.extend(tableConfig, data);
        this.setState({
            tableConfig: tableConfig
        });
    }
	
	override function componentDidCatch(error, info) {
		// Display fallback UI
		this.setState({ hasError: true });
		trace(error);
	}		
	
    override function render() {
		if(state.tableConfig.data != null)
			trace(state.tableConfig.data[2]);
		if (state.tableConfig.data.length == 0)
		{
			return jsx('
			<section className="hero is-alt">
			  <div className="hero-body">
			  <div className="loader"  style=${{width:'3rem', height:'3rem', margin:'auto', borderWidth:'0.58rem'}}/>
			  </div>
			</section>
			');					
		}
		
		return jsx('
			<SmartGrid {...state.tableConfig}/>
		');

	}
	
}