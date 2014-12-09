using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Defines the results of a query where T is the type of records being returned
     */
    public class QueryResults<T>
    {
        public T[] results { get; set; }    // result rows for the query
        public int startRow { get; set; }   // the starting record number to return (support for pagination)
        public int totalRows { get; set; }  // number of total rows matching query (w/o pagination resriction)

        // ctors
        public QueryResults()
        {
        }

        public QueryResults(T[] results, int startRow, int totalRows)
        {
            this.results = results;
            this.startRow = startRow;
            this.totalRows = totalRows;
        }
    }
}