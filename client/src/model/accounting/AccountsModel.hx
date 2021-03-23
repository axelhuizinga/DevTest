package model.accounting;

import react.ReactMacro.jsx;
import view.shared.io.DataAccess;
import view.table.Table.DataColumn;
import view.table.Table.DataState;
import view.shared.FormInputElement;

/**
 * @author axel@cunity.me
 */

class AccountsModel
{
	public static var dataAccess:DataAccess = [
		'open' => {
			source:[
				"accounts" => [
					"filter" => 'id',
				//"joins" => []//Array of join parameters
					],
				],
			view:[				
				'account_holder'=>{label:'Kontoinhaber',type:Input},
				'creation_date'=>{label:'Erstellt',type:Hidden, displayFormat: "d.m.Y", disabled:true},
				'sign_date'=>{label:'Erteilt',type:DatePicker, displayFormat: "d.m.Y"},
				'bank_name'=>{label:'Bank',type:Input},
				'iban'=>{label:'IBAN',type:Input},
				'status'=>{label:'Status', type:Select,options: ['active'=>'Aktiv','passive'=>'Passiv','new'=>'Neu']},
				'id' => {type:Hidden},
				'edited_by' => {type:Hidden},				
				'mandator' => {type:Hidden}				
			]
		}
	];

	public static var gridColumns:Map<String,view.grid.Grid.DataColumn> = [
		'id'=>{label:'ID',show:false, useAsIndex: true},				
		'account_holder'=>{
			flexGrow:1,
			label:'Inhaber',cellFormat:function(v:String) 
			{
				var n = v.split(',');
				n.reverse();
				return n.join(' ');
			}
		},	
		'sign_date'=>{label:'Erteilt',cellFormat:function(v:String) return v!=null? DateTools.format(Date.fromString(v), "%d.%m.%Y"):''},	
		'contact'=>{label:'Kontakt',show:false, useAsIndex: false},				
		'iban'=>{label:'IBAN'},	
		'status' => {label:'Status', className: 'tCenter',
			cellFormat:function(v:String) 
			{
				var className = (v=='active'?'active fas fa-heart':'passive far fa-heart');
				//trace(uState);
				return jsx('<span className=${className}></span>');
			}}
	];

	public static var listColumns:Map<String,DataColumn> = [
		'id'=>{label:'ID',show:false, useAsIndex: true},				
		'contact'=>{label:'Kontakt',show:false, useAsIndex: false},				
		'bank_name'=>{label:'Bankname'},	
		'iban'=>{label:'IBAN'},	
		'status' => {label:'Aktiv', className: 'tCenter',
			cellFormat:function(v:String) 
			{
				var className = (v=='active'?'active fas fa-heart':'passive far fa-heart');
				//trace(uState);
				return jsx('<span className=${className}></span>');
			}}
		
	];

	public static var dataDisplay:Map<String,DataState> = [
		'accountsList' => {columns:listColumns}
	];	

	public static var dataGridDisplay:Map<String,view.grid.Grid.DataState> = [
		'accountsList' => {columns:gridColumns}
	];	
}