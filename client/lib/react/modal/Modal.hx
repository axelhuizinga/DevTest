package react.modal;

import js.html.Element;
import haxe.Constraints.Function;
import react.ReactComponent;

typedef ModalStyle = {
	?overlay:Dynamic,/**{
		position: 'fixed',
		top: 0,
		left: 0,
		right: 0,
		bottom: 0,
		backgroundColor: 'rgba(255, 255, 255, 0.75)'
	  }**/
	?content:Dynamic/**{
		position: 'fixed',
		top: 0,
		left: 0,
		right: 0,
		bottom: 0,
		backgroundColor: 'rgba(255, 255, 255, 0.75)'
	  }**/
}

typedef ModalProps = {
	isOpen:Bool,
	?appElement:Element,
	?children:ReactFragment,
	?onAfterOpen:Function,
	?onAfterClose:Function,
	?onRequestClose:Function,
	?style:ModalStyle,
	?closeTimeoutMS:Int,
	?contentLabel:String,
	?portalClassName:String,
	?overlayClassName:String,
	?id:String,
	?className:String,
	?bodyOpenClassName:String,
	?htmlOpenClassName:String,
	?ariaHideApp:Bool,
	?shouldFocusAfterRender:Bool,//true
	?shouldCloseOnOverlayClick:Bool,//true
	?shouldCloseOnEsc:Bool,//true
	?shouldReturnFocusAfterClose:Bool,//true
	?role:String,//"dialog"
	?preventScroll:Bool,//false
	?parentSelector:Void->Element,//() => document.body
	?aria:Dynamic,/**{
		  labelledby: "heading",
		  describedby: "full_description"
		}**/
	?data:Dynamic,/**{ background: "green" }**/
	?testId:String,
	?overlayRef:Function,//	setOverlayRef
	?contentRef:Function,//	setContentRef
	?overlayElement:Function,//	(props, contentElement) => <div {...props}>{contentElement}</div>
	?contentElement:Function,//(props, children) => <div {...props}>{children}</div>	
}

@:jsRequire('react-modal', 'Modal')
extern class Modal extends ReactComponent.ReactComponentOfProps<ModalProps>{
	//public static var defaultStyles:ModalStyle;
}