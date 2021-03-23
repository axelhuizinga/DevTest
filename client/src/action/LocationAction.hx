package action;
import react.router.RouterMatch;
import haxe.extern.EitherType;
import history.History;
import history.Location;

/**
 * @author axel@cunity.me
 */

enum LocationAction
{
	Pop(url:String, ?state:Dynamic);
	Push(url:String, ?state:Dynamic);
	Replace(url:String, ?state:Dynamic);
	Go(to:Int);
	Back;
	Forward;	
	//InitHistory(history:History,location:Location);
	InitHistory(history:History);
	LocationChange(location:Location);
}