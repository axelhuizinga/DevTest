package react_virtualized;
import haxe.Constraints.Function;
import react.ReactComponent.ReactFragment;
import react.PureComponent;

/**
 * ...
 * @author axel@cunity.me
 */

typedef Size =
{
	?height:Int,
	?width:Int
}

typedef AutoSizerProps =
{
	children:Size->ReactFragment,
	?className:String,
	?defaultHeight:Int,
	?defaultWitdth:Int, 
	?disableHeight:Bool,
	?disableWidth:Bool,
	?nonce:String,
	?onResize:Function,
	?style:Dynamic
}

@:jsRequire('react-virtualized', 'AutoSizer')
@:native('AutoSizer')
extern class AutoSizer extends PureComponentOf<AutoSizerProps,Size>{}
