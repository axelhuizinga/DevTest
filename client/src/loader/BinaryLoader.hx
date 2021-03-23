package loader;

import db.DBAccessProps;
import db.DbQuery;
import haxe.Json;
import haxe.CallStack;
import me.cunity.debug.Out;
import shared.DbData;
/**
 * ...
 * @author axel@cunity.me
 */

import haxe.io.Bytes;
import hxbit.Serializer;
import js.html.FileReader;
import js.html.FormData;
import js.html.XMLHttpRequest; 


class BinaryLoader {

	public static function create(url:String, p:Dynamic, onLoaded:DbData->Void):XMLHttpRequest
	{
		return dbQuery(url, p, onLoaded);
	}

	public static function dbQuery(url:String,dbAP:DBAccessProps, onLoaded:DbData->Void) {
		//trace(dbAP);
		trace(url);
		var s:Serializer = new Serializer();
		var bl:BinaryLoader = new BinaryLoader(url);
		var dbQuery = new DbQuery(dbAP);//.toHex();
		//Out.dumpObject(dbQuery);
		var b:Bytes = s.serialize(dbQuery);
		//trace(dbQuery.getSerializeSchema());
		//trace(dbQuery.relations.get('contacts').fields);
		//dbQuery.dump('/tmp/dbQuery.json');
		//trace(dbQuery);
		//trace('b.length:${b.length}');
		bl.param = b.getData();
		//bl.param = new FileReader().readAsBinaryString(s.serialize(new DbQuery(dbQuery)));
		//trace(bl.param);
		//trace(bl.param.toHex().length + ' :: ' + bl.param.toString().length + ' : ' + bl.param.length);
		bl.cB = onLoaded;
		bl.load();
		return bl.xhr;
	}

	public static function go(url:String, dbAP:DBAccessProps, onLoaded:DBAccessJsonResponse->Void){
		trace(dbAP);
		var s:Serializer = new Serializer();
		var bl:BinaryLoader = new BinaryLoader(url);
		var dbQuery = new DbQuery(dbAP);//.toHex();
		trace(dbQuery);
		var b:Bytes = s.serialize(dbQuery);
		bl.param = b.getData();
		bl.dBa = onLoaded;
		bl.loadJson();
		return bl.xhr;
	}


	var cB:DbData->Void;	
	var dBa:DBAccessJsonResponse->Void;
	var param:Dynamic;
	//var param:String;
	public var xhr:XMLHttpRequest;
	
	public var url(default, null) : String;
	#if flash
	var loader : flash.net.URLLoader;
	#end

	public function new( url : String ) {
		this.url = url;
		xhr = new js.html.XMLHttpRequest();
	}

	//public dynamic function onLoaded( bytes : haxe.io.Bytes ) {
	public function onLoaded( bytes : haxe.io.Bytes ) {
		//trace(bytes.length);
		if(bytes!=null && bytes.length>0){
			var u:Serializer = new Serializer();
			var data:DbData = u.unserialize(bytes, DbData);
			cB(data);			
		}
		else 
			trace('got nothing');

	}

	public dynamic function onProgress( cur : Int, max : Int ) {
	}

	public dynamic function onError( msg : String ) {
		Out.dumpStack(CallStack.callStack());
		trace(msg);
		throw msg;
	}

	public function load() {
		xhr.open('POST', url, true);
		//xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
		//xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
		xhr.responseType = js.html.XMLHttpRequestResponseType.ARRAYBUFFER;
		
		//xhr.onerror = function(e) onError(xhr.statusText);
		xhr.onerror = function(e) {
			trace(e);
			trace(e.type);
		}
		xhr.withCredentials = true;
		xhr.onload = function(e) {
			//trace(xhr.status);
			if (xhr.status != 200) {
				onError(xhr.statusText);
				return;
			}
			//trace(xhr.response.length);
			onLoaded(haxe.io.Bytes.ofData(xhr.response));
		}
		
	/*	xhr.onprogress = function(e) {
			#if (haxe_ver >= 4)
			trace('${e.loaded} :: ${e.total}');
			//onProgress(Std.int(js.Syntax.code("{0}.loaded || {0}.position", e)), Std.int(js.Syntax.code("{0}.total || {0}.totalSize", e)));
			#else
			onProgress(Std.int(untyped __js__("{0}.loaded || {0}.position", e)), Std.int(untyped __js__("{0}.total || {0}.totalSize", e)));
			#end
		}*/
		xhr.send(param);
	}

	public function loadJson() {
		xhr.open('POST', url, true);
		//xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
		//xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
		xhr.responseType = js.html.XMLHttpRequestResponseType.ARRAYBUFFER;
		
		xhr.onerror = function(e) {
			trace(e);
			trace(e.type);
		}
		xhr.withCredentials = true;
		xhr.onload = function(e) {
			//trace(xhr.status);
			if (xhr.status != 200) {
				onError(xhr.statusText);
				return;
			}
			//trace(xhr.response.length);
			//dBa(haxe.io.Bytes.ofData(xhr.response));
		}
		xhr.send(param);
	}
}