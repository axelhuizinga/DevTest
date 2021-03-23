package view.stats;

import view.shared.io.BaseForm;
import react.Partial;
import redux.Redux.Dispatch;
import state.AppState;
import react.ReactComponent.ReactFragment;
import react.ReactComponent;
import react.ReactMacro.jsx;
import view.shared.io.DataAccess;
import view.shared.io.DataFormProps;
import view.shared.io.FormApi;
import state.FormState;
import view.shared.Menu;
import view.shared.MenuProps;
import view.shared.io.Users;
import view.stats.history.Charts;
using Lambda;

class Performance  extends ReactComponentOf<DataFormProps,FormState>
{
	override function render()
		{
			//if(state.dataTable != null)	trace(state.dataTable[0]);
			//trace(props.match.params.section);					
			trace(props.match.params.action);	
			//trace(props.storeContactsList);	
			return switch(props.match.params.section)
			{
				case "Charts":
					jsx('
						<$Charts ${...props} limit=${100} parentComponent=${this} formApi=${state.formApi} 
						fullWidth={true} sideMenu=${state.sideMenu}/>
						');								
				default:
					null;					
			}		
		}	
}