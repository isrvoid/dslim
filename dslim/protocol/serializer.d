module dslim.protocol.serializer;

import std.array : Appender;
import std.format : format;

import dslim.types;

@safe:

public class SlimSerializer
{
    private Appender!string result;
    private Object[] list;

    this(Object[] list) pure nothrow
    {
        this.list = list;
    }

    static string serialize(Object[] list) pure nothrow
    {
        return new SlimSerializer(list).serialize();
    }

    string serialize() pure nothrow
    {
        result.put('[');
        foreach (o; list)
        {
            auto s = "hi";
        }
        result.put(']');
        return result.data;
    }

    private:
    string marshalObjectToString(Object o) @trusted
    {
        if (o is null)
            return "null";
        // FIXME

        return o.toString();
    }

    void appendString(string s)
    {
        result.put(s);
        result.put(':');
    }

    void appendLength(size_t size)
    {
        result.put(format(SlimVersion.LENGTH_FORMAT, size));
    }
}
