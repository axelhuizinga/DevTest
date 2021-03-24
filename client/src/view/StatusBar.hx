package view;


import debug.Out;
import react.ReactUtil;
import react.ReactComponent.ReactFragment;
import haxe.Timer;
import bulma_components.*;
import react.Partial;
import react.ReactComponent.ReactComponentOf;
import react.ReactDateTimeClock;

import react.ReactMacro.jsx;
import redux.react.IConnectedComponent;
import redux.Redux;
import react.router.Route.RouteComponentProps;
import redux.StoreMethods;
import action.AppAction;
import state.AppState;
import view.shared.DateTime;

import react.intl.ReactIntl;
import react.intl.comp.FormattedDate;
import react.intl.DateTimeFormatOptions.NumericFormat.Numeric;
import react.intl.DateTimeFormatOptions.NumericFormat.TwoDigit;

/**
 * ...
 * @author axel@cunity.me
 */

typedef StatusBarProps =
{
	> RouteComponentProps,
	?className:String,
	date:Date,
	path:String,
	?text:String
}

typedef StatusBarState = 
{
	?path:String,
	?text:String,
	?date:Date,
	?className:String,
}

@:connect
@:autoBuild(react.ReactMacro.buildComponent())
@:autoBuild(react.ReactTypeMacro.alterComponentSignatures())
class StatusBar extends ReactComponentOf<StatusBarProps,StatusBarState>	
{
	var mounted:Bool = false;
	var timer:Timer;
	
	public function new(?props:StatusBarProps,?context:Dynamic)
	{
		trace('setState:' + Reflect.field(this,'setState'));
		state = ReactUtil.copy(props, {date:Date.now()});
		super(props);
	}
	
	override public function componentDidMount():Void 
	{
		mounted = true;
		var d:Date = Date.now();
		var s:Int = d.getSeconds();
		trace('start delay at $s set timer start in ${(60 - s ) } seconds');
		Timer.delay(function(){
			if (!mounted)
			{
				trace('not mounted - will do nothing');
				return;
			}
			trace('timer start at ${Date.now().getSeconds()}');
			this.setState({ date: Date.now()});
			timer = new Timer(60000);
			timer.run = function() this.setState({ date: Date.now()});
		}, (60 - d.getSeconds()) * 1000);
		
		trace(props.children);
	}
	
	override public function componentWillUnmount()
	{
		mounted = false;
		if(timer !=null)
			timer.stop();
	}	
	
	static function mapStateToProps(astate:AppState) 
	{
		return {
			className: astate.status.className==null?'':astate.status.className,
			path: astate.status.path,
			text: astate.status.text
		};
	}	
	
	override public function render()
	{
		var display_name:String = 'Gast';
		var userIcon:String = 'fa fa-user-o';
		if(!Std.isOfType(props.text,String))
		{
			Out.dumpObject(props.text);
			return null;
		}

		 display_name = 'Guest';
		 userIcon = 'fa fa-user';			
		
		return jsx('
		<Footer>
			<div className="statusbar">
				<span className="column" >${props.path}</span>	
				<span className="main column ${props.className}" >${props.text}</span>			
				<span className="column flex-end">
				<i className=${userIcon}></i> $display_name</span>
				<$DateTime />			
			</div>
		</Footer>
		');
	}

}