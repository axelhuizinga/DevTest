package view.dashboard.model;

import view.grid.Grid;
import haxe.ds.Map;
import state.FormState;
import shared.DBMetaData;
/**
 * ...
 * @author axel@cunity.me
 */


import haxe.ds.StringMap;
import view.shared.FormInputElement;


class DBFormsModel 
{
	public static var formatBool = function(v:Dynamic) {return (v?'Y':'N'); }
	public static var formatElementSelection = function(v:Dynamic) {return (v?'Y':'N'); }
	public static var fieldsListColumns:Map<String, DataColumn> =  [
		/*'table_name'=>{label:'Tabelle',editable:false},
		'field_name'=>{label:'Feldname',editable:false, flexGrow:1},
	//	'format_display'=>{label:'Anzeige', title:'Anzeigeformat'},
		'format_store'=>{label:'DB', title:'Speicherformat'},
		'element'=>{label:'Form', title:'Eingabefeld'},
		'admin_only'=>{label:'AO', title:'Admin',cellFormat:formatBool},
		'readonly'=>{label:'RO', title:'Nur Lesen', cellFormat:formatBool},
		'required'=>{label:'RQ', title:'Pflichtfeld', cellFormat:formatBool},
		//'primary'=>{label:'PID', title: 'Is Primary ID',cellFormat:formatBool},
		'use_as_index'=>{label:'ID', cellFormat:formatBool},
		//'any'=>{label:'Eigenschaften', flexGrow:1},
		'id'=>{label: 'ID', show:false}*/
	];
	
	//public static function dataDisplay(?parentForm:DataAccessForm):StringMap<DataState> 
	public static var dataDisplay:Map<String,DataState> =
		[
			//'fieldsList' => {altGroupPos:0,columns:fieldsListColumns}
		];
	
	public static function dbMetaToState(dbMeta:Array<Map<String,Dynamic>>):Array<Map<String,Dynamic>>
	{
		var sData:Array<Map<String,Dynamic>> = new Array();
		for(row in dbMeta)
		{
			var rM:Map<String,Dynamic> = new Map();
			for(k in row.keys())
			{
				if(row[k].format_display != null)
					rM[k] = App.sprintf(row[k].format_display, row[k]);
				else 
					rM[k] = row[k];
			}
			sData.push(rM)			;
		}
		return sData;
	}
}
/*	id:Int,
	mandator:Int,
	element:FormInputElement,
	table_name:String,
	field_name:String,
	field_type:String,
	format_display:String,
	format_store:String,
	admin_only:Bool,
	required:Bool,
	disabled:Bool,
	use_as_index:Bool,
	primary:Bool*/