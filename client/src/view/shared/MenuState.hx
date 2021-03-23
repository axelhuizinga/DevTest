package view.shared;

typedef  InteractionState =
{
	var disables:Array<String>;
	var enables:Array<String>;
}

typedef MenuState =
{
	?hidden:Bool,
	?disabled:Bool,
	?sameWidth:Int,
	?section:String,
	?interactionStates:Map<String,InteractionState>
}
