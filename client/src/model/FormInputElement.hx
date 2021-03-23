package model;

typedef FormInputElementProps = {
	?type:String
};

@:rtti
class FormInputElement extends ORM
{
	public function new(data:Map<String,String>) {
		super(data);
		
	}	
		
	@dataType("text")
	@:isVar public var type(default,set):String;

	function set_type(type:String):String{
		if(initialized('type'))
			modified('type');
		this.type = type ;
		return type;
	}	
	
}