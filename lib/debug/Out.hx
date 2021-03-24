package debug;

import haxe.Http;
import haxe.Log;
import haxe.PosInfos;
import haxe.CallStack;
import Type; 
#if (haxe_ver >= 4)
import #if js js.Syntax #elseif php php.Syntax #end;
#end

#if flash
import flash.Boot;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.external.ExternalInterface;
import flash.Lib;
#elseif !js
import sys.io.File;
import sys.io.FileOutput;
#end
#if php
import php.Lib;
import php.Syntax;
#elseif neko
import neko.Lib;
#end
#if js
import js.Boot;
#end
#if !(nodejs || js_kit)
//import js.jq.JHelper;
import js.html.Window;
import js.Browser;
import js.html.Element;
import js.jquery.*;
#end

//using me.cunity.tools.ArrayTools;
using Lambda;

enum DebugOutput {
	HAXE;
	NATIVE;
}

@:keep 
@:expose("Out")
class Out{
	
	public static var suspended:Bool = #if noTrace true #else false #end; 
	public static var skipFields:Array<String> = [];
	public static var skipFunctions:Bool = true;
	public static var traceToConsole:Bool = false;
	public static var traceTarget:DebugOutput = NATIVE;
	public static var aStack:Void->Array<StackItem> = CallStack.callStack;
	public static var dumpedObjects:Array<Dynamic>;
	#if php
	public static var log:FileOutput;
	public static var once:Bool = false;
	
	public static function init() {
		File.saveContent('log.txt', '');
		log = File.write('log.txt', true);
		log.flush();
		Log.trace = Out._trace;
	}
	#end
	
	public static function _trace(v :Dynamic, ?i :haxe.PosInfos ) :Void {
		if (suspended)
			return;
		var warned = false;
		if(i != null && Reflect.hasField(i ,'customParams')){
			i = i.customParams[0];
		}

		var msg = if( i != null ) i.fileName+":"+i.methodName +":"+i.lineNumber+":" else "";		
		msg += v;

		#if php
		if (log != null) {
			log.writeString(msg+'\n');
			log.flush();				
		}
		else
		switch(traceTarget)
		{				
			case NATIVE:
				Syntax.call("error_log({0})", msg);
			case HAXE:								
				php.Lib.print(StringTools.htmlEscape(msg) + '<br/>');
			//case LOG:
		}				

		if (once)
		{
			once = false;
			_trace('i:' + Type.typeof(i));
			dumpObject(i);
		}

		#elseif neko
		haxe.Log.trace(msg + "\n", i);
		#elseif flash
		switch(traceTarget)
		{
			case HAXE:
				ExternalInterface.call("trace",  msg + "<br/>");
				//Boot.__trace(v + "", i);
			case NATIVE:
			untyped __global__['trace'](msg);

		}	
		#elseif (js || html5)
		switch(traceTarget){
			case NATIVE:
				untyped console.log(msg);
			case HAXE:
				untyped {
					var msg = if( i != null ) i.fileName+":"+i.lineNumber+":"+i.methodName+":" else "";
					#if jsfl
					msg += __string_rec(v,"");
					fl.trace(msg);
					#else
					msg += Std.string(v)+"<br/>";
					var d = Browser.document.getElementById("haxe:trace");
					if ( d == null && !warned)
					{
						warned = true;
						alert("No haxe:trace element defined\n"+msg);
					}
					else
						d.innerHTML += msg;
					#end
				}
		}
		#end			
	}
	
	public static function log2(v, ?i :haxe.PosInfos)
	{
		#if !nodejs
		var msg = if ( i != null ) i.fileName+":" + i.lineNumber + ":" + i.methodName+":" else "";
		msg += Std.string(v);
		var http:Http = new Http('http://localhost/devel/php/jsLog.php');
		http.setParameter('log', msg);
		#if js
		http.async = true;
		#end
		http.onData = function(data) { if (data != 'OK') trace(data); };
		http.request(true);		
		#end
	}

#if flash	

	public static function dumpLayout(dI:DisplayObject, ?recursive:Null<Bool> = false, ?i :haxe.PosInfos) {
		//var m = if( i != null ) i.className+":"+i.methodName +":"+i.lineNumber+":" else "";
		var m = "\n";
		try {
		m += dI.name + ' depth:' + dI.parent.getChildIndex(dI) + ' alpha:' + dI.alpha + ' x:' + dI.x + ' y:' + dI.y + ' width:' + dI.width + 
		' height:' + dI.height + '\nrotation:' + dI.rotation + ' scaleX:' + dI.scaleX + ' scaleY:' + dI.scaleY;
		m += ' visible:' + dI.visible;
		m += '\n parentBox:' + Std.string(dI.getBounds(dI.parent));
		m += '\n rootBox:' + Std.string(dI.getBounds(flash.Lib.current));
		}
		catch (ex:Dynamic) {
			m += Std.string(ex);
		}
		//ExternalInterface.call("debug", m);
		_trace(m, i);
		if (dI != dI.root && recursive) {
			try{
				if (recursive && dI.parent != dI && dI.parent != null){
					dumpLayout(dI.parent, recursive, i);
				}
			}
			catch (ex:Dynamic) {
				trace(Std.string(ex), i);
			}
		}
	}
	
	public static function dump(msg:String, ?i :haxe.PosInfos) {
		
		ExternalInterface.call("dump", msg + '\n');
	}
#elseif (js && !(nodejs || js_kit))
//	BROWSER WINDOW ONLY
	#if JQ
	public static function dumpLayout(dI:Element, ?recursive:Null<Bool> = false, ?i :haxe.PosInfos)
	{
		dumpJLayout(new JQuery(dI), recursive, i);
	}
	
	public static function dumpJLayout(jQ:JQuery, ?recursive:Null<Bool> = false, ?i :haxe.PosInfos)
	{
		//trace(jQ.length);
		if (jQ.length == 0)
			return;
		var m:String = jQ.attr('id') + ' left:' + jQ.position().left + ' top:' + jQ.position().top +' width:' + jQ.width() + 
		' height:' + jQ.height() + ' visibility:' + jQ.css('visibility') + ' display:' + jQ.css('display') + ' position:' + jQ.css('position') 
		+ ' class:' + jQ.attr('class') +' overflow:' + jQ.css('overflow') + ' zIndex:' + jQ.css('z-index') + ' opacity:' + jQ.css('opacity');
		_trace(m, i);
		if (recursive && jQ.parent().attr('id') != 'bgBox')
			dumpJLayout(jQ.parent(), true, i);
	}
	#end
	
	public static function dumpObjectRSafe(root:Dynamic, recursive:Bool = false, ?i:PosInfos)
	{
		var oCopy:Dynamic = {};
		for (f in Reflect.fields(root))
		{
			if (f == 'parentView')
			{
				oCopy.parentView = root.parentView.instancePath;
				continue;
			}
			Reflect.setField(oCopy,f, Reflect.field(root, f));
		}
		dumpObject(oCopy, i);
	}
	
	@:keep
	@:expose
	public static function dumpObjectTree(root:Dynamic, recursive:Bool = false, ?i:PosInfos)
	{
		dumpedObjects = new Array();
		_dumpObjectTree(root, Type.typeof(root), recursive, i);
	}
	
	static function _dumpObjectTree(root:Dynamic, parent:ValueType, recursive:Bool, ?i:PosInfos)
	{
		var m:String = ((Type.getClass(root) != null) 
			? Type.getClassName(Type.getClass(root))
			: Type.typeof(root).getName());
		var fields:Array<String> = (Type.getClass(root) != null) ?
			Type.getInstanceFields(Type.getClass(root)):
			Reflect.fields(root);
		if (m == 'String')
		{
			_trace(root + ' len:' + root.length, i);
		}
		else
		{
			//don't save Strings
			dumpedObjects.push(root);
			_trace(m + ' fields:' + fields.length + ':' + fields.slice(0, 5).toString(),i);
		}
		//dumpedObjects.push(parent);
		try {
			
			for (f in fields)
			{
				trace(f,i);
				if (recursive)
				{
					if (dumpedObjects.length > 1000)
					{
						_trace(dumpedObjects.toString(),i);
						throw('oops');
						break;
						return;
					}
					else
					{
						var _o = untyped __js__("root[f]");
						if ( ! Lambda.has(dumpedObjects, _o))
						{						
							_dumpObjectTree( _o, Type.typeof(_o), true, i);
						}						
					}
					
				}
			}
		}
		
		catch(ex:Dynamic){
			trace(ex);
		}
		//_trace(fields, i);
	}
#elseif php
	public static function printCDATA(data:String, ?i:PosInfos) {
		_trace('<pre>' + Syntax.call("htmlspecialchars({0})", data) + '</pre>', i);
	}
	
	public static function dumpVar(v:Dynamic, ?i:PosInfos)
	{
		Syntax.code("
			ob_start();
			print_r({0});
			$ret =  ob_get_clean();
		", v);
		_trace(untyped ret);
	}
#end


	public static function dumpObject(ob:Dynamic, ?i:haxe.PosInfos) 
	{
		var tClass = Type.getClass(ob);
		var m:String = 'dumpObject:' + ( ob != null ? Type.getClass(ob) :ob) + '\n';
		var names:Array<String> = new Array();
		//trace(names.toString());
		names = (Type.getClass(ob) != null) ?
			Type.getInstanceFields(Type.getClass(ob)):
			Reflect.fields(ob);
		if (Type.getClass(ob) != null)
		//{
			m =  Type.getClassName(Type.getClass(ob))+':\n';
			//untyped{
			for (name in names) {
				if (skipFields.has(name))
				{
					m += '$name:skipped\n';
					continue;
				}
				try {
					var t = Std.string(Type.typeof(Reflect.field(ob, name)));
					if ( skipFunctions && t == 'TFunction')
					null;
					m += name + ':' +Reflect.field(ob,name) + ':' + t + '\n';
				}
				catch (ex:Dynamic) {
					m += name + ':' + ex;
				}
			}
		//}
		//else
			//m = Std.string(ob);
		
		_trace(m, i);
	}
	
	public static function dumpStack(sA:Array<StackItem>,  ?i:PosInfos):Void
	{
		var b:StringBuf = new StringBuf();
		b.add("StackDump:" + #if php sA.length + "<br/>" #else'\n'#end);
		for (item in sA)
		{			
			itemToString(item, b);
			b.add(#if php "<br/>" #else'\n'#end);
		}
		//_trace(#if php ~/\n|\r\n/g.replace(b.toString(), "<br/>") #else b.toString()#end, i);
		//_trace(~/<br\/>$/.replace(b.toString(),''), i);
		trace(b.toString(), i);
	}
		
	static function itemToString(s:StackItem, b :StringBuf)
	{
		switch( s ) {
		case CFunction:
			b.add("a C function");
		case LocalFunction(v):
			b.add("LocalFunction:" + v);
		case Module(m):
			b.add("module ");
			b.add(m);
		case FilePos(s,file,line):
			if( s != null ) {
				itemToString(s, b);
				b.add(" (");
			}
			b.add(file);
			b.add(" line ");
			b.add(line);
			if( s != null ) b.add(#if php ")<br/>" #else ")\n"#end);
		case Method(cname,meth):
			b.add(cname);
			b.add(".");
			b.add(meth);
			b.add(#if php "<br/>" #else "\n"#end);
		/*case Lambda(n):
			b.add("local function #");
			b.add(n);*/
		}
	}
	#if flash
	public static function isChildOf(di:DisplayObject, p:DisplayObjectContainer = null):Bool
	{
		if (p == null)
			p = Lib.current;
		while (di.parent != null)
		{
			if (di.parent == p)
				return true;
			di = di.parent;
		}
		return false;
	}
	#end
	
	public static function fTrace (str:String, arr:Array<Dynamic>, ?i :haxe.PosInfos) 
	{
		var str_arr = str.split (" @");
		var str_buf :StringBuf = new StringBuf();
			
		for (i in 0...str_arr.length) {
			str_buf.add ( str_arr[i] );
			if (arr[i] != null)
			str_buf.add ( arr[i] );
		}
		_trace( str_buf.toString(), i);
	}
}