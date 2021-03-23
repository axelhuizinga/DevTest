(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[4],{

/***/ "./node_modules/haxe-loader/index.js?build/view_Data!./":
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(global) {/* eslint-disable */ 
var $hx_exports = module.exports, $global = global;
var $s = $global.$hx_scope, $_;
var React_Component = $s.a, haxe_Log = $s.b, $hxClasses = $s.c, redux_Action = $s.d, redux_thunk_Thunk = $s.bf, action_LocationAction = $s.bg, react_router_ReactRouter = $s.bh, Std = $s.ae, $extend = $s.g, react_ReactType = $s.h, js_Boot = $s.i, Reflect = $s.j, React_Fragment = $s.k, bulma_$components_Tabs = $s.l, view_shared_TabLink = $s.m, shared_Utils = $s.bi, React = $s.n, react_router_Switch = $s.bj, react_router_Route = $s.o, haxe_ds_StringMap = $s.ah, App = $s.ag, haxe_ds_IntMap = $s.bk, action_DataAction = $s.bl, view_shared_io_FormApi = $s.p, haxe_iterators_MapKeyValueIterator = $s.bm, haxe_Exception = $s.an, me_cunity_debug_Out = $s.af, haxe_CallStack = $s.bn, $bind = $s.ad, EReg = $s.bo, action_async_CRUD = $s.ba, model_ORM = $s.bp, react_ReactUtil = $s.ca, action_async_DBAccess = $s.cb, redux_react_ReactRedux = $s.aj, react_ReactTypeOf = $s.ak, view_table_Table = $s.aa, hxbit_Serializer = $s.cc, haxe_ds_Either = $s.ab, loader_BinaryLoader = $s.bd, view_shared_FormBuilder = $s.ap, react_ReactRef = $s.al, view_StatusBar = $s.be;
$hx_exports["me"] = $hx_exports["me"] || {};
$hx_exports["me"]["cunity"] = $hx_exports["me"]["cunity"] || {};
$hx_exports["me"]["cunity"]["debug"] = $hx_exports["me"]["cunity"]["debug"] || {};
$hx_exports["me"]["cunity"]["debug"]["Out"] = $hx_exports["me"]["cunity"]["debug"]["Out"] || {};
var action_async_LiveDataAccess = function() { };
$hxClasses["action.async.LiveDataAccess"] = action_async_LiveDataAccess;
action_async_LiveDataAccess.__name__ = "action.async.LiveDataAccess";
action_async_LiveDataAccess.create = function() {
};
action_async_LiveDataAccess.delete = function() {
};
action_async_LiveDataAccess.storeData = function(id,action) {
	return redux_thunk_Thunk.Action(function(dispatch,getState) {
		if(id == null) {
			return null;
		}
		var aState = getState();
		haxe_Log.trace(aState.dataStore.contactData,{ fileName : "action/async/LiveDataAccess.hx", lineNumber : 47, className : "action.async.LiveDataAccess", methodName : "storeData"});
		if(id == "Contacts") {
			if(action._hx_index == 4) {
				return dispatch(redux_Action.map(action_DataAction.Restore));
			} else {
				return null;
			}
		} else {
			return null;
		}
	});
};
action_async_LiveDataAccess.select = function(props) {
	return redux_thunk_Thunk.Action(function(dispatch,getState) {
		if(props.id == null) {
			return null;
		}
		var aState = getState();
		var tableRoot = view_shared_io_FormApi.getTableRoot(props.match);
		haxe_Log.trace(tableRoot,{ fileName : "action/async/LiveDataAccess.hx", lineNumber : 71, className : "action.async.LiveDataAccess", methodName : "select"});
		haxe_Log.trace(Reflect.fields(aState),{ fileName : "action/async/LiveDataAccess.hx", lineNumber : 72, className : "action.async.LiveDataAccess", methodName : "select"});
		haxe_Log.trace(props.data,{ fileName : "action/async/LiveDataAccess.hx", lineNumber : 74, className : "action.async.LiveDataAccess", methodName : "select"});
		var sData = null;
		switch(tableRoot[1]) {
		case "Accounts":
			sData = aState.dataStore.accountData;
			sData = action_async_LiveDataAccess.selectType(props.id,props.data,sData,props.selectType);
			var aState1 = aState.locationStore.history;
			var tmp = "" + tableRoot[2] + "/" + view_shared_io_FormApi.params(shared_Utils.keysList(sData.keys()));
			aState1.push(tmp);
			return dispatch(redux_Action.map(action_DataAction.SelectAccounts(props.data)));
		case "Contacts":
			sData = aState.dataStore.contactData;
			sData = action_async_LiveDataAccess.selectType(props.id,props.data,sData,props.selectType);
			haxe_Log.trace("" + tableRoot[2] + "/" + view_shared_io_FormApi.params(shared_Utils.keysList(sData.keys())),{ fileName : "action/async/LiveDataAccess.hx", lineNumber : 86, className : "action.async.LiveDataAccess", methodName : "select"});
			var aState1 = aState.locationStore.history;
			var tmp = "" + tableRoot[2] + "#" + view_shared_io_FormApi.params(shared_Utils.keysList(sData.keys()));
			var tmp1 = "" + tableRoot[2] + "#" + view_shared_io_FormApi.params(shared_Utils.keysList(sData.keys()));
			aState1.push(tmp,{ activeContactUrl : tmp1});
			return dispatch(redux_Action.map(action_DataAction.SelectContacts(props.data)));
		case "Deals":
			sData = aState.dataStore.dealData;
			sData = action_async_LiveDataAccess.selectType(props.id,props.data,sData,props.selectType);
			var aState1 = aState.locationStore.history;
			var tmp = "" + tableRoot[2] + "/" + view_shared_io_FormApi.params(shared_Utils.keysList(sData.keys()));
			aState1.push(tmp);
			return dispatch(redux_Action.map(action_DataAction.SelectDeals(props.data)));
		default:
			return null;
		}
	});
};
action_async_LiveDataAccess.selectType = function(id,data,sData,sT) {
	switch(sT) {
	case "All":
		sData = new haxe_ds_IntMap();
		var _g = new haxe_iterators_MapKeyValueIterator(data);
		while(_g.hasNext()) {
			var _g1 = _g.next();
			var k = _g1.key;
			var v = _g1.value;
			sData.h[k] = v;
		}
		return sData;
	case "One":
		sData.h[id] = data.h[id];
		return sData;
	case "Unselect":
		sData.remove(id);
		return sData;
	case "UnselectAll":
		sData = new haxe_ds_IntMap();
		return sData;
	default:
		haxe_Log.trace(data,{ fileName : "action/async/LiveDataAccess.hx", lineNumber : 120, className : "action.async.LiveDataAccess", methodName : "selectType"});
		sData = new haxe_ds_IntMap();
		sData.h[id] = data.h[id];
		return sData;
	}
};
var action_async_LocationAccess = function() { };
$hxClasses["action.async.LocationAccess"] = action_async_LocationAccess;
action_async_LocationAccess.__name__ = "action.async.LocationAccess";
action_async_LocationAccess.redirect = function(routes,to,props) {
	if(props == null) {
		return redux_thunk_Thunk.Action(function(dispatch,getState) {
			haxe_Log.trace("Redirecting to " + to,{ fileName : "action/async/LocationAccess.hx", lineNumber : 19, className : "action.async.LocationAccess", methodName : "redirect"});
			return dispatch(redux_Action.map(action_LocationAction.LocationChange({ pathname : to, search : "", hash : "", key : null, state : null})));
		});
	}
	return redux_thunk_Thunk.Action(function(dispatch,getState) {
		haxe_Log.trace(props.location.pathname,{ fileName : "action/async/LocationAccess.hx", lineNumber : 30, className : "action.async.LocationAccess", methodName : "redirect"});
		haxe_Log.trace(to,{ fileName : "action/async/LocationAccess.hx", lineNumber : 31, className : "action.async.LocationAccess", methodName : "redirect"});
		var match = null;
		var _g = 0;
		while(_g < routes.length) {
			var route = routes[_g];
			++_g;
			match = react_router_ReactRouter.matchPath(props.location.pathname,{ path : route, exact : true, strict : false});
			haxe_Log.trace("" + route + " => " + Std.string(match),{ fileName : "action/async/LocationAccess.hx", lineNumber : 41, className : "action.async.LocationAccess", methodName : "redirect"});
			if(match != null) {
				return null;
			}
		}
		haxe_Log.trace("history.push(" + to + ")",{ fileName : "action/async/LocationAccess.hx", lineNumber : 47, className : "action.async.LocationAccess", methodName : "redirect"});
		props.history.push(to);
		return null;
	});
};
var model_Contact = function(data) {
	model_ORM.call(this,data);
	this.propertyNames = "id,mandator,creation_date,state,use_email,company_name,co_field,phone_code,phone_number,fax,title,title_pro,first_name,last_name,address,address_2,city,postal_code,country_code,gender,date_of_birth,mobile,email,comments,edited_by,merged,last_locktime,owner".split(",");
};
$hxClasses["model.Contact"] = model_Contact;
model_Contact.__name__ = "model.Contact";
model_Contact.__super__ = model_ORM;
model_Contact.prototype = $extend(model_ORM.prototype,{
	id: null
	,id_initialized: null
	,get_id: function() {
		return this.id;
	}
	,set_id: function(id) {
		if(this.id_initialized) {
			this.modified("id");
		}
		this.id = id;
		this.id_initialized = true;
		return id;
	}
	,mandator: null
	,mandator_initialized: null
	,get_mandator: function() {
		return this.mandator;
	}
	,set_mandator: function(mandator) {
		if(this.mandator_initialized) {
			this.modified("mandator");
		}
		this.mandator = mandator;
		this.mandator_initialized = true;
		return mandator;
	}
	,creation_date: null
	,creation_date_initialized: null
	,get_creation_date: function() {
		return this.creation_date;
	}
	,set_creation_date: function(creation_date) {
		if(this.creation_date_initialized) {
			this.modified("creation_date");
		}
		this.creation_date = creation_date;
		this.creation_date_initialized = true;
		return creation_date;
	}
	,state: null
	,state_initialized: null
	,get_state: function() {
		return this.state;
	}
	,set_state: function(state) {
		if(this.state_initialized) {
			this.modified("state");
		}
		this.state = state;
		this.state_initialized = true;
		return state;
	}
	,use_email: null
	,use_email_initialized: null
	,get_use_email: function() {
		return this.use_email;
	}
	,set_use_email: function(use_email) {
		if(this.use_email_initialized) {
			this.modified("use_email");
		}
		this.use_email = use_email;
		this.use_email_initialized = true;
		return use_email;
	}
	,company_name: null
	,company_name_initialized: null
	,get_company_name: function() {
		return this.company_name;
	}
	,set_company_name: function(company_name) {
		if(this.company_name_initialized) {
			this.modified("company_name");
		}
		this.company_name = company_name;
		this.company_name_initialized = true;
		return company_name;
	}
	,co_field: null
	,co_field_initialized: null
	,get_co_field: function() {
		return this.co_field;
	}
	,set_co_field: function(co_field) {
		if(this.co_field_initialized) {
			this.modified("co_field");
		}
		this.co_field = co_field;
		this.co_field_initialized = true;
		return co_field;
	}
	,phone_code: null
	,phone_code_initialized: null
	,get_phone_code: function() {
		return this.phone_code;
	}
	,set_phone_code: function(phone_code) {
		if(this.phone_code_initialized) {
			this.modified("phone_code");
		}
		this.phone_code = phone_code;
		this.phone_code_initialized = true;
		return phone_code;
	}
	,phone_number: null
	,phone_number_initialized: null
	,get_phone_number: function() {
		return this.phone_number;
	}
	,set_phone_number: function(phone_number) {
		if(this.phone_number_initialized) {
			this.modified("phone_number");
		}
		this.phone_number = phone_number;
		this.phone_number_initialized = true;
		return phone_number;
	}
	,fax: null
	,fax_initialized: null
	,get_fax: function() {
		return this.fax;
	}
	,set_fax: function(fax) {
		if(this.fax_initialized) {
			this.modified("fax");
		}
		this.fax = fax;
		this.fax_initialized = true;
		return fax;
	}
	,title: null
	,title_initialized: null
	,get_title: function() {
		return this.title;
	}
	,set_title: function(title) {
		if(this.title_initialized) {
			this.modified("title");
		}
		this.title = title;
		this.title_initialized = true;
		return title;
	}
	,title_pro: null
	,title_pro_initialized: null
	,get_title_pro: function() {
		return this.title_pro;
	}
	,set_title_pro: function(title_pro) {
		if(this.title_pro_initialized) {
			this.modified("title_pro");
		}
		this.title_pro = title_pro;
		this.title_pro_initialized = true;
		return title_pro;
	}
	,first_name: null
	,first_name_initialized: null
	,get_first_name: function() {
		return this.first_name;
	}
	,set_first_name: function(first_name) {
		if(this.first_name_initialized) {
			this.modified("first_name");
		}
		this.first_name = first_name;
		this.first_name_initialized = true;
		return first_name;
	}
	,last_name: null
	,last_name_initialized: null
	,get_last_name: function() {
		return this.last_name;
	}
	,set_last_name: function(last_name) {
		if(this.last_name_initialized) {
			this.modified("last_name");
		}
		this.last_name = last_name;
		this.last_name_initialized = true;
		return last_name;
	}
	,address: null
	,address_initialized: null
	,get_address: function() {
		return this.address;
	}
	,set_address: function(address) {
		if(this.address_initialized) {
			this.modified("address");
		}
		this.address = address;
		this.address_initialized = true;
		return address;
	}
	,address_2: null
	,address_2_initialized: null
	,get_address_2: function() {
		return this.address_2;
	}
	,set_address_2: function(address_2) {
		if(this.address_2_initialized) {
			this.modified("address_2");
		}
		this.address_2 = address_2;
		this.address_2_initialized = true;
		return address_2;
	}
	,city: null
	,city_initialized: null
	,get_city: function() {
		return this.city;
	}
	,set_city: function(city) {
		if(this.city_initialized) {
			this.modified("city");
		}
		this.city = city;
		this.city_initialized = true;
		return city;
	}
	,postal_code: null
	,postal_code_initialized: null
	,get_postal_code: function() {
		return this.postal_code;
	}
	,set_postal_code: function(postal_code) {
		if(this.postal_code_initialized) {
			this.modified("postal_code");
		}
		this.postal_code = postal_code;
		this.postal_code_initialized = true;
		return postal_code;
	}
	,country_code: null
	,country_code_initialized: null
	,get_country_code: function() {
		return this.country_code;
	}
	,set_country_code: function(country_code) {
		if(this.country_code_initialized) {
			this.modified("country_code");
		}
		this.country_code = country_code;
		this.country_code_initialized = true;
		return country_code;
	}
	,gender: null
	,gender_initialized: null
	,get_gender: function() {
		return this.gender;
	}
	,set_gender: function(gender) {
		if(this.gender_initialized) {
			this.modified("gender");
		}
		this.gender = gender;
		this.gender_initialized = true;
		return gender;
	}
	,date_of_birth: null
	,date_of_birth_initialized: null
	,get_date_of_birth: function() {
		return this.date_of_birth;
	}
	,set_date_of_birth: function(date_of_birth) {
		if(this.date_of_birth_initialized) {
			this.modified("date_of_birth");
		}
		this.date_of_birth = date_of_birth;
		this.date_of_birth_initialized = true;
		return date_of_birth;
	}
	,mobile: null
	,mobile_initialized: null
	,get_mobile: function() {
		return this.mobile;
	}
	,set_mobile: function(mobile) {
		if(this.mobile_initialized) {
			this.modified("mobile");
		}
		this.mobile = mobile;
		this.mobile_initialized = true;
		return mobile;
	}
	,email: null
	,email_initialized: null
	,get_email: function() {
		return this.email;
	}
	,set_email: function(email) {
		if(this.email_initialized) {
			this.modified("email");
		}
		this.email = email;
		this.email_initialized = true;
		return email;
	}
	,comments: null
	,comments_initialized: null
	,get_comments: function() {
		return this.comments;
	}
	,set_comments: function(comments) {
		if(this.comments_initialized) {
			this.modified("comments");
		}
		this.comments = comments;
		this.comments_initialized = true;
		return comments;
	}
	,edited_by: null
	,edited_by_initialized: null
	,get_edited_by: function() {
		return this.edited_by;
	}
	,set_edited_by: function(edited_by) {
		if(this.edited_by_initialized) {
			this.modified("edited_by");
		}
		this.edited_by = edited_by;
		this.edited_by_initialized = true;
		return edited_by;
	}
	,merged: null
	,merged_initialized: null
	,get_merged: function() {
		return this.merged;
	}
	,set_merged: function(merged) {
		if(this.merged_initialized) {
			this.modified("merged");
		}
		this.merged = merged;
		this.merged_initialized = true;
		return merged;
	}
	,last_locktime: null
	,last_locktime_initialized: null
	,get_last_locktime: function() {
		return this.last_locktime;
	}
	,set_last_locktime: function(last_locktime) {
		if(this.last_locktime_initialized) {
			this.modified("last_locktime");
		}
		this.last_locktime = last_locktime;
		this.last_locktime_initialized = true;
		return last_locktime;
	}
	,owner: null
	,owner_initialized: null
	,get_owner: function() {
		return this.owner;
	}
	,set_owner: function(owner) {
		if(this.owner_initialized) {
			this.modified("owner");
		}
		this.owner = owner;
		this.owner_initialized = true;
		return owner;
	}
	,__class__: model_Contact
	,__properties__: {set_owner:"set_owner",get_owner:"get_owner",set_last_locktime:"set_last_locktime",get_last_locktime:"get_last_locktime",set_merged:"set_merged",get_merged:"get_merged",set_edited_by:"set_edited_by",get_edited_by:"get_edited_by",set_comments:"set_comments",get_comments:"get_comments",set_email:"set_email",get_email:"get_email",set_mobile:"set_mobile",get_mobile:"get_mobile",set_date_of_birth:"set_date_of_birth",get_date_of_birth:"get_date_of_birth",set_gender:"set_gender",get_gender:"get_gender",set_country_code:"set_country_code",get_country_code:"get_country_code",set_postal_code:"set_postal_code",get_postal_code:"get_postal_code",set_city:"set_city",get_city:"get_city",set_address_2:"set_address_2",get_address_2:"get_address_2",set_address:"set_address",get_address:"get_address",set_last_name:"set_last_name",get_last_name:"get_last_name",set_first_name:"set_first_name",get_first_name:"get_first_name",set_title_pro:"set_title_pro",get_title_pro:"get_title_pro",set_title:"set_title",get_title:"get_title",set_fax:"set_fax",get_fax:"get_fax",set_phone_number:"set_phone_number",get_phone_number:"get_phone_number",set_phone_code:"set_phone_code",get_phone_code:"get_phone_code",set_co_field:"set_co_field",get_co_field:"get_co_field",set_company_name:"set_company_name",get_company_name:"get_company_name",set_use_email:"set_use_email",get_use_email:"get_use_email",set_state:"set_state",get_state:"get_state",set_creation_date:"set_creation_date",get_creation_date:"get_creation_date",set_mandator:"set_mandator",get_mandator:"get_mandator",set_id:"set_id",get_id:"get_id"}
});
var model_contacts_ContactsModel = function() { };
$hxClasses["model.contacts.ContactsModel"] = model_contacts_ContactsModel;
model_contacts_ContactsModel.__name__ = "model.contacts.ContactsModel";
var model_deals_DealsModel = function() { };
$hxClasses["model.deals.DealsModel"] = model_deals_DealsModel;
model_deals_DealsModel.__name__ = "model.deals.DealsModel";
var react_ReactPaginate = __webpack_require__("./node_modules/react-paginate/dist/index.js").default;
var view_Data = $hx_exports["default"] = function(props) {
	this.renderCount = 0;
	this.rendered = false;
	this.mounted = false;
	this.state = { hasError : false, mounted : false};
	React_Component.call(this,props);
	view_Data._strace = this._trace = false;
	if(this._trace) {
		haxe_Log.trace(props.match,{ fileName : "view/Data.hx", lineNumber : 62, className : "view.Data", methodName : "new"});
	}
	if(this._trace) {
		haxe_Log.trace(props.store,{ fileName : "view/Data.hx", lineNumber : 63, className : "view.Data", methodName : "new"});
	}
	if(props.match.url == "/Data" && props.match.isExact) {
		if(this._trace) {
			haxe_Log.trace("pushing2: /Data/Contacts/List/get",{ fileName : "view/Data.hx", lineNumber : 66, className : "view.Data", methodName : "new"});
		}
		props.history.push("/Data/Contacts/List/get");
	}
};
$hxClasses["view.Data"] = view_Data;
view_Data.__name__ = "view.Data";
view_Data.mapDispatchToProps = function(dispatch) {
	return { redirect : function(path,props) {
		return dispatch(redux_Action.map(action_async_LocationAccess.redirect(["/Data/Contacts/:section?/:action?/:id?","/Data/Deals/:section?/:action?/:id?","/Data/Accounts/:section?/:action?/:id?"],path,props)));
	}};
};
view_Data.__super__ = React_Component;
view_Data.prototype = $extend(React_Component.prototype,{
	mounted: null
	,rendered: null
	,renderCount: null
	,_trace: null
	,componentDidMount: function() {
		this.mounted = true;
	}
	,componentDidCatch: function(error,info) {
		if(this.mounted) {
			this.setState({ hasError : true});
		}
		if(this._trace) {
			haxe_Log.trace(error,{ fileName : "view/Data.hx", lineNumber : 89, className : "view.Data", methodName : "componentDidCatch"});
		}
		if(this._trace) {
			haxe_Log.trace(info,{ fileName : "view/Data.hx", lineNumber : 90, className : "view.Data", methodName : "componentDidCatch"});
		}
	}
	,shouldComponentUpdate: function(nextProps,nextState) {
		if(this._trace) {
			haxe_Log.trace("propsChanged:" + Std.string(nextProps != this.props),{ fileName : "view/Data.hx", lineNumber : 95, className : "view.Data", methodName : "shouldComponentUpdate"});
		}
		if(this._trace) {
			haxe_Log.trace("stateChanged:" + Std.string(nextState != this.state),{ fileName : "view/Data.hx", lineNumber : 97, className : "view.Data", methodName : "shouldComponentUpdate"});
		}
		if(nextState != this.state || nextProps != this.props) {
			return true;
		}
		return nextProps != this.props;
	}
	,render: function() {
		if(this.state.hasError) {
			var tmp = $$tre;
			var tmp1 = react_ReactType.fromString("h1");
			var c = js_Boot.getClass(this);
			return { "$$typeof" : tmp, type : tmp1, props : { children : ["Fehler in ",c.__name__,"."]}, key : null, ref : null};
		}
		if(this._trace) {
			haxe_Log.trace(Reflect.fields(this.props),{ fileName : "view/Data.hx", lineNumber : 139, className : "view.Data", methodName : "render"});
		}
		if(this._trace) {
			haxe_Log.trace(Reflect.fields(this.state),{ fileName : "view/Data.hx", lineNumber : 140, className : "view.Data", methodName : "render"});
		}
		var tmp = react_ReactType.fromComp(React_Fragment);
		var tmp1 = $$tre;
		var tmp2 = react_ReactType.fromString("div");
		var tmp3 = react_ReactType.fromComp(bulma_$components_Tabs);
		var tmp4 = { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_shared_TabLink), props : Object.assign({ },this.props,{ to : "/Data/Contacts", children : "Kontakte"}), key : null, ref : null};
		var tmp5 = $$tre;
		var tmp6 = react_ReactType.fromComp(view_shared_TabLink);
		var tmp7 = this.props;
		var tmp8 = this.props.location.key;
		var tmp9 = shared_Utils.extend(this.props.location.state,{ contact : this.props.location.hash});
		var tmp10 = { "$$typeof" : tmp5, type : tmp6, props : Object.assign({ },tmp7,{ to : { key : tmp8, hash : "", pathname : "/Data/Deals", search : "", state : tmp9}, children : "Aufträge"}), key : null, ref : null};
		var tmp5 = $$tre;
		var tmp6 = react_ReactType.fromComp(view_shared_TabLink);
		var tmp7 = this.props;
		var tmp8 = this.props.location.key;
		var tmp9 = this.props.location.hash;
		var tmp11 = shared_Utils.extend(this.props.location.state,{ contact : this.props.location.hash});
		var tmp12 = { "$$typeof" : tmp5, type : tmp6, props : Object.assign({ },tmp7,{ to : { key : tmp8, hash : tmp9, pathname : "/Data/Accounts", search : "", state : tmp11}, children : "Konten"}), key : null, ref : null};
		var tmp5 = $$tre;
		var tmp6 = react_ReactType.fromComp(view_shared_TabLink);
		var tmp7 = Object.assign({ },this.props,{ to : "/Data/QC", children : "QC"});
		var tmp8 = { "$$typeof" : tmp1, type : tmp2, props : { className : "tabNav2", children : React.createElement(tmp3,{ className : "is-boxed"},tmp4,tmp10,tmp12,{ "$$typeof" : tmp5, type : tmp6, props : tmp7, key : null, ref : null})}, key : null, ref : null};
		var tmp1 = $$tre;
		var tmp2 = react_ReactType.fromString("div");
		var tmp3 = react_ReactType.fromComp(react_router_Switch);
		var tmp4 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Data/Contacts/:section?/:action?/:id?", component : react_ReactType.fromComp(view_data_Contacts)}));
		var tmp5 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Data/Deals/:section?/:action?/:id?", component : react_ReactType.fromComp(view_data_Deals)}));
		var tmp6 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Data/Accounts/:section?/:action?/:id?", component : react_ReactType.fromComp(view_data_Accounts)}));
		var tmp7 = React.createElement(react_ReactType.fromComp(react_router_Route),Object.assign({ },this.props,{ path : "/Data/QC/:section?/:action?/:id?", component : react_ReactType.fromComp(view_data_QC)}));
		var tmp9 = { "$$typeof" : tmp1, type : tmp2, props : { className : "tabContent2", children : React.createElement(tmp3,{ },tmp4,tmp5,tmp6,tmp7)}, key : null, ref : null};
		var tmp1 = $$tre;
		return React.createElement(tmp,{ },tmp8,tmp9,{ "$$typeof" : tmp1, type : view_StatusBar._renderWrapper, props : this.props, key : null, ref : null});
	}
	,renderComponent: function(props) {
		if(this._trace) {
			haxe_Log.trace(props.location,{ fileName : "view/Data.hx", lineNumber : 178, className : "view.Data", methodName : "renderComponent"});
		}
		if(this._trace) {
			haxe_Log.trace(props.match,{ fileName : "view/Data.hx", lineNumber : 179, className : "view.Data", methodName : "renderComponent"});
		}
		return null;
	}
	,internalRedirect: function(path) {
		if(path == null) {
			path = "/Data/Contacts/List/get";
		}
		if(this._trace) {
			haxe_Log.trace("" + this.props.location.pathname + " " + path,{ fileName : "view/Data.hx", lineNumber : 185, className : "view.Data", methodName : "internalRedirect"});
		}
		if(this.props.location.pathname != path) {
			if(path != this.props.location.pathname) {
				this.props.redirect(path,this.props);
			}
		}
	}
	,__class__: view_Data
});
var view_data_Accounts = function(props) {
	React_Component.call(this,props);
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/data/Accounts.hx", lineNumber : 41, className : "view.data.Accounts", methodName : "new"});
	haxe_Log.trace(props.match.params.section,{ fileName : "view/data/Accounts.hx", lineNumber : 42, className : "view.data.Accounts", methodName : "new"});
	this.state = { clean : true, hasError : false, mounted : false, loading : true, sideMenu : view_shared_io_FormApi.initSideMenu(this,[{ dataClassPath : "data.Contacts", label : "Konten", section : "List", items : view_data_accounts_List.menuItems},{ dataClassPath : "contact.Deals", label : "Aufträge", section : "Edit", items : view_data_accounts_Edit.menuItems}],{ section : props.match.params.section == null ? "DBSync" : props.match.params.section, sameWidth : true})};
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/data/Accounts.hx", lineNumber : 69, className : "view.data.Accounts", methodName : "new"});
};
$hxClasses["view.data.Accounts"] = view_data_Accounts;
view_data_Accounts.__name__ = "view.data.Accounts";
view_data_Accounts.__super__ = React_Component;
view_data_Accounts.prototype = $extend(React_Component.prototype,{
	componentDidCatch: function(error,info) {
		if(this.state.mounted) {
			this.setState({ hasError : true});
		}
		haxe_Log.trace(error,{ fileName : "view/data/Accounts.hx", lineNumber : 91, className : "view.data.Accounts", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		this.setState({ mounted : true});
		if(this.props.match.params.section == null) {
			var basePath = this.props.match.url;
			this.props.history.push("" + basePath + "/DB");
			haxe_Log.trace(this.props.history.location.pathname,{ fileName : "view/data/Accounts.hx", lineNumber : 102, className : "view.data.Accounts", methodName : "componentDidMount"});
			haxe_Log.trace("setting section to:DB",{ fileName : "view/data/Accounts.hx", lineNumber : 103, className : "view.data.Accounts", methodName : "componentDidMount"});
		}
		haxe_Log.trace("",{ fileName : "view/data/Accounts.hx", lineNumber : 105, className : "view.data.Accounts", methodName : "componentDidMount"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/Accounts.hx", lineNumber : 128, className : "view.data.Accounts", methodName : "render"});
		switch(this.props.match.params.section) {
		case "Edit":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_data_accounts_Edit), props : Object.assign({ },this.props,{ fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		case "List":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_data_accounts_List), props : Object.assign({ },this.props,{ fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		default:
			return null;
		}
	}
	,__class__: view_data_Accounts
});
var view_data_Contacts = function(props) {
	React_Component.call(this,props);
	view_data_Contacts._strace = this._trace = false;
	this.dataAccess = model_contacts_ContactsModel.dataAccess;
	this.dataDisplay = model_contacts_ContactsModel.dataDisplay;
	if(this._trace) {
		haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/Contacts.hx", lineNumber : 75, className : "view.data.Contacts", methodName : "new"});
	}
	if(this._trace) {
		haxe_Log.trace(props.match.params,{ fileName : "view/data/Contacts.hx", lineNumber : 76, className : "view.data.Contacts", methodName : "new"});
	}
	this.state = App.initEState({ dataTable : [], loading : false, contactData : new haxe_ds_IntMap(), selectedRows : [], values : new haxe_ds_StringMap()},this);
	if(props.match.params.section == null) {
		if(this._trace) {
			haxe_Log.trace("reme",{ fileName : "view/data/Contacts.hx", lineNumber : 83, className : "view.data.Contacts", methodName : "new"});
		}
		var baseUrl = props.match.path.split(":section")[0];
		if(props.dataStore.contactData.iterator().hasNext()) {
			if(this._trace) {
				haxe_Log.trace(shared_Utils.keysList(props.dataStore.contactData.keys()),{ fileName : "view/data/Contacts.hx", lineNumber : 87, className : "view.data.Contacts", methodName : "new"});
			}
		}
		var props1 = props.history;
		var tmp = props.dataStore.contactData.iterator().hasNext() ? "/" + Std.string(shared_Utils.keysList(props.dataStore.contactData.keys())) : "";
		props1.push("" + baseUrl + "List/get" + tmp);
	}
};
$hxClasses["view.data.Contacts"] = view_data_Contacts;
view_data_Contacts.__name__ = "view.data.Contacts";
view_data_Contacts.mapDispatchToProps = function(dispatch) {
	if(view_data_Contacts._strace) {
		haxe_Log.trace("ok",{ fileName : "view/data/Contacts.hx", lineNumber : 112, className : "view.data.Contacts", methodName : "mapDispatchToProps"});
	}
	return { storeData : function(id,action) {
		dispatch(redux_Action.map(action_async_LiveDataAccess.storeData(id,action)));
	}, select : function(id,data,match,selectType) {
		if(id == null) {
			id = -1;
		}
		if(view_data_Contacts._strace) {
			haxe_Log.trace("select:" + id + " selectType:" + selectType,{ fileName : "view/data/Contacts.hx", lineNumber : 125, className : "view.data.Contacts", methodName : "mapDispatchToProps"});
		}
		dispatch(redux_Action.map(action_async_LiveDataAccess.select({ id : id, data : data, match : match, selectType : selectType})));
	}};
};
view_data_Contacts.mapStateToProps = function(aState) {
	if(view_data_Contacts._strace) {
		haxe_Log.trace(Reflect.fields(aState),{ fileName : "view/data/Contacts.hx", lineNumber : 135, className : "view.data.Contacts", methodName : "mapStateToProps"});
	}
	if(aState.dataStore.contactData != null) {
		if(view_data_Contacts._strace) {
			haxe_Log.trace(aState.dataStore.contactData.keys().next(),{ fileName : "view/data/Contacts.hx", lineNumber : 137, className : "view.data.Contacts", methodName : "mapStateToProps"});
		}
	}
	if(aState.dataStore.contactsDbData != null) {
		if(view_data_Contacts._strace) {
			var tmp = aState.dataStore.contactsDbData.dataRows[0];
			haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/data/Contacts.hx", lineNumber : 139, className : "view.data.Contacts", methodName : "mapStateToProps"});
		} else {
			if(view_data_Contacts._strace) {
				haxe_Log.trace(aState.dataStore,{ fileName : "view/data/Contacts.hx", lineNumber : 142, className : "view.data.Contacts", methodName : "mapStateToProps"});
			}
			if(view_data_Contacts._strace) {
				haxe_Log.trace(Reflect.fields(aState.dataStore),{ fileName : "view/data/Contacts.hx", lineNumber : 143, className : "view.data.Contacts", methodName : "mapStateToProps"});
			}
		}
	}
	if(view_data_Contacts._strace) {
		haxe_Log.trace(App.store.getState().dataStore.contactsDbData,{ fileName : "view/data/Contacts.hx", lineNumber : 145, className : "view.data.Contacts", methodName : "mapStateToProps"});
	}
	var bState = { dataStore : aState.dataStore, userState : aState.userState};
	if(view_data_Contacts._strace) {
		haxe_Log.trace(bState.dataStore.contactData,{ fileName : "view/data/Contacts.hx", lineNumber : 152, className : "view.data.Contacts", methodName : "mapStateToProps"});
	}
	return bState;
};
view_data_Contacts.__super__ = React_Component;
view_data_Contacts.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,dbData: null
	,dbMetaData: null
	,_trace: null
	,componentDidCatch: function(error,info) {
		try {
			this.setState({ hasError : true});
		} catch( _g ) {
			var ex = haxe_Exception.caught(_g).unwrap();
			if(this._trace) {
				haxe_Log.trace(ex,{ fileName : "view/data/Contacts.hx", lineNumber : 104, className : "view.data.Contacts", methodName : "componentDidCatch"});
			}
		}
		if(this._trace) {
			haxe_Log.trace(error,{ fileName : "view/data/Contacts.hx", lineNumber : 106, className : "view.data.Contacts", methodName : "componentDidCatch"});
		}
		me_cunity_debug_Out.dumpStack(haxe_CallStack.callStack(),{ fileName : "view/data/Contacts.hx", lineNumber : 107, className : "view.data.Contacts", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		if(this._trace) {
			haxe_Log.trace(this.props.location.pathname,{ fileName : "view/data/Contacts.hx", lineNumber : 158, className : "view.data.Contacts", methodName : "componentDidMount"});
		}
	}
	,render: function() {
		if(this._trace) {
			haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/Contacts.hx", lineNumber : 168, className : "view.data.Contacts", methodName : "render"});
		}
		if(this._trace) {
			haxe_Log.trace(this.props.match.params.action,{ fileName : "view/data/Contacts.hx", lineNumber : 169, className : "view.data.Contacts", methodName : "render"});
		}
		switch(this.props.match.params.section) {
		case "Edit":
			return { "$$typeof" : $$tre, type : view_data_contacts_Edit._renderWrapper, props : Object.assign({ },this.props,{ parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		case "List":
			return { "$$typeof" : $$tre, type : view_data_contacts_List._renderWrapper, props : Object.assign({ },this.props,{ limit : 100, parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		default:
			return null;
		}
	}
	,setStateFromChild: function(cState) {
		this.setState(cState);
	}
	,__class__: view_data_Contacts
});
var view_data_Deals = function(props) {
	React_Component.call(this,props);
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/data/Deals.hx", lineNumber : 46, className : "view.data.Deals", methodName : "new"});
	haxe_Log.trace(props.match.params.section,{ fileName : "view/data/Deals.hx", lineNumber : 47, className : "view.data.Deals", methodName : "new"});
	this.state = { clean : true, hasError : false, mounted : false, loading : true, sideMenu : view_shared_io_FormApi.initSideMenu(this,[{ dataClassPath : "data.deals.List", label : "Aufträge", section : "List", items : view_data_deals_List.menuItems},{ dataClassPath : "data.deals.Edit", label : "Aufträge", section : "Edit", items : view_data_deals_Edit.menuItems}],{ section : props.match.params.section == null ? "List" : props.match.params.section, sameWidth : true})};
	haxe_Log.trace(Reflect.fields(props),{ fileName : "view/data/Deals.hx", lineNumber : 74, className : "view.data.Deals", methodName : "new"});
};
$hxClasses["view.data.Deals"] = view_data_Deals;
view_data_Deals.__name__ = "view.data.Deals";
view_data_Deals.__super__ = React_Component;
view_data_Deals.prototype = $extend(React_Component.prototype,{
	componentDidCatch: function(error,info) {
		if(this.state.mounted) {
			this.setState({ hasError : true});
		}
		haxe_Log.trace(error,{ fileName : "view/data/Deals.hx", lineNumber : 96, className : "view.data.Deals", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		if(this.props.match.params.section == null) {
			var basePath = this.props.match.url;
			this.props.history.push("" + basePath + "/List/get",this.props.location);
			haxe_Log.trace(this.props.history.location.pathname,{ fileName : "view/data/Deals.hx", lineNumber : 107, className : "view.data.Deals", methodName : "componentDidMount"});
			haxe_Log.trace("redirecting to " + basePath + "/List/get",{ fileName : "view/data/Deals.hx", lineNumber : 108, className : "view.data.Deals", methodName : "componentDidMount"});
		}
		haxe_Log.trace("",{ fileName : "view/data/Deals.hx", lineNumber : 110, className : "view.data.Deals", methodName : "componentDidMount"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/Deals.hx", lineNumber : 116, className : "view.data.Deals", methodName : "render"});
		switch(this.props.match.params.section) {
		case "Edit":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_data_deals_Edit), props : Object.assign({ },this.props,{ fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		case "List":
			return { "$$typeof" : $$tre, type : view_data_deals_List._renderWrapper, props : Object.assign({ },this.props,{ limit : 100, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		default:
			return null;
		}
	}
	,__class__: view_data_Deals
});
var view_data_QC = function(props) {
	React_Component.call(this,props);
	this.dataAccess = model_contacts_ContactsModel.dataAccess;
	this.dataDisplay = model_contacts_ContactsModel.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/QC.hx", lineNumber : 73, className : "view.data.QC", methodName : "new"});
	haxe_Log.trace(props.match.params,{ fileName : "view/data/QC.hx", lineNumber : 74, className : "view.data.QC", methodName : "new"});
	if(props.match.params.section == null) {
		haxe_Log.trace("reme",{ fileName : "view/data/QC.hx", lineNumber : 78, className : "view.data.QC", methodName : "new"});
		var baseUrl = props.match.path.split(":section")[0];
		props.history.push("" + baseUrl + "List/get");
	}
	this.state = App.initEState({ dataTable : [], loading : false, contactData : new haxe_ds_IntMap(), selectedRows : [], values : new haxe_ds_StringMap()},this);
};
$hxClasses["view.data.QC"] = view_data_QC;
view_data_QC.__name__ = "view.data.QC";
view_data_QC.mapDispatchToProps = function(dispatch) {
	haxe_Log.trace("ok",{ fileName : "view/data/QC.hx", lineNumber : 105, className : "view.data.QC", methodName : "mapDispatchToProps"});
	return { storeData : function(id,action) {
		dispatch(redux_Action.map(action_async_LiveDataAccess.storeData(id,action)));
	}, select : function(id,data,match,selectType) {
		if(id == null) {
			id = -1;
		}
		haxe_Log.trace("select:" + id + " selectType:" + selectType,{ fileName : "view/data/QC.hx", lineNumber : 118, className : "view.data.QC", methodName : "mapDispatchToProps"});
		dispatch(redux_Action.map(action_async_LiveDataAccess.select({ id : id, data : data, match : match, selectType : selectType})));
	}, storeActData : function(data) {
		dispatch(redux_Action.map(action_DataAction.SelectActContacts(data)));
	}, storeContactsList : function(data) {
		dispatch(redux_Action.map(action_DataAction.ContactsLoaded(data)));
	}};
};
view_data_QC.mapStateToProps = function(aState) {
	haxe_Log.trace(Reflect.fields(aState),{ fileName : "view/data/QC.hx", lineNumber : 139, className : "view.data.QC", methodName : "mapStateToProps"});
	if(aState.dataStore.contactData != null) {
		haxe_Log.trace(aState.dataStore.contactData.keys().next(),{ fileName : "view/data/QC.hx", lineNumber : 141, className : "view.data.QC", methodName : "mapStateToProps"});
	}
	if(aState.dataStore.contactsDbData != null) {
		var tmp = aState.dataStore.contactsDbData.dataRows[0];
		haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/data/QC.hx", lineNumber : 143, className : "view.data.QC", methodName : "mapStateToProps"});
	} else {
		haxe_Log.trace(aState.dataStore,{ fileName : "view/data/QC.hx", lineNumber : 146, className : "view.data.QC", methodName : "mapStateToProps"});
		haxe_Log.trace(Reflect.fields(aState.dataStore),{ fileName : "view/data/QC.hx", lineNumber : 147, className : "view.data.QC", methodName : "mapStateToProps"});
	}
	haxe_Log.trace(App.store.getState().dataStore.contactsDbData,{ fileName : "view/data/QC.hx", lineNumber : 149, className : "view.data.QC", methodName : "mapStateToProps"});
	var bState = { dataStore : aState.dataStore, userState : aState.userState};
	haxe_Log.trace(bState.dataStore.contactData,{ fileName : "view/data/QC.hx", lineNumber : 156, className : "view.data.QC", methodName : "mapStateToProps"});
	return bState;
};
view_data_QC.__super__ = React_Component;
view_data_QC.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,dbData: null
	,dbMetaData: null
	,componentDidCatch: function(error,info) {
		try {
			this.setState({ hasError : true});
		} catch( _g ) {
			var ex = haxe_Exception.caught(_g).unwrap();
			haxe_Log.trace(ex,{ fileName : "view/data/QC.hx", lineNumber : 97, className : "view.data.QC", methodName : "componentDidCatch"});
		}
		haxe_Log.trace(error,{ fileName : "view/data/QC.hx", lineNumber : 99, className : "view.data.QC", methodName : "componentDidCatch"});
		me_cunity_debug_Out.dumpStack(haxe_CallStack.callStack(),{ fileName : "view/data/QC.hx", lineNumber : 100, className : "view.data.QC", methodName : "componentDidCatch"});
	}
	,componentDidMount: function() {
		haxe_Log.trace(this.props.location.pathname,{ fileName : "view/data/QC.hx", lineNumber : 162, className : "view.data.QC", methodName : "componentDidMount"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/QC.hx", lineNumber : 172, className : "view.data.QC", methodName : "render"});
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/data/QC.hx", lineNumber : 173, className : "view.data.QC", methodName : "render"});
		switch(this.props.match.params.section) {
		case "Edit":
			return { "$$typeof" : $$tre, type : view_data_contacts_Edit._renderWrapper, props : Object.assign({ },this.props,{ parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		case "List":
			return { "$$typeof" : $$tre, type : view_data_contacts_List._renderWrapper, props : Object.assign({ },this.props,{ limit : 100, parentComponent : this, formApi : this.state.formApi, fullWidth : true, sideMenu : this.state.sideMenu}), key : null, ref : null};
		default:
			return null;
		}
	}
	,setStateFromChild: function(cState) {
		this.setState(cState);
	}
	,__class__: view_data_QC
});
var view_data_accounts_Edit = function(props) {
	var _gthis = this;
	React_Component.call(this,props);
	haxe_Log.trace(props.match.params,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 69, className : "view.data.accounts.Edit", methodName : "new"});
	this.dataAccess = model_contacts_ContactsModel.dataAccess;
	this.initialState = null;
	if(props.match.params.id == null && new EReg("edit(/)*$","").match(props.match.params.action)) {
		haxe_Log.trace("nothing selected - redirect",{ fileName : "view/data/accounts/Edit.hx", lineNumber : 80, className : "view.data.accounts.Edit", methodName : "new"});
		var baseUrl = props.match.path.split(":section")[0];
		props.history.push("" + baseUrl + "List/get");
		return;
	}
	this.fieldNames = [];
	var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
	while(k.hasNext()) {
		var k1 = k.next();
		this.fieldNames.push(k1);
	}
	this.dataDisplay = model_contacts_ContactsModel.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 91, className : "view.data.accounts.Edit", methodName : "new"});
	this.formRef = React.createRef();
	if(props.match.params.id != null) {
		this.initialState.set_id(Std.parseInt(props.match.params.id));
	}
	haxe_Log.trace(props.dataStore.contactActData,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 96, className : "view.data.accounts.Edit", methodName : "new"});
	haxe_Log.trace(props.dataStore.contactData,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 97, className : "view.data.accounts.Edit", methodName : "new"});
	var tmp;
	if(this.initialState.get_id() != null) {
		var _this = props.dataStore.contactData;
		var key = this.initialState.get_id();
		tmp = _this.h.hasOwnProperty(key);
	} else {
		tmp = false;
	}
	if(tmp) {
		this.initialState = this.loadContactData(this.initialState.get_id());
		haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 102, className : "view.data.accounts.Edit", methodName : "new"});
		this.actualState = view_shared_io_Observer.run(this.actualState,function(newState) {
			_gthis.actualState = newState;
			haxe_Log.trace(_gthis.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 106, className : "view.data.accounts.Edit", methodName : "new"});
		});
	} else {
		haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 111, className : "view.data.accounts.Edit", methodName : "new"});
	}
	this.state = App.initEState({ dataTable : [], formBuilder : new view_shared_FormBuilder(this), initialState : this.initialState, loading : false, selectedRows : [], sideMenu : view_shared_io_FormApi.initSideMenu2(this,{ dataClassPath : "data.Contacts", label : "Bearbeiten", section : "Edit", items : view_data_accounts_Edit.menuItems},{ section : props.match.params.section == null ? "Edit" : props.match.params.section, sameWidth : true}), values : new haxe_ds_StringMap()},this);
	haxe_Log.trace(this.state.initialState.id,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 136, className : "view.data.accounts.Edit", methodName : "new"});
};
$hxClasses["view.data.accounts.Edit"] = view_data_accounts_Edit;
view_data_accounts_Edit.__name__ = "view.data.accounts.Edit";
view_data_accounts_Edit.mapStateToProps = function(aState) {
	haxe_Log.trace(aState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 161, className : "view.data.accounts.Edit", methodName : "mapStateToProps"});
	return { userState : aState.userState};
};
view_data_accounts_Edit.__super__ = React_Component;
view_data_accounts_Edit.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,dbData: null
	,dbMetaData: null
	,formRef: null
	,fieldNames: null
	,actualState: null
	,initialState: null
	,loadContactData: function(id) {
		haxe_Log.trace("loading:" + id,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 141, className : "view.data.accounts.Edit", methodName : "loadContactData"});
		return null;
	}
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 169, className : "view.data.accounts.Edit", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,componentDidMount: function() {
		var _gthis = this;
		window.addEventListener("beforeunload",$bind(this,this.sessionStore));
		var sessContacts = window.sessionStorage.getItem("contacts");
		if(sessContacts != null) {
			haxe_Log.trace(JSON.parse(sessContacts),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 179, className : "view.data.accounts.Edit", methodName : "componentDidMount"});
			this.actualState = JSON.parse(sessContacts);
			haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 181, className : "view.data.accounts.Edit", methodName : "componentDidMount"});
			this.forceUpdate();
		} else {
			var tmp;
			if(this.initialState.get_id() != null) {
				var _this = App.store.getState().dataStore.contactData;
				var key = this.initialState.get_id();
				tmp = !_this.h.hasOwnProperty(key);
			} else {
				tmp = false;
			}
			if(tmp) {
				App.store.dispatch(redux_Action.map(action_async_DBAccess.get({ action : "get", className : "data.Contacts", table : "contacts", filter : "id|" + this.initialState.get_id(), userState : App.store.getState().userState})));
			} else if(this.actualState == null) {
				this.actualState = react_ReactUtil.copy(this.initialState);
				this.actualState = view_shared_io_Observer.run(this.actualState,function(newState) {
					_gthis.actualState = newState;
					haxe_Log.trace(_gthis.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 203, className : "view.data.accounts.Edit", methodName : "componentDidMount"});
				});
			}
		}
		if(react_ReactRef.get_current(this.formRef) != null) {
			react_ReactRef.get_current(this.formRef).addEventListener("keyup",$bind(this,this.handleChange));
			react_ReactRef.get_current(this.formRef).addEventListener("mouseup",function(ev) {
				haxe_Log.trace(ev.target.value,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 215, className : "view.data.accounts.Edit", methodName : "componentDidMount"});
			});
		}
	}
	,shouldComponentUpdate: function(nextProps,nextState) {
		haxe_Log.trace("propsChanged:" + Std.string(nextProps != this.props),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 222, className : "view.data.accounts.Edit", methodName : "shouldComponentUpdate"});
		haxe_Log.trace("stateChanged:" + Std.string(nextState != this.state),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 223, className : "view.data.accounts.Edit", methodName : "shouldComponentUpdate"});
		if(this.props.dataStore != null && this.actualState == null) {
			this.actualState = this.loadContactData(this.initialState.get_id());
			this.setState({ initialState : this.actualState, actualState : this.actualState});
		}
		if(nextState != this.state) {
			return true;
		}
		return nextProps != this.props;
	}
	,componentWillUnmount: function() {
		var _g = new haxe_ds_IntMap();
		var key = this.initialState.get_id();
		var _g1 = new haxe_ds_StringMap();
		var _g2 = 0;
		var _g3 = Reflect.fields(this.actualState);
		while(_g2 < _g3.length) {
			var f = _g3[_g2];
			++_g2;
			_g1.h[f] = Reflect.field(this.actualState,f);
		}
		_g.h[key] = _g1;
		var actData = _g;
		haxe_Log.trace(actData,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 243, className : "view.data.accounts.Edit", methodName : "componentWillUnmount"});
		App.store.dispatch(redux_Action.map(action_DataAction.SelectActContacts(actData)));
	}
	,sessionStore: function() {
		haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 248, className : "view.data.accounts.Edit", methodName : "sessionStore"});
		window.sessionStorage.setItem("contacts",JSON.stringify(this.actualState));
		window.removeEventListener("beforeunload",$bind(this,this.sessionStore));
	}
	,doChange: function(name,value) {
		haxe_Log.trace("" + name + ": " + value,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 254, className : "view.data.accounts.Edit", methodName : "doChange"});
		if(name != null && name != "") {
			this.actualState[name] = value;
		}
		this.setState({ initialState : this.actualState});
	}
	,handleChange: function(e) {
		var el = e.target;
		if(el.name != "" && el.name != null) {
			haxe_Log.trace(">>" + Std.string(el.name) + "=>" + Std.string(el.value) + "<<",{ fileName : "view/data/accounts/Edit.hx", lineNumber : 267, className : "view.data.accounts.Edit", methodName : "handleChange"});
			this.actualState[el.name] = el.value;
			haxe_Log.trace(this.actualState.get_last_name(),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 270, className : "view.data.accounts.Edit", methodName : "handleChange"});
		}
	}
	,handleSubmit: function(event) {
		event.preventDefault();
		haxe_Log.trace(this.state.initialState.id,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 285, className : "view.data.accounts.Edit", methodName : "handleSubmit"});
		var doc = window.document;
		var formElement = js_Boot.__cast(doc.querySelector("form[name=\"contact\"]") , HTMLFormElement);
		var elements = formElement.elements;
		var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
		while(k.hasNext()) {
			var k1 = k.next();
			if(k1 == "id") {
				continue;
			}
			try {
				var item = elements.namedItem(k1);
				var o = this.actualState;
				var field = item.name;
				var value;
				switch(item.type) {
				case "checkbox":
					value = item.checked ? 1 : 0;
					break;
				case "select-multiple":case "select-one":
					var sOpts = item.selectedOptions;
					if(sOpts.length > 1) {
						var _g = [];
						var _g1 = 0;
						var _g2 = sOpts.length;
						while(_g1 < _g2) {
							var o1 = _g1++;
							_g.push(sOpts[o1].value);
						}
						value = _g.join("|");
					} else {
						value = item.value;
					}
					break;
				default:
					value = item.value;
				}
				o[field] = value;
			} catch( _g3 ) {
				var ex = haxe_Exception.caught(_g3).unwrap();
				haxe_Log.trace(ex,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 320, className : "view.data.accounts.Edit", methodName : "handleSubmit"});
			}
		}
		haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 324, className : "view.data.accounts.Edit", methodName : "handleSubmit"});
		this.go(this.actualState);
	}
	,go: function(aState) {
		haxe_Log.trace(Reflect.fields(aState),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 331, className : "view.data.accounts.Edit", methodName : "go"});
		var dbaProps = { action : this.props.match.params.action, className : "data.Contacts", dataSource : null, table : "contacts", userState : this.props.userState};
		switch(this.props.match.params.action) {
		case "delete":case "get":
			var _g = new haxe_ds_StringMap();
			var _g1 = new haxe_ds_StringMap();
			_g1.h["filter"] = "id|" + Std.string(this.state.initialState.id);
			_g.h["contacts"] = _g1;
			dbaProps.dataSource = _g;
			break;
		case "insert":
			var _g = 0;
			var _g1 = this.fieldNames;
			while(_g < _g1.length) {
				var f = _g1[_g];
				++_g;
				haxe_Log.trace("" + f + " =>" + Std.string(Reflect.field(aState,f)) + "<=",{ fileName : "view/data/accounts/Edit.hx", lineNumber : 345, className : "view.data.accounts.Edit", methodName : "go"});
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
			dbaProps.dataSource = _g;
			break;
		case "update":
			var _g = 0;
			var _g1 = this.fieldNames;
			while(_g < _g1.length) {
				var f = _g1[_g];
				++_g;
				if(Reflect.field(aState,f) == "") {
					Reflect.deleteField(aState,f);
				}
			}
			var _g = new haxe_ds_StringMap();
			var _g1 = new haxe_ds_StringMap();
			_g1.h["data"] = aState;
			_g1.h["filter"] = "id|" + Std.string(this.state.initialState.id);
			_g.h["contacts"] = _g1;
			dbaProps.dataSource = _g;
			break;
		}
		App.store.dispatch(redux_Action.map(action_async_DBAccess.execute(dbaProps)));
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + "/" + this.props.match.params.action + " state.dataTable:" + Std.string(this.state.dataTable != null),{ fileName : "view/data/accounts/Edit.hx", lineNumber : 385, className : "view.data.accounts.Edit", methodName : "renderResults"});
		haxe_Log.trace("########### action:" + this.props.match.params.action,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 387, className : "view.data.accounts.Edit", methodName : "renderResults"});
		switch(this.props.match.params.action) {
		case "insert":
			haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 409, className : "view.data.accounts.Edit", methodName : "renderResults"});
			var tmp = this.state.formBuilder;
			var tmp1 = this.state.handleSubmit;
			var _g = new haxe_ds_StringMap();
			var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
			while(k.hasNext()) {
				var k1 = k.next();
				_g.h[k1] = this.dataAccess.h["update"].view.h[k1];
			}
			return tmp.renderForm({ handleSubmit : tmp1, fields : _g, model : "contact", ref : this.formRef, title : "Kontakt - Neue Stammdaten"},this.actualState);
		case "update":
			haxe_Log.trace(this.actualState,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 393, className : "view.data.accounts.Edit", methodName : "renderResults"});
			if(this.actualState == null) {
				return this.state.formApi.renderWait();
			} else {
				var tmp = this.state.formBuilder;
				var tmp1 = this.state.handleSubmit;
				var _g = new haxe_ds_StringMap();
				var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
				while(k.hasNext()) {
					var k1 = k.next();
					_g.h[k1] = this.dataAccess.h["update"].view.h[k1];
				}
				return tmp.renderForm({ handleSubmit : tmp1, fields : _g, model : "contact", ref : this.formRef, title : "Kontakt - Bearbeite Stammdaten"},this.actualState);
			}
			break;
		default:
			return null;
		}
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 426, className : "view.data.accounts.Edit", methodName : "render"});
		switch(this.props.match.params.action) {
		case "insert":
			return this.state.formApi.render(this.renderResults());
		case "update":
			return this.state.formApi.render(this.renderResults());
		default:
			return this.state.formApi.render(this.renderResults());
		}
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/data/accounts/Edit.hx", lineNumber : 449, className : "view.data.accounts.Edit", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["Contact"].items;
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
	,__class__: view_data_accounts_Edit
});
var view_data_accounts_List = function(props) {
	React_Component.call(this,props);
	this.dataDisplay = view_data_accounts_model_Accounts.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/accounts/List.hx", lineNumber : 39, className : "view.data.accounts.List", methodName : "new"});
	this.state = App.initEState({ loading : false, values : new haxe_ds_StringMap()},this);
	haxe_Log.trace(this.state.loading,{ fileName : "view/data/accounts/List.hx", lineNumber : 41, className : "view.data.accounts.List", methodName : "new"});
};
$hxClasses["view.data.accounts.List"] = view_data_accounts_List;
view_data_accounts_List.__name__ = "view.data.accounts.List";
view_data_accounts_List.mapStateToProps = function(aState) {
	return { userState : aState.userState};
};
view_data_accounts_List.__super__ = React_Component;
view_data_accounts_List.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,dbData: null
	,dbMetaData: null
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/accounts/List.hx", lineNumber : 53, className : "view.data.accounts.List", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,get: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi :)",{ fileName : "view/data/accounts/List.hx", lineNumber : 59, className : "view.data.accounts.List", methodName : "get"});
		var s = new hxbit_Serializer();
		this.state.formApi.requests.push(haxe_ds_Either.Right(loader_BinaryLoader.create("" + Std.string(App.config.api),{ id : this.props.userState.dbUser.id, jwt : this.props.userState.dbUser.jwt, className : "data.Contacts", action : "get", devIP : App.devIP},function(data) {
			haxe_Log.trace(data.dataInfo == null ? "null" : haxe_ds_StringMap.stringify(data.dataInfo.h),{ fileName : "view/data/accounts/List.hx", lineNumber : 81, className : "view.data.accounts.List", methodName : "get"});
			if(data.dataRows.length > 0) {
				_gthis.setState({ dataTable : data.dataRows});
			}
		})));
	}
	,edit: function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/accounts/List.hx", lineNumber : 90, className : "view.data.accounts.List", methodName : "edit"});
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
				haxe_Log.trace(k1,{ fileName : "view/data/accounts/List.hx", lineNumber : 101, className : "view.data.accounts.List", methodName : "initStateFromDataTable"});
				if(this.dataDisplay.h["fieldsList"].columns.h[k1].cellFormat == view_shared_Format.formatBool) {
					rS[k1] = dR.h[k1] == "Y";
				} else {
					rS[k1] = dR.h[k1];
				}
			}
			iS[dR.h["id"]] = rS;
		}
		haxe_Log.trace(iS,{ fileName : "view/data/accounts/List.hx", lineNumber : 111, className : "view.data.accounts.List", methodName : "initStateFromDataTable"});
		return iS;
	}
	,componentDidMount: function() {
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		var value = new haxe_ds_StringMap();
		_g1.h["contacts"] = value;
		var value = { source : _g1, view : new haxe_ds_StringMap()};
		_g.h["get"] = value;
		this.dataAccess = _g;
		if(this.props.match.params.action != null) {
			var fun = Reflect.field(this,this.props.match.params.action);
			if(Reflect.isFunction(fun)) {
				fun.apply(this,null);
			}
		} else {
			this.setState({ loading : false});
		}
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + ":" + Std.string(this.state.dataTable != null),{ fileName : "view/data/accounts/List.hx", lineNumber : 141, className : "view.data.accounts.List", methodName : "renderResults"});
		haxe_Log.trace(this.state.loading,{ fileName : "view/data/accounts/List.hx", lineNumber : 143, className : "view.data.accounts.List", methodName : "renderResults"});
		if(this.state.loading) {
			return this.state.formApi.renderWait();
		}
		haxe_Log.trace("###########loading:" + Std.string(this.state.loading),{ fileName : "view/data/accounts/List.hx", lineNumber : 146, className : "view.data.accounts.List", methodName : "renderResults"});
		switch(this.props.match.params.action) {
		case "delete":
			return null;
		case "get":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["contactList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		case "insert":
			haxe_Log.trace(this.dataDisplay.h["fieldsList"],{ fileName : "view/data/accounts/List.hx", lineNumber : 162, className : "view.data.accounts.List", methodName : "renderResults"});
			haxe_Log.trace(Std.string(this.state.dataTable[29].h["id"]) + "<<<",{ fileName : "view/data/accounts/List.hx", lineNumber : 163, className : "view.data.accounts.List", methodName : "renderResults"});
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["fieldsList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		case "update":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["clientList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		default:
			return null;
		}
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/accounts/List.hx", lineNumber : 180, className : "view.data.accounts.List", methodName : "render"});
		var tmp = this.state.formApi;
		var tmp1 = react_ReactType.fromComp(React_Fragment);
		var tmp2 = $$tre;
		var tmp3 = react_ReactType.fromString("form");
		var tmp4 = this.renderResults();
		return tmp.render(React.createElement(tmp1,{ },{ "$$typeof" : tmp2, type : tmp3, props : { className : "tabComponentForm", children : tmp4}, key : null, ref : null}));
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/data/accounts/List.hx", lineNumber : 192, className : "view.data.accounts.List", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["Contact"].items;
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
	,__class__: view_data_accounts_List
});
var view_data_accounts_model_Accounts = function() { };
$hxClasses["view.data.accounts.model.Accounts"] = view_data_accounts_model_Accounts;
view_data_accounts_model_Accounts.__name__ = "view.data.accounts.model.Accounts";
var view_data_contacts_Edit = function(props) {
	React_Component.call(this,props);
	this.baseForm = new view_shared_io_BaseForm(this);
	haxe_Log.trace(props.match.params,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 87, className : "view.data.contacts.Edit", methodName : "new"});
	if(props.match.params.id == null && new EReg("edit(/)*$","").match(props.match.params.action)) {
		haxe_Log.trace("nothing selected - redirect",{ fileName : "view/data/contacts/Edit.hx", lineNumber : 92, className : "view.data.contacts.Edit", methodName : "new"});
		var baseUrl = props.match.path.split(":section")[0];
		props.history.push("" + baseUrl + "List/get");
		return;
	}
	this.dataAccess = model_contacts_ContactsModel.dataAccess;
	this.fieldNames = this.baseForm.initFieldNames(haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h));
	this.dataDisplay = model_contacts_ContactsModel.dataDisplay;
	if(props.dataStore.contactData != null) {
		haxe_Log.trace(props.dataStore.contactData.keys().next(),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 102, className : "view.data.contacts.Edit", methodName : "new"});
	}
	var tmp = { edited_by : props.userState.dbUser.id, mandator : props.userState.dbUser.mandator};
	var tmp1 = view_shared_io_FormApi.initSideMenu2(this,{ dataClassPath : "data.Contacts", label : "Bearbeiten", section : "Edit", items : view_data_contacts_Edit.menuItems},{ section : props.match.params.section == null ? "Edit" : props.match.params.section, sameWidth : true});
	this.state = App.initEState({ dataTable : [], actualState : tmp, initialData : null, loading : false, handleSubmit : [{ handler : $bind(this,this.handleSubmit), handlerAction : "SubmitAndClose", label : "Speichern + Schließen"},{ handler : $bind(this,this.handleSubmit), handlerAction : "Submit", label : "Speichern"},{ handler : $bind(this,this.handleSubmit), handlerAction : "Close", label : "Schließen"}], selectedRows : [], sideMenu : tmp1, values : new haxe_ds_StringMap()},this);
	haxe_Log.trace(this.state.initialState.id,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 144, className : "view.data.contacts.Edit", methodName : "new"});
	this.loadContactData(Std.parseInt(props.match.params.id));
};
$hxClasses["view.data.contacts.Edit"] = view_data_contacts_Edit;
view_data_contacts_Edit.__name__ = "view.data.contacts.Edit";
view_data_contacts_Edit.mapDispatchToProps = function(dispatch) {
	return { load : function(param) {
		return dispatch(redux_Action.map(action_async_CRUD.read(param)));
	}};
};
view_data_contacts_Edit.mapStateToProps = function(aState) {
	return { userState : aState.userState};
};
view_data_contacts_Edit.__super__ = React_Component;
view_data_contacts_Edit.prototype = $extend(React_Component.prototype,{
	dataAccess: null
	,dataDisplay: null
	,formApi: null
	,formBuilder: null
	,formFields: null
	,formRef: null
	,fieldNames: null
	,baseForm: null
	,contact: null
	,dbData: null
	,dbMetaData: null
	,loadContactData: function(id) {
		var _gthis = this;
		haxe_Log.trace("loading:" + id,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 150, className : "view.data.contacts.Edit", methodName : "loadContactData"});
		if(id == null) {
			return null;
		}
		var p = this.props.load({ className : "data.Contacts", action : "get", filter : { id : id, mandator : 1}, table : "contacts", dbUser : this.props.userState.dbUser, devIP : App.devIP});
		p.then(function(data) {
			haxe_Log.trace(data.dataRows.length,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 164, className : "view.data.contacts.Edit", methodName : "loadContactData"});
			if(data.dataRows.length == 1) {
				var data1 = data.dataRows[0];
				haxe_Log.trace(data1 == null ? "null" : haxe_ds_StringMap.stringify(data1.h),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 168, className : "view.data.contacts.Edit", methodName : "loadContactData"});
				_gthis.setState({ loading : false, initialData : new model_Contact(data1)});
			}
		});
		haxe_Log.trace(this.state.actualState,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 177, className : "view.data.contacts.Edit", methodName : "loadContactData"});
		haxe_Log.trace(this.contact.fieldsModified,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 179, className : "view.data.contacts.Edit", methodName : "loadContactData"});
		haxe_Log.trace("contact.fieldsModified:" + Std.string(this.contact.fieldsModified),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 180, className : "view.data.contacts.Edit", methodName : "loadContactData"});
		return null;
	}
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 203, className : "view.data.contacts.Edit", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,componentDidMount: function() {
		haxe_Log.trace("mounted",{ fileName : "view/data/contacts/Edit.hx", lineNumber : 209, className : "view.data.contacts.Edit", methodName : "componentDidMount"});
	}
	,shouldComponentUpdate: function(nextProps,nextState) {
		haxe_Log.trace("propsChanged:" + Std.string(nextProps != this.props) + " stateChanged:" + Std.string(nextState != this.state),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 214, className : "view.data.contacts.Edit", methodName : "shouldComponentUpdate"});
		if(nextState != this.state) {
			return true;
		}
		return nextProps != this.props;
	}
	,componentWillUnmount: function() {
		return;
	}
	,handleSubmit: function(event) {
		event.preventDefault();
		var target = js_Boot.__cast(event.target , HTMLInputElement);
		haxe_Log.trace(target.value,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 238, className : "view.data.contacts.Edit", methodName : "handleSubmit"});
		var dataSet = target.dataset;
		haxe_Log.trace(dataSet.action,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 240, className : "view.data.contacts.Edit", methodName : "handleSubmit"});
		haxe_Log.trace(this.state.initialState.id,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 245, className : "view.data.contacts.Edit", methodName : "handleSubmit"});
		this.update();
	}
	,update: function() {
		var doc = window.document;
		var formElement = js_Boot.__cast(doc.querySelector("form[name=\"contact\"]") , HTMLFormElement);
		var elements = formElement.elements;
		var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
		while(k.hasNext()) {
			var k1 = k.next();
			if(k1 == "id") {
				continue;
			}
			try {
				var item = elements.namedItem(k1);
				var o = this.state.actualState;
				var field = item.name;
				var value;
				switch(item.type) {
				case "checkbox":
					value = item.checked ? 1 : 0;
					break;
				case "select-multiple":case "select-one":
					var sOpts = item.selectedOptions;
					if(sOpts.length > 1) {
						var _g = [];
						var _g1 = 0;
						var _g2 = sOpts.length;
						while(_g1 < _g2) {
							var o1 = _g1++;
							_g.push(sOpts[o1].value);
						}
						value = _g.join("|");
					} else {
						value = item.value;
					}
					break;
				default:
					value = item.value;
				}
				o[field] = value;
			} catch( _g3 ) {
				var ex = haxe_Exception.caught(_g3).unwrap();
				haxe_Log.trace(ex,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 324, className : "view.data.contacts.Edit", methodName : "update"});
			}
		}
		var aState = react_ReactUtil.copy(this.state.actualState);
		var dbaProps = { action : "update", className : "data.Contacts", dataSource : null, userState : this.props.userState};
		switch(this.props.match.params.action) {
		case "delete":case "get":
			var _g = new haxe_ds_StringMap();
			var _g1 = new haxe_ds_StringMap();
			_g1.h["filter"] = { id : this.state.initialState.id};
			_g.h["contacts"] = _g1;
			dbaProps.dataSource = _g;
			break;
		case "insert":
			var _g = 0;
			var _g1 = this.fieldNames;
			while(_g < _g1.length) {
				var f = _g1[_g];
				++_g;
				haxe_Log.trace("" + f + " =>" + Std.string(Reflect.field(aState,f)) + "<=",{ fileName : "view/data/contacts/Edit.hx", lineNumber : 343, className : "view.data.contacts.Edit", methodName : "update"});
				if(Reflect.field(aState,f) == "") {
					Reflect.deleteField(aState,f);
				}
			}
			var _g = new haxe_ds_StringMap();
			var _g1 = new haxe_ds_StringMap();
			_g1.h["data"] = aState;
			_g1.h["fields"] = this.contact.fieldsModified;
			_g.h["contacts"] = _g1;
			dbaProps.dataSource = _g;
			break;
		case "update":
			haxe_Log.trace("" + Std.string(this.state.initialState.id) + " :: creation_date: " + Std.string(aState.creation_date) + " " + Std.string(this.state.initialState.creation_date),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 363, className : "view.data.contacts.Edit", methodName : "update"});
			haxe_Log.trace(Std.string(this.contact.modified()) + (":" + Std.string(this.contact.fieldsModified)),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 366, className : "view.data.contacts.Edit", methodName : "update"});
			var _g = 0;
			var _g1 = this.fieldNames;
			while(_g < _g1.length) {
				var f = _g1[_g];
				++_g;
				if(Reflect.field(aState,f) != Reflect.field(this.state.initialState,f)) {
					haxe_Log.trace("" + f + ":" + Std.string(Reflect.field(aState,f)) + "==" + Std.string(Reflect.field(this.state.initialState,f)) + "<<",{ fileName : "view/data/contacts/Edit.hx", lineNumber : 372, className : "view.data.contacts.Edit", methodName : "update"});
					Reflect.setProperty(this.contact,f,Reflect.field(aState,f));
					this.contact.modified(f);
				}
			}
			if(!this.contact.modified()) {
				haxe_Log.trace("nothing modified",{ fileName : "view/data/contacts/Edit.hx", lineNumber : 382, className : "view.data.contacts.Edit", methodName : "update"});
				return;
			}
			var _g = new haxe_ds_StringMap();
			var _g1 = new haxe_ds_StringMap();
			var value = this.contact.store();
			_g1.h["data"] = value;
			_g1.h["filter"] = { id : this.state.initialState.id};
			_g.h["contacts"] = _g1;
			dbaProps.dataSource = _g;
			haxe_Log.trace(dbaProps.dataSource.h["contacts"].h["filter"],{ fileName : "view/data/contacts/Edit.hx", lineNumber : 392, className : "view.data.contacts.Edit", methodName : "update"});
			break;
		}
		App.store.dispatch(redux_Action.map(action_async_DBAccess.execute(dbaProps)));
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + "/" + this.props.match.params.action + " state.dataTable:" + Std.string(this.state.dataTable != null),{ fileName : "view/data/contacts/Edit.hx", lineNumber : 399, className : "view.data.contacts.Edit", methodName : "renderResults"});
		haxe_Log.trace("########### action:" + this.props.match.params.action,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 401, className : "view.data.contacts.Edit", methodName : "renderResults"});
		switch(this.props.match.params.action) {
		case "insert":
			haxe_Log.trace(this.state.actualState,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 423, className : "view.data.contacts.Edit", methodName : "renderResults"});
			var tmp = this.state.formBuilder;
			var tmp1 = this.state.handleSubmit;
			var _g = new haxe_ds_StringMap();
			var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
			while(k.hasNext()) {
				var k1 = k.next();
				_g.h[k1] = this.dataAccess.h["update"].view.h[k1];
			}
			return tmp.renderForm({ handleSubmit : tmp1, fields : _g, model : "contact", ref : this.formRef, title : "Kontakt - Neue Stammdaten"},this.state.actualState);
		case "update":
			if(this.state.actualState == null) {
				return this.state.formApi.renderWait();
			} else {
				var tmp = this.state.formBuilder;
				var tmp1 = this.state.handleSubmit;
				var _g = new haxe_ds_StringMap();
				var k = haxe_ds_StringMap.keysIterator(this.dataAccess.h["update"].view.h);
				while(k.hasNext()) {
					var k1 = k.next();
					_g.h[k1] = this.dataAccess.h["update"].view.h[k1];
				}
				return tmp.renderForm({ handleSubmit : tmp1, fields : _g, model : "contact", ref : this.formRef, title : "Kontakt - Bearbeite Stammdaten"},this.state.actualState);
			}
			break;
		default:
			return null;
		}
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 440, className : "view.data.contacts.Edit", methodName : "render"});
		switch(this.props.match.params.action) {
		case "insert":
			return this.state.formApi.render(this.renderResults());
		case "update":
			return this.state.formApi.render(this.renderResults());
		default:
			return this.state.formApi.render(this.renderResults());
		}
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/data/contacts/Edit.hx", lineNumber : 463, className : "view.data.contacts.Edit", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["Contact"].items;
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
	,__class__: view_data_contacts_Edit
});
var view_data_contacts_List = function(props) {
	React_Component.call(this,props);
	this.baseForm = new view_shared_io_BaseForm(this);
	this.dataDisplay = model_contacts_ContactsModel.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/contacts/List.hx", lineNumber : 64, className : "view.data.contacts.List", methodName : "new"});
	this.state = App.initEState({ dataTable : [], loading : false, contactData : new haxe_ds_IntMap(), selectedRows : [], sideMenu : view_shared_io_FormApi.initSideMenu2(this,{ dataClassPath : "data.Contacts", label : "Liste", section : "List", items : view_data_contacts_List.menuItems},{ section : props.match.params.section == null ? "List" : props.match.params.section, sameWidth : true}), values : new haxe_ds_StringMap()},this);
	if(props.match.params.section == null || props.match.params.action == null) {
		var baseUrl = props.match.path.split(":section")[0];
		haxe_Log.trace("redirecting to " + baseUrl + "List/get",{ fileName : "view/data/contacts/List.hx", lineNumber : 87, className : "view.data.contacts.List", methodName : "new"});
		props.history.push("" + baseUrl + "List/get");
		this.get(null);
	} else {
		haxe_Log.trace(props.match.params,{ fileName : "view/data/contacts/List.hx", lineNumber : 94, className : "view.data.contacts.List", methodName : "new"});
	}
	haxe_Log.trace(this.state.loading,{ fileName : "view/data/contacts/List.hx", lineNumber : 96, className : "view.data.contacts.List", methodName : "new"});
};
$hxClasses["view.data.contacts.List"] = view_data_contacts_List;
view_data_contacts_List.__name__ = "view.data.contacts.List";
view_data_contacts_List.mapStateToProps = function(aState) {
	haxe_Log.trace("never",{ fileName : "view/data/contacts/List.hx", lineNumber : 101, className : "view.data.contacts.List", methodName : "mapStateToProps"});
	return { userState : aState.userState};
};
view_data_contacts_List.mapDispatchToProps = function(dispatch) {
	return { load : function(param) {
		return dispatch(redux_Action.map(action_async_CRUD.read(param)));
	}};
};
view_data_contacts_List.__super__ = React_Component;
view_data_contacts_List.prototype = $extend(React_Component.prototype,{
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
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/contacts/List.hx", lineNumber : 109, className : "view.data.contacts.List", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,get: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi " + Std.string(ev),{ fileName : "view/data/contacts/List.hx", lineNumber : 115, className : "view.data.contacts.List", methodName : "get"});
		var offset = 0;
		if(ev != null && ev.page != null) {
			offset = this.props.limit * ev.page | 0;
		}
		haxe_Log.trace(this.props.userState,{ fileName : "view/data/contacts/List.hx", lineNumber : 121, className : "view.data.contacts.List", methodName : "get"});
		var p = this.props.load({ className : "data.Contacts", action : "get", filter : this.props.match.params.id != null ? { id : this.props.match.params.id, mandator : "1"} : { mandator : "1"}, limit : this.props.limit, offset : offset > 0 ? offset : 0, table : "contacts", dbUser : this.props.userState.dbUser, devIP : App.devIP});
		p.then(function(data) {
			haxe_Log.trace(data.dataRows.length,{ fileName : "view/data/contacts/List.hx", lineNumber : 135, className : "view.data.contacts.List", methodName : "get"});
			_gthis.setState({ loading : false, dataTable : data.dataRows});
		});
	}
	,edit: function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/contacts/List.hx", lineNumber : 142, className : "view.data.contacts.List", methodName : "edit"});
		haxe_Log.trace(Reflect.fields(ev),{ fileName : "view/data/contacts/List.hx", lineNumber : 143, className : "view.data.contacts.List", methodName : "edit"});
	}
	,restore: function() {
		var _gthis = this;
		haxe_Log.trace(Reflect.fields(this.props.dataStore),{ fileName : "view/data/contacts/List.hx", lineNumber : 147, className : "view.data.contacts.List", methodName : "restore"});
		if(this.props.dataStore != null && this.props.dataStore.contactsDbData != null) {
			this.setState({ dataTable : this.props.dataStore.contactsDbData.dataRows, dataCount : Std.parseInt(this.props.dataStore.contactsDbData.dataInfo.h["count"]), pageCount : Math.ceil(Std.parseInt(this.props.dataStore.contactsDbData.dataInfo.h["count"]) / this.props.limit)},function() {
				haxe_Log.trace(_gthis.state.dataTable,{ fileName : "view/data/contacts/List.hx", lineNumber : 157, className : "view.data.contacts.List", methodName : "restore"});
				_gthis.props.history.push("" + _gthis.props.match.path.split(":section")[0] + "List/get/" + (_gthis.props.match.params.id != null ? _gthis.props.match.params.id : ""));
			});
		} else {
			this.props.history.push("" + this.props.match.path.split(":section")[0] + "List/get/" + (this.props.match.params.id != null ? this.props.match.params.id : ""));
			this.get(null);
		}
	}
	,selectionClear: function() {
		var match = react_ReactUtil.copy(this.props.match);
		match.params.action = "get";
		haxe_Log.trace(this.state.dataTable.length,{ fileName : "view/data/contacts/List.hx", lineNumber : 178, className : "view.data.contacts.List", methodName : "selectionClear"});
		this.props.select(0,null,match,"UnselectAll");
		var trs = window.document.querySelectorAll(".tabComponentForm tr");
		haxe_Log.trace(trs.length,{ fileName : "view/data/contacts/List.hx", lineNumber : 183, className : "view.data.contacts.List", methodName : "selectionClear"});
		var _g = 0;
		var _g1 = trs.length;
		while(_g < _g1) {
			var i = _g++;
			var tre = js_Boot.__cast(trs.item(i) , HTMLTableRowElement);
			if(tre.classList.contains("is-selected")) {
				haxe_Log.trace("unselect:" + tre.dataset.id,{ fileName : "view/data/contacts/List.hx", lineNumber : 187, className : "view.data.contacts.List", methodName : "selectionClear"});
				tre.classList.remove("is-selected");
			}
		}
		window.document.querySelector("[class=\"grid-container-inner\"]").scrollTop = 0;
	}
	,componentDidMount: function() {
		var _g = new haxe_ds_StringMap();
		var _g1 = new haxe_ds_StringMap();
		var value = new haxe_ds_StringMap();
		_g1.h["contacts"] = value;
		var value = { source : _g1, view : new haxe_ds_StringMap()};
		_g.h["get"] = value;
		this.dataAccess = _g;
		if(this.props.userState != null) {
			haxe_Log.trace("yeah: " + this.props.userState.dbUser.first_name,{ fileName : "view/data/contacts/List.hx", lineNumber : 206, className : "view.data.contacts.List", methodName : "componentDidMount"});
		}
		haxe_Log.trace(this.props.match.params.action,{ fileName : "view/data/contacts/List.hx", lineNumber : 207, className : "view.data.contacts.List", methodName : "componentDidMount"});
		this.state.formApi.doAction();
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + (":" + this.props.match.params.action + "::") + Std.string(this.state.dataTable != null),{ fileName : "view/data/contacts/List.hx", lineNumber : 214, className : "view.data.contacts.List", methodName : "renderResults"});
		var pState = this.props.parentComponent.state;
		haxe_Log.trace(this.state.dataTable.length,{ fileName : "view/data/contacts/List.hx", lineNumber : 217, className : "view.data.contacts.List", methodName : "renderResults"});
		if(this.props.dataStore.contactsDbData != null) {
			var tmp = this.props.dataStore.contactsDbData.dataRows[0];
			haxe_Log.trace(tmp == null ? "null" : haxe_ds_StringMap.stringify(tmp.h),{ fileName : "view/data/contacts/List.hx", lineNumber : 219, className : "view.data.contacts.List", methodName : "renderResults"});
		} else {
			haxe_Log.trace(this.props.dataStore.contactsDbData,{ fileName : "view/data/contacts/List.hx", lineNumber : 220, className : "view.data.contacts.List", methodName : "renderResults"});
		}
		haxe_Log.trace(this.state.loading,{ fileName : "view/data/contacts/List.hx", lineNumber : 221, className : "view.data.contacts.List", methodName : "renderResults"});
		if(this.state.dataTable.length == 0) {
			return this.state.formApi.renderWait();
		}
		if(this.props.match.params.action == "get") {
			return { "$$typeof" : $$tre, type : react_ReactType.fromString("form"), props : { className : "tabComponentForm", children : { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, parentComponent : this, dataState : this.dataDisplay.h["contactList"], renderPager : ($_=this.baseForm,$bind($_,$_.renderPager)), className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null}}, key : null, ref : null};
		} else {
			return null;
		}
	}
	,getCellData: function(cP) {
		haxe_Log.trace(cP,{ fileName : "view/data/contacts/List.hx", lineNumber : 242, className : "view.data.contacts.List", methodName : "getCellData"});
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/contacts/List.hx", lineNumber : 249, className : "view.data.contacts.List", methodName : "render"});
		return this.state.formApi.render(this.renderResults());
	}
	,componentWillUnmount: function() {
		haxe_Log.trace("...",{ fileName : "view/data/contacts/List.hx", lineNumber : 256, className : "view.data.contacts.List", methodName : "componentWillUnmount"});
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/data/contacts/List.hx", lineNumber : 262, className : "view.data.contacts.List", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["List"].items;
		while(_g < _g1.length) {
			var mI = _g1[_g];
			++_g;
			var _g2 = mI.action;
			if(_g2 != null) {
				switch(_g2) {
				case "delete":case "update":
					mI.disabled = this.state.selectedRows.length == 0;
					break;
				default:
				}
			}
		}
		return sideMenu;
	}
	,__class__: view_data_contacts_List
});
var view_data_deals_Edit = function(props) {
	React_Component.call(this,props);
	this.dataDisplay = model_deals_DealsModel.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/deals/Edit.hx", lineNumber : 62, className : "view.data.deals.Edit", methodName : "new"});
	this.state = App.initEState({ loading : false, values : new haxe_ds_StringMap()},this);
	haxe_Log.trace(this.state.loading,{ fileName : "view/data/deals/Edit.hx", lineNumber : 64, className : "view.data.deals.Edit", methodName : "new"});
};
$hxClasses["view.data.deals.Edit"] = view_data_deals_Edit;
view_data_deals_Edit.__name__ = "view.data.deals.Edit";
view_data_deals_Edit.mapStateToProps = function(aState) {
	return { userState : aState.userState};
};
view_data_deals_Edit.__super__ = React_Component;
view_data_deals_Edit.prototype = $extend(React_Component.prototype,{
	dataDisplay: null
	,dataAccess: null
	,dbData: null
	,dbMetaData: null
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/deals/Edit.hx", lineNumber : 76, className : "view.data.deals.Edit", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,get: function(ev) {
		haxe_Log.trace("hi :)",{ fileName : "view/data/deals/Edit.hx", lineNumber : 82, className : "view.data.deals.Edit", methodName : "get"});
		var s = new hxbit_Serializer();
		this.state.formApi.requests.push(null);
	}
	,edit: function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/deals/Edit.hx", lineNumber : 95, className : "view.data.deals.Edit", methodName : "edit"});
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
				haxe_Log.trace(k1,{ fileName : "view/data/deals/Edit.hx", lineNumber : 106, className : "view.data.deals.Edit", methodName : "initStateFromDataTable"});
				if(this.dataDisplay.h["fieldsList"].columns.h[k1].cellFormat == view_shared_Format.formatBool) {
					rS[k1] = dR.h[k1] == "Y";
				} else {
					rS[k1] = dR.h[k1];
				}
			}
			iS[dR.h["id"]] = rS;
		}
		haxe_Log.trace(iS,{ fileName : "view/data/deals/Edit.hx", lineNumber : 116, className : "view.data.deals.Edit", methodName : "initStateFromDataTable"});
		return iS;
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
			haxe_Log.trace("yeah: " + this.props.userState.dbUser.first_name,{ fileName : "view/data/deals/Edit.hx", lineNumber : 132, className : "view.data.deals.Edit", methodName : "componentDidMount"});
		}
		if(this.props.match.params.action != null) {
			var fun = Reflect.field(this,this.props.match.params.action);
			if(Reflect.isFunction(fun)) {
				fun.apply(this,null);
			}
		} else {
			this.setState({ loading : false});
		}
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + ":" + Std.string(this.state.dataTable != null),{ fileName : "view/data/deals/Edit.hx", lineNumber : 148, className : "view.data.deals.Edit", methodName : "renderResults"});
		haxe_Log.trace(this.state.loading,{ fileName : "view/data/deals/Edit.hx", lineNumber : 150, className : "view.data.deals.Edit", methodName : "renderResults"});
		if(this.state.loading) {
			return this.state.formApi.renderWait();
		}
		haxe_Log.trace("###########loading:" + Std.string(this.state.loading),{ fileName : "view/data/deals/Edit.hx", lineNumber : 153, className : "view.data.deals.Edit", methodName : "renderResults"});
		switch(this.props.match.params.action) {
		case "delete":
			return null;
		case "get":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["contactList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		case "insert":
			haxe_Log.trace(this.dataDisplay.h["fieldsList"],{ fileName : "view/data/deals/Edit.hx", lineNumber : 169, className : "view.data.deals.Edit", methodName : "renderResults"});
			haxe_Log.trace(Std.string(this.state.dataTable[29].h["id"]) + "<<<",{ fileName : "view/data/deals/Edit.hx", lineNumber : 170, className : "view.data.deals.Edit", methodName : "renderResults"});
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["fieldsList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		case "update":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["clientList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		default:
			return null;
		}
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/deals/Edit.hx", lineNumber : 187, className : "view.data.deals.Edit", methodName : "render"});
		var tmp = this.state.formApi;
		var tmp1 = react_ReactType.fromComp(React_Fragment);
		var tmp2 = $$tre;
		var tmp3 = react_ReactType.fromString("form");
		var tmp4 = this.renderResults();
		return tmp.render(React.createElement(tmp1,{ },{ "$$typeof" : tmp2, type : tmp3, props : { className : "tabComponentForm", children : tmp4}, key : null, ref : null}));
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/data/deals/Edit.hx", lineNumber : 199, className : "view.data.deals.Edit", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["Contact"].items;
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
	,__class__: view_data_deals_Edit
});
var view_data_deals_List = function(props) {
	React_Component.call(this,props);
	this.baseForm = new view_shared_io_BaseForm(this);
	this.dataDisplay = model_deals_DealsModel.dataDisplay;
	haxe_Log.trace("..." + Std.string(Reflect.fields(props)),{ fileName : "view/data/deals/List.hx", lineNumber : 56, className : "view.data.deals.List", methodName : "new"});
	this.state = App.initEState({ dataTable : [], loading : false, dealsData : new haxe_ds_IntMap(), selectedRows : [], sideMenu : view_shared_io_FormApi.initSideMenu2(this,{ dataClassPath : "data.Deals", label : "Liste", section : "List", items : view_data_deals_List.menuItems},{ section : props.match.params.section == null ? "List" : props.match.params.section, sameWidth : true}), values : new haxe_ds_StringMap()},this);
	if(props.match.params.action == null) {
		var baseUrl = props.match.path.split(":section")[0];
		haxe_Log.trace("redirecting to " + baseUrl + "List/get",{ fileName : "view/data/deals/List.hx", lineNumber : 80, className : "view.data.deals.List", methodName : "new"});
		props.history.push("" + baseUrl + "List/get");
		this.get(null);
	} else {
		haxe_Log.trace(props.match.params,{ fileName : "view/data/deals/List.hx", lineNumber : 87, className : "view.data.deals.List", methodName : "new"});
	}
	haxe_Log.trace(this.state.loading,{ fileName : "view/data/deals/List.hx", lineNumber : 89, className : "view.data.deals.List", methodName : "new"});
};
$hxClasses["view.data.deals.List"] = view_data_deals_List;
view_data_deals_List.__name__ = "view.data.deals.List";
view_data_deals_List.mapDispatchToProps = function(dispatch) {
	return { load : function(param) {
		return dispatch(redux_Action.map(action_async_CRUD.read(param)));
	}};
};
view_data_deals_List.mapStateToProps = function(aState) {
	return { userState : aState.userState};
};
view_data_deals_List.__super__ = React_Component;
view_data_deals_List.prototype = $extend(React_Component.prototype,{
	dataAccess: null
	,dataDisplay: null
	,formFields: null
	,fieldNames: null
	,baseForm: null
	,dbData: null
	,dbMetaData: null
	,'delete': function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/deals/List.hx", lineNumber : 107, className : "view.data.deals.List", methodName : "delete"});
		var data = this.state.formApi.selectedRowsMap(this.state);
	}
	,get: function(ev) {
		var _gthis = this;
		haxe_Log.trace("hi " + Std.string(ev),{ fileName : "view/data/deals/List.hx", lineNumber : 113, className : "view.data.deals.List", methodName : "get"});
		var offset = 0;
		this.setState({ loading : true});
		if(ev != null && ev.page != null) {
			offset = this.props.limit * ev.page | 0;
		}
		var contact = this.props.location.state.contact;
		var p = this.props.load({ className : "data.Deals", action : "get", filter : this.props.match.params.id != null ? { id : this.props.match.params.id, mandator : "1"} : { mandator : "1"}, limit : this.props.limit, offset : offset > 0 ? offset : 0, table : "deals", dbUser : this.props.userState.dbUser, devIP : App.devIP});
		p.then(function(data) {
			haxe_Log.trace(data.dataRows.length,{ fileName : "view/data/deals/List.hx", lineNumber : 134, className : "view.data.deals.List", methodName : "get"});
			_gthis.setState({ loading : false, dataTable : data.dataRows});
		});
	}
	,edit: function(ev) {
		haxe_Log.trace(this.state.selectedRows.length,{ fileName : "view/data/deals/List.hx", lineNumber : 141, className : "view.data.deals.List", methodName : "edit"});
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
				haxe_Log.trace(k1,{ fileName : "view/data/deals/List.hx", lineNumber : 152, className : "view.data.deals.List", methodName : "initStateFromDataTable"});
				if(this.dataDisplay.h["fieldsList"].columns.h[k1].cellFormat == view_shared_Format.formatBool) {
					rS[k1] = dR.h[k1] == "Y";
				} else {
					rS[k1] = dR.h[k1];
				}
			}
			iS[dR.h["id"]] = rS;
		}
		haxe_Log.trace(iS,{ fileName : "view/data/deals/List.hx", lineNumber : 162, className : "view.data.deals.List", methodName : "initStateFromDataTable"});
		return iS;
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
			haxe_Log.trace("yeah: " + this.props.userState.dbUser.first_name,{ fileName : "view/data/deals/List.hx", lineNumber : 178, className : "view.data.deals.List", methodName : "componentDidMount"});
		}
		if(this.props.match.params.action != null) {
			var fun = Reflect.field(this,this.props.match.params.action);
			if(Reflect.isFunction(fun)) {
				fun.apply(this,null);
			}
		} else {
			this.setState({ loading : false});
		}
	}
	,renderResults: function() {
		haxe_Log.trace(this.props.match.params.section + ":" + Std.string(this.state.dataTable != null),{ fileName : "view/data/deals/List.hx", lineNumber : 194, className : "view.data.deals.List", methodName : "renderResults"});
		haxe_Log.trace(this.state.loading,{ fileName : "view/data/deals/List.hx", lineNumber : 196, className : "view.data.deals.List", methodName : "renderResults"});
		if(this.state.loading) {
			return this.state.formApi.renderWait();
		}
		haxe_Log.trace("###########loading:" + Std.string(this.state.loading),{ fileName : "view/data/deals/List.hx", lineNumber : 199, className : "view.data.deals.List", methodName : "renderResults"});
		switch(this.props.match.params.action) {
		case "delete":
			return null;
		case "get":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["dealsList"], renderPager : ($_=this.baseForm,$bind($_,$_.renderPager)), parentComponent : this, className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		case "insert":
			haxe_Log.trace(this.dataDisplay.h["fieldsList"],{ fileName : "view/data/deals/List.hx", lineNumber : 215, className : "view.data.deals.List", methodName : "renderResults"});
			haxe_Log.trace(Std.string(this.state.dataTable[29].h["id"]) + "<<<",{ fileName : "view/data/deals/List.hx", lineNumber : 216, className : "view.data.deals.List", methodName : "renderResults"});
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["fieldsList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		case "update":
			return { "$$typeof" : $$tre, type : react_ReactType.fromComp(view_table_Table), props : Object.assign({ },this.props,{ id : "fieldsList", data : this.state.dataTable, dataState : this.dataDisplay.h["clientList"], className : "is-striped is-hoverable", fullWidth : true}), key : null, ref : null};
		default:
			return null;
		}
	}
	,render: function() {
		haxe_Log.trace(this.props.match.params.section,{ fileName : "view/data/deals/List.hx", lineNumber : 233, className : "view.data.deals.List", methodName : "render"});
		var tmp = this.state.formApi;
		var tmp1 = react_ReactType.fromComp(React_Fragment);
		var tmp2 = $$tre;
		var tmp3 = react_ReactType.fromString("form");
		var tmp4 = this.renderResults();
		return tmp.render(React.createElement(tmp1,{ },{ "$$typeof" : tmp2, type : tmp3, props : { className : "tabComponentForm", children : tmp4}, key : null, ref : null}));
	}
	,updateMenu: function(viewClassPath) {
		var sideMenu = this.state.sideMenu;
		haxe_Log.trace(sideMenu.section,{ fileName : "view/data/deals/List.hx", lineNumber : 245, className : "view.data.deals.List", methodName : "updateMenu"});
		var _g = 0;
		var _g1 = sideMenu.menuBlocks.h["Contact"].items;
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
	,__class__: view_data_deals_List
});
var view_shared_Format = function() { };
$hxClasses["view.shared.Format"] = view_shared_Format;
view_shared_Format.__name__ = "view.shared.Format";
view_shared_Format.formatBool = function(v) {
	if(v) {
		return "Y";
	} else {
		return "N";
	}
};
view_shared_Format.formatElementSelection = function(v) {
	if(v) {
		return "Y";
	} else {
		return "N";
	}
};
view_shared_Format.formatPhone = function(v) {
	if(new EReg("^(+|0)","").match(v)) {
		return v;
	} else {
		return "0" + v;
	}
};
var view_shared_io_BaseForm = function(comp) {
	this.comp = comp;
};
$hxClasses["view.shared.io.BaseForm"] = view_shared_io_BaseForm;
view_shared_io_BaseForm.__name__ = "view.shared.io.BaseForm";
view_shared_io_BaseForm.prototype = {
	comp: null
	,compareStates: function() {
		var _g = 0;
		var _g1 = Reflect.fields(this.comp.state.initialState);
		while(_g < _g1.length) {
			var f = _g1[_g];
			++_g;
			haxe_Log.trace("" + f + ":" + Std.string(Reflect.field(this.comp.state.actualState,f)) + "<==>" + Std.string(Reflect.field(this.comp.state.initialState,f)) + "<",{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 43, className : "view.shared.io.BaseForm", methodName : "compareStates"});
		}
	}
	,doChange: function(name,value) {
		haxe_Log.trace("" + name + ": " + value,{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 48, className : "view.shared.io.BaseForm", methodName : "doChange"});
		if(name != null && name != "") {
			this.comp.state.actualState[name] = value;
		}
	}
	,handleChange: function(e) {
		var el = e.target;
		if(el.name != "" && el.name != null) {
			haxe_Log.trace(">>" + Std.string(el.name) + "=>" + Std.string(el.value) + "<<",{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 62, className : "view.shared.io.BaseForm", methodName : "handleChange"});
			this.comp.state.actualState[el.name] = el.value;
			haxe_Log.trace(this.comp.state.actualState.last_name,{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 65, className : "view.shared.io.BaseForm", methodName : "handleChange"});
		}
	}
	,initFieldNames: function(keys) {
		var fieldNames = [];
		var k = keys;
		while(k.hasNext()) {
			var k1 = k.next();
			fieldNames.push(k1);
		}
		return fieldNames;
	}
	,sessionStore: function() {
		haxe_Log.trace(this.comp.state.actualState,{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 122, className : "view.shared.io.BaseForm", methodName : "sessionStore"});
		window.sessionStorage.setItem("contact",JSON.stringify(this.comp.state.actualState));
		window.removeEventListener("beforeunload",$bind(this,this.sessionStore));
	}
	,storeParams: function(path,params) {
		var _g = new haxe_ds_StringMap();
		var _g1 = 0;
		var _g2 = Reflect.fields(params);
		while(_g1 < _g2.length) {
			var f = _g2[_g1];
			++_g1;
			_g.h[f] = Reflect.field(params,f);
		}
		var pMap = _g;
		var _g = new haxe_ds_StringMap();
		_g.h[path] = pMap;
		return _g;
	}
	,restoreParams: function(m) {
		var p = { };
		var _g = haxe_ds_StringMap.kvIterator(m.h);
		while(_g.hasNext()) {
			var _g1 = _g.next();
			var k = _g1.key;
			var v = _g1.value;
			p[k] = v;
		}
		return p;
	}
	,renderPager: function() {
		haxe_Log.trace("pageCount=" + this.comp.state.pageCount,{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 150, className : "view.shared.io.BaseForm", methodName : "renderPager"});
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "paginationContainer", children : { "$$typeof" : $$tre, type : react_ReactType.fromString("nav"), props : { children : React.createElement(react_ReactType.fromComp(react_ReactPaginate),{ previousLabel : "<", breakLinkClassName : "pagination-link", pageLinkClassName : "pagination-link", nextLinkClassName : "pagination-next", previousLinkClassName : "pagination-previous", nextLabel : ">", breakLabel : "...", breakClassName : "break-me", pageCount : this.comp.state.pageCount, marginPagesDisplayed : 2, pageRangeDisplayed : 5, onPageChange : $bind(this,this.onPageChange), containerClassName : "pagination  is-small", subContainerClassName : "pages pagination", activeLinkClassName : "is-current"})}, key : null, ref : null}}, key : null, ref : null};
	}
	,onPageChange: function(data) {
		haxe_Log.trace("" + this.comp.props.match.params.action + ":" + data.selected,{ fileName : "view/shared/io/BaseForm.hx", lineNumber : 174, className : "view.shared.io.BaseForm", methodName : "onPageChange"});
		var fun = Reflect.field(this.comp,this.comp.props.match.params.action);
		if(Reflect.isFunction(fun)) {
			fun.apply(this.comp,[{ page : data.selected}]);
		}
	}
	,__class__: view_shared_io_BaseForm
};
var view_shared_io_Observer = function() { };
$hxClasses["view.shared.io.Observer"] = view_shared_io_Observer;
view_shared_io_Observer.__name__ = "view.shared.io.Observer";
view_shared_io_Observer.run = function(obj,cb) {
	view_shared_io_Observer.handler = { get : function(target,property,receiver) {
		haxe_Log.trace(property,{ fileName : "view/shared/io/Observer.hx", lineNumber : 13, className : "view.shared.io.Observer", methodName : "run"});
		return Reflect.getProperty(target,property);
	}, set : function(target,property,value,receiver) {
		try {
			if(property == "co_field") {
				haxe_Log.trace("" + (value == null ? "null" : Std.string(value)) + " " + Std.string(Reflect.getProperty(receiver,property)),{ fileName : "view/shared/io/Observer.hx", lineNumber : 20, className : "view.shared.io.Observer", methodName : "run"});
				haxe_Log.trace("" + (value == null ? "null" : Std.string(value)) + " " + Std.string(Reflect.getProperty(target,property)),{ fileName : "view/shared/io/Observer.hx", lineNumber : 21, className : "view.shared.io.Observer", methodName : "run"});
			}
			target[property] = value;
			return true;
		} catch( _g ) {
			var e = haxe_Exception.caught(_g).unwrap();
			haxe_Log.trace(e,{ fileName : "view/shared/io/Observer.hx", lineNumber : 31, className : "view.shared.io.Observer", methodName : "run"});
			return false;
		}
	}};
	return new Proxy(obj,view_shared_io_Observer.handler);
};
function $getIterator(o) { if( o instanceof Array ) return new haxe_iterators_ArrayIterator(o); else return o.iterator(); }
var $$tre = (typeof Symbol === "function" && Symbol.for && Symbol.for("react.element")) || 0xeac7;
if(typeof(performance) != "undefined" ? typeof(performance.now) == "function" : false) {
	HxOverrides.now = performance.now.bind(performance);
}
model_Contact.__meta__ = { fields : { id : { dataType : ["bigint"]}, mandator : { dataType : ["bigint"]}, creation_date : { dataType : ["timestamp(0) without time zone"]}, state : { dataType : ["character varying(64)"]}, use_email : { dataType : ["boolean"]}, company_name : { dataType : ["character varying(64)"]}, co_field : { dataType : ["character varying(100)"]}, phone_code : { dataType : ["character varying(10)"]}, phone_number : { dataType : ["character varying(18)"]}, fax : { dataType : ["character varying(18)"]}, title : { dataType : ["character varying(64)"]}, title_pro : { dataType : ["character varying(64)"]}, first_name : { dataType : ["character varying(32)"]}, last_name : { dataType : ["character varying(32)"]}, address : { dataType : ["character varying(64)"]}, address_2 : { dataType : ["character varying(64)"]}, city : { dataType : ["character varying(50)"]}, postal_code : { dataType : ["character varying(10)"]}, country_code : { dataType : ["character varying(3)"]}, gender : { dataType : ["character varying(64)"]}, date_of_birth : { dataType : ["date"]}, mobile : { dataType : ["character varying(19)"]}, email : { dataType : ["character varying(64)"]}, comments : { dataType : ["character varying(4096)"]}, edited_by : { dataType : ["bigint"]}, merged : { dataType : ["bigint[]"]}, last_locktime : { dataType : ["timestamp(0) without time zone"]}, owner : { dataType : ["bigint"]}}};
model_Contact.__rtti = "<class path=\"model.Contact\" params=\"\">\n\t<extends path=\"model.ORM\"/>\n\t<id public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<x path=\"Int\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"bigint\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</id>\n\t<id_initialized><x path=\"Bool\"/></id_initialized>\n\t<get_id set=\"method\" line=\"47\"><f a=\"\"><x path=\"Int\"/></f></get_id>\n\t<set_id set=\"method\" line=\"51\"><f a=\"id\">\n\t<x path=\"Int\"/>\n\t<x path=\"Int\"/>\n</f></set_id>\n\t<mandator public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<x path=\"Int\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"bigint\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</mandator>\n\t<mandator_initialized><x path=\"Bool\"/></mandator_initialized>\n\t<get_mandator set=\"method\" line=\"63\"><f a=\"\"><x path=\"Int\"/></f></get_mandator>\n\t<set_mandator set=\"method\" line=\"67\"><f a=\"mandator\">\n\t<x path=\"Int\"/>\n\t<x path=\"Int\"/>\n</f></set_mandator>\n\t<creation_date public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"timestamp(0) without time zone\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</creation_date>\n\t<creation_date_initialized><x path=\"Bool\"/></creation_date_initialized>\n\t<get_creation_date set=\"method\" line=\"79\"><f a=\"\"><c path=\"String\"/></f></get_creation_date>\n\t<set_creation_date set=\"method\" line=\"83\"><f a=\"creation_date\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_creation_date>\n\t<state public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</state>\n\t<state_initialized><x path=\"Bool\"/></state_initialized>\n\t<get_state set=\"method\" line=\"95\"><f a=\"\"><c path=\"String\"/></f></get_state>\n\t<set_state set=\"method\" line=\"99\"><f a=\"state\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_state>\n\t<use_email public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<x path=\"Bool\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"boolean\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</use_email>\n\t<use_email_initialized><x path=\"Bool\"/></use_email_initialized>\n\t<get_use_email set=\"method\" line=\"111\"><f a=\"\"><x path=\"Bool\"/></f></get_use_email>\n\t<set_use_email set=\"method\" line=\"115\"><f a=\"use_email\">\n\t<x path=\"Bool\"/>\n\t<x path=\"Bool\"/>\n</f></set_use_email>\n\t<company_name public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</company_name>\n\t<company_name_initialized><x path=\"Bool\"/></company_name_initialized>\n\t<get_company_name set=\"method\" line=\"127\"><f a=\"\"><c path=\"String\"/></f></get_company_name>\n\t<set_company_name set=\"method\" line=\"131\"><f a=\"company_name\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_company_name>\n\t<co_field public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(100)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</co_field>\n\t<co_field_initialized><x path=\"Bool\"/></co_field_initialized>\n\t<get_co_field set=\"method\" line=\"143\"><f a=\"\"><c path=\"String\"/></f></get_co_field>\n\t<set_co_field set=\"method\" line=\"147\"><f a=\"co_field\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_co_field>\n\t<phone_code public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(10)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</phone_code>\n\t<phone_code_initialized><x path=\"Bool\"/></phone_code_initialized>\n\t<get_phone_code set=\"method\" line=\"159\"><f a=\"\"><c path=\"String\"/></f></get_phone_code>\n\t<set_phone_code set=\"method\" line=\"163\"><f a=\"phone_code\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_phone_code>\n\t<phone_number public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(18)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</phone_number>\n\t<phone_number_initialized><x path=\"Bool\"/></phone_number_initialized>\n\t<get_phone_number set=\"method\" line=\"175\"><f a=\"\"><c path=\"String\"/></f></get_phone_number>\n\t<set_phone_number set=\"method\" line=\"179\"><f a=\"phone_number\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_phone_number>\n\t<fax public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(18)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</fax>\n\t<fax_initialized><x path=\"Bool\"/></fax_initialized>\n\t<get_fax set=\"method\" line=\"191\"><f a=\"\"><c path=\"String\"/></f></get_fax>\n\t<set_fax set=\"method\" line=\"195\"><f a=\"fax\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_fax>\n\t<title public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</title>\n\t<title_initialized><x path=\"Bool\"/></title_initialized>\n\t<get_title set=\"method\" line=\"207\"><f a=\"\"><c path=\"String\"/></f></get_title>\n\t<set_title set=\"method\" line=\"211\"><f a=\"title\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_title>\n\t<title_pro public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</title_pro>\n\t<title_pro_initialized><x path=\"Bool\"/></title_pro_initialized>\n\t<get_title_pro set=\"method\" line=\"223\"><f a=\"\"><c path=\"String\"/></f></get_title_pro>\n\t<set_title_pro set=\"method\" line=\"227\"><f a=\"title_pro\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_title_pro>\n\t<first_name public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(32)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</first_name>\n\t<first_name_initialized><x path=\"Bool\"/></first_name_initialized>\n\t<get_first_name set=\"method\" line=\"239\"><f a=\"\"><c path=\"String\"/></f></get_first_name>\n\t<set_first_name set=\"method\" line=\"243\"><f a=\"first_name\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_first_name>\n\t<last_name public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(32)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</last_name>\n\t<last_name_initialized><x path=\"Bool\"/></last_name_initialized>\n\t<get_last_name set=\"method\" line=\"255\"><f a=\"\"><c path=\"String\"/></f></get_last_name>\n\t<set_last_name set=\"method\" line=\"259\"><f a=\"last_name\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_last_name>\n\t<address public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</address>\n\t<address_initialized><x path=\"Bool\"/></address_initialized>\n\t<get_address set=\"method\" line=\"271\"><f a=\"\"><c path=\"String\"/></f></get_address>\n\t<set_address set=\"method\" line=\"275\"><f a=\"address\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_address>\n\t<address_2 public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</address_2>\n\t<address_2_initialized><x path=\"Bool\"/></address_2_initialized>\n\t<get_address_2 set=\"method\" line=\"287\"><f a=\"\"><c path=\"String\"/></f></get_address_2>\n\t<set_address_2 set=\"method\" line=\"291\"><f a=\"address_2\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_address_2>\n\t<city public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(50)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</city>\n\t<city_initialized><x path=\"Bool\"/></city_initialized>\n\t<get_city set=\"method\" line=\"303\"><f a=\"\"><c path=\"String\"/></f></get_city>\n\t<set_city set=\"method\" line=\"307\"><f a=\"city\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_city>\n\t<postal_code public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(10)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</postal_code>\n\t<postal_code_initialized><x path=\"Bool\"/></postal_code_initialized>\n\t<get_postal_code set=\"method\" line=\"319\"><f a=\"\"><c path=\"String\"/></f></get_postal_code>\n\t<set_postal_code set=\"method\" line=\"323\"><f a=\"postal_code\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_postal_code>\n\t<country_code public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(3)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</country_code>\n\t<country_code_initialized><x path=\"Bool\"/></country_code_initialized>\n\t<get_country_code set=\"method\" line=\"335\"><f a=\"\"><c path=\"String\"/></f></get_country_code>\n\t<set_country_code set=\"method\" line=\"339\"><f a=\"country_code\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_country_code>\n\t<gender public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</gender>\n\t<gender_initialized><x path=\"Bool\"/></gender_initialized>\n\t<get_gender set=\"method\" line=\"351\"><f a=\"\"><c path=\"String\"/></f></get_gender>\n\t<set_gender set=\"method\" line=\"355\"><f a=\"gender\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_gender>\n\t<date_of_birth public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"date\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</date_of_birth>\n\t<date_of_birth_initialized><x path=\"Bool\"/></date_of_birth_initialized>\n\t<get_date_of_birth set=\"method\" line=\"367\"><f a=\"\"><c path=\"String\"/></f></get_date_of_birth>\n\t<set_date_of_birth set=\"method\" line=\"371\"><f a=\"date_of_birth\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_date_of_birth>\n\t<mobile public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(19)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</mobile>\n\t<mobile_initialized><x path=\"Bool\"/></mobile_initialized>\n\t<get_mobile set=\"method\" line=\"383\"><f a=\"\"><c path=\"String\"/></f></get_mobile>\n\t<set_mobile set=\"method\" line=\"387\"><f a=\"mobile\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_mobile>\n\t<email public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(64)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</email>\n\t<email_initialized><x path=\"Bool\"/></email_initialized>\n\t<get_email set=\"method\" line=\"399\"><f a=\"\"><c path=\"String\"/></f></get_email>\n\t<set_email set=\"method\" line=\"403\"><f a=\"email\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_email>\n\t<comments public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"character varying(4096)\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</comments>\n\t<comments_initialized><x path=\"Bool\"/></comments_initialized>\n\t<get_comments set=\"method\" line=\"415\"><f a=\"\"><c path=\"String\"/></f></get_comments>\n\t<set_comments set=\"method\" line=\"419\"><f a=\"comments\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_comments>\n\t<edited_by public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<x path=\"Int\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"bigint\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</edited_by>\n\t<edited_by_initialized><x path=\"Bool\"/></edited_by_initialized>\n\t<get_edited_by set=\"method\" line=\"431\"><f a=\"\"><x path=\"Int\"/></f></get_edited_by>\n\t<set_edited_by set=\"method\" line=\"435\"><f a=\"edited_by\">\n\t<x path=\"Int\"/>\n\t<x path=\"Int\"/>\n</f></set_edited_by>\n\t<merged public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"Array\"><x path=\"Int\"/></c>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"bigint[]\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</merged>\n\t<merged_initialized><x path=\"Bool\"/></merged_initialized>\n\t<get_merged set=\"method\" line=\"447\"><f a=\"\"><c path=\"Array\"><x path=\"Int\"/></c></f></get_merged>\n\t<set_merged set=\"method\" line=\"451\"><f a=\"merged\">\n\t<c path=\"Array\"><x path=\"Int\"/></c>\n\t<c path=\"Array\"><x path=\"Int\"/></c>\n</f></set_merged>\n\t<last_locktime public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<c path=\"String\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"timestamp(0) without time zone\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</last_locktime>\n\t<last_locktime_initialized><x path=\"Bool\"/></last_locktime_initialized>\n\t<get_last_locktime set=\"method\" line=\"463\"><f a=\"\"><c path=\"String\"/></f></get_last_locktime>\n\t<set_last_locktime set=\"method\" line=\"467\"><f a=\"last_locktime\">\n\t<c path=\"String\"/>\n\t<c path=\"String\"/>\n</f></set_last_locktime>\n\t<owner public=\"1\" get=\"accessor\" set=\"accessor\">\n\t\t<x path=\"Int\"/>\n\t\t<meta>\n\t\t\t<m n=\"dataType\"><e>\"bigint\"</e></m>\n\t\t\t<m n=\":isVar\"/>\n\t\t</meta>\n\t</owner>\n\t<owner_initialized><x path=\"Bool\"/></owner_initialized>\n\t<get_owner set=\"method\" line=\"479\"><f a=\"\"><x path=\"Int\"/></f></get_owner>\n\t<set_owner set=\"method\" line=\"483\"><f a=\"owner\">\n\t<x path=\"Int\"/>\n\t<x path=\"Int\"/>\n</f></set_owner>\n\t<new public=\"1\" set=\"method\" line=\"38\"><f a=\"data\">\n\t<t path=\"Map\">\n\t\t<c path=\"String\"/>\n\t\t<c path=\"String\"/>\n\t</t>\n\t<x path=\"Void\"/>\n</f></new>\n\t<meta>\n\t\t<m n=\":directlyUsed\"/>\n\t\t<m n=\":build\"><e>react.jsx.JsxStaticMacro.build()</e></m>\n\t\t<m n=\":rtti\"/>\n\t</meta>\n</class>";
model_contacts_ContactsModel.dataAccess = (function($this) {
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
		_g2.h["id"] = { type : "Hidden"};
		_g2.h["edited_by"] = { type : "Hidden"};
		_g2.h["mandator"] = { type : "Hidden"};
		_g2.h["merged"] = { type : "Hidden"};
		_g.h["update"] = { source : _g1, view : _g2};
	}
	$r = _g;
	return $r;
}(this));
model_contacts_ContactsModel.listColumns = (function($this) {
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
model_contacts_ContactsModel.dataDisplay = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["contactList"] = { columns : model_contacts_ContactsModel.listColumns};
	$r = _g;
	return $r;
}(this));
model_deals_DealsModel.listColumns = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["contact"] = { show : false, usAsIndex : true};
	_g.h["first_name"] = { show : false, useInTooltip : 0};
	_g.h["last_name"] = { show : false, useInTooltip : 1};
	_g.h["start_date"] = { label : "Seit"};
	_g.h["state"] = { label : "Aktiv", className : "tCenter", cellFormat : function(v) {
		var uState = v == "active" ? "thumbs-up" : "thumbs-down";
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("span"), props : { className : "far fa-" + uState}, key : null, ref : null};
	}};
	_g.h["id"] = { show : false};
	$r = _g;
	return $r;
}(this));
model_deals_DealsModel.dataDisplay = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["dealsList"] = { columns : model_deals_DealsModel.listColumns};
	$r = _g;
	return $r;
}(this));
view_Data._renderWrapper = (redux_react_ReactRedux.connect(null,view_Data.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_Data));
view_Data.__jsxStatic = view_Data._renderWrapper;
view_data_Contacts._renderWrapper = (redux_react_ReactRedux.connect(view_data_Contacts.mapStateToProps,view_data_Contacts.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_data_Contacts));
view_data_Contacts.__jsxStatic = view_data_Contacts._renderWrapper;
view_data_QC._renderWrapper = (redux_react_ReactRedux.connect(view_data_QC.mapStateToProps,view_data_QC.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_data_QC));
view_data_QC.__jsxStatic = view_data_QC._renderWrapper;
view_data_accounts_Edit.menuItems = [{ label : "Auswahl", action : "get", section : "List"},{ label : "Bearbeiten", action : "update"},{ label : "Neu", action : "insert"},{ label : "Löschen", action : "delete"}];
view_data_accounts_List.menuItems = [{ label : "Anzeigen", action : "get"},{ label : "Bearbeiten", action : "update"},{ label : "Neu", action : "insert"},{ label : "Löschen", action : "delete"}];
view_data_accounts_model_Accounts.listColumns = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["first_name"] = { label : "Vorname", flexGrow : 0};
	_g.h["last_name"] = { label : "Name", flexGrow : 0};
	_g.h["email"] = { label : "Email"};
	_g.h["phone_number"] = { label : "Telefon", flexGrow : 1};
	_g.h["state"] = { label : "Aktiv", className : "tCenter", cellFormat : function(v) {
		var uState = v == "active" ? "user" : "user-slash";
		return { "$$typeof" : $$tre, type : react_ReactType.fromString("span"), props : { className : "fa fa-" + uState}, key : null, ref : null};
	}};
	_g.h["id"] = { show : false};
	$r = _g;
	return $r;
}(this));
view_data_accounts_model_Accounts.dataDisplay = (function($this) {
	var $r;
	var _g = new haxe_ds_StringMap();
	_g.h["show"] = { columns : view_data_accounts_model_Accounts.listColumns};
	$r = _g;
	return $r;
}(this));
view_data_contacts_Edit.menuItems = [{ label : "Schließen", action : "restore", section : "List"},{ label : "Speichern + Schließen", action : "updateAndClose"},{ label : "Speichern", action : "update"},{ label : "Neu", action : "insert"},{ label : "Löschen", action : "delete"}];
view_data_contacts_Edit._renderWrapper = (redux_react_ReactRedux.connect(view_data_contacts_Edit.mapStateToProps,view_data_contacts_Edit.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_data_contacts_Edit));
view_data_contacts_Edit.__jsxStatic = view_data_contacts_Edit._renderWrapper;
view_data_contacts_List.menuItems = [{ label : "Bearbeiten", action : "update", section : "Edit"},{ label : "Neu", action : "insert", section : "Edit"},{ label : "Löschen", action : "delete"},{ label : "Auswahl aufheben", action : "selectionClear"}];
view_data_contacts_List._renderWrapper = (redux_react_ReactRedux.connect(view_data_contacts_List.mapStateToProps,view_data_contacts_List.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_data_contacts_List));
view_data_contacts_List.__jsxStatic = view_data_contacts_List._renderWrapper;
view_data_deals_Edit.menuItems = [{ label : "Anzeigen", action : "get"},{ label : "Bearbeiten", action : "update"},{ label : "Neu", action : "insert"},{ label : "Löschen", action : "delete"}];
view_data_deals_List.menuItems = [{ label : "Anzeigen", action : "get"},{ label : "Bearbeiten", action : "update"},{ label : "Neu", action : "insert"},{ label : "Löschen", action : "delete"}];
view_data_deals_List._renderWrapper = (redux_react_ReactRedux.connect(view_data_deals_List.mapStateToProps,view_data_deals_List.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_data_deals_List));
view_data_deals_List.__jsxStatic = view_data_deals_List._renderWrapper;
$s.view_Data = view_Data; 

/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__("./node_modules/webpack/buildin/global.js")))

/***/ }),

/***/ "./node_modules/react-paginate/dist/BreakView.js":
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _react = __webpack_require__("./node_modules/react/index.js");

var _react2 = _interopRequireDefault(_react);

var _propTypes = __webpack_require__("./node_modules/react-paginate/node_modules/prop-types/index.js");

var _propTypes2 = _interopRequireDefault(_propTypes);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var BreakView = function BreakView(props) {
  var breakLabel = props.breakLabel,
      breakClassName = props.breakClassName,
      breakLinkClassName = props.breakLinkClassName,
      onClick = props.onClick;

  var className = breakClassName || 'break';

  return _react2.default.createElement(
    'li',
    { className: className },
    _react2.default.createElement(
      'a',
      {
        className: breakLinkClassName,
        onClick: onClick,
        role: 'button',
        tabIndex: '0',
        onKeyPress: onClick
      },
      breakLabel
    )
  );
};

BreakView.propTypes = {
  breakLabel: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.node]),
  breakClassName: _propTypes2.default.string,
  breakLinkClassName: _propTypes2.default.string,
  onClick: _propTypes2.default.func.isRequired
};

exports.default = BreakView;
//# sourceMappingURL=BreakView.js.map

/***/ }),

/***/ "./node_modules/react-paginate/dist/PageView.js":
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _react = __webpack_require__("./node_modules/react/index.js");

var _react2 = _interopRequireDefault(_react);

var _propTypes = __webpack_require__("./node_modules/react-paginate/node_modules/prop-types/index.js");

var _propTypes2 = _interopRequireDefault(_propTypes);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var PageView = function PageView(props) {
  var pageClassName = props.pageClassName;
  var pageLinkClassName = props.pageLinkClassName;

  var onClick = props.onClick;
  var href = props.href;
  var ariaLabel = props.ariaLabel || 'Page ' + props.page + (props.extraAriaContext ? ' ' + props.extraAriaContext : '');
  var ariaCurrent = null;

  if (props.selected) {
    ariaCurrent = 'page';

    ariaLabel = props.ariaLabel || 'Page ' + props.page + ' is your current page';

    if (typeof pageClassName !== 'undefined') {
      pageClassName = pageClassName + ' ' + props.activeClassName;
    } else {
      pageClassName = props.activeClassName;
    }

    if (typeof pageLinkClassName !== 'undefined') {
      if (typeof props.activeLinkClassName !== 'undefined') {
        pageLinkClassName = pageLinkClassName + ' ' + props.activeLinkClassName;
      }
    } else {
      pageLinkClassName = props.activeLinkClassName;
    }
  }

  return _react2.default.createElement(
    'li',
    { className: pageClassName },
    _react2.default.createElement(
      'a',
      {
        onClick: onClick,
        role: 'button',
        className: pageLinkClassName,
        href: href,
        tabIndex: '0',
        'aria-label': ariaLabel,
        'aria-current': ariaCurrent,
        onKeyPress: onClick
      },
      props.page
    )
  );
};

PageView.propTypes = {
  onClick: _propTypes2.default.func.isRequired,
  selected: _propTypes2.default.bool.isRequired,
  pageClassName: _propTypes2.default.string,
  pageLinkClassName: _propTypes2.default.string,
  activeClassName: _propTypes2.default.string,
  activeLinkClassName: _propTypes2.default.string,
  extraAriaContext: _propTypes2.default.string,
  href: _propTypes2.default.string,
  ariaLabel: _propTypes2.default.string,
  page: _propTypes2.default.number.isRequired
};

exports.default = PageView;
//# sourceMappingURL=PageView.js.map

/***/ }),

/***/ "./node_modules/react-paginate/dist/PaginationBoxView.js":
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = __webpack_require__("./node_modules/react/index.js");

var _react2 = _interopRequireDefault(_react);

var _propTypes = __webpack_require__("./node_modules/react-paginate/node_modules/prop-types/index.js");

var _propTypes2 = _interopRequireDefault(_propTypes);

var _PageView = __webpack_require__("./node_modules/react-paginate/dist/PageView.js");

var _PageView2 = _interopRequireDefault(_PageView);

var _BreakView = __webpack_require__("./node_modules/react-paginate/dist/BreakView.js");

var _BreakView2 = _interopRequireDefault(_BreakView);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var PaginationBoxView = function (_Component) {
  _inherits(PaginationBoxView, _Component);

  function PaginationBoxView(props) {
    _classCallCheck(this, PaginationBoxView);

    var _this = _possibleConstructorReturn(this, (PaginationBoxView.__proto__ || Object.getPrototypeOf(PaginationBoxView)).call(this, props));

    _this.handlePreviousPage = function (evt) {
      var selected = _this.state.selected;

      evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;
      if (selected > 0) {
        _this.handlePageSelected(selected - 1, evt);
      }
    };

    _this.handleNextPage = function (evt) {
      var selected = _this.state.selected;
      var pageCount = _this.props.pageCount;


      evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;
      if (selected < pageCount - 1) {
        _this.handlePageSelected(selected + 1, evt);
      }
    };

    _this.handlePageSelected = function (selected, evt) {
      evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;

      if (_this.state.selected === selected) return;

      _this.setState({ selected: selected });

      // Call the callback with the new selected item:
      _this.callCallback(selected);
    };

    _this.handleBreakClick = function (index, evt) {
      evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;

      var selected = _this.state.selected;


      _this.handlePageSelected(selected < index ? _this.getForwardJump() : _this.getBackwardJump(), evt);
    };

    _this.callCallback = function (selectedItem) {
      if (typeof _this.props.onPageChange !== 'undefined' && typeof _this.props.onPageChange === 'function') {
        _this.props.onPageChange({ selected: selectedItem });
      }
    };

    _this.pagination = function () {
      var items = [];
      var _this$props = _this.props,
          pageRangeDisplayed = _this$props.pageRangeDisplayed,
          pageCount = _this$props.pageCount,
          marginPagesDisplayed = _this$props.marginPagesDisplayed,
          breakLabel = _this$props.breakLabel,
          breakClassName = _this$props.breakClassName,
          breakLinkClassName = _this$props.breakLinkClassName;
      var selected = _this.state.selected;


      if (pageCount <= pageRangeDisplayed) {
        for (var index = 0; index < pageCount; index++) {
          items.push(_this.getPageElement(index));
        }
      } else {
        var leftSide = pageRangeDisplayed / 2;
        var rightSide = pageRangeDisplayed - leftSide;

        // If the selected page index is on the default right side of the pagination,
        // we consider that the new right side is made up of it (= only one break element).
        // If the selected page index is on the default left side of the pagination,
        // we consider that the new left side is made up of it (= only one break element).
        if (selected > pageCount - pageRangeDisplayed / 2) {
          rightSide = pageCount - selected;
          leftSide = pageRangeDisplayed - rightSide;
        } else if (selected < pageRangeDisplayed / 2) {
          leftSide = selected;
          rightSide = pageRangeDisplayed - leftSide;
        }

        var _index = void 0;
        var page = void 0;
        var breakView = void 0;
        var createPageView = function createPageView(index) {
          return _this.getPageElement(index);
        };

        for (_index = 0; _index < pageCount; _index++) {
          page = _index + 1;

          // If the page index is lower than the margin defined,
          // the page has to be displayed on the left side of
          // the pagination.
          if (page <= marginPagesDisplayed) {
            items.push(createPageView(_index));
            continue;
          }

          // If the page index is greater than the page count
          // minus the margin defined, the page has to be
          // displayed on the right side of the pagination.
          if (page > pageCount - marginPagesDisplayed) {
            items.push(createPageView(_index));
            continue;
          }

          // If the page index is near the selected page index
          // and inside the defined range (pageRangeDisplayed)
          // we have to display it (it will create the center
          // part of the pagination).
          if (_index >= selected - leftSide && _index <= selected + rightSide) {
            items.push(createPageView(_index));
            continue;
          }

          // If the page index doesn't meet any of the conditions above,
          // we check if the last item of the current "items" array
          // is a break element. If not, we add a break element, else,
          // we do nothing (because we don't want to display the page).
          if (breakLabel && items[items.length - 1] !== breakView) {
            breakView = _react2.default.createElement(_BreakView2.default, {
              key: _index,
              breakLabel: breakLabel,
              breakClassName: breakClassName,
              breakLinkClassName: breakLinkClassName,
              onClick: _this.handleBreakClick.bind(null, _index)
            });
            items.push(breakView);
          }
        }
      }

      return items;
    };

    var initialSelected = void 0;
    if (props.initialPage) {
      initialSelected = props.initialPage;
    } else if (props.forcePage) {
      initialSelected = props.forcePage;
    } else {
      initialSelected = 0;
    }

    _this.state = {
      selected: initialSelected
    };
    return _this;
  }

  _createClass(PaginationBoxView, [{
    key: 'componentDidMount',
    value: function componentDidMount() {
      var _props = this.props,
          initialPage = _props.initialPage,
          disableInitialCallback = _props.disableInitialCallback,
          extraAriaContext = _props.extraAriaContext;
      // Call the callback with the initialPage item:

      if (typeof initialPage !== 'undefined' && !disableInitialCallback) {
        this.callCallback(initialPage);
      }

      if (extraAriaContext) {
        console.warn('DEPRECATED (react-paginate): The extraAriaContext prop is deprecated. You should now use the ariaLabelBuilder instead.');
      }
    }
  }, {
    key: 'componentDidUpdate',
    value: function componentDidUpdate(prevProps) {
      if (typeof this.props.forcePage !== 'undefined' && this.props.forcePage !== prevProps.forcePage) {
        this.setState({ selected: this.props.forcePage });
      }
    }
  }, {
    key: 'getForwardJump',
    value: function getForwardJump() {
      var selected = this.state.selected;
      var _props2 = this.props,
          pageCount = _props2.pageCount,
          pageRangeDisplayed = _props2.pageRangeDisplayed;


      var forwardJump = selected + pageRangeDisplayed;
      return forwardJump >= pageCount ? pageCount - 1 : forwardJump;
    }
  }, {
    key: 'getBackwardJump',
    value: function getBackwardJump() {
      var selected = this.state.selected;
      var pageRangeDisplayed = this.props.pageRangeDisplayed;


      var backwardJump = selected - pageRangeDisplayed;
      return backwardJump < 0 ? 0 : backwardJump;
    }
  }, {
    key: 'hrefBuilder',
    value: function hrefBuilder(pageIndex) {
      var _props3 = this.props,
          hrefBuilder = _props3.hrefBuilder,
          pageCount = _props3.pageCount;

      if (hrefBuilder && pageIndex !== this.state.selected && pageIndex >= 0 && pageIndex < pageCount) {
        return hrefBuilder(pageIndex + 1);
      }
    }
  }, {
    key: 'ariaLabelBuilder',
    value: function ariaLabelBuilder(pageIndex) {
      var selected = pageIndex === this.state.selected;
      if (this.props.ariaLabelBuilder && pageIndex >= 0 && pageIndex < this.props.pageCount) {
        var label = this.props.ariaLabelBuilder(pageIndex + 1, selected);
        // DEPRECATED: The extraAriaContext prop was used to add additional context
        // to the aria-label. Users should now use the ariaLabelBuilder instead.
        if (this.props.extraAriaContext && !selected) {
          label = label + ' ' + this.props.extraAriaContext;
        }
        return label;
      }
    }
  }, {
    key: 'getPageElement',
    value: function getPageElement(index) {
      var selected = this.state.selected;
      var _props4 = this.props,
          pageClassName = _props4.pageClassName,
          pageLinkClassName = _props4.pageLinkClassName,
          activeClassName = _props4.activeClassName,
          activeLinkClassName = _props4.activeLinkClassName,
          extraAriaContext = _props4.extraAriaContext;


      return _react2.default.createElement(_PageView2.default, {
        key: index,
        onClick: this.handlePageSelected.bind(null, index),
        selected: selected === index,
        pageClassName: pageClassName,
        pageLinkClassName: pageLinkClassName,
        activeClassName: activeClassName,
        activeLinkClassName: activeLinkClassName,
        extraAriaContext: extraAriaContext,
        href: this.hrefBuilder(index),
        ariaLabel: this.ariaLabelBuilder(index),
        page: index + 1
      });
    }
  }, {
    key: 'render',
    value: function render() {
      var _props5 = this.props,
          disabledClassName = _props5.disabledClassName,
          previousClassName = _props5.previousClassName,
          nextClassName = _props5.nextClassName,
          pageCount = _props5.pageCount,
          containerClassName = _props5.containerClassName,
          previousLinkClassName = _props5.previousLinkClassName,
          previousLabel = _props5.previousLabel,
          nextLinkClassName = _props5.nextLinkClassName,
          nextLabel = _props5.nextLabel;
      var selected = this.state.selected;


      var previousClasses = previousClassName + (selected === 0 ? ' ' + disabledClassName : '');
      var nextClasses = nextClassName + (selected === pageCount - 1 ? ' ' + disabledClassName : '');

      var previousAriaDisabled = selected === 0 ? 'true' : 'false';
      var nextAriaDisabled = selected === pageCount - 1 ? 'true' : 'false';

      return _react2.default.createElement(
        'ul',
        { className: containerClassName },
        _react2.default.createElement(
          'li',
          { className: previousClasses },
          _react2.default.createElement(
            'a',
            {
              onClick: this.handlePreviousPage,
              className: previousLinkClassName,
              href: this.hrefBuilder(selected - 1),
              tabIndex: '0',
              role: 'button',
              onKeyPress: this.handlePreviousPage,
              'aria-disabled': previousAriaDisabled
            },
            previousLabel
          )
        ),
        this.pagination(),
        _react2.default.createElement(
          'li',
          { className: nextClasses },
          _react2.default.createElement(
            'a',
            {
              onClick: this.handleNextPage,
              className: nextLinkClassName,
              href: this.hrefBuilder(selected + 1),
              tabIndex: '0',
              role: 'button',
              onKeyPress: this.handleNextPage,
              'aria-disabled': nextAriaDisabled
            },
            nextLabel
          )
        )
      );
    }
  }]);

  return PaginationBoxView;
}(_react.Component);

PaginationBoxView.propTypes = {
  pageCount: _propTypes2.default.number.isRequired,
  pageRangeDisplayed: _propTypes2.default.number.isRequired,
  marginPagesDisplayed: _propTypes2.default.number.isRequired,
  previousLabel: _propTypes2.default.node,
  nextLabel: _propTypes2.default.node,
  breakLabel: _propTypes2.default.oneOfType([_propTypes2.default.string, _propTypes2.default.node]),
  hrefBuilder: _propTypes2.default.func,
  onPageChange: _propTypes2.default.func,
  initialPage: _propTypes2.default.number,
  forcePage: _propTypes2.default.number,
  disableInitialCallback: _propTypes2.default.bool,
  containerClassName: _propTypes2.default.string,
  pageClassName: _propTypes2.default.string,
  pageLinkClassName: _propTypes2.default.string,
  activeClassName: _propTypes2.default.string,
  activeLinkClassName: _propTypes2.default.string,
  previousClassName: _propTypes2.default.string,
  nextClassName: _propTypes2.default.string,
  previousLinkClassName: _propTypes2.default.string,
  nextLinkClassName: _propTypes2.default.string,
  disabledClassName: _propTypes2.default.string,
  breakClassName: _propTypes2.default.string,
  breakLinkClassName: _propTypes2.default.string,
  extraAriaContext: _propTypes2.default.string,
  ariaLabelBuilder: _propTypes2.default.func
};
PaginationBoxView.defaultProps = {
  pageCount: 10,
  pageRangeDisplayed: 2,
  marginPagesDisplayed: 3,
  activeClassName: 'selected',
  previousClassName: 'previous',
  nextClassName: 'next',
  previousLabel: 'Previous',
  nextLabel: 'Next',
  breakLabel: '...',
  disabledClassName: 'disabled',
  disableInitialCallback: false
};
exports.default = PaginationBoxView;
//# sourceMappingURL=PaginationBoxView.js.map

/***/ }),

/***/ "./node_modules/react-paginate/dist/index.js":
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _PaginationBoxView = __webpack_require__("./node_modules/react-paginate/dist/PaginationBoxView.js");

var _PaginationBoxView2 = _interopRequireDefault(_PaginationBoxView);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

exports.default = _PaginationBoxView2.default;
//# sourceMappingURL=index.js.map

/***/ }),

/***/ "./node_modules/react-paginate/node_modules/prop-types/factoryWithThrowingShims.js":
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */



var ReactPropTypesSecret = __webpack_require__("./node_modules/react-paginate/node_modules/prop-types/lib/ReactPropTypesSecret.js");

function emptyFunction() {}
function emptyFunctionWithReset() {}
emptyFunctionWithReset.resetWarningCache = emptyFunction;

module.exports = function() {
  function shim(props, propName, componentName, location, propFullName, secret) {
    if (secret === ReactPropTypesSecret) {
      // It is still safe when called from React.
      return;
    }
    var err = new Error(
      'Calling PropTypes validators directly is not supported by the `prop-types` package. ' +
      'Use PropTypes.checkPropTypes() to call them. ' +
      'Read more at http://fb.me/use-check-prop-types'
    );
    err.name = 'Invariant Violation';
    throw err;
  };
  shim.isRequired = shim;
  function getShim() {
    return shim;
  };
  // Important!
  // Keep this list in sync with production version in `./factoryWithTypeCheckers.js`.
  var ReactPropTypes = {
    array: shim,
    bool: shim,
    func: shim,
    number: shim,
    object: shim,
    string: shim,
    symbol: shim,

    any: shim,
    arrayOf: getShim,
    element: shim,
    elementType: shim,
    instanceOf: getShim,
    node: shim,
    objectOf: getShim,
    oneOf: getShim,
    oneOfType: getShim,
    shape: getShim,
    exact: getShim,

    checkPropTypes: emptyFunctionWithReset,
    resetWarningCache: emptyFunction
  };

  ReactPropTypes.PropTypes = ReactPropTypes;

  return ReactPropTypes;
};


/***/ }),

/***/ "./node_modules/react-paginate/node_modules/prop-types/index.js":
/***/ (function(module, exports, __webpack_require__) {

/**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

if (false) { var throwOnDirectAccess, ReactIs; } else {
  // By explicitly using `prop-types` you are opting into new production behavior.
  // http://fb.me/prop-types-in-prod
  module.exports = __webpack_require__("./node_modules/react-paginate/node_modules/prop-types/factoryWithThrowingShims.js")();
}


/***/ }),

/***/ "./node_modules/react-paginate/node_modules/prop-types/lib/ReactPropTypesSecret.js":
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */



var ReactPropTypesSecret = 'SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED';

module.exports = ReactPropTypesSecret;


/***/ })

}]);