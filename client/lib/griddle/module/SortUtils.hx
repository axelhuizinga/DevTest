package griddle.module;
extern class SortUtilsTopLevel {
	static function defaultSort(data:Array<Dynamic>, column:String, ?sortAscending:Bool):Float;
	static function setSortProperties(sortProperties:SortProperties):Void -> Void;
}
