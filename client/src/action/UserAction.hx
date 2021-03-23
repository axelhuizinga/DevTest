package action;
import state.UserState;

enum UserAction
{
	LoginChange(state: UserState);
	LoginComplete(state: UserState);
	LoginError(state: UserState);
	LoginExpired(state: UserState);
	LogOut(state: UserState);	
	LogOutComplete(state: UserState);	
	LoginRequired(state: UserState);		
}