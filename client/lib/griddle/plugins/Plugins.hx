package griddle.plugins;
import griddle.components.Components;
import griddle.components.Components.GriddlePlugin;

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

@:jsRequire('griddle-react','plugins')
@:native("plugins") extern class Plugins {
	static var CorePlugin : GriddlePlugin;
	static var LegacyStylePlugin : GriddlePlugin;
	static var LocalPlugin : GriddlePlugin;
	static var PositionPlugin : PositionSettings -> GriddlePlugin;
}
