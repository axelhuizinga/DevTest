package gigatables_react;

import react.ReactComponent.ReactComponentOfProps;
import react.ReactComponent.ReactFragment;


/**
 * ...
 * @author axel@cunity.me
 */

typedef HeaderProps = {
	data: String,
    ?sortId: String,
    columns: Array<Dynamic>,
    ?sortDirection: Int,
    ?columnsSearch: Dynamic,
};

@:jsRequire("gigatables-react", "Header") 
extern class Header extends ReactComponentOfProps<HeaderProps>
{

	public function new(?props:HeaderProps);
	
	override function render():ReactFragment;
	
}