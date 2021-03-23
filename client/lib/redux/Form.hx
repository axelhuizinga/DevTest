package redux;

import react.ReactType;
import react.ReactComponent;
import react.ReactComponent.ReactComponentOfProps;
import redux.Redux.Action;
import redux.Redux.Dispatch;
import haxe.Constraints.Function;

typedef FormProps = 
{
	?onSubmit:Function,
	?_reduxForm:Dynamic
}

typedef Values = Dynamic;
typedef GetFormState = Dynamic->Dynamic;
typedef OnChangeFunction = Values->Dispatch->Dynamic->Values->Void;
typedef OnSubmitFunction = Function;
typedef OnSubmitFail = Function;
typedef OnSubmitSuccess = Function;
typedef ValidateFunction = Values->Dynamic->Dynamic;

typedef Config = {
  ?asyncBlurFields: Array<String>,
  ?destroyOnUnmount: Bool,
  ?forceUnregisterOnUnmount: Bool,
  ?enableReinitialize: Bool,
  ?keepDirtyOnReinitialize: Bool,
  ?keepValues: Bool,
  form: String,
  ?immutableProps: Array<String>,
  ?initialValues: Values,
  ?getFormState: GetFormState,
  ?onChange: OnChangeFunction,
  ?onSubmit: OnSubmitFunction,
  ?onSubmitFail: OnSubmitFail,
  ?onSubmitSuccess: OnSubmitSuccess,
  ?propNamespace: String,
  ?submitAsSideEffect: Bool,
  ?validate: ValidateFunction,
  ?warn: ValidateFunction,
  ?touchOnBlur: Bool,
  ?touchOnChange: Bool,
  ?persistentSubmitErrors: Bool,
  ?registeredFields: Dynamic
}

typedef Validator = Function;
/*typedef Validator = (
  value: Dynamic,
  allValues: Object,
  props: Object,
  name: String
) => ?Dynamic*/

@:jsRequire('redux-form')
extern class Form extends ReactComponentOfProps<FormProps> {
	public static function reducer(state: Dynamic, action: Action):Void;
	public static function reduxForm(reduxConfig:Config):(ReactType->ReactType);
}