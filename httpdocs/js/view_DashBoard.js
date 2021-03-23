(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[3],{

/***/ "./node_modules/haxe-loader/index.js?build/view_DashBoard!./":
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(global) {/* eslint-disable */ 
var $hx_exports = module.exports, $global = global;
var $s = $global.$hx_scope, $_;
var React_Component = $s.a, haxe_Log = $s.b, $hxClasses = $s.c, redux_Action = $s.d, action_AppAction = $s.e, action_ConfigAction = $s.f, $extend = $s.g, react_ReactType = $s.h, js_Boot = $s.i, Reflect = $s.j, React_Fragment = $s.k, bulma_$components_Tabs = $s.l, view_shared_TabLink = $s.m, React = $s.n, react_router_Route = $s.o, view_shared_io_FormApi = $s.p, view_table_Table = $s.aa, haxe_ds_Either = $s.ab, haxe_http_HttpJs = $s.ac, $bind = $s.ad, Std = $s.ae, me_cunity_debug_Out = $s.af, App = $s.ag, haxe_ds_StringMap = $s.ah, view_shared_SMenu = $s.ai, redux_react_ReactRedux = $s.aj, react_ReactTypeOf = $s.ak, react_ReactRef = $s.al, haxe_Unserializer = $s.am, haxe_Exception = $s.an, haxe_Serializer = $s.ao, view_shared_FormBuilder = $s.ap, action_async_CRUD = $s.ba, action_async_LivePBXSync = $s.bb, action_StatusAction = $s.bc, loader_BinaryLoader = $s.bd, view_StatusBar = $s.be;
$hx_exports["me"] = $hx_exports["me"] || {};
$hx_exports["me"]["cunity"] = $hx_exports["me"]["cunity"] || {};
$hx_exports["me"]["cunity"]["debug"] = $hx_exports["me"]["cunity"]["debug"] || {};
$hx_exports["me"]["cunity"]["debug"]["Out"] = $hx_exports["me"]["cunity"]["debug"]["Out"] || {};
var loader_AjaxLoader = function(cb,p,r) {
	this.cB = cb;
	this.params = p;
	this.post = p != null;
	this.req = r;
};
$hxClasses["loader.AjaxLoader"] = loader_AjaxLoader;
loader_AjaxLoader.__name__ = "loader.AjaxLoader";
loader_AjaxLoader.load = function(url,params,cB) {
	var req = new haxe_http_HttpJs(url);
	if(params != null) {
		var _g = 0;
		var _g1 = Reflect.fields(params);
		while(_g < _g1.length) {
			var k = _g1[_g];
			++_g;
			req.addParameter(k,Reflect.field(params,k));
		}
	}
	req.addHeader("Access-Control-Allow-Methods","PUT, GET, POST, DELETE, OPTIONS");
	req.addHeader("Access-Control-Allow-Origin","*");
	var loader = new loader_AjaxLoader(cB);
	req.onData = $bind(loader,loader._onData);
	req.onError = function(err) {
		haxe_Log.trace(err,{ fileName : "loader/AjaxLoader.hx", lineNumber : 34, className : "loader.AjaxLoader", methodName : "load"});
	};
	haxe_Log.trace("POST? " + Std.string(params) != null,{ fileName : "loader/AjaxLoader.hx", lineNumber : 35, className : "loader.AjaxLoader", methodName : "load"});
	req.withCredentials = true;
	req.request(params != null);
	return req;
};
loader_AjaxLoader.loadData = function(url,params,cB) {
	var loader = loader_AjaxLoader.queue(url,params,cB);
	loader_AjaxLoader.rqs.push(loader.req);
	if(loader_AjaxLoader.rqs.length == 1) {
		loader_AjaxLoader.rqs.shift().request(loader.post);
	}
	return loader.req;
};
loader_AjaxLoader.queue = function(url,params,cB) {
	var req = new haxe_http_HttpJs(url);
	if(params != null) {
		var _g = 0;
		var _g1 = Reflect.fields(params);
		while(_g < _g1.length) {
			var k = _g1[_g];
			++_g;
			req.addParameter(k,Reflect.field(params,k));
		}
	}
	req.addHeader("Access-Control-Allow-Methods","PUT, GET, POST, DELETE, OPTIONS");
	req.addHeader("Access-Control-Allow-Origin","*");
	var loader = new loader_AjaxLoader(cB,params,req);
	loader.url = url;
	req.onData = $bind(loader,loader._onQueueData);
	req.onError = function(err) {
		haxe_Log.trace(err,{ fileName : "loader/AjaxLoader.hx", lineNumber : 119, className : "loader.AjaxLoader", methodName : "queue"});
		me_cunity_debug_Out.dumpObject(req,{ fileName : "loader/AjaxLoader.hx", lineNumber : 119, className : "loader.AjaxLoader", methodName : "queue"});
	};
	haxe_Log.trace("POST? " + Std.string(params) != null,{ fileName : "loader/AjaxLoader.hx", lineNumber : 120, className : "loader.AjaxLoader", methodName : "queue"});
	req.withCredentials = true;
	return loader;
};
loader_AjaxLoader.prototype = {
	cB: null
	,params: null
	,post: null
	,req: null
	,url: null
	,_onData: function(response) {
		if(response.length > 0) {
			var dataObj = JSON.parse(response);
			if(dataObj.error != "") {
				haxe_Log.trace(dataObj.error,{ fileName : "loader/AjaxLoader.hx", lineNumber : 62, className : "loader.AjaxLoader", methodName : "_onData"});
				dataObj.data = { error : dataObj.error, rows : []};
			}
			if(this.cB != null) {
				this.cB(dataObj.data);
			}
		}
	}
	,_onError: function(err) {
	}
	,_onQueueData: function(response) {
		if(response.length > 0) {
			var dataObj = JSON.parse(response);
			if(dataObj.error != "") {
				haxe_Log.trace(dataObj.error,{ fileName : "loader/AjaxLoader.hx", lineNumber : 84, className : "loader.AjaxLoader", methodName : "_onQueueData"});
				dataObj.data = { error : dataObj.error, rows : []};
			}
			if(this.cB != null) {
				this.cB(dataObj.data);
			}
			if(loader_AjaxLoader.rqs.length > 0) {
				loader_AjaxLoader.rqs.shift().request(this.post);
			}
		}
	}
	,__class__: loader_AjaxLoader
};
var view_DashBoard = $hx_exports["default"] = function(props) {
	this.renderCount = 0;
	this.rendered = false;
	this.mounted = false;
	this.state = { hasError : false, mounted : false};
	React_Component.call(this,props);
	if(props.match.url == "/DashBoard") {
		props.history.push("/DashBoard/Settings");
		haxe_Log.trace("pushed2: /DashBoard/Settings",{ fileName : "view/DashBoard.hx", lineNumber : 58, className : "view.DashBoard", methodName : "new"});
	}
};
$hxClasses["view.DashBoard"] = view_DashBoard;
view_DashBoard.__name__ = "view.DashBoard";
view_DashBoard.mapDispatchToProps = function(dispatch) {
	return { setThemeColor : function() {
		dispatch(redux_Action.map(action_AppAction.Config(action_ConfigAction.SetTheme("violet"))));
	}};
};
view_DashBoard.mapStateToProps = function(aState) {
	var uState = aState.userState;
	return { appConfig : aState.config, redirectAfterLogin : aState.locationStore.redirectAfterLogin, userState : uState};
};
view_DashBoard.__super__ = React_Component;
view_DashBoard.prototype = $extend(React_Component.prototype,{
	mounted: null
	,rendered: null
	,renderCount: null
	,componentDidMount: function() {
		this.mounted = true;
	}
	,componentDidCatch: function(error,info) {
		if(this.mounted) {
			this.setState({ hasError : true});
		}
		haxe_Log.trace(error,{ fileName : "view/DashBoard.hx", lineNumber : 74, className : "view.DashBoard", methodName : "componentDidCatch"});
		haxe_Log.trace(info,{ fileName : "view/DashBoard.hx", lineNumber : 75, className : "view.DashBoard", methodName : "componentDidCatch"});
	}
	,componentWillUnmount: function() {
		haxe_Log.trace("leaving...",{ fileName : "view/DashBoard.hx", lineNumber : 80, className : "view.DashBoard", methodName : "componentWillUnmount"});
	}
	,render: function() {
		if(this.state.hasError) {
			var tmp = $$tre;
			var tmp1 = react_ReactType.fromString("h1");
			var c = js_Boot.getClass(this);
			return { "$$typeof" : tmp, type : tmp1, props : { children : ["Fehler in ",c.__name__,"."]}, key : null, ref : null};
		}
		haxe_Log.trace(Reflect.fields(this.props),{ fileName : "view/DashBoard.hx", lineNumber : 121, className : "view.DashBoard", methodName : "render"});
		haxe_Log.trace(Reflect.fields(this.state),{ fileName : "view/DashBoard.hx", lineNumber : 122, className : "view.DashBoard", methodName : "render"});
		var tmp = react_ReactType.fromComp(React_Fragment);
		var tmp1 = $$tre;
		var tmp2 = react_ReactType.fromString("div");
		var tmp3 = react_ReactType.fromComp(bulma_$components_Tabs);
		var tmp4 = { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_TabLink), props : Object.assign({ },this.props,{ to : "/DashBoard/Roles", children : "Benutzer"}), key : null, ref : null};
		var tmp5 = { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_TabLink), props : Object.assign({ },this.props,{ to : "/DashBoard/Settings", children : "Meine Einstellungen"}), key : null, ref : null};
		var tmp6 = $$tre;
		var tmp7 = react_ReactType.fromComp(view_shared_TabLink);
		var tmp8 = Object.assign({ },this.props,{ to : "/DashBoard/Setup", children : "Setup"});
		var tmp9 = { "$$typeof" : tmp1, type : tmp2, props : { className : "tabNav2", children : React.createElement(tmp3,{ className : "is-boxed"},tmp4,tmp5,{ "$$typeof" : tmp6, type : tmp7, props : tmp8, key : null, ref : null})}, key : null, ref : null};
		var tmp1 = { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "tabContent2", children : [React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/DashBoard/Roles/:section?/:action?/:id?", component : react_ReactType.fromComp(view_dashboard_Roles)})),React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/DashBoard/Settings/:section?/:action?/:id?", component : react_ReactType.fromComp(view_dashboard_Settings)})),React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/DashBoard/Setup/:section?/:action?", component : react_ReactType.fromComp(view_dashboard_Setup)}))]}, key : null, ref : null};
		var tmp2 = $$tre;
		return React.createElement(tmp,{ },tmp9,tmp1,{ "$$typeof" : tmp2, type : view_StatusBar._renderWrapper, props : this.props, key : null, ref : null});
	}
	,internalRedirect: function(path) {
		if(path == null) {
			path = "/DashBoard/Settings";
		}
		this.props.history.push(path);
		return null;
	}
	,__class__: view_DashBoard
});
var view_dashboard_DB = function(props) {
	React_Component.call(this,props);
	this.dataDisplay = view_dashboard_model_DBFormsModel.dataDisplay;
	this.state = { formApi : new view_shared_io_FormApi(this), hasError : false, sideMenu : props.sideMenu};
};
$hxClasses["view.dashboard.DB"] = view_dashboard_DB;
view_dashboard_DB.__name__ = "view.dashboard.DB";
view_dashboard_DB.mapStateToProps = function(aState) {
	return { userState : aState.userState};
};
view_dashboard_DB.__super__ = React_Component;
view_dashboard_DB.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,createFieldList: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi :)",{ fileName : "view/dashboard/DB.hx", lineNumber : 76, className : "view.dashboard.DB", methodName : "createFieldList"});
		this.state.formApi.requests.push(haxe_ds_Either.Left(view_shared_io_Loader.load("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, className : "tools.DB", action : "createFieldList", update : "1"},function(data) {
			haxe_Log.trace(data == null ? "null" : haxe_ds_StringMap.stringify(data.h),{ fileName : "view/dashboard/DB.hx", lineNumber : 88, className : "view.dashboard.DB", methodName : "createFieldList"});
			if(Object.prototype.hasOwnProperty.call(data.h,"error")) {
				haxe_Log.trace(data.h["error"],{ fileName : "view/dashboard/DB.hx", lineNumber : 92, className : "view.dashboard.DB", methodName : "createFieldList"});
				return;
			}
			_gthis.setState({ data : data});
		})));
		haxe_Log.trace(this.props.history,{ fileName : "view/dashboard/DB.hx", lineNumber : 98, className : "view.dashboard.DB", methodName : "createFieldList"});
		haxe_Log.trace(this.props.match,{ fileName : "view/dashboard/DB.hx", lineNumber : 99, className : "view.dashboard.DB", methodName : "createFieldList"});
	}
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/dashboard/DB.hx", lineNumber : 105, className : "view.dashboard.DB", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,editTableFields: function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/dashboard/DB.hx", lineNumber : 112, className : "view.dashboard.DB", methodName : "editTableFields"});
		var data = this.state.formApi.selectedRowsMap(this.state);
		var view = haxe_ds_StringMap.createCopy(this.dataAccess.h["editTableFields"].view.h);
		haxe_Log.trace(this.dataAccess.h["editTableFields"].view.h["table_name"],{ fileName : "view/dashboard/DB.hx", lineNumber : 115, className : "view.dashboard.DB", methodName : "editTableFields"});
		haxe_Log.trace(data[0].h["id"] + "<",{ fileName : "view/dashboard/DB.hx", lineNumber : 116, className : "view.dashboard.DB", methodName : "editTableFields"});
	}
	,initStateFromDataTable: function(dt) {
		var iS = { };
		var _g = 0;
		while(_g < dt.length) {
			var dR = dt[_g];
			++_g;
			var rS = { };
			var k = haxe_ds_StringMap.keysIterator(dR.h);
			while(k.hasNext()) {
				var k1 = k.next();
				haxe_Log.trace(k1,{ fileName : "view/dashboard/DB.hx", lineNumber : 142, className : "view.dashboard.DB", methodName : "initStateFromDataTable"});
				if(this.dataDisplay.h["fieldsList"].columns.h[k1].cellFormat == view_dashboard_model_DBFormsModel.formatBool) {
					rS[k1] = dR.h[k1] == "Y";
				} else {
					rS[k1] = dR.h[k1];
				}
			}
			iS[dR.h["id"]] = rS;
		}
		haxe_Log.trace(iS,{ fileName : "view/dashboard/DB.hx", lineNumber : 152, className : "view.dashboard.DB", methodName : "initStateFromDataTable"});
		return iS;
	}
	,saveTableFields: function(vA) {
		haxe_Log.trace(vA,{ fileName : "view/dashboard/DB.hx", lineNumber : 158, className : "view.dashboard.DB", methodName : "saveTableFields"});
	}
	,showFieldList: function(_) {
		this.state.formApi.requests.push(null);
	}
	,componentDidMount: function() {
		haxe_Log.trace("Ok",{ fileName : "view/dashboard/DB.hx", lineNumber : 227, className : "view.dashboard.DB", methodName : "componentDidMount"});
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		_g1.h["selectedRows"] = null;
		var _g2 = new haxe_ds_StringMap();
		_g2.h["table_name"] = { label : "Tabelle", disabled : true};
		_g2.h["field_name"] = { label : "Feldname", disabled : true};
		_g2.h["field_type"] = { label : "Datentyp", type : "Select"};
		_g2.h["element"] = { label : "Eingabefeld", type : "Select"};
		_g2.h["disabled"] = { label : "Readonly", type : "Checkbox"};
		_g2.h["required"] = { label : "Required", type : "Checkbox"};
		_g2.h["use_as_index"] = { label : "Index", type : "Checkbox"};
		_g2.h["any"] = { label : "Eigenschaften", disabled : true, type : "Hidden"};
		_g2.h["id"] = { primary : true, type : "Hidden"};
		_g.h["editTableFields"] = { source : _g1, view : _g2};
		_g.h["saveTableFields"] = { source : null, view : null};
		this.dataAccess = _g;
	}
	,renderResults: function() {
		if(this.state.dataTable != null) {
			switch(this.props.match.params.action) {
			case "editTableFields":
				return null;
			case "showFieldList":
				haxe_Log.trace(Std.string(this.state.dataTable[29].h["id"]) + "<<<",{ fileName : "view/dashboard/DB.hx", lineNumber : 266, className : "view.dashboard.DB", methodName : "renderResults"});
				return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["fieldsList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
			default:
				return null;
			}
		}
		return null;
	}
	,render: function() {
		if(this.state.values != null) {
			haxe_Log.trace(this.state.values == null ? "null" : haxe_ds_StringMap.stringify(this.state.values.h),{ fileName : "view/dashboard/DB.hx", lineNumber : 283, className : "view.dashboard.DB", methodName : "render"});
		}
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/dashboard/DB.hx", lineNumber : 284, className : "view.dashboard.DB", methodName : "render"});
		return this.state.formApi.render({ "$$typeof" : $$tre, type : react_ReactType.fromString("form"), props : { className : "tabComponentForm", children : [{ "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "caption", children : "DB"}, key : null, ref : null},this.renderResults()]}, key : null, ref : null});
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["DB"].items;
		while(_g < _g1.length) {
			var mI = _g1[_g];
			++_g;
			var _g2 = mI.action;
			if(_g2 != null) {
				switch(_g2) {
				case "editTableFields":
					mI.disabled = this.state.selectedRows.length == 0;
					break;
				case "save":
					mI.disabled = this.state.clean;
					break;
				default:
				}
			}
		}
		return sideMenu;
	}
	,__class__: view_dashboard_DB
});
var view_dashboard_DBSync = function(props) {
	React_Component.call(this,props);
	this.dataDisplay = view_dashboard_model_DBSyncModel.dataDisplay;
	this.dataAccess = view_dashboard_model_DBSyncModel.dataAccess(props.match.params.action);
	this.formFields = view_dashboard_model_DBSyncModel.formFields(props.match.params.action);
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/dashboard/DBSync.hx", lineNumber : 73, className : "view.dashboard.DBSync", methodName : "new"});
	this.state = App.initEState({ loading : false, dataTable : [], formBuilder : new view_shared_FormBuilder(this), actualState : { edited_by : props.userState.dbUser.id, mandator : props.userState.dbUser.mandator}, initialState : { edited_by : props.userState.dbUser.id, mandator : props.userState.dbUser.mandator}, values : new haxe_ds_StringMap()},this);
	haxe_Log.trace(this.state.loading,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 86, className : "view.dashboard.DBSync", methodName : "new"});
};
$hxClasses["view.dashboard.DBSync"] = view_dashboard_DBSync;
view_dashboard_DBSync.__name__ = "view.dashboard.DBSync";
view_dashboard_DBSync.mapStateToProps = function(aState) {
	return { userState : aState.userState};
};
view_dashboard_DBSync.mapDispatchToProps = function(dispatch) {
	return { load : function(param) {
		return dispatch(redux_Action.map(action_async_CRUD.read(param)));
	}};
};
view_dashboard_DBSync.__super__ = React_Component;
view_dashboard_DBSync.prototype = $extend(React_Component.prototype,{
	dataAccess: null
	,dataDisplay: null
	,formApi: null
	,formBuilder: null
	,formFields: null
	,fieldNames: null
	,baseForm: null
	,contact: null
	,dbData: null
	,dbMetaData: null
	,createFieldList: function(ev) {
		haxe_Log.trace("hi :)",{ fileName : "view/dashboard/DBSync.hx", lineNumber : 105, className : "view.dashboard.DBSync", methodName : "createFieldList"});
	}
	,editTableFields: function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 133, className : "view.dashboard.DBSync", methodName : "editTableFields"});
	}
	,initStateFromDataTable: function(dt) {
		var iS = { };
		var _g = 0;
		while(_g < dt.length) {
			var dR = dt[_g];
			++_g;
			var rS = { };
			var k = haxe_ds_StringMap.keysIterator(dR.h);
			while(k.hasNext()) {
				var k1 = k.next();
				haxe_Log.trace(k1,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 144, className : "view.dashboard.DBSync", methodName : "initStateFromDataTable"});
				if(this.dataDisplay.h["fieldsList"].columns.h[k1].cellFormat == view_dashboard_model_DBSyncModel.formatBool) {
					rS[k1] = dR.h[k1] == "Y";
				} else {
					rS[k1] = dR.h[k1];
				}
			}
			iS[dR.h["id"]] = rS;
		}
		haxe_Log.trace(iS,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 154, className : "view.dashboard.DBSync", methodName : "initStateFromDataTable"});
		return iS;
	}
	,saveTableFields: function(vA) {
		haxe_Log.trace(vA,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 160, className : "view.dashboard.DBSync", methodName : "saveTableFields"});
	}
	,importAccounts: function(_) {
		var _gthis = this;
		haxe_Log.trace(this.props.userState.dbUser.first_name,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 189, className : "view.dashboard.DBSync", methodName : "importAccounts"});
		this.setState({ loading : true});
		var p = this.props.load({ className : "admin.SyncExternalAccounts", action : "syncAll", filter : { mandator : "1"}, limit : 1000, offset : 0, table : "accounts", dbUser : this.props.userState.dbUser, devIP : App.devIP, maxImport : 4000, relations : new haxe_ds_StringMap()});
		p.then(function(data) {
			haxe_Log.trace(data,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 207, className : "view.dashboard.DBSync", methodName : "importAccounts"});
			_gthis.setState({ loading : false});
		});
	}
	,importAll: function(_) {
		haxe_Log.trace(this.props.userState.dbUser.first_name,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 215, className : "view.dashboard.DBSync", methodName : "importAll"});
		App.store.dispatch(action_async_LivePBXSync.syncAll({ limit : 1000, maxImport : 4000, userState : this.props.userState, offset : 0, className : "admin.SyncExternal", action : "syncAll"}));
	}
	,importAllBookingRequests: function(_) {
		haxe_Log.trace(this.props.userState.dbUser.first_name,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 228, className : "view.dashboard.DBSync", methodName : "importAllBookingRequests"});
		App.store.dispatch(action_async_LivePBXSync.syncAll({ limit : 50000, maxImport : 50000, userState : this.props.userState, offset : 100000, table : "bank_transfers", className : "admin.SyncExternalBookings", action : "syncAll"}));
	}
	,importBookingRequests: function() {
		App.store.dispatch(redux_Action.map(action_async_LivePBXSync.importBookingRequests({ limit : 25000, offset : 0, className : "admin.SyncExternalBookings", action : "syncBookingRequests", userState : this.props.userState})));
	}
	,importContacts: function() {
		haxe_Log.trace(this.props.userState.dbUser.first_name,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 267, className : "view.dashboard.DBSync", methodName : "importContacts"});
		App.store.dispatch(redux_Action.map(action_AppAction.Status(action_StatusAction.Update({ cssClass : " ", text : "Importiere Kontakte"}))));
		App.store.dispatch(action_async_LivePBXSync.importAll({ limit : 1000, userState : this.props.userState, offset : 0, onlyNew : true, className : "admin.SyncExternalContacts", action : "importAll"}));
	}
	,importDeals: function() {
		App.store.dispatch(redux_Action.map(action_AppAction.Status(action_StatusAction.Update({ cssClass : " ", text : "Importiere Abschlüsse"}))));
		App.store.dispatch(redux_Action.map(action_async_LivePBXSync.importDeals({ limit : 1000, offset : 0, onlyNew : true, className : "admin.SyncExternalDeals", action : "importAll", userState : this.props.userState})));
	}
	,syncDeals: function() {
		App.store.dispatch(redux_Action.map(action_AppAction.Status(action_StatusAction.Update({ cssClass : " ", text : "Aktualisiere Abschlüsse"}))));
		App.store.dispatch(redux_Action.map(action_async_LivePBXSync.importDeals({ limit : 1000, offset : 0, className : "admin.SyncExternalDeals", action : "importAll", userState : this.props.userState})));
	}
	,syncUserList: function(_) {
		var _gthis = this;
		haxe_Log.trace(App.config.api,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 317, className : "view.dashboard.DBSync", methodName : "syncUserList"});
		loader_BinaryLoader.create("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, fields : "id,table_name,field_name,disabled,element,required,use_as_index", className : "admin.SyncExternal", action : "syncUserDetails", devIP : App.devIP},function(data) {
			haxe_Log.trace(data.dataRows.length,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 333, className : "view.dashboard.DBSync", methodName : "syncUserList"});
			if(data.dataRows.length > 0) {
				_gthis.setState({ dataTable : data.dataRows});
			}
		});
	}
	,proxy_showUserList: function(_) {
		var _gthis = this;
		haxe_Log.trace(App.config.api,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 343, className : "view.dashboard.DBSync", methodName : "proxy_showUserList"});
		loader_BinaryLoader.create("https://pitverwaltung.de/sync/proxy.php",{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, fields : "id,table_name,field_name,disabled,element,required,use_as_index", className : "admin.SyncExternal", action : "syncUserDetails", target : "syncUsers.php", devIP : App.devIP},function(data) {
			haxe_Log.trace(data.dataRows.length,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 361, className : "view.dashboard.DBSync", methodName : "proxy_showUserList"});
			if(data.dataRows.length > 0) {
				_gthis.setState({ dataTable : data.dataRows});
			}
		});
	}
	,componentDidMount: function() {
		if(this.props.userState != null) {
			haxe_Log.trace("yeah: " + this.props.userState.dbUser.first_name,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 372, className : "view.dashboard.DBSync", methodName : "componentDidMount"});
		}
	}
	,go: function(aState) {
		haxe_Log.trace(Reflect.fields(aState),{ fileName : "view/dashboard/DBSync.hx", lineNumber : 377, className : "view.dashboard.DBSync", methodName : "go"});
		var dbaProps_action = this.props.match.params.action;
		var dbaProps_className = "data.Contacts";
		var dbaProps_dataSource = null;
		var dbaProps_table = "contacts";
		var dbaProps_userState = this.props.userState;
		switch(this.props.match.params.action) {
		case "delete":case "get":
			break;
		case "insert":
			var _g = 0;
			var _g1 = this.fieldNames;
			while(_g < _g1.length) {
				var f = _g1[_g];
				++_g;
				haxe_Log.trace("" + f + " =>" + Std.string(Reflect.field(aState,f)) + "<=",{ fileName : "view/dashboard/DBSync.hx", lineNumber : 391, className : "view.dashboard.DBSync", methodName : "go"});
				if(Reflect.field(aState,f) == "") {
					Reflect.deleteField(aState,f);
				}
			}
			Reflect.deleteField(aState,"id");
			Reflect.deleteField(aState,"creation_date");
			var _g = new haxe_ds_StringMap();
			var _g1 = new haxe_ds_StringMap();
			_g1.h["data"] = aState;
			var value = Reflect.fields(aState).join(",");
			_g1.h["fields"] = value;
			_g.h["contacts"] = _g1;
			dbaProps_dataSource = _g;
			break;
		}
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 411, className : "view.dashboard.DBSync", methodName : "render"});
		var tmp = this.state.formApi;
		var tmp1 = react_ReactType.fromComp(React_Fragment);
		var tmp2 = $$tre;
		var tmp3 = react_ReactType.fromString("form");
		var tmp4 = this.renderResults();
		return tmp.render(React.createElement(tmp1,{ },{ "$$typeof" : tmp2, type : tmp3, props : { className : "tabComponentForm", children : tmp4}, key : null, ref : null}));
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.action + ":" + Std.string(this.state.dataTable != null),{ fileName : "view/dashboard/DBSync.hx", lineNumber : 422, className : "view.dashboard.DBSync", methodName : "renderResults"});
		haxe_Log.trace(this.state.loading,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 423, className : "view.dashboard.DBSync", methodName : "renderResults"});
		if(this.state.loading) {
			return this.state.formApi.renderWait();
		}
		haxe_Log.trace("###########loading:" + Std.string(this.state.loading),{ fileName : "view/dashboard/DBSync.hx", lineNumber : 426, className : "view.dashboard.DBSync", methodName : "renderResults"});
		switch(this.props.match.params.action) {
		case "importClientList":
			haxe_Log.trace(this.state.actualState,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 437, className : "view.dashboard.DBSync", methodName : "renderResults"});
			if(this.state.actualState == null) {
				return this.state.formApi.renderWait();
			} else {
				return this.state.formBuilder.renderForm({ handleSubmit : this.state.handleSubmit, fields : this.formFields, model : "importClientList", title : "Stammdaten Import"},this.state.actualState);
			}
			break;
		case "shared.io.DB.editTableFields":
			return null;
		default:
			return null;
		}
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/dashboard/DBSync.hx", lineNumber : 471, className : "view.dashboard.DBSync", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["DBSync"].items;
		while(_g < _g1.length) {
			var mI = _g1[_g];
			++_g;
			var _g2 = mI.action;
			if(_g2 != null) {
				switch(_g2) {
				case "editTableFields":
					mI.disabled = this.state.selectedRows.length == 0;
					break;
				case "save":
					mI.disabled = this.state.clean;
					break;
				default:
				}
			}
		}
		return sideMenu;
	}
	,__class__: view_dashboard_DBSync
});
var view_dashboard_Roles = function(props) {
	React_Component.call(this,props);
	this.state = { clean : true, hasError : false, mounted : false, loading : true, sideMenu : view_shared_io_FormApi.initSideMenu(this,[{ dataClassPath : "roles.User", label : "Benutzer", section : "Users", items : view_shared_io_Users.menuItems},{ dataClassPath : "settings.Bookmarks", label : "Benutzergruppen", section : "Bookmarks", items : []},{ dataClassPath : "roles.Permissions", label : "Rechte", section : "permissions", items : []}],{ section : "Users", sameWidth : true})};
	new view_shared_io_FormApi(this,this.state.sideMenu);
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/dashboard/Roles.hx", lineNumber : 69, className : "view.dashboard.Roles", methodName : "new"});
};
$hxClasses["view.dashboard.Roles"] = view_dashboard_Roles;
view_dashboard_Roles.__name__ = "view.dashboard.Roles";
view_dashboard_Roles.mapStateToProps = function(aState) {
	return function(aState) {
		var uState = aState.userState;
		haxe_Log.trace(uState,{ fileName : "view/dashboard/Roles.hx", lineNumber : 133, className : "view.dashboard.Roles", methodName : "mapStateToProps"});
		return { userState : uState};
	};
};
view_dashboard_Roles.__super__ = React_Component;
view_dashboard_Roles.prototype = $extend(React_Component.prototype,{
	createUsers: function(ev) {
	}
	,editUsers: function(ev) {
	}
	,deleteUsers: function(ev) {
	}
	,createUserGroups: function(ev) {
	}
	,editUserGroups: function(ev) {
	}
	,deleteUserGroups: function(ev) {
	}
	,createRoles: function(ev) {
	}
	,editRoles: function(ev) {
	}
	,deleteRoles: function(ev) {
	}
	,importExternalUsers: function(ev) {
		haxe_Log.trace(ev.currentTarget,{ fileName : "view/dashboard/Roles.hx", lineNumber : 113, className : "view.dashboard.Roles", methodName : "importExternalUsers"});
		this.props.formApi.requests.push(haxe_ds_Either.Left(loader_AjaxLoader.load("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, first_name : this.props.userState.dbUser.first_name, className : "admin.CreateUsers", action : "importExternal"},function(data) {
			haxe_Log.trace(data,{ fileName : "view/dashboard/Roles.hx", lineNumber : 124, className : "view.dashboard.Roles", methodName : "importExternalUsers"});
		})));
	}
	,componentDidMount: function() {
		haxe_Log.trace(this.state.loading,{ fileName : "view/dashboard/Roles.hx", lineNumber : 143, className : "view.dashboard.Roles", methodName : "componentDidMount"});
	}
	,render: function() {
		var sM = this.state.sideMenu;
		if(sM.menuBlocks != null) {
			haxe_Log.trace(haxe_ds_StringMap.keysIterator(sM.menuBlocks.h).next() + ":" + this.props.match.params.section,{ fileName : "view/dashboard/Roles.hx", lineNumber : 168, className : "view.dashboard.Roles", methodName : "render"});
		}
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "columns", children : [this.renderContent(),{ "$$typeof" : $$tre, type : view_shared_SMenu._renderWrapper, props : Object.assign({ },sM,{ className : "menu"}), key : null, ref : null}]}, key : null, ref : null};
	}
	,renderContent: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/dashboard/Roles.hx", lineNumber : 180, className : "view.dashboard.Roles", methodName : "renderContent"});
		if(this.props.match.params.action == "userList") {
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_io_Users), props : Object.assign({ },this.props,{ fullWidth : true}), key : null, ref : null};
		} else {
			return { "$$typeof" : $$tre, type : react_ReactType.fromString("form"), props : { className : "tabComponentForm"}, key : null, ref : null};
		}
	}
	,__class__: view_dashboard_Roles
});
var view_dashboard_Settings = function(props) {
	React_Component.call(this,props);
	this.state = { clean : true, hasError : false, mounted : false, loading : true, sideMenu : view_shared_io_FormApi.initSideMenu(this,[{ dataClassPath : "auth.User", label : "UserDaten", section : "user", items : view_shared_io_User.menuItems},{ dataClassPath : "settings.Bookmarks", label : "Lesezeichen", section : "bookmarks", items : view_shared_io_Bookmarks.menuItems},{ dataClassPath : "settings.Design", label : "Design", section : "design", items : view_shared_io_Design.menuItems}],{ section : "bookmarks", sameWidth : true})};
	if(props.match.params.section != null) {
		haxe_Log.trace(props.match.params.section,{ fileName : "view/dashboard/Settings.hx", lineNumber : 81, className : "view.dashboard.Settings", methodName : "new"});
	}
	haxe_Log.trace("" + props.match.params.section + " " + props.match.params.action,{ fileName : "view/dashboard/Settings.hx", lineNumber : 86, className : "view.dashboard.Settings", methodName : "new"});
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/dashboard/Settings.hx", lineNumber : 87, className : "view.dashboard.Settings", methodName : "new"});
};
$hxClasses["view.dashboard.Settings"] = view_dashboard_Settings;
view_dashboard_Settings.__name__ = "view.dashboard.Settings";
view_dashboard_Settings.__super__ = React_Component;
view_dashboard_Settings.prototype = $extend(React_Component.prototype,{
	componentDidCatch: function(error,info) {
		haxe_Log.trace(Reflect.fields(this.state),{ fileName : "view/dashboard/Settings.hx", lineNumber : 37, className : "view.dashboard.Settings", methodName : "componentDidCatch"});
		if(this.state.mounted) {
			this.setState({ hasError : true});
		}
		haxe_Log.trace(error,{ fileName : "view/dashboard/Settings.hx", lineNumber : 40, className : "view.dashboard.Settings", methodName : "componentDidCatch"});
		haxe_Log.trace(info,{ fileName : "view/dashboard/Settings.hx", lineNumber : 41, className : "view.dashboard.Settings", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		haxe_Log.trace(Reflect.fields(this.state),{ fileName : "view/dashboard/Settings.hx", lineNumber : 93, className : "view.dashboard.Settings", methodName : "componentDidMount"});
		haxe_Log.trace(this.state.loading,{ fileName : "view/dashboard/Settings.hx", lineNumber : 94, className : "view.dashboard.Settings", methodName : "componentDidMount"});
		haxe_Log.trace(Reflect.fields(this.props),{ fileName : "view/dashboard/Settings.hx", lineNumber : 95, className : "view.dashboard.Settings", methodName : "componentDidMount"});
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/dashboard/Settings.hx", lineNumber : 96, className : "view.dashboard.Settings", methodName : "componentDidMount"});
	}
	,render: function() {
		var _g = this.props.match.params.section;
		if(_g == null) {
			return { "$$typeof" : $$tre, type : view_shared_io_Bookmarks._renderWrapper, props : Object.assign({ },this.props,{ sideMenu : this.state.sideMenu, fullWidth : true}), key : null, ref : null};
		} else {
			switch(_g) {
			case "Bookmarks":
				return { "$$typeof" : $$tre, type : view_shared_io_Bookmarks._renderWrapper, props : Object.assign({ },this.props,{ sideMenu : this.state.sideMenu, fullWidth : true}), key : null, ref : null};
			case "User":
				return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_io_User), props : Object.assign({ },this.props,{ sideMenu : this.state.sideMenu, fullWidth : true}), key : null, ref : null};
			default:
				return null;
			}
		}
	}
	,__class__: view_dashboard_Settings
});
var view_dashboard_Setup = function(props) {
	haxe_Log.trace(props.userState,{ fileName : "view/dashboard/Setup.hx", lineNumber : 41, className : "view.dashboard.Setup", methodName : "new"});
	React_Component.call(this,props);
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/dashboard/Setup.hx", lineNumber : 43, className : "view.dashboard.Setup", methodName : "new"});
	haxe_Log.trace(props.match.params.section,{ fileName : "view/dashboard/Setup.hx", lineNumber : 44, className : "view.dashboard.Setup", methodName : "new"});
	this.state = App.initEState({ sideMenu : view_shared_io_FormApi.initSideMenu(this,[{ dataClassPath : "tools.DB", label : "DB Design", section : "DB", items : view_dashboard_DB.menuItems},{ dataClassPath : "admin.SyncExternal", label : "DB Abgleich", section : "DBSync", items : view_dashboard_DBSync.menuItems}],{ section : props.match.params.section == null ? "DBSync" : props.match.params.section, sameWidth : true})},this);
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/dashboard/Setup.hx", lineNumber : 73, className : "view.dashboard.Setup", methodName : "new"});
};
$hxClasses["view.dashboard.Setup"] = view_dashboard_Setup;
view_dashboard_Setup.__name__ = "view.dashboard.Setup";
view_dashboard_Setup.__super__ = React_Component;
view_dashboard_Setup.prototype = $extend(React_Component.prototype,{
	componentDidCatch: function(error,info) {
		haxe_Log.trace(info,{ fileName : "view/dashboard/Setup.hx", lineNumber : 92, className : "view.dashboard.Setup", methodName : "componentDidCatch"});
		if(this.state.mounted) {
			this.setState({ hasError : true});
		}
		haxe_Log.trace(error,{ fileName : "view/dashboard/Setup.hx", lineNumber : 96, className : "view.dashboard.Setup", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		this.setState({ mounted : true});
		if(this.props.match.params.section == null) {
			var basePath = this.props.match.url;
			this.props.history.push("" + basePath + "/DB");
			haxe_Log.trace(this.props.history.location.pathname,{ fileName : "view/dashboard/Setup.hx", lineNumber : 107, className : "view.dashboard.Setup", methodName : "componentDidMount"});
			haxe_Log.trace("setting section to:DB",{ fileName : "view/dashboard/Setup.hx", lineNumber : 108, className : "view.dashboard.Setup", methodName : "componentDidMount"});
		}
		haxe_Log.trace("",{ fileName : "view/dashboard/Setup.hx", lineNumber : 110, className : "view.dashboard.Setup", methodName : "componentDidMount"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/dashboard/Setup.hx", lineNumber : 133, className : "view.dashboard.Setup", methodName : "render"});
		switch(this.props.match.params.section) {
		case "DB":
			return { "$$typeof" : $$tre, type : view_dashboard_DB._renderWrapper, props : Object.assign({ },this.props,{ fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		case "DBSync":
			return { "$$typeof" : $$tre, type : view_dashboard_DBSync._renderWrapper, props : Object.assign({ },this.props,{ fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		default:
			return null;
		}
	}
	,__class__: view_dashboard_Setup
});
var view_dashboard_model_DBFormsModel = function() { };
$hxClasses["view.dashboard.model.DBFormsModel"] = view_dashboard_model_DBFormsModel;
view_dashboard_model_DBFormsModel.__name__ = "view.dashboard.model.DBFormsModel";
view_dashboard_model_DBFormsModel.formatBool = function(v) {
	if(v) {
		return "Y";
	} else {
		return "N";
	}
};
view_dashboard_model_DBFormsModel.formatElementSelection = function(v) {
	if(v) {
		return "Y";
	} else {
		return "N";
	}
};
view_dashboard_model_DBFormsModel.dbMetaToState = function(dbMeta) {
	var sData = [];
	var _g = 0;
	while(_g < dbMeta.length) {
		var row = dbMeta[_g];
		++_g;
		var rM = new haxe_ds_StringMap();
		var k = haxe_ds_StringMap.keysIterator(row.h);
		while(k.hasNext()) {
			var k1 = k.next();
			if(row.h[k1].format_display != null) {
				var v = App.sprintf(row.h[k1].format_display,row.h[k1]);
				rM.h[k1] = v;
			} else {
				var v1 = row.h[k1];
				rM.h[k1] = v1;
			}
		}
		sData.push(rM);
	}
	return sData;
};
var view_dashboard_model_DBSyncModel = function() { };
$hxClasses["view.dashboard.model.DBSyncModel"] = view_dashboard_model_DBSyncModel;
view_dashboard_model_DBSyncModel.__name__ = "view.dashboard.model.DBSyncModel";
view_dashboard_model_DBSyncModel.formatBool = function(v) {
	if(v) {
		return "Y";
	} else {
		return "N";
	}
};
view_dashboard_model_DBSyncModel.formatElementSelection = function(v) {
	if(v) {
		return "Y";
	} else {
		return "N";
	}
};
view_dashboard_model_DBSyncModel.formatPhone = function(p) {
	haxe_Log.trace(p,{ fileName : "view/dashboard/model/DBSyncModel.hx", lineNumber : 17, className : "view.dashboard.model.DBSyncModel", methodName : "formatPhone"});
	if(p) {
		return p.login;
	} else {
		return "";
	}
};
view_dashboard_model_DBSyncModel.dataSource = function(action) {
	switch(action) {
	case "importClientList":
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		_g1.h["alias"] = "co";
		_g1.h["fields"] = "";
		_g1.h["jCond"] = "contact=co.id";
		_g.h["contacts"] = _g1;
		var _g1 = new haxe_ds_StringMap();
		_g1.h["alias"] = "da";
		_g1.h["fields"] = null;
		_g1.h["jCond"] = "contact=co.id";
		_g.h["deals"] = _g1;
		var _g1 = new haxe_ds_StringMap();
		_g1.h["alias"] = "ac";
		_g1.h["fields"] = "";
		_g.h["accounts"] = _g1;
		return _g;
	case "loadClientData":
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		_g1.h["alias"] = "co";
		_g1.h["fields"] = "";
		_g1.h["jCond"] = "contact=co.id";
		_g.h["contacts"] = _g1;
		var _g1 = new haxe_ds_StringMap();
		_g1.h["alias"] = "da";
		_g1.h["fields"] = null;
		_g1.h["jCond"] = "contact=co.id";
		_g.h["deals"] = _g1;
		var _g1 = new haxe_ds_StringMap();
		_g1.h["alias"] = "ac";
		_g1.h["fields"] = "";
		_g.h["accounts"] = _g1;
		return _g;
	default:
		return null;
	}
};
view_dashboard_model_DBSyncModel.formFields = function(action) {
	switch(action) {
	case "editTableFields":
		var _g = new haxe_ds_StringMap();
		_g.h["table_name"] = { label : "Tabelle", disabled : true};
		_g.h["field_name"] = { label : "Feldname", disabled : true};
		_g.h["field_type"] = { label : "Datentyp", type : "Select"};
		_g.h["element"] = { label : "Eingabefeld", type : "Select"};
		_g.h["disabled"] = { label : "Readonly", type : "Checkbox"};
		_g.h["required"] = { label : "Required", type : "Checkbox"};
		_g.h["use_as_index"] = { label : "Index", type : "Checkbox"};
		_g.h["any"] = { label : "Eigenschaften", disabled : true, type : "Hidden"};
		_g.h["id"] = { type : "Hidden"};
		return _g;
	case "importClientList":
		var _g = new haxe_ds_StringMap();
		_g.h["import_contacts"] = { label : "Kontakte", type : "Checkbox", preset : true};
		_g.h["contacts_limit"] = { label : "Anzahl", type : "Input"};
		_g.h["import_deals"] = { label : "Aufträge", type : "Checkbox", preset : true};
		_g.h["import_accounts"] = { label : "Kontent", type : "Checkbox", preset : true};
		return _g;
	default:
		return null;
	}
};
view_dashboard_model_DBSyncModel.dataAccess = function(action) {
	switch(action) {
	case "editTableFields":
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		_g1.h["selectedRows"] = null;
		var _g2 = new haxe_ds_StringMap();
		_g2.h["table_name"] = { label : "Tabelle", disabled : true};
		_g2.h["field_name"] = { label : "Feldname", disabled : true};
		_g2.h["field_type"] = { label : "Datentyp", type : "Select"};
		_g2.h["element"] = { label : "Eingabefeld", type : "Select"};
		_g2.h["disabled"] = { label : "Readonly", type : "Checkbox"};
		_g2.h["required"] = { label : "Required", type : "Checkbox"};
		_g2.h["use_as_index"] = { label : "Index", type : "Checkbox"};
		_g2.h["any"] = { label : "Eigenschaften", disabled : true, type : "Hidden"};
		_g2.h["id"] = { type : "Hidden"};
		_g.h["" + action] = { source : _g1, view : _g2};
		return _g;
	case "importClientList":
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		_g1.h["selectedRows"] = null;
		var _g2 = new haxe_ds_StringMap();
		_g2.h["import_contacts"] = { label : "Kontakte", type : "Checkbox", preset : true};
		_g2.h["contacts_limit"] = { label : "Anzahl", type : "Input"};
		_g2.h["import_deals"] = { label : "Aufträge", type : "Checkbox", preset : true};
		_g2.h["import_accounts"] = { label : "Kontent", type : "Checkbox", preset : true};
		_g.h["" + action] = { source : _g1, view : _g2};
		return _g;
	case "saveTableFields":
		var _g = new haxe_ds_StringMap();
		_g.h["" + action] = { source : null, view : null};
		return _g;
	default:
		return null;
	}
};
var view_shared_io_Bookmarks = function(props) {
	React_Component.call(this,props);
	var sideMenu = this.updateMenu("bookmarks");
	this.state = { clean : true, hasError : false, mounted : false, loading : true, sideMenu : sideMenu};
};
$hxClasses["view.shared.io.Bookmarks"] = view_shared_io_Bookmarks;
view_shared_io_Bookmarks.__name__ = "view.shared.io.Bookmarks";
view_shared_io_Bookmarks.__super__ = React_Component;
view_shared_io_Bookmarks.prototype = $extend(React_Component.prototype,{
	componentDidCatch: function(error,info) {
		if(this.state.mounted) {
			this.setState({ hasError : true});
		}
		haxe_Log.trace(error,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 39, className : "view.shared.io.Bookmarks", methodName : "componentDidCatch"});
		haxe_Log.trace(info,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 40, className : "view.shared.io.Bookmarks", methodName : "componentDidCatch"});
	}
	,add: function(ev) {
	}
	,'delete': function(ev) {
	}
	,edit: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi :)",{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 55, className : "view.shared.io.Bookmarks", methodName : "edit"});
		this.props.formApi.requests.push(haxe_ds_Either.Left(loader_AjaxLoader.load("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, className : "auth.User", action : "update", filter : "id|" + this.props.userState.dbUser.id, dataSource : haxe_Serializer.run(null)},function(data) {
			if(data.rows == null) {
				return;
			}
			haxe_Log.trace(data.rows.length,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 70, className : "view.shared.io.Bookmarks", methodName : "edit"});
			var dataRows = data.rows;
			haxe_Log.trace(Reflect.fields(dataRows[0]),{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 72, className : "view.shared.io.Bookmarks", methodName : "edit"});
			haxe_Log.trace(dataRows[0].active,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 73, className : "view.shared.io.Bookmarks", methodName : "edit"});
			var _gthis1 = _gthis;
			var _g = new haxe_ds_StringMap();
			_g.h["accountData"] = dataRows;
			_gthis1.setState({ data : _g, loading : false});
		})));
		this.setState({ dataClassPath : "auth.User.edit"});
	}
	,save: function(ev) {
	}
	,no: function(ev) {
	}
	,render: function() {
		haxe_Log.trace(this.state,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 116, className : "view.shared.io.Bookmarks", methodName : "render"});
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 119, className : "view.shared.io.Bookmarks", methodName : "render"});
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "tabComponentForm", children : "dummy"}, key : null, ref : null};
	}
	,updateMenu: function(viewClassPath) {
		if(this.state == null) {
			haxe_Log.trace(this.state,{ fileName : "view/shared/io/Bookmarks.hx", lineNumber : 139, className : "view.shared.io.Bookmarks", methodName : "updateMenu"});
			return null;
		}
		var sideMenu = this.state.sideMenu;
		sideMenu.menuBlocks.h["bookmarks"].isActive = true;
		sideMenu.menuBlocks.h["bookmarks"].label = "Lesezeichen";
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["bookmarks"].items;
		while(_g < _g1.length) {
			var mI = _g1[_g];
			++_g;
			var _g2 = mI.action;
			if(_g2 != null) {
				switch(_g2) {
				case "save":
					mI.disabled = this.state.clean;
					break;
				case "update":
					mI.disabled = this.state.selectedRows.length == 0;
					break;
				default:
				}
			}
		}
		return sideMenu;
	}
	,getRow: function(row) {
		return { one : row.one, two : row.two, three : row.three};
	}
	,__class__: view_shared_io_Bookmarks
});
var view_shared_io_Design = function(props) {
	React_Component.call(this,props);
	this.state = { clean : true, hasError : false, mounted : false, loading : true, sideMenu : { }};
	haxe_Log.trace(this.props,{ fileName : "view/shared/io/Design.hx", lineNumber : 88, className : "view.shared.io.Design", methodName : "new"});
};
$hxClasses["view.shared.io.Design"] = view_shared_io_Design;
view_shared_io_Design.__name__ = "view.shared.io.Design";
view_shared_io_Design.__super__ = React_Component;
view_shared_io_Design.prototype = $extend(React_Component.prototype,{
	edit: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi :)",{ fileName : "view/shared/io/Design.hx", lineNumber : 31, className : "view.shared.io.Design", methodName : "edit"});
		this.props.formApi.requests.push(haxe_ds_Either.Left(loader_AjaxLoader.load("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, className : "auth.User", action : "update", filter : "id|" + this.props.userState.dbUser.id},function(data) {
			if(data.rows == null) {
				return;
			}
			haxe_Log.trace(data.rows.length,{ fileName : "view/shared/io/Design.hx", lineNumber : 46, className : "view.shared.io.Design", methodName : "edit"});
			var dataRows = data.rows;
			haxe_Log.trace(Reflect.fields(dataRows[0]),{ fileName : "view/shared/io/Design.hx", lineNumber : 48, className : "view.shared.io.Design", methodName : "edit"});
			haxe_Log.trace(dataRows[0].active,{ fileName : "view/shared/io/Design.hx", lineNumber : 49, className : "view.shared.io.Design", methodName : "edit"});
			var _gthis1 = _gthis;
			var _g = new haxe_ds_StringMap();
			_g.h["accountData"] = dataRows;
			_gthis1.setState({ data : _g, loading : false});
		})));
		this.setState({ dataClassPath : "auth.User.edit"});
	}
	,render: function() {
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { }, key : null, ref : null};
	}
	,__class__: view_shared_io_Design
});
var view_shared_io_Loader = function(cb,p,r) {
	this.cB = cb;
	this.params = p;
	this.post = p != null;
	this.req = r;
};
$hxClasses["view.shared.io.Loader"] = view_shared_io_Loader;
view_shared_io_Loader.__name__ = "view.shared.io.Loader";
view_shared_io_Loader.load = function(url,params,cB) {
	var req = new haxe_http_HttpJs(url);
	if(params != null) {
		var _g = 0;
		var _g1 = Reflect.fields(params);
		while(_g < _g1.length) {
			var k = _g1[_g];
			++_g;
			req.addParameter(k,Reflect.field(params,k));
		}
	}
	req.addHeader("Access-Control-Allow-Methods","PUT, GET, POST, DELETE, OPTIONS");
	req.addHeader("Access-Control-Allow-Origin","*");
	var loader = new view_shared_io_Loader(cB,params,req);
	req.onData = $bind(loader,loader._onData);
	req.onError = function(err) {
		haxe_Log.trace(err,{ fileName : "view/shared/io/Loader.hx", lineNumber : 35, className : "view.shared.io.Loader", methodName : "load"});
	};
	haxe_Log.trace("POST? " + Std.string(params) != null,{ fileName : "view/shared/io/Loader.hx", lineNumber : 36, className : "view.shared.io.Loader", methodName : "load"});
	req.withCredentials = true;
	req.request(params != null);
	return req;
};
view_shared_io_Loader.loadData = function(url,params,cB) {
	var loader = view_shared_io_Loader.queue(url,params,cB);
	view_shared_io_Loader.rqs.push(loader.req);
	if(view_shared_io_Loader.rqs.length == 1) {
		view_shared_io_Loader.rqs.shift().request(loader.post);
	}
	return loader.req;
};
view_shared_io_Loader.queue = function(url,params,cB) {
	var req = new haxe_http_HttpJs(url);
	if(params != null) {
		var _g = 0;
		var _g1 = Reflect.fields(params);
		while(_g < _g1.length) {
			var k = _g1[_g];
			++_g;
			req.addParameter(k,Reflect.field(params,k));
		}
	}
	req.addHeader("Access-Control-Allow-Methods","PUT, GET, POST, DELETE, OPTIONS");
	req.addHeader("Access-Control-Allow-Origin","*");
	var loader = new view_shared_io_Loader(cB,params,req);
	loader.url = url;
	req.onData = $bind(loader,loader._onQueueData);
	req.onError = function(err) {
		haxe_Log.trace(err,{ fileName : "view/shared/io/Loader.hx", lineNumber : 134, className : "view.shared.io.Loader", methodName : "queue"});
	};
	haxe_Log.trace("POST? " + Std.string(params) != null,{ fileName : "view/shared/io/Loader.hx", lineNumber : 135, className : "view.shared.io.Loader", methodName : "queue"});
	req.withCredentials = true;
	return loader;
};
view_shared_io_Loader.prototype = {
	cB: null
	,params: null
	,post: null
	,req: null
	,url: null
	,_onData: function(response) {
		if(response.length > 0) {
			haxe_Log.trace(response,{ fileName : "view/shared/io/Loader.hx", lineNumber : 60, className : "view.shared.io.Loader", methodName : "_onData"});
			var dataObj = null;
			try {
				dataObj = haxe_Unserializer.run(response);
			} catch( _g ) {
				var ex = haxe_Exception.caught(_g).unwrap();
				haxe_Log.trace(ex,{ fileName : "view/shared/io/Loader.hx", lineNumber : 67, className : "view.shared.io.Loader", methodName : "_onData"});
				return;
			}
			if(Object.prototype.hasOwnProperty.call(dataObj.h,"ERROR")) {
				haxe_Log.trace(dataObj.h["ERROR"],{ fileName : "view/shared/io/Loader.hx", lineNumber : 72, className : "view.shared.io.Loader", methodName : "_onData"});
				return;
			}
			if(this.cB != null) {
				this.cB(dataObj);
			}
		}
	}
	,_onError: function(err) {
		haxe_Log.trace(err,{ fileName : "view/shared/io/Loader.hx", lineNumber : 82, className : "view.shared.io.Loader", methodName : "_onError"});
	}
	,_onQueueData: function(response) {
		haxe_Log.trace(response,{ fileName : "view/shared/io/Loader.hx", lineNumber : 87, className : "view.shared.io.Loader", methodName : "_onQueueData"});
		if(response.length > 0) {
			var dataObj = null;
			try {
				dataObj = haxe_Unserializer.run(response);
				haxe_Log.trace(dataObj,{ fileName : "view/shared/io/Loader.hx", lineNumber : 93, className : "view.shared.io.Loader", methodName : "_onQueueData"});
			} catch( _g ) {
				var ex = haxe_Exception.caught(_g).unwrap();
				haxe_Log.trace(ex,{ fileName : "view/shared/io/Loader.hx", lineNumber : 97, className : "view.shared.io.Loader", methodName : "_onQueueData"});
				return;
			}
			if(response.indexOf("ERROR") > -1) {
				haxe_Log.trace(response,{ fileName : "view/shared/io/Loader.hx", lineNumber : 102, className : "view.shared.io.Loader", methodName : "_onQueueData"});
			} else if(this.cB != null) {
				this.cB(dataObj);
			}
			if(view_shared_io_Loader.rqs.length > 0) {
				view_shared_io_Loader.rqs.shift().request(this.post);
			}
		}
	}
	,__class__: view_shared_io_Loader
};
var view_shared_io_User = function(props) {
	React_Component.call(this,props);
	var _g = new haxe_ds_StringMap();
	var _g1 = new haxe_ds_StringMap();
	var _g2 = new haxe_ds_StringMap();
	_g2.h["fields"] = "id,change_pass_required,password";
	_g1.h["users"] = _g2;
	var _g2 = new haxe_ds_StringMap();
	_g2.h["id"] = { type : "Hidden"};
	_g2.h["pass"] = { type : "Password"};
	_g2.h["new_pass"] = { type : "Password"};
	_g.h["changePassword"] = { source : _g1, view : _g2};
	var _g1 = new haxe_ds_StringMap();
	var _g2 = new haxe_ds_StringMap();
	_g2.h["alias"] = "us";
	_g2.h["fields"] = "id,last_login,change_pass_required,password";
	_g1.h["users"] = _g2;
	var _g2 = new haxe_ds_StringMap();
	_g2.h["alias"] = "co";
	_g2.h["fields"] = "first_name,last_name,email";
	_g2.h["jCond"] = "contact=co.id";
	_g1.h["contacts"] = _g2;
	var _g2 = new haxe_ds_StringMap();
	_g2.h["id"] = { label : "UserID", disabled : true, type : "Hidden"};
	_g2.h["pass"] = { label : "Passwort", type : "Hidden"};
	_g2.h["first_name"] = { label : "Vorname"};
	_g2.h["last_name"] = { label : "Name"};
	_g2.h["email"] = { label : "Email"};
	_g2.h["last_login"] = { label : "Letze Anmeldung", disabled : true, displayFormat : view_shared_io_FormApi.localDate};
	_g.h["update"] = { source : _g1, view : _g2};
	_g.h["save"] = { source : null, view : null};
	this.dataAccess = _g;
};
$hxClasses["view.shared.io.User"] = view_shared_io_User;
view_shared_io_User.__name__ = "view.shared.io.User";
view_shared_io_User.__super__ = React_Component;
view_shared_io_User.prototype = $extend(React_Component.prototype,{
	dataAccess: null
	,autoFocus: null
	,dataDisplay: null
	,componentDidMount: function() {
		haxe_Log.trace(this.props,{ fileName : "view/shared/io/User.hx", lineNumber : 107, className : "view.shared.io.User", methodName : "componentDidMount"});
	}
	,componentDidUpdate: function(prevProps,prevState) {
		haxe_Log.trace(App.store.getState().userState.dbUser.first_name,{ fileName : "view/shared/io/User.hx", lineNumber : 171, className : "view.shared.io.User", methodName : "componentDidUpdate"});
		if(this.autoFocus != null) {
			react_ReactRef.get_current(this.autoFocus).focus();
		}
	}
	,changePassword: function(ev) {
		haxe_Log.trace(this.state.values == null ? "null" : haxe_ds_StringMap.stringify(this.state.values.h),{ fileName : "view/shared/io/User.hx", lineNumber : 179, className : "view.shared.io.User", methodName : "changePassword"});
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/shared/io/User.hx", lineNumber : 180, className : "view.shared.io.User", methodName : "changePassword"});
		if(this.props.match.params.action != "changePassword") {
			this.updateMenu("changePassword");
			this.props.history.push(this.props.location.pathname + ("/user/changePassword/" + this.props.userState.dbUser.id));
			this.setState({ action : "changePassword"});
			return;
		} else if(!(this.state.values.h["pass"].length > 7 && this.state.values.h["new_pass"].length > 7)) {
			var _g = new haxe_ds_StringMap();
			_g.h["changePassword"] = "Die Passwörter müssen mindestens 8 Zeichen habe!";
			this.setState({ errors : _g});
			return;
		}
		if(this.state.values.h["new_pass"] != this.state.values.h["new_pass_confirm"]) {
			var _g = new haxe_ds_StringMap();
			_g.h["changePassword"] = "Die Passwörter stimmen nicht überein!";
			this.setState({ errors : _g});
			return;
		}
		if(this.state.values.h["new_pass"] == this.state.values.h["pass"] && this.state.values.h["new_pass"] != "" && this.state.values.h["new_pass"] != null) {
			var _g = new haxe_ds_StringMap();
			_g.h["changePassword"] = "Das Passwort muss geändert werden!";
			this.setState({ errors : _g});
			return;
		}
		haxe_Log.trace(App.store.getState().userState,{ fileName : "view/shared/io/User.hx", lineNumber : 196, className : "view.shared.io.User", methodName : "changePassword"});
	}
	,edit: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi :)",{ fileName : "view/shared/io/User.hx", lineNumber : 202, className : "view.shared.io.User", methodName : "edit"});
		this.props.formApi.requests.push(haxe_ds_Either.Left(view_shared_io_Loader.loadData("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, className : "auth.User", action : "update", filter : "id|" + this.props.userState.dbUser.id, dataSource : haxe_Serializer.run(this.dataAccess.h["update"].source)},function(data) {
			haxe_Log.trace(data,{ fileName : "view/shared/io/User.hx", lineNumber : 215, className : "view.shared.io.User", methodName : "edit"});
			if(data == null) {
				return;
			}
			if(Object.prototype.hasOwnProperty.call(data[0].h,"ERROR")) {
				haxe_Log.trace(data[0].h["ERROR"],{ fileName : "view/shared/io/User.hx", lineNumber : 220, className : "view.shared.io.User", methodName : "edit"});
				return;
			}
			_gthis.setState({ fields : _gthis.dataAccess.h["update"].view, values : _gthis.props.formApi.createStateValues(data[0],_gthis.dataAccess.h["update"].view), loading : false});
		})));
	}
	,save: function(evt) {
		evt.preventDefault();
		haxe_Log.trace(this.state.data == null ? "null" : haxe_ds_StringMap.stringify(this.state.data.h),{ fileName : "view/shared/io/User.hx", lineNumber : 237, className : "view.shared.io.User", methodName : "save"});
		haxe_Log.trace(this.state.values == null ? "null" : haxe_ds_StringMap.stringify(this.state.values.h),{ fileName : "view/shared/io/User.hx", lineNumber : 238, className : "view.shared.io.User", methodName : "save"});
		var skeys = [];
		var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
		while(k.hasNext()) {
			var k1 = k.next();
			if(!this.dataAccess.h["update"].view.h[k1].disabled) {
				skeys.push(k1);
			}
		}
		var tmp = view_shared_io_FormApi.filterMap(this.state.values,skeys);
		haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/shared/io/User.hx", lineNumber : 249, className : "view.shared.io.User", methodName : "save"});
		haxe_Log.trace(skeys.toString(),{ fileName : "view/shared/io/User.hx", lineNumber : 250, className : "view.shared.io.User", methodName : "save"});
		var tmp = this.dataAccess.h["update"].source;
		haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/shared/io/User.hx", lineNumber : 251, className : "view.shared.io.User", methodName : "save"});
		this.props.formApi.requests.push(haxe_ds_Either.Left(view_shared_io_Loader.load("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, className : "auth.User", action : "save", filter : "id|" + this.props.userState.dbUser.id, dataSource : haxe_Serializer.run(this.dataAccess.h["update"].source)},function(data) {
			haxe_Log.trace(data,{ fileName : "view/shared/io/User.hx", lineNumber : 265, className : "view.shared.io.User", methodName : "save"});
		})));
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		sideMenu.menuBlocks.h["users"].isActive = true;
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["users"].items;
		while(_g < _g1.length) {
			var mI = _g1[_g];
			++_g;
			var _g2 = mI.action;
			if(_g2 != null) {
				switch(_g2) {
				case "editTableFields":
					mI.disabled = this.state.selectedRows.length == 0;
					break;
				case "save":
					mI.disabled = this.state.clean;
					break;
				default:
				}
			}
		}
		return sideMenu;
	}
	,renderContent: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/shared/io/User.hx", lineNumber : 294, className : "view.shared.io.User", methodName : "renderContent"});
		switch(this.props.match.params.action) {
		case "changePassword":
			var tmp = react_ReactType.fromComp(React_Fragment);
			var tmp1 = this.renderErrors("changePassword");
			var tmp2 = { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "formField", children : [{ "$$typeof" : $$tre, type : react_ReactType.fromString("label"), props : { className : "required", children : "Aktuelles Passwort"}, key : null, ref : null},React.createElement(react_ReactType.fromString("input"),{ ref : this.autoFocus, name : "pass", type : "password", onChange : this.state.handleChange, autoFocus : "true"})]}, key : null, ref : null};
			var tmp3 = { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "formField", children : [{ "$$typeof" : $$tre, type : react_ReactType.fromString("label"), props : { className : "required", children : "Neues Passwort"}, key : null, ref : null},{ "$$typeof" : $$tre, type : react_ReactType.fromString("input"), props : { name : "new_pass", type : "password", onChange : this.state.handleChange}, key : null, ref : null}]}, key : null, ref : null};
			var tmp4 = $$tre;
			var tmp5 = react_ReactType.fromString("div");
			var tmp6 = { "$$typeof" : $$tre, type : react_ReactType.fromString("label"), props : { className : "required", children : "Neues Passwort bestätigen"}, key : null, ref : null};
			var tmp7 = $$tre;
			return React.createElement(tmp,{ },tmp1,tmp2,tmp3,{ "$$typeof" : tmp4, type : tmp5, props : { className : "formField", children : [tmp6,{ "$$typeof" : tmp7, type : react_ReactType.fromString("input"), props : { name : "new_pass_confirm", type : "password", onChange : this.state.handleChange}, key : null, ref : null}]}, key : null, ref : null});
		case "edit":
			return this.props.formApi.renderElements(this.state);
		default:
			return null;
		}
	}
	,renderErrors: function(name) {
		haxe_Log.trace(name + ":" + Std.string(Object.prototype.hasOwnProperty.call(this.state.errors.h,name)),{ fileName : "view/shared/io/User.hx", lineNumber : 324, className : "view.shared.io.User", methodName : "renderErrors"});
		if(Object.prototype.hasOwnProperty.call(this.state.errors.h,name)) {
			var tmp = $$tre;
			var tmp1 = this.state.errors.h[name];
			return { "$$typeof" : tmp, type : react_ReactType.fromString("div"), props : { className : "formField", children : tmp1}, key : null, ref : null};
		}
		return null;
	}
	,render: function() {
		if(this.state.values != null) {
			haxe_Log.trace(this.state.values == null ? "null" : haxe_ds_StringMap.stringify(this.state.values.h),{ fileName : "view/shared/io/User.hx", lineNumber : 337, className : "view.shared.io.User", methodName : "render"});
		}
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "tabComponentForm", children : { "$$typeof" : $$tre, type : react_ReactType.fromString("form"), props : { className : "form60", children : this.renderContent()}, key : null, ref : null}}, key : null, ref : null};
	}
	,__class__: view_shared_io_User
});
var view_shared_io_Users = function(props) {
	React_Component.call(this,props);
	haxe_Log.trace(this.props,{ fileName : "view/shared/io/Users.hx", lineNumber : 47, className : "view.shared.io.Users", methodName : "new"});
};
$hxClasses["view.shared.io.Users"] = view_shared_io_Users;
view_shared_io_Users.__name__ = "view.shared.io.Users";
view_shared_io_Users.__super__ = React_Component;
view_shared_io_Users.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,render: function() {
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { }, key : null, ref : null};
	}
	,renderResults: function() {
		if(this.state.dataTable != null) {
			if(this.props.match.params.action == "userList") {
				return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "userList", data : this.state.dataTable == null ? null : this.state.dataTable, dataState : this.dataDisplay.h["userList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
			} else {
				return null;
			}
		}
		return null;
	}
	,__class__: view_shared_io_Users
});
function $getIterator(o) { if( o instanceof Array ) return new haxe_iterators_ArrayIterator(o); else return o.iterator(); }
var $$tre = (typeof Symbol === "function" && Symbol.for && Symbol.for("react.element")) || 0xeac7;
if(typeof(performance) != "undefined" ? typeof(performance.now) == "function" : false) {
	HxOverrides.now = performance.now.bind(performance);
}
loader_AjaxLoader.rqs = [];
view_DashBoard._renderWrapper = (redux_react_ReactRedux.connect(view_DashBoard.mapStateToProps,view_DashBoard.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_DashBoard));
view_DashBoard.__jsxStatic = view_DashBoard._renderWrapper;
view_dashboard_DB.menuItems = [{ label : "Create Fields Table", action : "createFieldList"},{ label : "Table Fields", action : "showFieldList"},{ label : "Bearbeiten", action : "editTableFields"},{ label : "Speichern", action : "save"},{ label : "Löschen", action : "delete"}];
view_dashboard_DB._renderWrapper = (redux_react_ReactRedux.connect(view_dashboard_DB.mapStateToProps))(react_ReactTypeOf.fromComp(view_dashboard_DB));
view_dashboard_DB.__jsxStatic = view_dashboard_DB._renderWrapper;
view_dashboard_DBSync.menuItems = [{ label : "BenutzerDaten ", action : "showUserList"},{ label : "BenutzerDaten Abgleich", action : "syncUserList"},{ label : "BuchungsDaten Abgleich", action : "importAllBookingRequests"},{ label : "Stammdaten Import ", action : "importContacts"},{ label : "Stammdaten Update ", action : "importAll"},{ label : "Abschlüsse Import ", action : "importDeals"},{ label : "Abschlüsse Update ", action : "syncDeals"},{ label : "Konten Import ", action : "importAccounts"},{ label : "Speichern", action : "save"},{ label : "Löschen", action : "delete"}];
view_dashboard_DBSync._renderWrapper = (redux_react_ReactRedux.connect(view_dashboard_DBSync.mapStateToProps,view_dashboard_DBSync.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_dashboard_DBSync));
view_dashboard_DBSync.__jsxStatic = view_dashboard_DBSync._renderWrapper;
view_dashboard_Roles._renderWrapper = (redux_react_ReactRedux.connect(view_dashboard_Roles.mapStateToProps))(react_ReactTypeOf.fromComp(view_dashboard_Roles));
view_dashboard_Roles.__jsxStatic = view_dashboard_Roles._renderWrapper;
view_dashboard_model_DBFormsModel.fieldsListColumns = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["table_name"] = { label : "Tabelle", editable : false};
	_g.h["field_name"] = { label : "Feldname", editable : false, flexGrow : 1};
	_g.h["format_display"] = { label : "Anzeige", title : "Anzeigeformat"};
	_g.h["format_store"] = { label : "DB", title : "Speicherformat"};
	_g.h["element"] = { label : "Form", title : "Eingabefeld"};
	_g.h["admin_only"] = { label : "AO", title : "Admin", cellFormat : view_dashboard_model_DBFormsModel.formatBool};
	_g.h["readonly"] = { label : "RO", title : "Nur Lesen", cellFormat : view_dashboard_model_DBFormsModel.formatBool};
	_g.h["required"] = { label : "RQ", title : "Pflichtfeld", cellFormat : view_dashboard_model_DBFormsModel.formatBool};
	_g.h["use_as_index"] = { label : "ID", cellFormat : view_dashboard_model_DBFormsModel.formatBool};
	_g.h["id"] = { label : "ID", show : false};
	$r = _g;
	return $r;
}(this));
view_dashboard_model_DBFormsModel.dataDisplay = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["fieldsList"] = { altGroupPos : 0, columns : view_dashboard_model_DBFormsModel.fieldsListColumns};
	$r = _g;
	return $r;
}(this));
view_dashboard_model_DBSyncModel.clientListColumns = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["client_id"] = { label : "ID", show : true};
	_g.h["first_name"] = { label : "Vorname", editable : true};
	_g.h["last_name"] = { label : "Name", editable : true};
	_g.h["phone"] = { label : "Telefon"};
	$r = _g;
	return $r;
}(this));
view_dashboard_model_DBSyncModel.userListColumns = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["user_id"] = { label : "ID", show : true};
	_g.h["user"] = { label : "User", editable : false};
	_g.h["full_name"] = { label : "Name", editable : true, flexGrow : 1};
	_g.h["phone_login"] = { label : "Nebenstelle", editable : true, className : "tRight"};
	_g.h["user_group"] = { label : "Gruppe", editable : true};
	$r = _g;
	return $r;
}(this));
view_dashboard_model_DBSyncModel.dataDisplay = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["userList"] = { altGroupPos : 0, columns : view_dashboard_model_DBSyncModel.userListColumns};
	_g.h["clientList"] = { altGroupPos : 0, columns : view_dashboard_model_DBSyncModel.clientListColumns};
	$r = _g;
	return $r;
}(this));
view_shared_io_Bookmarks.menuItems = [{ label : "Neu", action : "insert"},{ label : "Bearbeiten", action : "update"},{ label : "Speichern", action : "save"},{ label : "Löschen", action : "delete"}];
view_shared_io_Bookmarks._renderWrapper = (redux_react_ReactRedux.connect())(react_ReactTypeOf.fromComp(view_shared_io_Bookmarks));
view_shared_io_Bookmarks.__jsxStatic = view_shared_io_Bookmarks._renderWrapper;
view_shared_io_Design.menuItems = [{ label : "Neu", action : "insert"},{ label : "Bearbeiten", action : "update"},{ label : "Speichern", action : "save"},{ label : "Löschen", action : "delete"}];
view_shared_io_Loader.rqs = [];
view_shared_io_User.menuItems = [{ label : "Neu", action : "insert"},{ label : "Bearbeiten", action : "update"},{ label : "Speichern", action : "save"},{ label : "Löschen", action : "delete"}];
view_shared_io_Users.menuItems = [{ label : "Liste", action : "get"},{ label : "Neu", action : "insert"},{ label : "Bearbeiten", action : "update"},{ label : "Speichern", action : "save"},{ label : "Löschen", action : "delete"}];
$s.view_DashBoard = view_DashBoard; 

/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__("./node_modules/webpack/buildin/global.js")))

/***/ })

}]);