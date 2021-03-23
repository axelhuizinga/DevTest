package view.dashboard.model;

/**
 * ...
 * @author axel@cunity.me
 */

import view.table.Table.DataColumn;
import view.table.Table.DataState;
import view.shared.FormInputElement;
import view.shared.io.DataAccess;

class DBSyncModel 
{
	public static var formatBool = function(v:Dynamic) {return (v?'Y':'N'); }
	public static var formatElementSelection = function(v:Dynamic) {return (v?'Y':'N'); }
    static var formatPhone = function(p:Dynamic){trace(p);return (p?p.login:'');};
	public static function dataSource(action:String):DataSource {
		return switch (action){
			case 'loadClientData':
				[
					"contacts" => [
						"alias" => 'co',
						"fields" => '',
						"jCond"=>'contact=co.id'
					],
					"deals" => ["alias" => 'da',
						"fields" => null,
						"jCond"=>'contact=co.id'
					],
					"accounts" =>["alias" => 'ac',
						"fields" => ''
					]
				];			
			case 'importClientList':
				[
					"contacts" => [
						"alias" => 'co',
						"fields" => '',
						"jCond"=>'contact=co.id'
					],
					"deals" => ["alias" => 'da',
						"fields" => null,
						"jCond"=>'contact=co.id'
					],
					"accounts" =>["alias" => 'ac',
						"fields" => ''
					]
				];
			default:
				null;
		}
	}

	public static function formFields(action:String):DataView {
		return switch(action){
			case 'editTableFields':
				[
					'table_name'=>{label:'Tabelle',disabled:true},
					'field_name'=>{label:'Feldname',disabled:true},
					'field_type'=>{label:'Datentyp',type:Select},
					'element'=>{label:'Eingabefeld', type:Select},
					'disabled' => {label:'Readonly', type:Checkbox},
					'required' => {label:'Required', type:Checkbox},
					'use_as_index' => {label:'Index', type:Checkbox},
					'any' => {label:'Eigenschaften', disabled:true, type:Hidden},
					'id' =>{type:Hidden}
				];
			case 'importClientList':
				[
					'import_contacts'=>{label:'Kontakte',type:Checkbox, preset:true},
					'contacts_limit'=>{label:'Anzahl',type:Input},
					'import_deals'=>{label:'Aufträge',type:Checkbox, preset:true},
					'import_accounts'=>{label:'Kontent', type:Checkbox, preset:true},
				];
			default:
				null;
		}
	}
	public static function dataAccess(action:String):DataAccess {
		
		return switch (action){
			case 'editTableFields':
			['$action'=>{
				source:[
					"selectedRows" => null//selectedRowsMap()
				],
				view:[
					'table_name'=>{label:'Tabelle',disabled:true},
					'field_name'=>{label:'Feldname',disabled:true},
					'field_type'=>{label:'Datentyp',type:Select},
					'element'=>{label:'Eingabefeld', type:Select},
					'disabled' => {label:'Readonly', type:Checkbox},
					'required' => {label:'Required', type:Checkbox},
					'use_as_index' => {label:'Index', type:Checkbox},
					'any' => {label:'Eigenschaften', disabled:true, type:Hidden},
					'id' =>{type:Hidden}
				]
			}];
			case 'importClientList':
			['$action'=>{
				source:[
					"selectedRows" => null//selectedRowsMap()
				],
				view:[
					'import_contacts'=>{label:'Kontakte',type:Checkbox, preset:true},
					'contacts_limit'=>{label:'Anzahl',type:Input},
					'import_deals'=>{label:'Aufträge',type:Checkbox, preset:true},
					'import_accounts'=>{label:'Kontent', type:Checkbox, preset:true},
				]
			}];
			case 'saveTableFields':
			['$action'=>{
				source:null,
				view:null
			}];
			default:
			null;
		};
	}		
	
	public static var clientListColumns:Map<String,DataColumn> =  [
		'client_id'=>{label: 'ID', show:true},
		'first_name'=>{label:'Vorname',editable:true},
		'last_name'=>{label:'Name',editable:true},
		'phone'=>{label: 'Telefon'}
	];
	public static var userListColumns:Map<String,DataColumn> =  [
		'user_id'=>{label: 'ID', show:true},
		'user'=>{label:'User',editable:false},
		'full_name'=>{label:'Name',editable:true, flexGrow:1},
		//'phone_data'=>{label:'Nebenstelle', editable: true, cellFormat:formatPhone, className: 'tRight'},
		'phone_login'=>{label:'Nebenstelle', editable: true, className: 'tRight'},
        'user_group'=>{label:'Gruppe', editable: true}
		//'any'=>{label:'Eigenschaften', flexGrow:1},
	];
	
	//public static function dataDisplay(?parentForm:DataAccessForm):StringMap<DataState> 
	public static var dataDisplay:Map<String,DataState> =
	[
		'userList' => {altGroupPos:0,columns:userListColumns},
		'clientList' => {altGroupPos:0,columns:clientListColumns}
	];
	
}
