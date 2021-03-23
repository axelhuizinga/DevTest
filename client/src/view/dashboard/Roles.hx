package view.dashboard;

import loader.AjaxLoader;
import action.async.UserAccess;
import haxe.Serializer;
import haxe.ds.StringMap;
import state.AppState;
import react.ReactComponent.ReactFragment;
import react.ReactComponent;
import shared.DbData;

import loader.BinaryLoader;
import view.table.Table;
import react.ReactEvent;
import react.ReactMacro.jsx;
import react.ReactUtil;
import react.ReactType;
import redux.Redux.Dispatch;
import view.dashboard.model.RolesFormModel;
import view.shared.io.DataFormProps;
import view.shared.io.FormApi;
import state.FormState;
import view.shared.Menu;
import view.shared.MenuProps;
import view.shared.io.Users;
using Lambda;
/**
 * ...
 * @author axel@cunity.me
 */

@:connect
class Roles extends ReactComponentOf<DataFormProps,FormState>
{			
	public function new(?props:DataFormProps) 
	{
		super(props);
		//dataDisplay = RolesFormModel.dataDisplay;		
		state = {
			clean:true,
			hasError:false,
			mounted:false,
			loading:true,
			sideMenu:FormApi.initSideMenu2( this,
				[
					{
						dataClassPath:'roles.User',
						label:'Benutzer',
						section: 'Users',
						items: Users.menuItems
					},
					{
						dataClassPath:'settings.Bookmarks',
						label:'Benutzergruppen',
						section: 'Bookmarks',
						items: []//Bookmarks.menuItems
					},
					{
						dataClassPath:'roles.Permissions',
						label:'Rechte',
						section: 'permissions',
						items: []//Design.menuItems
					},										
				],
				{section: 'Users',	sameWidth: true}
			)
		};
		new FormApi(this, state.sideMenu);
		trace(Reflect.fields(props));
	}
	
	public function createUsers(ev:ReactEvent):Void
	{
		
	}
	public function editUsers(ev:ReactEvent):Void
	{
		
	}
	public function deleteUsers(ev:ReactEvent):Void
	{
		
	}
	
	public function createUserGroups(ev:ReactEvent):Void
	{
		
	}
	public function editUserGroups(ev:ReactEvent):Void
	{
		
	}
	public function deleteUserGroups(ev:ReactEvent):Void
	{
		
	}	
	public function createRoles(ev:ReactEvent):Void
	{
		
	}
	public function editRoles(ev:ReactEvent):Void
	{
		
	}
	public function deleteRoles(ev:ReactEvent):Void
	{
		
	}	
	
	
	public function importExternalUsers(ev:ReactEvent):Void
	{
		trace(ev.currentTarget);
		props.formApi.requests.push(AjaxLoader.load(
			'${App.config.api}', 
			{
				id:props.userState.dbUser.id,
				jwt:props.userState.dbUser.jwt,
				first_name:props.userState.dbUser.first_name,
				classPath:'admin.CreateUsers',
				action:'importExternal'
			},
			function(data){
				trace(data);				
			}
		));
	}
	
	static function mapStateToProps(aState:AppState) {
		return function(aState:AppState) 
		{
			var uState = aState.userState;
			trace(uState);		
			return {
				userState:uState
			};
		};
	}	
	
	override public function componentDidMount():Void 
	{
		
		trace(state.loading);
		
	}
	
	/*override public function componentWillUnmount()
	{
		for (r in requests)
			r.cancel();
	}
	//columnSizerProps = {{}}defaultSort = ${{column:"full_name", direction: SortDirection.ASC}}
    override function render() {
		trace(Reflect.fields(props));
		//trace(state);
		//trace(props);
        return jsx('		
				<div className="columns">
					<div className="tabComponentForm" children={renderContent()} />
					<Menu className="menu" menuBlocks={state.sideMenu.menuBlocks}/>					
				</div>		
        ');
    }	*/	
	
	override public function render() {
		var sM:MenuProps = state.sideMenu;
		if(sM.menuBlocks != null)
			trace(sM.menuBlocks.keys().next() + ':' + props.match.params.section);
		return jsx('
			<div className="columns">
				${renderContent()}
				<$Menu className="menu" {...sM} />
			</div>			
		');		
		//return jsx('<FormContainer ${...props} sideMenu=${state.sideMenu} render=${renderContent}/>');
	}

	function renderContent():ReactFragment
	{
		trace(props.match.params.action);
		return switch(props.match.params.action)
		{
			case "userList":
				jsx('
					<$Users	${...props} fullWidth={true}  />				
				');				
			default:
				jsx('<form className="tabComponentForm" >
					
				</form>');
				//null;
		}
	}
	
}

/**formApi=${cState.formApi}
 * 							autoSize = {true} 
							headerClassName = "table tablesorter is-striped is-fullwidth is-hoverable"
							headerColumns=${displayUsers}
							oddClassName="trOdd"
							evenClassName = "trEven"
							sortColumn = "full_name"
							sortDirection = {SortDirection.ASC}
*/