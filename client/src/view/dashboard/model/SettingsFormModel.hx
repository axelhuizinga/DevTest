package view.dashboard.model;
import haxe.ds.StringMap;
import view.shared.FormProps;
import view.shared.FormInputElement;
import view.shared.FormField;

/**
 * @author axel@cunity.me
 */

import state.FormState;

typedef FormRelation =
{
	?props:FormProps,
	?state:FormState
}

class SettingsFormModel
{
	public static var accountDataElements:StringMap<FormField> =  [
		'id'=>{label:'Benutzer'},
		'first_name'=>{label:'Vorname'},
		'last_name'=>{label:'Name'},
		'email'=>{label:'Email'},		
		'name'=>{label:'UserGroup'},		
		'active' => {label:'Aktiv', className:'', 'type':FormInputElement.Checkbox},
		'user_id' => {'type':FormInputElement.Hidden}
	];
	
	public static var relations:StringMap<FormRelation> = [
		'user' => {
			props:{elements:accountDataElements,userState:App._app.state.user.id},
			state:null
		},
		'userBookmarks' => {}
	];	
}