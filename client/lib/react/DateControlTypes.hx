package react;

import haxe.Constraints.Function;
import react.ControlTypes;

/**
 * ...
 * @author axel@cunity.me
 */

typedef Locale = {
    weekdays: {
        shorthand: Array<String>,
        longhand: Array<String>
    },
    months: {
        shorthand: Array<String>,
        longhand: Array<String>
    },
    daysInMonth: Array<Int>,
    firstDayOfWeek: Int,
    ordinal: Int->String,
    rangeSeparator: String,
    weekAbbreviation: String,
    scrollTitle: String,
    toggleTitle: String,
    amPM: Array<String>,
    yearAriaLabel: String,
    time_24hr: Bool
};
 
typedef DateTimeProps =
{
	>InputProps,
	?comp:Dynamic,
    ?defaultValue: String,
    ?options: FlatpickrProps,
    ?onOpen: Function,
    ?onClose: Function,
    ?onMonthChange: Function,
    ?onYearChange: Function,
    ?onReady: Function,
    ?onValueUpdate: Function,
    ?onDayCreate: Function,
    ?onCreate: Function,
    ?onDestroy: Function
}

typedef DateOption = Dynamic;//Either<Date, Either<String, Int>>;

typedef FlatpickrProps =
{
	?allowInput:Bool,
	?animate:Bool,
	?clickOpens:Bool,
	?dateFormat:String,
	?defaultDate:Dynamic,//Either<DateOption, Array<DateOption>>,
	?enableSeconds:Bool,
	?enableTime:Bool,
	?_inline:Bool,
	?formatDate: Date->String->Locale->String,
	?locale: String,
    ?maxDate: DateOption,
    ?maxTime: DateOption,
    ?minDate: DateOption,
    ?minTime: DateOption,
	?minuteIncrement:Int,
	?onChange:Array<Date>->String->Flatpickr->Void,
	?onOpen:Array<Date>->String->Flatpickr->Void,
	?onClose:Array<Date>->String->Flatpickr->Void,
	?onMonthChange:Array<Date>->String->Flatpickr->Void,
	?onDayCreate:Dynamic->String->Dynamic->Dynamic->Void,
	?onReady:Dynamic->String->Dynamic->Dynamic->Void,
	?onValueUpdate:Dynamic->String->Dynamic->Dynamic->Void,
	?onYearChange:Array<Date>->String->Flatpickr->Void,
	?noCalendar:Bool,
	?time_24hr:Bool
}
