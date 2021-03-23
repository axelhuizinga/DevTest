package view.shared.io;

import js.html.Element;
using Lambda;

typedef ToolTipProps =
{
	data:String,
	?classes:Array<String>
}

class Tooltip {

	private var classes:Array<String>;
	private var el:Element;

	public function new(el:Element, ?tProps:ToolTipProps):Void
	{
		this.el = el;
		if(tProps.classes != null)
		{
			if(!tProps.classes.has('tooltip'))
				tProps.classes.remove('tooltip');
			classes = tProps.classes;
			classes.map(function(cN:String) {el.classList.add('is-tooltip-$cN');return null;});
		}
			
		el.classList.add('tooltip');
		el.dataset.tooltip = tProps.data;		
	}

	public function clear() {
		el.classList.remove('tooltip');
		classes.map(function(cN:String) {el.classList.remove('is-tooltip-$cN');return null;});
		el.removeAttribute('data-tooltip');
	}
	
}