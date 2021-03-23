package view.stats.history;

import js.d3.color.LAB;
import js.d3.color.HSL;
import eventtypes.electron.InAppPurchaseEventType;

import js.html.FormElement;
import js.html.svg.StopElement;

import js.html.MouseEvent;
import js.d3.time.Time;
import js.d3.locale.TimeFormat;
import js.Browser;
import js.html.Element;
import shared.Utils;
import react.ReactDOM;
import react.React.*;
import react.ReactRef;
import js.d3.selection.Selection;
import js.d3.D3;
import js.d3.D3.time;
import react.ReactComponent.ReactComponentOf;
import view.shared.io.DataAccess;
import view.shared.io.FormApi;
import view.table.Table.DataState;
import react.ReactComponent.ReactFragment;
import react.ReactMacro.jsx;
import shared.DbData;
import loader.BinaryLoader;
import state.AppState;
import model.stats.HistoryModel;
import haxe.Constraints.Function;
import haxe.extern.EitherType;
import view.shared.MItem;
import view.shared.io.BaseForm;
import view.shared.io.DataFormProps;
import state.FormState;

typedef ChartDataState =
{
	?altGroupPos:Int,
	columns:Map<String,ChartDataColumn>,
	?defaultSearch:Map<String,ChartDataColumn>,
	?search:Map<String,ChartDataColumn>
}

typedef ChartDataColumn = 
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
}

typedef ChartDataCellPos =
{
	column:Int,
	row:Int
}
typedef ChartDataCell =
{
	@:optional var cellFormat:Function;
	@:optional var className:Dynamic;
	@:optional var data:Dynamic;// CELL CONTENT VALUE
	@:optional var dataDisplay:Dynamic;// CELL CONTENT DISPLAY VALUE
	@:optional var dataType:Dynamic;// CELL CONTENT VALUE TYPE
	@:optional var name:String;
	@:optional var id:String;
	@:optional var pos:ChartDataCellPos;
	@:value(true)
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

class Charts extends ReactComponentOf<DataFormProps,FormState>
{
	public static var menuItems:Array<MItem> = [
		//{label:'Anzeigen',action:'get'},
		{label:'Einstellung',action:'setup',section: 'Charts'},
	//	{label:'Auswahl umkehren',action:'selectionInvert'},
	//	{label:'Auswahl alle',action:'selectionAll'},
	];
	
	var dataAccess:DataAccess;	
	var dataDisplay:Map<String,DataState>;

	var formFields:DataView;
	var formRef:ReactRef<FormElement>;
	var fieldNames:Array<String>;
	var baseForm:BaseForm;
	var dbData: shared.DbData;
	var dbMetaData:shared.DBMetaData;
	var chartBox:Element;
	var svg:Selection;

	public function new(props) 
	{
		super(props);
		dataDisplay = HistoryModel.dataDisplay;
		trace('...' + Reflect.fields(props));
		state =  App.initEState({
			dataTable:[],
			loading:false,
			//contactData:new IntMap(),			
			selectedRows:[],
			sideMenu:FormApi.initSideMenu( this,
				{
					dataClassPath:'reports.History',
					label:'Charts',
					section: 'Charts',
					items: menuItems
				}					
				,{	
					section: props.match.params.section==null? 'Chart':props.match.params.section, 
					sameWidth: true
				}),
			values:new Map<String,Dynamic>()
		},this);
		if(props.match.params.section==null||props.match.params.action==null)
		{
			//var sData = App.store.getState().dataStore.contactData;			
			var baseUrl:String = props.match.path.split(':section')[0];
			trace('redirecting to ${baseUrl}Charts/get');
			props.history.push('${baseUrl}Charts/get');
			get(null);
		}
		else 
		{
			state.formApi.doAction();
		}		
		trace(state.loading);
	}
	
	static function mapStateToProps(aState:AppState) 
	{
		trace ('never');
		return {
			userState:aState.userState
		};
	}

	public function get(ev:Dynamic):Void
	{
		trace('hi $ev');
		var offset:Int = 0;
		if(ev != null && ev.page!=null)
		{
			offset = Std.int(props.limit * ev.page);
		}
		var params:Dynamic = {
			dbUser:props.userState.dbUser,
			classPath:'stats.History',
			action:'get',
			filter:(props.filter==null?"termin<date_trunc('month', CURRENT_DATE)":props.filter),
			devIP:App.devIP,
			limit:props.limit,
			offset:offset>0?offset:0,
			order:'termin',
			table:'bank_transfers'
		};
		BinaryLoader.dbQuery(
			'${App.config.api}', 
			params,
			function(data:DbData)
			{			
				//UserAccess.jwtCheck(data);
				trace(data.dataInfo);
				trace(data.dataParams);
				trace(data.dataRows.length);
				if(data.dataRows.length>0) 
				{
					if(!data.dataErrors.keys().hasNext())
					{
						//data.dataRows.pop();
						setState({
						//props.parentComponent.setStateFromChild({
							//rows:dRows,
							dataTable:data.dataRows,
							dataCount:Std.parseInt(data.dataInfo['count'])
						});
						
						if(chartBox==null)
						chartBox = Browser.window.document.querySelector('.chartBox');
						trace(chartBox);
						if(chartBox!=null)
						draw();
					}
					else 
						setState({values: ['loadResult'=>'Kein Ergebnis','closeAfter'=>-1]});					
				}
			}
		);
	}
	
	override public function componentDidMount():Void 
	{	
		dataAccess = [
			'get' =>{
				source:[
					"contacts" => []
				],
				view:[]
			},
		];			
		//
		if(props.userState.dbUser != null)
		trace('yeah: ${props.userState.dbUser.first_name}');
		trace(props.match.params.action);
		//state.formApi.doAction();
		//chartBox = ReactDOM.findDOMNode(this);
		if(chartBox==null)
		chartBox = Browser.window.document.querySelector('.chartBox');
		trace(chartBox);
		if(chartBox!=null)
		draw();
	}

	function draw() {
		if(state.dataTable != null && state.dataTable.length>0)
			{		
		//trace(chartBox.outerHTML);	
		var cW:Int = chartBox.offsetWidth;
		var iX:Int = Math.floor(cW/state.dataTable.length);		
		cW = iX * state.dataTable.length;
		chartBox.style.width = cW + 'px';
		var cH:Int = chartBox.offsetHeight-1;
		var lH:Int = cH*0.064>24?Math.round(cH*0.064):24;
		cH -= lH;
		//var formatTime = D3.time.format;//("%b %Y");//TimeFormat.iso(
		var months = 'Jan,Feb,Mar,Apr,Mai,Jun,Jul,Aug,Sep,Okt,Nov,Dez'.split(',');
		var formatDate = function(dd:Dynamic){			
			//trace(dd);
			//var d:Date = Date.fromString(d.date);
			var d = dd.get('date').split('-');
			//trace(dd);
			//return 'hi';
			//trace('${months[Std.parseInt(d[1])-1]} ${d[0]}');
			
			return '${months[Std.parseInt(d[1])-1]} ${d[0]}';
			//return '${months[dd.getUTCMonth()]} ${DateTools.format(dd, '%Y')}';
		};
		var maxSum:Float = Utils.keyMax(state.dataTable,'sum');
		var maxCount:Int = Math.round(Utils.keyMax(state.dataTable, 'count'));
		var cRatio:Float = cH/maxCount;
		var sRatio:Float = cH/maxSum;
		trace('$maxCount => $maxSum $cW: $cRatio $sRatio ${state.dataTable.length} svg: ${svg!=null?svg:null}');
		trace(state.dataTable[0]);
		
		//var iW:Int = Math.floor(cW/state.dataTable.length)-2;
		var iW:Int = iX-2;
		if(svg!=null)
			return;
		var div = D3.select(".tabComponentForm").append("div")	
			.attr("class", "tooltip")				
			.style("opacity", 0);
		svg = D3.select('.chartBox').append('svg').attr('width',cW).attr('height', cH+lH);
		var svgDefs = svg.append('defs');

		var mainGradient = svgDefs.append('linearGradient')			
			.attr('x1', '0')
			.attr('y1', '100%')
			.attr('x2', '0')
			.attr('y2', '0')
			.attr('id', 'mainGradient')
			.attr('gradientUnits', 'userSpaceOnUse');

		// Create the stops of the main gradient. Each stop will be assigned
		// a class to style the stop using CSS.
		mainGradient.append('stop')
			.attr('class', 'stop-bottom')
			.attr('offset', '0');

		mainGradient.append('stop')
			.attr('class', 'stop-top')
			.attr('offset', '1');

		var stop1:StopElement = untyped mainGradient.selectAll('stop').node();
		trace(stop1.classList.value);
		trace(stop1.nextElementSibling.classList.value);
		//.attr("gradientTransform", "rotate(270)");
		//{var h = Std.parseFloat(d.get('sum'))*sRatio;trace(h);return h;}.attr("gradientTransform", "rotate(" + d3.select("#range1").property("value")+")");
		//if(state.dataTable != null && state.dataTable.length>0)
	/*	{
			trace(state.dataTable[0]);
			var iW:Int = Math.floor(cW/state.dataTable.length)-2;
			var iX:Float = cW/state.dataTable.length;*/
			trace(svg);
			svg.selectAll(null).data(state.dataTable).enter().append("rect")
				.attr('x', function(d:Dynamic,i:Int)return i*(iX))
			.attr('y',function(d:Dynamic,i:Int)return Math.floor(cH - sRatio * Std.parseFloat(d.get('sum')))).attr('width',iW)
			.attr('height',function(d:Dynamic,i:Int)return Math.ceil(Std.parseFloat(d.get('sum'))*sRatio)).attr("class", "gblue")
			.on("mouseover", function(d) {	
				var avg = App.sprintf('%.2f',Std.parseInt(d.get('sum'))/Std.parseInt(d.get('count')));
            div.transition()		
                .duration(200)		
                .style("opacity", .9);		
			div.html(formatDate(d) + "<br/>"  + Std.parseInt(d.get('sum')) + '€<br>${d.get('count')} Spenden' + '<br>$avg €/Spende')
                .style("left", (cast D3.event).pageX + "px")	
                .style("top", ((cast D3.event).pageY - 28) + "px");
            })					
			.on("mouseout", function(d) {		
				div.transition()		
					.duration(500)		
					.style("opacity", 0);	
			});
			//.attr('title',function(d:Dynamic, i:Int) return formatDate(d));
			drawLegend(cH, lH, cW, iW, iX);
		}
			
	}

	function drawLegend(top:Int,h:Int,lW:Int, iW:Int, iX:Float) {
		trace(svg);//data(state.dataTable).enter().
		trace('top:$top height:$h width:$lW');
		var legend:Selection = svg.append("g").attr('x', 0)
		.attr('transform','translate(0 '+top+')')
		.attr('id','legend')
		.attr('width',lW)
		.attr('height',h)
		.style("fill", 'rgba(0,0,0,0)');
		var years:Array<String> = state.dataTable.map(function (d) return d.get('date').split('-')[0]);
		//trace(years);
		var actYear:String = years[0];
		var yearX:Float = 0.0;
		var i:Int = 0;
		var iYear:String = '';
		for (iYear in years){
			//trace('$i $iYear');
			if(actYear != iYear)
			{
				var svg:Selection = legend.append('svg')
				.attr('y', 0)
				.attr('x', yearX)				
				.attr('width', (i*iX)-2-yearX)				
				.attr('height', h)
				.attr('viewBox', '0 0 ${(i*iX)-2-yearX} $h');
				svg.append('rect')				
				.attr('x', 0.0)
				.attr('y', 2)
				.attr('width', (i*iX)-2-yearX)
				.attr('height', h-4)
				.attr('fill', '#fff');
				//.attr('stroke', '#666')
				//.attr('stroke-width', '1');
				svg.append('text').text(actYear)
				.attr('text-anchor',"middle")
				.attr('fill', '#33a')
				.attr('y', '64%')
				.attr('x', '50%')
				.style('alignment-baseline','central');
				actYear = iYear;	
				yearX = i*iX;		
			}
			i++;
		};
		if(actYear != iYear)
		{
			var svg:Selection = legend.append('svg')
			.attr('y', 0)
			.attr('x', yearX)				
			.attr('width', (i*iX)-2-yearX)				
			.attr('height', h)
			.attr('viewBox', '0 0 ${(i*iX)-2-yearX} $h');
			svg.append('rect')				
			.attr('x', 0.0)
			.attr('y', 2)
			.attr('width', (i*iX)-2-yearX)
			.attr('height', h-4)
			.attr('fill', '#fff');
			//.attr('stroke', '#666')
			//.attr('stroke-width', '1');
			svg.append('text').text(actYear)
			.attr('y', '64%')
			.attr('text-anchor',"middle")
			.attr('fill', '#33a')
			.attr('x', '50%')
			.style('alignment-baseline','central');
			actYear = iYear;	
			yearX = i*iX;		
		}
	}
	
	function renderResults():ReactFragment
	{
		trace(props.match.params.section + ':${props.match.params.action}::' + Std.string(state.dataTable != null));
		//trace(dataDisplay["userList"]);
		if( state.dataTable.length==0)
			return state.formApi.renderWait();
		//trace('###########loading:' + state.rows[0]);
		return switch(props.match.params.action)
		{//  ${...props}<pre>${Std.string(state.dataTable)}</pre>
			case 'get':
				jsx('
					<form className="tabComponentForm" >
						<div className="chartBox"></div>
					</form>
				');
			default:
				null;
		}
		return null;
	}

	function getCellData(cP:Dynamic) {
		trace(cP);
	}
//cellDataGetter=${getCellData}
	
	override function render():ReactFragment
	{
		//if(state.dataTable != null)	trace(state.dataTable[0]);
		trace(props.match.params.section);		
		return state.formApi.render(jsx('
				${renderResults()}
		'));		
	}

	override public function componentWillUnmount() {
		trace('...');
	}
}