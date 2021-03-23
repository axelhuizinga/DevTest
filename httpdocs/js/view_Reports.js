(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[5],{

/***/ "./node_modules/haxe-loader/index.js?build/view_Reports!./":
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(global) {/* eslint-disable */ 
var $hx_exports = module.exports, $global = global;
var $s = $global.$hx_scope, $_;
var haxe_Log = $s.b, React_Component = $s.a, $hxClasses = $s.c, Reflect = $s.j, $extend = $s.g, react_ReactType = $s.h, React_Fragment = $s.k, bulma_$components_Tabs = $s.l, view_shared_TabLink = $s.m, React = $s.n, react_router_Switch = $s.bj, react_router_Route = $s.o, Std = $s.ae, App = $s.ag, haxe_ds_StringMap = $s.ah, haxe_Exception = $s.an, view_shared_io_FormApi = $s.p, loader_BinaryLoader = $s.bd, shared_Utils = $s.bi, redux_react_ReactRedux = $s.aj, react_ReactTypeOf = $s.ak, view_StatusBar = $s.be;
$hx_exports["me"] = $hx_exports["me"] || {};
$hx_exports["me"]["cunity"] = $hx_exports["me"]["cunity"] || {};
$hx_exports["me"]["cunity"]["debug"] = $hx_exports["me"]["cunity"]["debug"] || {};
$hx_exports["me"]["cunity"]["debug"]["Out"] = $hx_exports["me"]["cunity"]["debug"]["Out"] || {};
var model_stats_HistoryModel = function() { };
$hxClasses["model.stats.HistoryModel"] = model_stats_HistoryModel;
model_stats_HistoryModel.__name__ = "model.stats.HistoryModel";
var view_Reports = $hx_exports["default"] = function(props,context) {
	this.mounted = false;
	haxe_Log.trace(context,{ fileName : "view/Reports.hx", lineNumber : 31, className : "view.Reports", methodName : "new"});
	React_Component.call(this,props);
	if(props.match.url == "/Reports" && props.match.isExact) {
		haxe_Log.trace("pushing2: /Reports/History",{ fileName : "view/Reports.hx", lineNumber : 37, className : "view.Reports", methodName : "new"});
		props.history.push("/Reports/History/Charts/get");
	}
};
$hxClasses["view.Reports"] = view_Reports;
view_Reports.__name__ = "view.Reports";
view_Reports.mapStateToProps = function() {
	return function(aState) {
		haxe_Log.trace(Reflect.fields(aState),{ fileName : "view/Reports.hx", lineNumber : 61, className : "view.Reports", methodName : "mapStateToProps"});
		return { appConfig : aState.config, userState : aState.userState};
	};
};
view_Reports.__super__ = React_Component;
view_Reports.prototype = $extend(React_Component.prototype,{
	mounted: null
	,componentDidMount: function() {
		this.mounted = true;
		haxe_Log.trace("Ok",{ fileName : "view/Reports.hx", lineNumber : 46, className : "view.Reports", methodName : "componentDidMount"});
	}
	,componentDidCatch: function(error,info) {
		haxe_Log.trace(error,{ fileName : "view/Reports.hx", lineNumber : 54, className : "view.Reports", methodName : "componentDidCatch"});
	}
	,render: function() {
		var tmp = react_ReactType.fromComp(React_Fragment);
		var tmp1 = $$tre;
		var tmp2 = react_ReactType.fromString("div");
		var tmp3 = react_ReactType.fromComp(bulma_$components_Tabs);
		var tmp4 = { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_TabLink), props : Object.assign({ },this.props,{ to : "/Reports/History", children : "Entwicklung"}), key : null, ref : null};
		var tmp5 = { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_TabLink), props : Object.assign({ },this.props,{ to : "/Reports/Performance", children : "Leistung"}), key : null, ref : null};
		var tmp6 = $$tre;
		var tmp7 = react_ReactType.fromComp(view_shared_TabLink);
		var tmp8 = Object.assign({ },this.props,{ to : "/Reports/Preview", children : "Vorschau"});
		var tmp9 = { "$$typeof" : tmp1, type : tmp2, props : { className : "tabNav2", children : React.createElement(tmp3,{ className : "is-boxed"},tmp4,tmp5,{ "$$typeof" : tmp6, type : tmp7, props : tmp8, key : null, ref : null})}, key : null, ref : null};
		var tmp1 = $$tre;
		var tmp2 = react_ReactType.fromString("div");
		var tmp3 = react_ReactType.fromComp(react_router_Switch);
		var tmp4 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Reports/History/:section?/:action?/:id?", component : react_ReactType.fromComp(view_stats_History)}));
		var tmp5 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Reports/Performance/:section?/:action?/:id?", component : react_ReactType.fromComp(view_stats_Performance)}));
		var tmp6 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Reports/Preview/:section?/:action?/:id?", component : react_ReactType.fromComp(view_stats_Preview)}));
		var tmp7 = { "$$typeof" : tmp1, type : tmp2, props : { className : "tabContent2", children : React.createElement(tmp3,{ },tmp4,tmp5,tmp6)}, key : null, ref : null};
		var tmp1 = $$tre;
		return React.createElement(tmp,{ },tmp9,tmp7,{ "$$typeof" : tmp1, type : view_StatusBar._renderWrapper, props : this.props, key : null, ref : null});
	}
	,__class__: view_Reports
});
var view_stats_History = function(props) {
	React_Component.call(this,props);
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/stats/History.hx", lineNumber : 63, className : "view.stats.History", methodName : "new"});
	haxe_Log.trace(props.match.params,{ fileName : "view/stats/History.hx", lineNumber : 64, className : "view.stats.History", methodName : "new"});
	if(props.match.params.section == null) {
		haxe_Log.trace("reme",{ fileName : "view/stats/History.hx", lineNumber : 68, className : "view.stats.History", methodName : "new"});
		var baseUrl = props.match.path.split(":section")[0];
		props.history.push("" + baseUrl + "Charts/get");
	}
	this.state = App.initEState({ dataTable : [], loading : false, values : new haxe_ds_StringMap()},this);
};
$hxClasses["view.stats.History"] = view_stats_History;
view_stats_History.__name__ = "view.stats.History";
view_stats_History.mapDispatchToProps = function(dispatch) {
	haxe_Log.trace("ok",{ fileName : "view/stats/History.hx", lineNumber : 103, className : "view.stats.History", methodName : "mapDispatchToProps"});
	return { };
};
view_stats_History.mapStateToProps = function(aState) {
	haxe_Log.trace(Reflect.fields(aState),{ fileName : "view/stats/History.hx", lineNumber : 112, className : "view.stats.History", methodName : "mapStateToProps"});
	if(aState.dataStore.contactData != null) {
		haxe_Log.trace(aState.dataStore.contactData.keys().next(),{ fileName : "view/stats/History.hx", lineNumber : 114, className : "view.stats.History", methodName : "mapStateToProps"});
	}
	if(aState.dataStore.contactsDbData != null) {
		var tmp = aState.dataStore.contactsDbData.dataRows[0];
		haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/stats/History.hx", lineNumber : 116, className : "view.stats.History", methodName : "mapStateToProps"});
	} else {
		haxe_Log.trace(aState.dataStore,{ fileName : "view/stats/History.hx", lineNumber : 119, className : "view.stats.History", methodName : "mapStateToProps"});
		haxe_Log.trace(Reflect.fields(aState.dataStore),{ fileName : "view/stats/History.hx", lineNumber : 120, className : "view.stats.History", methodName : "mapStateToProps"});
	}
	haxe_Log.trace(App.store.getState().dataStore.contactsDbData,{ fileName : "view/stats/History.hx", lineNumber : 122, className : "view.stats.History", methodName : "mapStateToProps"});
	var bState = { dataStore : aState.dataStore, userState : aState.userState};
	haxe_Log.trace(bState.dataStore.contactData,{ fileName : "view/stats/History.hx", lineNumber : 129, className : "view.stats.History", methodName : "mapStateToProps"});
	return bState;
};
view_stats_History.__super__ = React_Component;
view_stats_History.prototype = $extend(React_Component.prototype,{
	dataAccess: null
	,dbData: null
	,componentDidCatch: function(error,info) {
		try {
			this.setState({ hasError : true});
		} catch( _g ) {
			var ex = haxe_Exception.caught(_g).unwrap();
			haxe_Log.trace(ex,{ fileName : "view/stats/History.hx", lineNumber : 87, className : "view.stats.History", methodName : "componentDidCatch"});
		}
		haxe_Log.trace(error,{ fileName : "view/stats/History.hx", lineNumber : 89, className : "view.stats.History", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		haxe_Log.trace(this.props.location.pathname,{ fileName : "view/stats/History.hx", lineNumber : 135, className : "view.stats.History", methodName : "componentDidMount"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/stats/History.hx", lineNumber : 146, className : "view.stats.History", methodName : "render"});
		if(this.props.match.params.section == "Charts") {
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_stats_history_Charts), props : Object.assign({ },this.props,{ limit : 100, parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		} else {
			return null;
		}
	}
	,__class__: view_stats_History
});
var view_stats_Performance = function(props,context) {
	React_Component.call(this,props,context);
};
$hxClasses["view.stats.Performance"] = view_stats_Performance;
view_stats_Performance.__name__ = "view.stats.Performance";
view_stats_Performance.__super__ = React_Component;
view_stats_Performance.prototype = $extend(React_Component.prototype,{
	render: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/stats/Performance.hx", lineNumber : 27, className : "view.stats.Performance", methodName : "render"});
		if(this.props.match.params.section == "Charts") {
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_stats_history_Charts), props : Object.assign({ },this.props,{ limit : 100, parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		} else {
			return null;
		}
	}
	,__class__: view_stats_Performance
});
var view_stats_Preview = function(props,context) {
	React_Component.call(this,props,context);
};
$hxClasses["view.stats.Preview"] = view_stats_Preview;
view_stats_Preview.__name__ = "view.stats.Preview";
view_stats_Preview.__super__ = React_Component;
view_stats_Preview.prototype = $extend(React_Component.prototype,{
	render: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/stats/Preview.hx", lineNumber : 50, className : "view.stats.Preview", methodName : "render"});
		if(this.props.match.params.section == "Charts") {
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_stats_history_Charts), props : Object.assign({ },this.props,{ limit : 100, parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		} else {
			return null;
		}
	}
	,__class__: view_stats_Preview
});
var view_stats_history_Charts = function(props) {
	React_Component.call(this,props);
	this.dataDisplay = model_stats_HistoryModel.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/stats/history/Charts.hx", lineNumber : 131, className : "view.stats.history.Charts", methodName : "new"});
	this.state = App.initEState({ dataTable : [], loading : false, selectedRows : [], sideMenu : view_shared_io_FormApi.initSideMenu2(this,{ dataClassPath : "reports.History", label : "Charts", section : "Charts", items : view_stats_history_Charts.menuItems},{ section : props.match.params.section == null ? "Chart" : props.match.params.section, sameWidth : true}), values : new haxe_ds_StringMap()},this);
	if(props.match.params.section == null || props.match.params.action == null) {
		var baseUrl = props.match.path.split(":section")[0];
		haxe_Log.trace("redirecting to " + baseUrl + "Charts/get",{ fileName : "view/stats/history/Charts.hx", lineNumber : 154, className : "view.stats.history.Charts", methodName : "new"});
		props.history.push("" + baseUrl + "Charts/get");
		this.get(null);
	} else {
		this.state.formApi.doAction();
	}
	haxe_Log.trace(this.state.loading,{ fileName : "view/stats/history/Charts.hx", lineNumber : 162, className : "view.stats.history.Charts", methodName : "new"});
};
$hxClasses["view.stats.history.Charts"] = view_stats_history_Charts;
view_stats_history_Charts.__name__ = "view.stats.history.Charts";
view_stats_history_Charts.mapStateToProps = function(aState) {
	haxe_Log.trace("never",{ fileName : "view/stats/history/Charts.hx", lineNumber : 167, className : "view.stats.history.Charts", methodName : "mapStateToProps"});
	return { userState : aState.userState};
};
view_stats_history_Charts.__super__ = React_Component;
view_stats_history_Charts.prototype = $extend(React_Component.prototype,{
	dataAccess: null
	,dataDisplay: null
	,formFields: null
	,formRef: null
	,fieldNames: null
	,baseForm: null
	,dbData: null
	,dbMetaData: null
	,chartBox: null
	,svg: null
	,get: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi " + Std.string(ev),{ fileName : "view/stats/history/Charts.hx", lineNumber : 175, className : "view.stats.history.Charts", methodName : "get"});
		var offset = 0;
		if(ev != null && ev.page != null) {
			offset = this.props.limit * ev.page | 0;
		}
		var params = { dbUser : this.props.userState.dbUser, className : "stats.History", action : "get", filter : this.props.filter == null ? "termin<date_trunc('month', CURRENT_DATE)" : this.props.filter, devIP : App.devIP, limit : this.props.limit, offset : offset > 0 ? offset : 0, order : "termin", table : "bank_transfers"};
		loader_BinaryLoader.dbQuery("" + Std.string(App.config.api),params,function(data) {
			haxe_Log.trace(data.dataInfo == null ? "null" : haxe_ds_StringMap.stringify(data.dataInfo.h),{ fileName : "view/stats/history/Charts.hx", lineNumber : 198, className : "view.stats.history.Charts", methodName : "get"});
			haxe_Log.trace(data.dataParams == null ? "null" : haxe_ds_StringMap.stringify(data.dataParams.h),{ fileName : "view/stats/history/Charts.hx", lineNumber : 199, className : "view.stats.history.Charts", methodName : "get"});
			haxe_Log.trace(data.dataRows.length,{ fileName : "view/stats/history/Charts.hx", lineNumber : 200, className : "view.stats.history.Charts", methodName : "get"});
			if(data.dataRows.length > 0) {
				if(!haxe_ds_StringMap.keysIterator(data.dataErrors.h).hasNext()) {
					data.dataRows.pop();
					_gthis.setState({ dataTable : data.dataRows, dataCount : Std.parseInt(data.dataInfo.h["count"])});
					if(_gthis.chartBox == null) {
						_gthis.chartBox = window.document.querySelector(".chartBox");
					}
					haxe_Log.trace(_gthis.chartBox,{ fileName : "view/stats/history/Charts.hx", lineNumber : 215, className : "view.stats.history.Charts", methodName : "get"});
					if(_gthis.chartBox != null) {
						_gthis.draw();
					}
				} else {
					var _gthis1 = _gthis;
					var _g = new haxe_ds_StringMap();
					_g.h["loadResult"] = "Kein Ergebnis";
					_g.h["closeAfter"] = -1;
					_gthis1.setState({ values : _g});
				}
			}
		});
	}
	,componentDidMount: function() {
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		var value = new haxe_ds_StringMap();
		_g1.h["contacts"] = value;
		var value = { source : _g1, view : new haxe_ds_StringMap()};
		_g.h["get"] = value;
		this.dataAccess = _g;
		if(this.props.userState.dbUser != null) {
			haxe_Log.trace("yeah: " + this.props.userState.dbUser.first_name,{ fileName : "view/stats/history/Charts.hx", lineNumber : 238, className : "view.stats.history.Charts", methodName : "componentDidMount"});
		}
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/stats/history/Charts.hx", lineNumber : 239, className : "view.stats.history.Charts", methodName : "componentDidMount"});
		if(this.chartBox == null) {
			this.chartBox = window.document.querySelector(".chartBox");
		}
		haxe_Log.trace(this.chartBox,{ fileName : "view/stats/history/Charts.hx", lineNumber : 244, className : "view.stats.history.Charts", methodName : "componentDidMount"});
		if(this.chartBox != null) {
			this.draw();
		}
	}
	,draw: function() {
		var cW = this.chartBox.offsetWidth - 1;
		var cH = this.chartBox.offsetHeight - 1;
		var lH = cH * 0.064 > 24 ? Math.round(cH * 0.064) : 24;
		cH -= lH;
		var months = "Jan,Feb,Mar,Apr,Mai,Jun,Jul,Aug,Sep,Okt,Nov,Dez".split(",");
		var formatDate = function(dd) {
			var d = dd.get("date").split("-");
			return "" + months[Std.parseInt(d[1]) - 1] + " " + d[0];
		};
		var maxSum = shared_Utils.keyMax(this.state.dataTable,"sum");
		var maxCount = Math.round(shared_Utils.keyMax(this.state.dataTable,"count"));
		var cRatio = cH / maxCount;
		var sRatio = cH / maxSum;
		haxe_Log.trace("" + maxCount + " => " + maxSum + " " + cW + ": " + cRatio + " " + sRatio + " " + this.state.dataTable.length + " svg: " + Std.string(this.svg != null ? this.svg : null),{ fileName : "view/stats/history/Charts.hx", lineNumber : 272, className : "view.stats.history.Charts", methodName : "draw"});
		if(this.svg != null) {
			return;
		}
		var div = d3.select(".tabComponentForm").append("div").attr("class","tooltip").style("opacity",0);
		this.svg = d3.select(".chartBox").append("svg").attr("width",cW).attr("height",cH + lH);
		var svgDefs = this.svg.append("defs");
		var mainGradient = svgDefs.append("linearGradient").attr("x1","0").attr("y1","100%").attr("x2","0").attr("y2","0").attr("id","mainGradient").attr("gradientUnits","userSpaceOnUse");
		mainGradient.append("stop").attr("class","stop-bottom").attr("offset","0");
		mainGradient.append("stop").attr("class","stop-top").attr("offset","1");
		var stop1 = mainGradient.selectAll("stop").node();
		haxe_Log.trace(stop1.classList.value,{ fileName : "view/stats/history/Charts.hx", lineNumber : 300, className : "view.stats.history.Charts", methodName : "draw"});
		haxe_Log.trace(stop1.nextElementSibling.classList.value,{ fileName : "view/stats/history/Charts.hx", lineNumber : 301, className : "view.stats.history.Charts", methodName : "draw"});
		if(this.state.dataTable != null && this.state.dataTable.length > 0) {
			var tmp = this.state.dataTable[0];
			haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/stats/history/Charts.hx", lineNumber : 306, className : "view.stats.history.Charts", methodName : "draw"});
			var iW = Math.floor(cW / this.state.dataTable.length) - 2;
			var iX = cW / this.state.dataTable.length;
			haxe_Log.trace(this.svg,{ fileName : "view/stats/history/Charts.hx", lineNumber : 309, className : "view.stats.history.Charts", methodName : "draw"});
			this.svg.selectAll(null).data(this.state.dataTable).enter().append("rect").attr("x",function(d,i) {
				return i * iX;
			}).attr("y",function(d,i) {
				return Math.floor(cH - sRatio * parseFloat(d.get("sum")));
			}).attr("width",iW).attr("height",function(d,i) {
				return Math.ceil(parseFloat(d.get("sum")) * sRatio);
			}).attr("class","gblue").on("mouseover",function(d) {
				var avg = App.sprintf("%.2f",Std.parseInt(d.get("sum")) / Std.parseInt(d.get("count")));
				div.transition().duration(200).style("opacity",.9);
				div.html(formatDate(d) + "<br/>" + Std.parseInt(d.get("sum")) + ("€<br>" + d.get("count") + " Spenden") + ("<br>" + avg + " €/Spende")).style("left",d3.event.pageX + "px").style("top",d3.event.pageY - 28 + "px");
			}).on("mouseout",function(d) {
				div.transition().duration(500).style("opacity",0);
			});
			this.drawLegend(cH,lH,cW,iW,iX);
		}
	}
	,drawLegend: function(top,h,lW,iW,iX) {
		haxe_Log.trace(this.svg,{ fileName : "view/stats/history/Charts.hx", lineNumber : 335, className : "view.stats.history.Charts", methodName : "drawLegend"});
		haxe_Log.trace("top:" + top + " height:" + h + " width:" + lW,{ fileName : "view/stats/history/Charts.hx", lineNumber : 336, className : "view.stats.history.Charts", methodName : "drawLegend"});
		var legend = this.svg.append("g").attr("x",0).attr("transform","translate(0 " + top + ")").attr("id","legend").attr("width",lW).attr("height",h).style("fill","rgba(0,0,0,0)");
		var _this = this.state.dataTable;
		var result = new Array(_this.length);
		var _g = 0;
		var _g1 = _this.length;
		while(_g < _g1) {
			var i = _g++;
			result[i] = _this[i].h["date"].split("-")[0];
		}
		var years = result;
		var actYear = years[0];
		var yearX = 0.0;
		var i = 0;
		var iYear = "";
		var _g = 0;
		while(_g < years.length) {
			var iYear1 = years[_g];
			++_g;
			if(actYear != iYear1) {
				var svg = legend.append("svg").attr("y",0).attr("x",yearX).attr("width",i * iX - 3 - yearX).attr("height",h).attr("viewBox","0 0 " + (i * iX - 2 - yearX) + " " + h);
				svg.append("rect").attr("x",0.5).attr("y",2).attr("width",i * iX - 3 - yearX).attr("height",h - 4).attr("fill","#fff");
				svg.append("text").text(actYear).attr("text-anchor","middle").attr("fill","#33a").attr("y","64%").attr("x","50%").style("alignment-baseline","central");
				actYear = iYear1;
				yearX = i * iX;
			}
			++i;
		}
		if(actYear != iYear) {
			var svg = legend.append("svg").attr("y",0).attr("x",yearX).attr("width",i * iX - 3 - yearX).attr("height",h).attr("viewBox","0 0 " + (i * iX - 2 - yearX) + " " + h);
			svg.append("rect").attr("x",0.5).attr("y",2).attr("width",i * iX - 3 - yearX).attr("height",h - 4).attr("fill","#fff");
			svg.append("text").text(actYear).attr("y","64%").attr("text-anchor","middle").attr("fill","#33a").attr("x","50%").style("alignment-baseline","central");
			actYear = iYear;
			yearX = i * iX;
		}
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + (":" + this.props.match.params.action + "::") + Std.string(this.state.dataTable != null),{ fileName : "view/stats/history/Charts.hx", lineNumber : 407, className : "view.stats.history.Charts", methodName : "renderResults"});
		if(this.state.dataTable.length == 0) {
			return this.state.formApi.renderWait();
		}
		if(this.props.match.params.action == "get") {
			return { "$$typeof" : $$tre, type : react_ReactType.fromString("form"), props : { className : "tabComponentForm", children : { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "chartBox"}, key : null, ref : null}}, key : null, ref : null};
		} else {
			return null;
		}
	}
	,getCellData: function(cP) {
		haxe_Log.trace(cP,{ fileName : "view/stats/history/Charts.hx", lineNumber : 427, className : "view.stats.history.Charts", methodName : "getCellData"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/stats/history/Charts.hx", lineNumber : 434, className : "view.stats.history.Charts", methodName : "render"});
		return this.state.formApi.render(this.renderResults());
	}
	,componentWillUnmount: function() {
		haxe_Log.trace("...",{ fileName : "view/stats/history/Charts.hx", lineNumber : 441, className : "view.stats.history.Charts", methodName : "componentWillUnmount"});
	}
	,__class__: view_stats_history_Charts
});
function $getIterator(o) { if( o instanceof Array ) return new haxe_iterators_ArrayIterator(o); else return o.iterator(); }
var $$tre = (typeof Symbol === "function" && Symbol.for && Symbol.for("react.element")) || 0xeac7;
if(typeof(performance) != "undefined" ? typeof(performance.now) == "function" : false) {
	HxOverrides.now = performance.now.bind(performance);
}
model_stats_HistoryModel.dataAccess = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	{
		var _g1 = new haxe_ds_StringMap();
		var _g2 = new haxe_ds_StringMap();
		_g2.h["filter"] = "id";
		_g1.h["contacts"] = _g2;
		var _g2 = new haxe_ds_StringMap();
		var _g3 = new haxe_ds_StringMap();
		_g3.h[""] = "Unbekannt";
		_g3.h["Herr"] = "Herr";
		_g3.h["Frau"] = "Frau";
		_g3.h["Familie"] = "Familie";
		_g3.h["Firma"] = "Firma";
		_g2.h["title"] = { label : "Anrede", type : "Select", options : _g3};
		_g2.h["title_pro"] = { label : "Titel"};
		_g2.h["first_name"] = { label : "Vorname"};
		_g2.h["last_name"] = { label : "Name"};
		_g2.h["email"] = { label : "Email"};
		_g2.h["phone_code"] = { label : "Landesvorwahl"};
		_g2.h["phone_number"] = { label : "Telefon"};
		_g2.h["mobile"] = { label : "Mobil"};
		_g2.h["fax"] = { label : "Fax"};
		_g2.h["company_name"] = { label : "Firmenname"};
		_g2.h["address"] = { label : "Strasse"};
		_g2.h["address_2"] = { label : "Hausnummer"};
		_g2.h["postal_code"] = { label : "PLZ"};
		_g2.h["city"] = { label : "Ort"};
		var _g3 = new haxe_ds_StringMap();
		_g3.h["active"] = "Aktiv";
		_g3.h["passive"] = "Passiv";
		_g3.h["blocked"] = "Gesperrt";
		_g2.h["state"] = { label : "Status", type : "Select", options : _g3};
		_g2.h["country_code"] = { label : "Land"};
		_g2.h["co_field"] = { label : "Adresszusatz"};
		_g2.h["creation_date"] = { label : "Hinzugefügt", type : "DateTimePicker", disabled : true, displayFormat : function() {
			return "d.m.Y H:i:S";
		}};
		_g2.h["date_of_birth"] = { label : "Geburtsdatum", type : "DatePicker", displayFormat : function() {
			return "d.m.Y";
		}};
		var _g3 = new haxe_ds_StringMap();
		_g3.h[""] = "Unbekannt";
		_g3.h["M"] = "Männlich";
		_g3.h["F"] = "Weiblich";
		_g2.h["gender"] = { label : "Geschlecht", type : "Select", options : _g3};
		_g2.h["comments"] = { label : "Kommentar"};
		_g2.h["use_email"] = { label : "Post per Email", type : "Checkbox"};
		_g2.h["ba_id"] = { type : "Hidden"};
		_g2.h["edited_by"] = { type : "Hidden"};
		_g2.h["mandator"] = { type : "Hidden"};
		_g.h["update"] = { source : _g1, view : _g2};
	}
	$r = _g;
	return $r;
}(this));
model_stats_HistoryModel.listColumns = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["first_name"] = { label : "Vorname", flexGrow : 0};
	_g.h["last_name"] = { label : "Name", flexGrow : 0};
	_g.h["email"] = { label : "Email"};
	_g.h["phone_number"] = { label : "Telefon"};
	_g.h["address"] = { label : "Straße"};
	_g.h["address_2"] = { label : "Hausnummer"};
	_g.h["co_field"] = { label : "Adresszusatz", flexGrow : 1};
	_g.h["postal_code"] = { label : "PLZ"};
	_g.h["city"] = { label : "Ort"};
	_g.h["state"] = { label : "Status", className : "tCenter", cellFormat : function(v) {
		var uState = v == "active" ? "user" : "user-slash";
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("span"), props : { className : "fa fa-" + uState}, key : null, ref : null};
	}};
	_g.h["id"] = { show : false};
	$r = _g;
	return $r;
}(this));
model_stats_HistoryModel.dataDisplay = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["contactList"] = { columns : model_stats_HistoryModel.listColumns};
	$r = _g;
	return $r;
}(this));
view_Reports._renderWrapper = (redux_react_ReactRedux.connect(view_Reports.mapStateToProps))(react_ReactTypeOf.fromComp(view_Reports));
view_Reports.__jsxStatic = view_Reports._renderWrapper;
view_stats_History._renderWrapper = (redux_react_ReactRedux.connect(view_stats_History.mapStateToProps,view_stats_History.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_stats_History));
view_stats_History.__jsxStatic = view_stats_History._renderWrapper;
view_stats_history_Charts.menuItems = [{ label : "Einstellung", action : "setup", section : "Charts"}];
$s.view_Reports = view_Reports; 

/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__("./node_modules/webpack/buildin/global.js")))

/***/ })

}]);