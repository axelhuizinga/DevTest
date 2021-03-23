package state;
//import view.shared.io.User;
//import history.Location;
import db.DbUser;
import state.ConfigState;
import state.LocationState;

typedef AppState =
{
	?app:App,
	?config:ConfigState,
	?formStates:Map<String, FormState>,
	?dataStore:DataAccessState,
	?locationStore:LocationState,
	?status:StatusState
};
