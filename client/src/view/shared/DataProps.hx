package view.shared;
import haxe.Constraints.Function;
import view.shared.RouteTabProps;
import state.AppState;
import redux.Store;

typedef  DataProps = 
{
	>RouteTabProps,
	?store:Store<AppState>,
	?redirect:Function
}