using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A simple object which stores a SQL criteria string and an associated data type for the value
     */
    public class SqlCriteria
    {
        public string clause { get; set; }        // example: "a.mycolumn = {0}"
        public CriteriaType type { get; set; }    // example: NUMBER
        public long id { get; set; }              // example: 123

        //ctors
        public SqlCriteria()
        {
        }
    
        public SqlCriteria(string clause, CriteriaType type)
        {
            this.clause = clause;
            this.type = type;
        }

        public SqlCriteria(string clause, CriteriaType type, long id)
        {
            this.clause = clause;
            this.type = type;
            this.id = id;
        }
    }

    public enum CriteriaType : byte
    {
        TEXT = 0,    // string (default = '')
        NUMBER = 1,  // various numeric types (default = 0)
        DATE = 2     // date types (default = getdate())
    }
}