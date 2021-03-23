package state;

import state.UserState;

typedef StatusBarState =
{
	?userState:UserState,
	status: String,
	date:Date,
	?hasError:Bool
}
