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
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH3d
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package view.stats;

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
/**
 * ...
 * @author axel@cunity.me
 */

@:connect
class History extends ReactComponentOf<DataFormProps,FormState>
{
	
	//var dataDisplay:Map<String,DataSt>;
	var dataAccess:DataAccess;	
	var dbData: shared.DbData;

	public function new(props) 
	{
		super(props);
		//dataAccess = ContactsModel.dataAccess;
		//dataDisplay = ContactsModel.dataDisplay;
		trace('...' + Reflect.fields(props));
		trace(props.match.params);
		if(props.match.params.section==null)
		{
			//SET DEFAULT SECTION
			trace('reme');
			var baseUrl:String = props.match.path.split(':section')[0];
			props.history.push('${baseUrl}Charts/get');
		}		
		
		state =  App.initEState({
			dataTable:[],loading:false,values:new Map<String,Dynamic>(),
		},this);
		//trace(state.contactData);
		//trace(state.loading);		
	}
	
	override function componentDidCatch(error, info) {
		// Display fallback UI
		//if(state.mounted)
		try{
			this.setState({ hasError: true });
		}
		catch(ex:Dynamic)
		{trace(ex);}
		
		trace(error);
		//Out.dumpStack(CallStack.callStack());
	}	

	/*override function shouldComponentUpdate(nextProps:DataFormProps, nextState:FormState) {
		trace('propsChanged:${nextProps!=props}');
		trace('stateChanged:${nextState!=state}');
		if(nextState!=state)
			return true;
		return nextProps!=props;
	}*/

	static function mapDispatchToProps(dispatch:Dispatch):Partial<DataFormProps>
    {
		trace('ok');
        return {
			
		};
    }
	
	static function mapStateToProps(aState:AppState) 
	{
		//trace(aState.dataStore.contactData);
		trace(Reflect.fields(aState));
		if(aState.dataStore.contactData != null)
		trace(aState.dataStore.contactData.keys().next());
		if(aState.dataStore.contactsDbData != null)
		trace(aState.dataStore.contactsDbData.dataRows[0]);
		else 
		{
			trace(aState.dataStore);
			trace(Reflect.fields(aState.dataStore));
		}
		trace(App.store.getState().dataStore.contactsDbData);
		var bState =  {
			dataStore:aState.dataStore,
			userState:aState.userState,
			//idLoaded:aState.dataStore.contactData.keys().next()
		};
		//trace(bState);
		trace(bState.dataStore.contactData);
		return bState;
	}
		
	override public function componentDidMount():Void 
	{	
		trace(props.location.pathname);
		//setState({mounted:true});
		return;
		var baseUrl:String = props.match.path.split(':section')[0];
		trace(props.match);
	}
	
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
