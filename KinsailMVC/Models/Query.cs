using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Defines a query for information from the server
     */
    class Query<T>
    {
        public T criteria { get; set; }     // search criteria for the query
        public int startRow { get; set; }   // the starting record number to return (support for pagination)
        public int rowCount { get; set; }   // number of total rows to return

        public Query()
        {
            this.criteria = default(T);
            this.startRow = 0;
            this.rowCount = 25;
        }

        public Query(T criteria)
        {
            this.criteria = criteria;
            this.startRow = 0;
            this.rowCount = 25;
        }
    }
}