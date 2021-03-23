package immutable;

/**
 * ...
 * @author axel@cunity.me
 */

@:jsRequire('immutable', 'List')
extern class List<T>
{
	public function new(?ld:Array<T>):Void;
	
	public function concat(ld:Dynamic):List;
	public function merge(ld:Dynamic):List;
	public function reverse():List;
	public function sortBy<T>(comparatorValueMapper: T->Dynamic, ?comparator:T->T->Int):List;
	public function toArray():Array<T>;	
}