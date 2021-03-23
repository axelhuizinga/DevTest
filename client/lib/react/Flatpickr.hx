package react;

/**
 * ...
 * @author axel@cunity.me
 */
 
typedef FlatpickrJS = Dynamic;

@:jsRequire('react-flatpickr', 'default')
@:native('DateTimePicker') 
extern class Flatpickr extends ReactComponent 
{}