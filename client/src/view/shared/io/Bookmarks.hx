package view.shared.io;

import js.html.Event;
import react.router.RouterMatch;
import react.ReactType;
import react.React;
import js.html.Plugin;
import js.Syntax;
import haxe.Serializer;
import haxe.ds.StringMap;
import loader.AjaxLoader;
import react.ReactComponent;
import react.ReactComponent.ReactFragment;
import react.ReactMacro.jsx;
import state.FormState;
import view.shared.Menu;
//import view.shared.io.DataAccessForm;
import view.shared.io.DataFormProps;
import view.shared.io.DataAccess.DataSource;
import view.table.Table.*;


/**
 * ...
 * @author axel@cunity.me
 */

typedef BookmarksModel = DataSource;

//typedef UserFilter = Dynamic;
@:connect
class Bookmarks extends ReactComponentOf<DataFormProps,FormState>
{
	
	override function componentDidCatch(error, info) {
		// Display fallback UI
		if(state.mounted)
		this.setState({ hasError: true });
		trace(error);
		trace(info);
	}
	
	public function add(ev:Event):Void
	{

	}

	public function delete(ev:Event):Void
	{
		
	}

	public function edit(ev:Event):Void
	{
		trace('hi :)');
		props.formApi.requests.push(AjaxLoader.load(	
			'${App.config.api}', 
			{
				id:props.userState.dbUser.id,
				jwt:props.userState.dbUser.jwt,
				classPath:'auth.User',
				action:'update',
				filter:'id|${props.userState.dbUser.id}',
				dataSource:Serializer.run(null)
			},
			function(data:Dynamic )
			{
				if (data.rows == null)
					return;
				trace(data.rows.length);
				var dataRows:Array<Dynamic> = data.rows;
				trace(Reflect.fields(dataRows[0]));
				trace(dataRows[0].active);
				setState({data:['accountData'=>dataRows], loading:false});					
			}
		));
		setState({dataClassPath:"auth.User.edit"});
	}
	
	public function save(ev:Event):Void
	{

	}

	public function no(ev:Event):Void
	{

	}

	public function new(props:DataFormProps)
	{
		super(props);
		/*dataAccess = [
			'update' =>{
				source:new Map(),
				view:new Map()
			}
		];*/
		//_menuItems = [];//{handler:edit, label:'Bearbeiten', action:'update'}];
		var sideMenu = updateMenu('bookmarks');
		//sideMenu.menuBlocks['bookmarks'].items = function() return _menuItems;
		//trace(sideMenu.menuBlocks['bookmarks'].items());
		state = {
			clean:true,
			hasError:false,
			mounted:false,
			loading:true,
			sideMenu:sideMenu, 
		};
		//trace(this.props);
	}
	
	override function render()
	{

		trace(state);
		//var NewLayoutInstance = React.createElement(NewLayout);;
		//trace(data);
		trace(props.match.params);

		return jsx('
			<div className="tabComponentForm"  >
				dummy	
			</div>		
		');
	}

	public static var menuItems:Array<MItem> = [
		{label:'Neu',action:'insert'},
		{label:'Bearbeiten',action:'update'},
		{label:'Speichern', action:'save'},
		{label:'Löschen',action:'delete'},
	];

	function updateMenu(?viewClassPath:String):MenuProps
	{
		if(state==null)
		{
			trace(state);
			return null;
		}
		var sideMenu = state.sideMenu;
		sideMenu.menuBlocks['bookmarks'].isActive = true;
		sideMenu.menuBlocks['bookmarks'].label='Lesezeichen';
		for(mI in sideMenu.menuBlocks['bookmarks'].items)
		{
			switch(mI.action)
			{		
				case 'update':
					mI.disabled = state.selectedRows.length==0;
				case 'save':
					mI.disabled = state.clean;
				default:

			}			
		}		
		//trace(sideMenu.menuBlocks['user'].items);	
		return sideMenu;
	}	

	function getRow(row:Dynamic):{one: String, two: String, three: String}
	{
		return {one: row.one, two: row.two, three: row.three};
	}
}
/*<$ReactTable
	          	data=${data}
    	      	columns=${columns}
				defaultPageSize={20}
          		style=${style}
         	 	className="-striped -highlight" />*/