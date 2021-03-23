package redux;

import react.ReactComponent.ReactFragment;
import react.ReactComponent.ReactComponentOfProps;
import haxe.extern.EitherType;
import haxe.Constraints.Function;
import redux.Form;
import redux.Form.Validator;
import redux.Redux.Dispatch;
//import type { Event, Validator } from './types'
import react.ReactType;
import react.ReactRef;

typedef FieldTypeProps = {
  ?type: String,//'radio',
  ?value: Dynamic // mandatory iff type === 'radio'
}

typedef Props = {
	>FieldTypeProps,
	name: String,

	// this is hard (?impossible) to type strictly - should be ComponentType<FieldProps & Passthrough>
	// where Passthrough is `Props.props & ${Dynamic other props passed to the Field component}`
	component: ReactFragment, 

	?format: Dynamic->String->String,
	?normalize: Function,
	//( value: Dynamic, previousValue: Dynamic, allValues: Object, previousAllValues: Object, name: String) => ?Dynamic,
	?onBlur: Function,
	?onChange: Function,
	?onDragStart:Function,
	?onDrop:Function,
	?onFocus:Function,
	?parse:Function,
	?props: Dynamic,
	?type: String,
	?validate: EitherType<Validator, Array<Validator>>,
	?warn: EitherType<Validator, Array<Validator>>,
	?forwardRef: Bool,
	?immutableProps: Array<String>
	}

typedef InputProps = {
	?checked: Bool,
	name: String,
	onBlur:Function,
	onChange:Function,
	onDrop:Function,
	onDragStart:Function,
	onFocus:Function,
	value: Dynamic
}

typedef FieldProps = {
  input: InputProps,
  meta: {
    active: Bool,
    asyncValidating: Bool,
    autofilled: Bool,
    dirty: Bool,
    dispatch: Dispatch,
    ?error: Dynamic,
    form: String,
    ?initial: Dynamic,
    invalid: Bool,
    pristine: Bool,
    submitting: Bool,
    submitFailed: Bool,
    touched: Bool,
    valid: Bool,
    visited: Bool,
    ?warning: Dynamic
  },
  custom: {
    ?ref: ReactRef<Dynamic>
  }
}
typedef FieldInputProps = Props;
@:jsRequire('redux-form','Field')
extern class Field extends  ReactComponentOfProps<FieldInputProps>
{
	public function  render():ReactType;
}

