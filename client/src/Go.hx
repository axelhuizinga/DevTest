import haxe.ds.IntMap;
import haxe.Log;
import js.Browser;
import js.Cookie;
import js.html.DivElement;
import me.cunity.debug.Out;
import react.ReactDOM;
import react.ReactMacro.jsx;

class Go
{

	public static function main()
	{
		Log.trace = Out._trace;
		trace('hi :) ${Out.suspended}');	
		var t:IntMap<haxe.ds.Map<String,Dynamic>> = new IntMap();
		t.set(0, ["hello"=>"world"]);
		t.set(1, ["org"=>666]);
		trace(Type.getInstanceFields(Type.getClass(t)));
		trace(t.remove(0));
		render(createRoot());
	}

	static function createRoot():DivElement
	{
		var root:DivElement = Browser.document.createDivElement();
		root.className = 'rootBox';
		Browser.document.body.appendChild(root);
		return root;
	}

	static function render(root:DivElement)
	{

		var app = ReactDOM.render(jsx('
					<App/>
		'), root);	
		//trace(app);
		trace('GO');
		
		#if (debug && react_hot)
		trace('calling ReactHMR.autoRefresh');
		ReactHMR.autoRefresh(app);
		#end
	}
}
