package view.shared;
import haxe.Constraints.Function;
import react.router.Route.RouteRenderProps;
import js.html.Event;
import view.shared.MItem;
import view.shared.MenuBlock;

typedef MenuProps =
{
	>RouteRenderProps,
	?activeInstance:Dynamic,
	?className:String,
	?basePath:String,
	?hidden:Bool,
	?menuBlocks:Map<String,MenuBlock>,
	?parentComponent:Dynamic,
	?section:String,
	?switchSection:Function,
	?items:Array<MItem>,
	?itemHandler:Event->Void,
	?right:Bool,
	?sameWidth:Bool
}
