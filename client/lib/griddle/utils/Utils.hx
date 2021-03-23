package griddle.utils;
import griddle.Griddle.*;
import griddle.components.Components.GriddleSortKey;
import griddle.components.Components.PropertyBag;

typedef SortProperties = {
	function setSortColumn(sortProperties:GriddleSortKey -> Void):Void;
	var sortProperty : GriddleSortKey;
	var columnId : String;
};
extern class Utils {
	static var columnUtils : PropertyBag<haxe.Constraints.Function>;
	static var compositionUtils : PropertyBag<haxe.Constraints.Function>;
	static var dataUtils : PropertyBag<haxe.Constraints.Function>;
	static var rowUtils : PropertyBag<haxe.Constraints.Function>;
	static var connect : Dynamic;
}
