package model.deals;

import react.ReactMacro.jsx;
import view.shared.io.DataAccess;
import view.table.Table.DataColumn;
import view.table.Table.DataState;
import view.shared.FormInputElement;

using StringTools;
/**
 * @author axel@cunity.me
 */

class DealsModel
{
	public static var dataAccess:DataAccess = [
		'open' => {
			source:[
				"deals" => [
					"filter" => 'id',
					"title" => 'id'
					],
				],
			view:[				
				'creation_date'=>{label:'Erstellt',type:DatePicker, displayFormat: "d.m.Y", disabled:true},
				'start_date'=>{label:'Start',type:DatePicker, displayFormat: "d.m.Y"},
				'booking_run'=>{label:'Buchungslauf',type: Radio,options: ['start'=>'Monatsanfang','middle'=>'Monatsmitte']},
				'cycle'=>{label:'Turnus',type:Radio,options:[
					'once'=>'Einmal','monthly'=>'Monatlich','quarterly'=>'Vierteljährlich',
					'semiannual'=>'Halbjährlich', 'annual'=>'Jährlich']},
				'amount'=>{label:'Betrag', type:NFormat},
				'product'=>{label:'Produkt',type:Select,options:['2'=>'Kinderhilfe','3'=>'Tierhilfe']},
				//'agent'=>{label:'Agent'},
				//'end_reason'=>{label:'Kündigungsgrund',type:DatePicker, displayFormat: "d.m.Y"},
				'end_date'=>{label:'Beendet zum',type:DatePicker, displayFormat: "d.m.Y"},				
				//'repeat_date'=>{label:'Zahlun',type:DatePicker, displayFormat: "d.m.Y"},				
				'cycle_start_date'=>{label:'Turnus Startdatum',type:DatePicker, displayFormat: "d.m.Y"},
				'id' => {type:Hidden},
				'edited_by' => {type:Hidden},				
				'mandator' => {type:Hidden}				
			]
		}
	];

	public static var gridColumns:Map<String,view.grid.Grid.DataColumn> = [
	//public static var shortListColumns:Map<String,DataColumn> = [
		'id'=>{label:'ID',show:false},				
		'start_date'=>{label:'Seit',cellFormat:function(v:String) return DateTools.format(Date.fromString(v), "%d.%m.%Y"), className: 'tableNums'},	
		'end_date'=>{label:'Bis',cellFormat:function(v:String){
			if(v==null)
				return null;
			 return DateTools.format(Date.fromString(v), "%d.%m.%Y");
			}},	
		'active' => {label:'Status', className: 'tCenter',
			cellFormat:function(v:Bool) 
			{
				var className = (v?'active fas fa-heart':'passive far fa-heart');
				//trace('>>>$v<<<');
				return jsx('<span className=${className}></span>');
			}},
		'cycle' => {label: 'Turnus'},
		'amount' => {label: 'Betrag', cellFormat: function(v) {
			trace(v);
			return App.sprintf('%01.2f €',v).replace('.',',');
		},className: 'tRight tableNums'},
		
	];

	public static var listColumns:Map<String,DataColumn> = [
		'id'=>{label:'ID',show:false},				
		'start_date'=>{label:'Seit',cellFormat:function(v:String) return DateTools.format(Date.fromString(v), "%d.%m.%Y")},	
		'end_date'=>{label:'Bis',cellFormat:function(v:String) return DateTools.format(Date.fromString(v), "%d.%m.%Y")},	
		'active' => {label:'Aktiv', className: 'tCenter',
			cellFormat:function(v:Bool) 
			{
				var className = (v?'active fas fa-heart':'passive far fa-heart');
				//trace('>>>$v<<<');
				return jsx('<span className=${className}></span>');
			}},
		'cycle' => {label: 'Turnus'},
		'amount' => {label: 'Betrag',cellFormat: function(v) {
			return App.sprintf('%01.2f €',v).replace('.',',');
		},className: 'tRight'},
		
	];

	public static var dataDisplay:Map<String,DataState> = [
		'dealsFull' => {columns:listColumns}
	];	

	public static var dataGridDisplay:Map<String,view.grid.Grid.DataState> = [
		'dealsList' => {columns:gridColumns}
	];	
}