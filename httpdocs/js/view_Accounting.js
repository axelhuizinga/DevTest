(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[2],{

/***/ "./node_modules/haxe-loader/index.js?build/view_Accounting!./":
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(global) {/* eslint-disable */ 
var $hx_exports = module.exports, $global = global;
var $s = $global.$hx_scope, $_;
var haxe_Log = $s.b, React_Component = $s.a, $hxClasses = $s.c, redux_Action = $s.d, action_AppAction = $s.e, action_ConfigAction = $s.f, $extend = $s.g, react_ReactType = $s.h, React_Fragment = $s.k, React = $s.n, view_StatusBar = $s.be, redux_react_ReactRedux = $s.aj, react_ReactTypeOf = $s.ak;
$hx_exports["me"] = $hx_exports["me"] || {};
$hx_exports["me"]["cunity"] = $hx_exports["me"]["cunity"] || {};
$hx_exports["me"]["cunity"]["debug"] = $hx_exports["me"]["cunity"]["debug"] || {};
$hx_exports["me"]["cunity"]["debug"]["Out"] = $hx_exports["me"]["cunity"]["debug"]["Out"] || {};
var view_Accounting = $hx_exports["default"] = function(props,context) {
	this.mounted = false;
	haxe_Log.trace(context,{ fileName : "view/Accounting.hx", lineNumber : 30, className : "view.Accounting", methodName : "new"});
	React_Component.call(this,props);
};
$hxClasses["view.Accounting"] = view_Accounting;
view_Accounting.__name__ = "view.Accounting";
view_Accounting.mapDispatchToProps = function(dispatch) {
	return { onTodoClick : function(id) {
		return dispatch(redux_Action.map(action_AppAction.Config(action_ConfigAction.SetTheme("orange"))));
	}};
};
view_Accounting.mapStateToProps = function() {
	return function(aState) {
		var uState = aState.userState;
		return { appConfig : aState.config, userState : aState.userState, redirectAfterLogin : aState.locationStore.redirectAfterLogin};
	};
};
view_Accounting.__super__ = React_Component;
view_Accounting.prototype = $extend(React_Component.prototype,{
	mounted: null
	,componentDidMount: function() {
		this.mounted = true;
	}
	,componentDidCatch: function(error,info) {
		haxe_Log.trace(error,{ fileName : "view/Accounting.hx", lineNumber : 53, className : "view.Accounting", methodName : "componentDidCatch"});
	}
	,render: function() {
		var tmp = react_ReactType.fromComp(React_Fragment);
		var tmp1 = { "$$typeof" : $$tre, type : react_ReactType.fromString("div"), props : { className : "tabContent2", children : "..."}, key : null, ref : null};
		var tmp2 = $$tre;
		return React.createElement(tmp,{ },tmp1,{ "$$typeof" : tmp2, type : view_StatusBar._renderWrapper, props : this.props, key : null, ref : null});
	}
	,__class__: view_Accounting
});
function $getIterator(o) { if( o instanceof Array ) return new haxe_iterators_ArrayIterator(o); else return o.iterator(); }
var $$tre = (typeof Symbol === "function" && Symbol.for && Symbol.for("react.element")) || 0xeac7;
if(typeof(performance) != "undefined" ? typeof(performance.now) == "function" : false) {
	HxOverrides.now = performance.now.bind(performance);
}
view_Accounting._renderWrapper = (redux_react_ReactRedux.connect(view_Accounting.mapStateToProps,view_Accounting.mapDispatchToProps))(react_ReactTypeOf.fromComp(view_Accounting));
view_Accounting.__jsxStatic = view_Accounting._renderWrapper;
$s.view_Accounting = view_Accounting; 

/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__("./node_modules/webpack/buildin/global.js")))

/***/ })

}]);