module dslim.converters;

import std.conv;
version (unittest)
{
    import std.math;
    import std.stdio; // FIXME remove
    import std.exception : assertThrown;
}

import dslim.types;

@safe:

// FIXME this can be implemented as an overloaded __traits(compiles, ...) directly in ConverterRegistery
class PrimitiveConverter (T) : Converter!T
{
    string toString(T o)
    {
        return o.to!string;
    }

    T fromString(string arg)
    {
        try
        {
            return arg.to!T;
        }
        catch (ConvException e)
        {
            throw new SlimException(text(`Can't convert "`, arg, `" to `, T.stringof, "."));
        }
    }
}

auto converters = [new PrimitiveConverter!double(), new PrimitiveConverter!bool()];

unittest // simple fromString
{
    auto conv = new PrimitiveConverter!double();
    assert(approxEqual(42.42, conv.fromString("42.42")));
}

unittest // simple toString
{
    auto conv = new PrimitiveConverter!double();
    assert("42.42" == conv.toString(42.42));

}

unittest // nan
{
    auto conv = new PrimitiveConverter!float();
    assert(conv.fromString("nan").isNaN());
}

unittest // inf
{
    auto conv = new PrimitiveConverter!double();
    assert(0.0 > conv.fromString("-inf"));
    assert(conv.fromString("-inf").isInfinity());
    assert(0.0 < conv.fromString("inf"));
    assert(conv.fromString("inf").isInfinity());
}

unittest // invalid converersion throws
{
    assertThrown(new PrimitiveConverter!bool().fromString("not a bool"));
}

// if T inherits from Object -- handle null

