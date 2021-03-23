package shared;

import shared.DBMetaData.DataField;
import hxbit.Serializable;
import App;

@:enum
abstract DataType(String)
{
    var Null_ = 'null';
    var Int_ = 'Int';
    var Date_ = 'Date';
    var Float_ ='Float';
    var String_ = 'String';
}

class FieldFormat
{
    public static inline function display(v:String, dv:DataField):String
    {
        return switch(dv.field_type)
        {
            case 'Date':
                DateTools.format(Date.fromString(v), dv.format_display);

            default:
                null;
        }
        
    }
}
/*abstract FieldFormat(DataFormat)
{
    inline function new(d:DataFormat) {
        switch(d)
        {
            case Date_(value):
                this = cast value;//.getTime();
            case Float_(value), Int_(value):
                this = cast value;
            case String_(value):
                this = Date.fromString(value).getTime();
        }
    }

    @:from
    public static inline function fromDate(d:Date)
    {
        return new FieldFormat(Date_(d.getTime()));
    }

    @:from
    public static inline function fromFloat(f:Float)
    {
        return new FieldFormat(Float_(f));
    }

    @:from
    public static inline function fromInt(i:Int)
    {
        return new FieldFormat(Int_(i));
    }

    @:from
    public static inline function fromString(s:String)
    {
        return new FieldFormat(Date.fromString(s));
    }

    @:to
    public inline function toDate():Date
    {
        return switch (this)
        {
            case Date_(this):
                Date.fromTime(this);
            default:
              Date.fromTime(this);
        }
    }

    @:to
    public inline function toFloat():Float
    {
        return cast(this, Float);
    }

    @:to
    public inline function toString():String
    {
        return switch (this)
        {
            case Date_(this):
                trace(this);
                DateTools.format(Date.fromTime(this), App.config.dateFormat);
            //case Null_:
              //  null;
            default:
                Std.string(this);
        }
    }
}*/