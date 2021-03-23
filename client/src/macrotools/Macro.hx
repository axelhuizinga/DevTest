package macrotools;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.Tools;
#end

@:dce
class Macro {
	public static macro function model<T:{}>(object:ExprOf<T>, model:Expr, field:Expr):ExprOf<T> {
		var type = Context.typeof(object);

		var fields = switch type.follow() {
			case TAnonymous(_.get() => anon): anon.fields;
			case _: throw new Error("Not an anonymous structure", object.pos);
		}
    
    var modelName = switch model {
      case macro $i{model}, macro $v{(model:String)}: model;
			case _: throw new Error("Invalid model expression", model.pos);
    }

    switch field {
      case macro $i{fieldName}:
    		if (Lambda.find(fields, function(f) return f.name == fieldName) == null)
          throw new Error('Invalid field ${fieldName}', field.pos);
    
        return macro $v{modelName + "." + fieldName};
        
      case {expr: EDisplay(macro null, DKMarked), pos: p}:
				var ct = type.toComplexType();
        return {pos: p, expr: EDisplay({pos: p, expr: EField(macro (null : $ct), "")}, DKDot)};
                                        
      case _:
        throw new Error("Invalid field expression", field.pos);
    }
	}
}