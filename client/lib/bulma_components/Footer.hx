package bulma_components;

import react.ReactComponent;
import react.ReactMacro.jsx;

/**
 * ...
 * @author axel@cunity.me
 */

@:keep
class Footer extends ReactComponent
{
	override function render()
	{
		return jsx('
			<footer className="footer" children={props.children}/>
		');
	}
}
