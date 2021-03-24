package action.async;

import debug.Out;
import js.lib.Promise;
import db.DbRelation;
import db.DbUser;
import js.html.svg.Point;
import action.AppAction;
import action.UserAction;
import haxe.http.HttpJs;
import haxe.Json;
import haxe.Serializer;
import loader.BinaryLoader;
import react.ReactUtil.copy;
import redux.Redux;
import redux.StoreMethods;
import redux.thunk.Thunk;
import js.Cookie;
import js.html.FormData;
import js.html.XMLHttpRequest;

import shared.DbData;
import state.AppState;
import state.UserState;
import view.shared.OneOf;
using DateTools;
using Lambda;

class UserAccess {

	
/**
 * 
 */
	
}