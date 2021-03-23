package action;
import haxe.ds.IntMap;

enum LoadAction
{
	DataLoaded(component:String,sData:IntMap<Map<String,Dynamic>>);
}