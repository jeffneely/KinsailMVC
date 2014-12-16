using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace KinsailMVC.Models
{
    public static class Utility
    {
        // Dumps an object graph to an HTML-formatted string using reflection
        public static string Dump(object obj, string name = "", int depth = 3)
        {
            try
            {
                var leafprefix = (string.IsNullOrWhiteSpace(name) ? name : name + " = ");
                if (null == obj) return leafprefix + "null";

                var t = obj.GetType();

                // handle simple value types
                if (depth-- < 1 || t == typeof(string) || t.IsValueType)
                    return leafprefix + obj;
                else
                    leafprefix = "<b>" + leafprefix + "</b>";

                var sb = new StringBuilder();

                // traverse enumerable types
                var enumerable = obj as IEnumerable;
                if (enumerable != null)
                {
                    name = (name ?? "").TrimEnd('[', ']') + '[';
                    var elements = enumerable.Cast<object>().Select(e => Dump(e, "", depth)).ToList();
                    var arrayInOneLine = elements.Count + "] = {" + string.Join(",", elements) + '}';
                    if (!arrayInOneLine.Contains("<br/>")) // Single line?
                        return name + arrayInOneLine;
                    var i = 0;
                    foreach (var element in elements)
                    {
                        var lineheader = name + i++ + ']';
                        sb.Append(lineheader).AppendLine(element.Replace("<br/>", "<br/>" + lineheader) + "<br/>");
                    }
                    return sb.ToString();
                }

                // traverse fields
                foreach (var f in t.GetFields())
                    sb.AppendLine(Dump(f.GetValue(obj), name + '.' + f.Name, depth) + "<br/>");

                // traverse properties
                foreach (var p in t.GetProperties())
                    sb.AppendLine(Dump(p.GetValue(obj, null), name + '.' + p.Name, depth) + "<br/>");

                if (sb.Length == 0) return leafprefix + obj;
                return sb.ToString().TrimEnd();
            }
            catch
            {
                return name + "???";
            }
        }

        // parse query string into a dictionary
        public static IDictionary<string, string> GetQueryParameters(string queryString)
        {
            var d = new Dictionary<string, string>();
            foreach (var item in queryString.TrimStart('?').Split(new[] { '&' }, StringSplitOptions.RemoveEmptyEntries))
            {
                var split = item.Split('=');
                d.Add(split[0], split[1]);
            }
            return d;
        }

    }
}