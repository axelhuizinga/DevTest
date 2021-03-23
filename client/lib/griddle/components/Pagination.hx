package griddle.components;

import react.ReactMacro.jsx;

typedef NextButtonProps =
{
    hasNext:Bool, 
    onClick:haxe.Constraints.Function, 
    style:Dynamic, 
    className:String,
    text:String
};
typedef PreviousButtonProps =
{
    hasPrevious:Bool, 
    onClick:haxe.Constraints.Function, 
    style:Dynamic, 
    className:String,
    text:String
};
typedef PaginationProps =
{
    Next:NextButton,
    Previous:PreviousButton,
    PageDropdown:PageDropdown,
    style:Dynamic,
    className:String 
};
@:jsRequire('griddle-react/components','NextButton')
extern class NextButton
{}
/*   public static function render(props:NextButtonProps)
    {
        return props.hasNext?
        jsx('<button type="button" onClick=${props.onClick} style=${props.style} className=${props.className}>${props.text}</button>'):
        null;
    }

    public function new(props:NextButtonProps)return NextButton.render(props);
}*/
@:jsRequire('griddle-react/components','PreviousButton')
extern class PreviousButton
{
   /* public static function render(props:PreviousButtonProps)
    {
        return props.hasPrevious?
        jsx('<button type="button" onClick=${props.onClick} style=${props.style} className=${props.className}>${props.text}</button>'):
        null;
    }

    public function new(props:PreviousButtonProps)return PreviousButton.render(props);*/
}
@:jsRequire('griddle-react/components','Pagination')
extern class Pagination{}