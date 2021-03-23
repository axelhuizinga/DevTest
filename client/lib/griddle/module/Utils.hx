package griddle.module.Utils.hx;
typedef SortProperties = {
	function setSortColumn(sortProperties:GriddleSortKey -> Void):Void;
	var sortProperty : GriddleSortKey;
	var columnId : String;
};
extern class UtilsTopLevel {
	static var columnUtils : PropertyBag<haxe.Constraints.Function>;
	static var compositionUtils : PropertyBag<haxe.Constraints.Function>;
	static var dataUtils : PropertyBag<haxe.Constraints.Function>;
	static var rowUtils : PropertyBag<haxe.Constraints.Function>;
	static var connect : Dynamic;
}
