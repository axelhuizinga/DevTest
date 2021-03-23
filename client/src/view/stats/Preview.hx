/*
 * MIT License
 *
 * Copyright (c) 2019 ParadiseProjects.de, Axel Huizinga
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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

class Preview  extends ReactComponentOf<DataFormProps,FormState>
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
