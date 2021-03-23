package griddle.components;

import js.html.Event;
import haxe.Constraints.Function;
import react.ReactComponent.ReactComponentOfProps;

typedef PageDropdownProps =
{
    ?maxPages:Int,
    ?currentPage:Int,
    ?setPage:Function,
    ?style:Dynamic,
    ?className:String
};

@:jsRequire('griddle-react/components','PageDropdown')
extern class PageDropdown extends  ReactComponentOfProps<PageDropdownProps>
{
    static var propTypes:PageDropdownProps;
}
