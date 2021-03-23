package griddle;
import griddle.components.Components.GriddleStyleConfig;
import griddle.components.Components.GriddlePlugin;
import griddle.components.Components.GriddleProps;
import react.ReactComponent.ReactComponentOf;
import react.ReactComponent.ReactComponentOfProps;
import haxe.Constraints.Function;

import haxe.Json;

/*typedef GriddleProps =
{
    ?data:Array<Json>,
       // array - The data that should be displayed within the grid. This data needs to be an array of JSON objects. Default: []
    ?styleConfig:GriddleStyleConfig,

    ?plugins:Array<GriddlePlugin>
}*/

@:jsRequire('griddle-react','default')
extern class Griddle<T> extends ReactComponentOf<GriddleProps<T>, Dynamic> {
	static var storeKey : String;
}