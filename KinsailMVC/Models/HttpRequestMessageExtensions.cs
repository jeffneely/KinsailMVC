using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;

namespace System.Web.Http
{

    // Extends the HttpRequestMessage collection
    //   see http://weblog.west-wind.com/posts/2013/Apr/15/WebAPI-Getting-Headers-QueryString-and-Cookie-Values
    public static class HttpRequestMessageExtensions
    {
        // Returns a dictionary of QueryStrings that's easier to work with 
        //   than GetQueryNameValuePairs KevValuePairs collection.
        // If you need a few single values, use GetQueryString (below) instead.
        public static Dictionary<string, string> GetQueryStrings(this HttpRequestMessage request)
        {
            return request.GetQueryNameValuePairs()
                          .ToDictionary(kv => kv.Key.ToLower(), kv => kv.Value, StringComparer.OrdinalIgnoreCase);
        }

        // Returns an individual querystring value
        public static string GetQueryString(this HttpRequestMessage request, string key)
        {
            var queryStrings = request.GetQueryNameValuePairs();
            if (queryStrings == null)
                return null;

            var match = queryStrings.FirstOrDefault(kv => string.Compare(kv.Key, key, true) == 0);
            if (string.IsNullOrEmpty(match.Value))
                return null;

            return match.Value;
        }

        // Returns an individual HTTP Header value
        public static string GetHeader(this HttpRequestMessage request, string key)
        {
            IEnumerable<string> keys = null;
            if (!request.Headers.TryGetValues(key, out keys))
                return null;

            return keys.First();
        }

        // Retrieves an individual cookie from the cookies collection
        public static string GetCookie(this HttpRequestMessage request, string cookieName)
        {
            CookieHeaderValue cookie = request.Headers.GetCookies(cookieName).FirstOrDefault();
            if (cookie != null)
                return cookie[cookieName].Value;

            return null;
        }
    }
}