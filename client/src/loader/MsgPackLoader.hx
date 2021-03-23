package loader;

import haxe.io.ArrayBufferView;
import org.msgpack.MsgPack;
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
import js.html.FormData;
import js.html.XMLHttpRequest;


class MsgPackLoader {

	public static function create(url:String, p:Dynamic, onLoaded:DbData->Void):XMLHttpRequest
	{
		var bl:MsgPackLoader = new MsgPackLoader(url);
		//bl.param = new FormData();
		bl.param = MsgPack.encode(p);
		bl.cB = onLoaded;
		bl.load();
		return bl.xhr;
	}
	var cB:DbData->Void;	
	//var param:FormData;
	var param:Bytes;
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
		trace(bytes.length);
		var u:Serializer = new Serializer();
		var data:DbData = u.unserialize(bytes, DbData);
		cB(data);
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
		xhr.setRequestHeader("Content-type", "application/x-msgpack; charset=utf-8");
		xhr.responseType = js.html.XMLHttpRequestResponseType.ARRAYBUFFER;
		xhr.onerror = function(e) onError(xhr.statusText);
		xhr.withCredentials = true;
		xhr.onload = function(e) {
			
			if (xhr.status != 200) {
				onError(xhr.statusText);
				return;
			}
			trace(xhr.response.length);
			onLoaded(haxe.io.Bytes.ofData(xhr.response));
		}
		
		xhr.onprogress = function(e) {
			#if (haxe_ver >= 4)
			onProgress(Std.int(js.Syntax.code("{0}.loaded || {0}.position", e)), Std.int(js.Syntax.code("{0}.total || {0}.totalSize", e)));
			#else
			onProgress(Std.int(untyped __js__("{0}.loaded || {0}.position", e)), Std.int(untyped __js__("{0}.total || {0}.totalSize", e)));
			#end
		}
		xhr.send(ArrayBufferView.fromData(param));
	}

}