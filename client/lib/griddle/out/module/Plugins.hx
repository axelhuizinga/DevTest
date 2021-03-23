package out.module.Plugins.hx;
typedef PositionSettings = {
	@:optional
	var tableHeight : haxe.extern.EitherType<Float, String>;
	@:optional
	var tableWidth : haxe.extern.EitherType<Float, String>;
	@:optional
	var rowHeight : haxe.extern.EitherType<Float, String>;
	@:optional
	var defaultColumnWidth : haxe.extern.EitherType<Float, String>;
	@:optional
	var fixedHeader : Bool;
	@:optional
	var disablePointerEvents : Bool;
};
extern class PluginsTopLevel {
	static var CorePlugin : GriddlePlugin;
	static var LegacyStylePlugin : GriddlePlugin;
	static var LocalPlugin : GriddlePlugin;
	static var PositionPlugin : PositionSettings -> GriddlePlugin;
	static var ColumnDefinition : Dynamic;
	static var RowDefinition : Dynamic;
}
