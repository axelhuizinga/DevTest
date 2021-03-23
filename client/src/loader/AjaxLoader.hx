package loader;
import haxe.ds.StringMap;
import haxe.http.HttpJs;
import haxe.Json;
import react.ReactComponent;
import me.cunity.debug.Out;
/**
 * ...
 * @author axel@cunity.me
 */

typedef AsyncDataLoader =
{
	url:String,
	?params:StringMap<String>,
	?cB:String->Void,
	?dataField:String,
	?component:ReactComponent
}

 class AjaxLoader 
{	
	public static function load(url:String, ?params:Dynamic,?cB:Dynamic->Void):HttpJs
	{
		var req = new HttpJs(url); 
		if(params!=null) for (k in Reflect.fields(params))
		{
			req.addParameter(k, Reflect.field(params, k));
		}		
		req.addHeader('Access-Control-Allow-Methods', "PUT, GET, POST, DELETE, OPTIONS");
		req.addHeader('Access-Control-Allow-Origin', '*');
		var loader:AjaxLoader = new AjaxLoader(cB);
		req.onData = loader._onData;
		req.onError = function(err:String) trace(err);
		trace('POST? ' + params != null);
		req.withCredentials = true;
		req.request(params != null);
		return req;
	} 
	
	var cB:Dynamic->Void;
	var params:Dynamic;
	var post:Bool;
	var req:HttpJs;
	var url:String;
	
	public function new(?cb:String->Void, ?p:Dynamic, ?r:HttpJs)
	{
		cB = cb;
		params = p;
		post = p!=null;
		req = r;
	}
	
	function _onData(response:String)
	{
		if (response.length > 0)
		{
			var dataObj = Json.parse(response);
			if (dataObj.error != '')
			{
				trace(dataObj.error);
				//trace(App.store.getState().history);
				//return;
				dataObj.data = {error: dataObj.error, rows:[]};
			}
			if (cB != null)
				cB(dataObj.data);					
		}
	}
	
	function _onError(err:String)
	{
		
	}

	function _onQueueData(response:String)
	{
		if (response.length > 0)
		{
			var dataObj = Json.parse(response);
			if (dataObj.error != '')
			{
				trace(dataObj.error);
				//trace(App.store.getState().history);
				//return;
				dataObj.data = {error: dataObj.error, rows:[]};
			}
			if (cB != null)
				cB(dataObj.data);	
			if (rqs.length > 0)
				rqs.shift().request(post);
		}
	}
	
	static var rqs:Array<HttpJs> = [];

	public static function loadData(url:String, ?params:Dynamic,?cB:Dynamic->Void):HttpJs
	{
		var loader:AjaxLoader = queue(url, params, cB);
		rqs.push(loader.req);
		if (rqs.length == 1)
			rqs.shift().request(loader.post);
		return loader.req;
	}

	public static function queue(url:String, ?params:Dynamic,?cB:Dynamic->Void):AjaxLoader
	{
		var req = new HttpJs(url); 
		if(params!=null) for (k in Reflect.fields(params))
		{
			req.addParameter(k, Reflect.field(params, k));
		}		
		req.addHeader('Access-Control-Allow-Methods', "PUT, GET, POST, DELETE, OPTIONS");
		req.addHeader('Access-Control-Allow-Origin', '*');
		var loader:AjaxLoader = new AjaxLoader(cB, params, req);
		loader.url = url;
		req.onData = loader._onQueueData;
		req.onError = function(err:String) {trace(err);Out.dumpObject(req);}
		trace('POST? ' + params != null);
		req.withCredentials = true;
		//req.request(params != null);
		return loader;
	}	

	
}