package view.shared;

import react.ReactComponent;
import react.ReactMacro.jsx;
import react.intl.IntlShape;
import react.intl.ReactIntl.defineMessages;
import react.intl.ReactIntl.injectIntl;
import react.intl.DateTimeFormatOptions.NumericFormat;
import react.intl.DateTimeFormatOptions.NumericFormat.Numeric;
import react.intl.DateTimeFormatOptions.NumericFormat.TwoDigit;
using StringTools;

private typedef IntlProps = {
	var intl:IntlShape;
}

typedef DateProps =
{
    >IntlProps,
    @:optional var className:String;
    @:optional var year:NumericFormat;
    @:optional var month:NumericFormat;
    @:optional var day:NumericFormat;
    @:optional var hour:NumericFormat;
    @:optional var minute:NumericFormat;
}

#if react_next
//@:noPublicProps
@:wrap(injectIntl)
#else
@:jsxStatic('WithIntl')
#end
class DateTime extends ReactComponentOfProps<IntlProps>
{
    #if !react_next
        public static var WithIntl = injectIntl(LocalesMenu);
    #end

    override public function render()
    {
        return jsx('
        <$DateDisplay   className="column flex-end"     intl=${props.intl}
        year=${Numeric} month=${Numeric} day=${Numeric} hour=${Numeric} minute=${Numeric} />
        ');
        return null;
    }

    function DateDisplay(props:DateProps)
    {
        var now:String = props.intl.formatDate(Date.now(),
        {
            year:props.year,
            month:props.month,
            day:props.day,
            hour:props.hour,
            minute:props.minute
        });
        //trace(now);
        now = now.replace(',', '');
        return jsx('
        <span   className="column flex-end" >
        ${now}
        </span>
        ');
    }
}