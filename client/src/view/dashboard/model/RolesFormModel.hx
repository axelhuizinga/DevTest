package view.dashboard.model;
import haxe.ds.StringMap;
import view.table.Table.DataColumn;
import view.table.Table.DataState;

/**
 * @author axel@cunity.me
 */

import view.table.Table.*;

class RolesFormModel
{
	public static var userListColumns:StringMap<DataColumn> =  [
		'id'=>{label:'Benutzer'},
		'first_name'=>{label:'Vorname', flexGrow:0},
		'last_name'=>{label:'Name', flexGrow:0},
		'email'=>{label:'Email'},
		'name'=>{label:'UserGroup', flexGrow:1},		
		'active' => {label:'Aktiv', className:'cRight', 
			cellFormat:function(v:Bool) return (v?'J':'N')},
		'user_id' => {show:false}
	];
	
	public static var dataDisplay:StringMap<DataState> = [
		'userList' => {columns:userListColumns},
		'userGroups' => {columns: [
			'user_group' => {label:'UserGroup', flexGrow:0},
			'group_name'=>{label:'Beschreibung', flexGrow:1},
			'allowed_campaigns'=>{label:'Kampagnen',flexGrow:1}
		]}
	];	
}