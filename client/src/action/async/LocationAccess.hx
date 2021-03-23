package action.async;

import action.LocationAction;
import redux.Redux.Dispatch;
import redux.thunk.Thunk;
import react.router.Route.RouteRenderProps;
import react.router.ReactRouter.matchPath;
import state.AppState;

class LocationAccess 
{
	public static function redirect(routes:Array<String>,to:String,?props:RouteRenderProps) 
	{
		if(props==null)
		{
			return Thunk.Action(function (dispatch:Dispatch, getState:Void->AppState)
			{
				//getState().locationState.history.push(to);
				trace('Redirecting to $to');
				return dispatch(LocationChange({
					pathname:to,
					search: '',
					hash: '',
					key:null,
					state:null
				}));
			});
		}
		return Thunk.Action(function(dispatch:Dispatch, getState:Void->AppState){
			trace(props.location.pathname);			
			trace(to);
			var match:react.router.RouterMatch = null;
			for(route in routes)
			{
				match = matchPath(props.location.pathname,{
				//match = matchPath(to,{
					path:route,
					exact:true,
					strict:false
				});
				trace('$route => $match');	
				if(match!=null)
				{
					return null;
				}
			}
			trace('history.push($to)');
			props.history.push(to);
			return null;
			return dispatch(LocationChange({
				pathname:to,
				search: '',
				hash: '',
				key:null,
				state:null
			}));
		});
	}
}