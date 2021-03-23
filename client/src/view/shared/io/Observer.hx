package view.shared.io;
import haxe.macro.Expr.Catch;
import js.lib.Proxy;
import js.lib.Object;

class Observer{

	static var handler:ProxyHandler<Dynamic>;

	public static function run(obj:Dynamic, cb:Dynamic->Void):Dynamic{
		handler = {
			get: function (target, property:String, receiver:Dynamic):Any{
				trace(property);
				return Reflect.getProperty(target, property);
			},
			set: function (target, property:String, value, receiver:Dynamic):Bool{
				try{
					if(property=='care_of')
					{
						trace('$value ${Reflect.getProperty(receiver, property)}');
						trace('$value ${Reflect.getProperty(target, property)}');
					}

					//trace(target);
					//trace(receiver);
					//target=receiver;
					Reflect.setField(target,property,value);
					//cb(target);
					return true;
				} catch(e:Dynamic){
					trace(e);
					return false;
				}
			}
		};
		return cast new Proxy(obj,handler);
	}		
}