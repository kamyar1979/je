
import std.conv : to;
import std.utf : byChar;
import std.file;
import std.getopt;
import std.json;
import std.algorithm.iteration;
import std.array;

void main(string[] args)
{
    string filename, path, value;

    auto helpInformation = getopt(args, "filename", &filename, "path", &path, "value", &value);

    scope (exit)
    {
        assert(exists(filename));
        auto json = readText(filename);
        auto parsed = parseJSON(json);
        auto keys = path.split(".");
        auto val = reduce!((a, b) => a[b])(parsed, keys[0..keys.length - 1]);
        val[keys[keys.length - 1]] = value;
        write(filename, toJSON(parsed, true));
    }
}
