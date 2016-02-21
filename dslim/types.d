module dslim.types;

import std.variant : Algebraic;
import std.array : Appender;
import std.conv : text;

@safe:

interface Converter (T)
{
    string toString(T o);
    T fromString(string arg);
}

class SlimException : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null) pure nothrow
    {
        super(msg, file, line, next);
    }
}

class SyntaxException : SlimException
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null) pure nothrow
    {
        super(msg, file, line, next);
    }
}

enum MINIMUM_NUMBER_LENGTH = 6;

enum SlimVersion : string
{
    VERSION = "0.4",
    BYEMESSAGE = "bye",
    SLIM_HEADER = "Slim -- V",
    LENGTH_FORMAT = "%0" ~ MINIMUM_NUMBER_LENGTH.text() ~ "d:" // "%06d:"
}

class TurtleStringList
{
    private Appender!(TurtleString[]) list;
    alias list this;

    override string toString() @system
    {
        return list.data.text();
    }
}
alias TurtleString = Algebraic!(string, TurtleStringList);
