using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    // SQL comparison operators
    public enum SqlOperator : byte
    {
        NONE = 0,           // X
        EQUAL = 1,          // = X
        NOTEQUAL = 2,       // <> X
        GREATER = 3,        // > X
        LESS = 4,           // < X
        GREATEREQUAL = 5,   // >= X
        LESSEQUAL = 6,      // < X
        BETWEEN = 7,        // BETWEEN X AND Y
        NOTBETWEEN = 8,     // NOT BETWEEN X AND Y
        IN = 9,             // IN (X)
        NOTIN = 10,         // NOT IN (X)
        LIKE = 11,          // LIKE 'X'       (Strings ONLY)
        NOTLIKE = 12,       // NOT LIKE 'X'   (Strings ONLY)
        CONTAINS = 13,      // LIKE '%X%'     (Strings ONLY)
        NOTCONTAINS = 14,   // NOT LIKE '%X%' (Strings ONLY)
        STARTSWITH = 15,    // LIKE 'X%'      (Strings ONLY)
        NOTSTARTSWITH = 16, // NOT LIKE 'X%'  (Strings ONLY)
        ENDSWITH = 17,      // LIKE '%X'      (Strings ONLY)
        NOTENDSWITH = 18,   // NOT LIKE '%X'  (Strings ONLY)
        BITNOT = 19,        // & X = 0        (Numbers ONLY, bit-wise operator, matches if no 1 bits from X are matched)
        BITAND = 20,        // & X = X        (Numbers ONLY, bit-wise operator, matches if all 1 bits from X are matched)
        BITOR = 21          // & X > 0        (Numbers ONLY, bit-wise operator, matches if any 1 bits from X are matched)
    }

    // classifies data type, so that user input can be validated appropriately
    public enum CriteriaType : byte
    {
        TEXT = 0,   // string
        NUMBER = 1, // various numeric types
        DATE = 2    // date types
    }

    /**
     * A simple object which stores a SQL criteria string and an associated data type for the value
     */
    public class SqlCriteria
    {
        public string column { get; set; }        // name of the DB column, including any alias prefix
        public CriteriaType type { get; set; }    // example: NUMBER
        public SqlOperator oper { get; set; }     // example: NotEqual
        public string value { get; set; }         // example: "dog"  (or "dog, cat")
        public long id { get; set; }              // example: 123

        // character that delimits multi-valued data
        private static char[] valueDelimiterChar = { ',' };

        // map abbreviated mnemonics to operators
        private static Dictionary<string, SqlOperator> operatorLookup = new Dictionary<string, SqlOperator>()
        {
            {"",     SqlOperator.NONE},
            {"EQ",   SqlOperator.EQUAL},
            {"EQU",   SqlOperator.EQUAL},         // alias for EQ
            {"NEQ",  SqlOperator.NOTEQUAL},
            {"GT",   SqlOperator.GREATER},
            {"NGT",  SqlOperator.LESSEQUAL},      // alias for LTE
            {"LT",   SqlOperator.LESS},
            {"NLT",  SqlOperator.GREATEREQUAL},   // alias for GTE
            {"GTE",  SqlOperator.GREATEREQUAL},
            {"NGTE", SqlOperator.LESS},           // alias for LT
            {"LTE",  SqlOperator.LESSEQUAL},
            {"NLTE", SqlOperator.GREATER},        // alias for GT
            {"BTW",  SqlOperator.BETWEEN},
            {"NBTW", SqlOperator.NOTBETWEEN},
            {"IN",   SqlOperator.IN},
            {"NIN",  SqlOperator.NOTIN},
            {"LIK",  SqlOperator.LIKE},
            {"NLIK", SqlOperator.NOTLIKE},
            {"CON",  SqlOperator.CONTAINS},
            {"NCON", SqlOperator.NOTCONTAINS},
            {"STA",  SqlOperator.STARTSWITH},
            {"NSTA", SqlOperator.NOTSTARTSWITH},
            {"END",  SqlOperator.ENDSWITH},
            {"NEND", SqlOperator.NOTENDSWITH},
            {"NOT",  SqlOperator.BITNOT},
            {"AND",  SqlOperator.BITAND},
            {"OR",   SqlOperator.BITOR}
        };

        // map operators to template SQL
        private static Dictionary<SqlOperator, string> sqlLookup = new Dictionary<SqlOperator, string>()
        {
            {SqlOperator.NONE,          "= {0}"},                   // default to equality if no specific operator is supplied
            {SqlOperator.EQUAL,         "= {0}"}, 
            {SqlOperator.NOTEQUAL,      "<> {0}"},
            {SqlOperator.GREATER,       "> {0}"},
            {SqlOperator.LESS,          "< {0}"},
            {SqlOperator.GREATEREQUAL,  ">= {0}"},
            {SqlOperator.LESSEQUAL,     "<= {0}"},
            {SqlOperator.BETWEEN,       "BETWEEN {0} AND {1}"},     // supports multiple values (2)
            {SqlOperator.NOTBETWEEN,    "NOT BETWEEN {0} AND {1}"}, // supports multiple values (2)
            {SqlOperator.IN,            "IN ({0})"},                // supports multiple values (1-n)
            {SqlOperator.NOTIN,         "NOT IN ({0})"},            // supports multiple values (1-n)
            {SqlOperator.LIKE,          "LIKE {0}"},
            {SqlOperator.NOTLIKE,       "NOT LIKE {0}"},
            {SqlOperator.CONTAINS,      "LIKE {0}"},                // "%" char will be inserted in the generation logic
            {SqlOperator.NOTCONTAINS,   "NOT LIKE {0}"},            // "%" char will be inserted in the generation logic
            {SqlOperator.STARTSWITH,    "LIKE {0}"},                // "%" char will be inserted in the generation logic
            {SqlOperator.NOTSTARTSWITH, "NOT LIKE {0}"},            // "%" char will be inserted in the generation logic
            {SqlOperator.ENDSWITH,      "LIKE {0}"},                // "%" char will be inserted in the generation logic
            {SqlOperator.NOTENDSWITH,   "NOT LIKE {0}"},            // "%" char will be inserted in the generation logic
            {SqlOperator.BITNOT,        "& {0} = 0"},               // 
            {SqlOperator.BITAND,        "& {0} = {0}"},             // 
            {SqlOperator.BITOR,         "& {0} > 0"}                // 
        };

        // Ctors
        public SqlCriteria()
        {
        }

        public SqlCriteria(string column, CriteriaType type, SqlOperator oper)
        {
            this.column = column;
            this.type = type;
            this.oper = oper;
        }

        public SqlCriteria(string column, CriteriaType type, SqlOperator oper, string value)
        {
            this.column = column;
            this.type = type;
            this.oper = oper;
            this.value = value;
        }

        public SqlCriteria(string column, CriteriaType type, SqlOperator oper, long id)
        {
            this.column = column;
            this.type = type;
            this.oper = oper;
            this.id = id;
        }

        // copy ctor
        public SqlCriteria (SqlCriteria source)
            : this(source.column, source.type, source.oper, source.value)
        {
        }


        // Return the operator for a given mnemonic string
        // Example:
        //   getOperator('NE') returns SqlOperator.NOTEQUAL
        public static SqlOperator getOperator(string s)
        {
            if (operatorLookup.ContainsKey(s))
            {
                return operatorLookup[s];
            }
            else
            {
                throw new ArgumentException("Invalid criteria operator: " + s);
            }
        }

        // Returns the field or property name, without the trailing operator mnemonic (if found)
        // Example:
        //  getColumnPart("MyField:GT") returns "MyField"
        public static string getColumnPart(string s)
        {
            if (s.IndexOf(":") > 0) {
                return s.Substring(0, s.IndexOf(":"));
            }
            else {
                return s;
            }
        }

        // Returns the operator mnemonic (if found), without the preceding column name
        // Example:
        //  getOperatorPart("MyField:GT") returns "GT"
        public static string getOperatorPart(string s)
        {
            if (s.IndexOf(":") > 0)
            {
                return s.Substring(s.IndexOf(":") + 1).ToUpper();
            }
            else
            {
                return "";
            }
        }

        public SqlCriteria clone()
        {
            return new SqlCriteria(this);
        }
        
        // Returns an array of escaped and parsed data values
        // Determines whether the value should be split based on embedded commas (and the operator type in question)
        public string[] getSqlValues()
        {
            // check for proper number of supplied data values (for the selected operator)
            List<string> values = new List<string>();
            switch (oper)
            {
                case SqlOperator.NONE:
                case SqlOperator.EQUAL:
                case SqlOperator.NOTEQUAL:
                case SqlOperator.GREATER:
                case SqlOperator.LESS:
                case SqlOperator.GREATEREQUAL:
                case SqlOperator.LESSEQUAL:
                case SqlOperator.LIKE:
                case SqlOperator.NOTLIKE:
                case SqlOperator.CONTAINS:
                case SqlOperator.NOTCONTAINS:
                case SqlOperator.STARTSWITH:
                case SqlOperator.NOTSTARTSWITH:
                case SqlOperator.ENDSWITH:
                case SqlOperator.NOTENDSWITH:
                case SqlOperator.BITNOT:
                case SqlOperator.BITAND:
                case SqlOperator.BITOR:
                    values.Add(value);
                    break;

                case SqlOperator.BETWEEN:
                case SqlOperator.NOTBETWEEN:
                    values.AddRange(value.Split(valueDelimiterChar));
                    if (values.Count != 2)
                        throw new ArgumentException("Invalid number of data values for operator: " + oper + ". Found " + values.Count + ", expected 2.");
                    break;

                case SqlOperator.IN:
                case SqlOperator.NOTIN:
                    values.AddRange(value.Split(valueDelimiterChar));
                    if (values.Count < 1)
                        throw new ArgumentException("Invalid number of data values for operator: " + oper + ". Found " + values.Count + ", expected 1 or more.");
                    break;

                default:
                    throw new ArgumentException("Invalid criteria operator: " + oper + ".");
                    break;
            }

            // validate/parse/escape data value(s) (based on the column data type)
            switch (type)
            {
                case CriteriaType.TEXT:  // all values are valid, so long as we escape embedded quotes
                    for (int i = 0; i < values.Count; i++)
                    {
                        values[i] = values[i].Replace("'", "''");  // escape all embedded quotes
                    }
                    break;

                case CriteriaType.NUMBER:  // need to parse the value string to see if it can be converted to a number
                    float num;
                    foreach (string v in values)
                    {
                        if (v == "")
                            throw new ArgumentException("Missing criteria data value.");
                        if (!Single.TryParse(v, NumberStyles.Number, CultureInfo.CurrentCulture, out num))
                            throw new ArgumentException("Invalid data value: " + v + ". Could not be interpretted as a number.");
                    }
                    break;

                case CriteriaType.DATE:  // need to parse the value string to see if it can be converted to a date
                    DateTime date;
                    foreach (string v in values)
                    {
                        if (v == "")
                            throw new ArgumentException("Missing criteria data value.");
                        if (!DateTime.TryParseExact(v, "D", CultureInfo.CurrentCulture, DateTimeStyles.None, out date))
                            throw new ArgumentException("Invalid data value: " + v + ". Could not be interpretted as a date.");
                    }
                    break;

                default:
                    throw new ArgumentException("Invalid criteria type: " + type + ".");
                    break;
            }
            
            // prefix/suffix value(s) with "%" if using a LIKE-based operator and data is of type TEXT
            if (type == CriteriaType.TEXT)
            {
                switch (oper)
                {
                    case SqlOperator.NONE:
                    case SqlOperator.EQUAL:
                    case SqlOperator.NOTEQUAL:
                    case SqlOperator.GREATER:
                    case SqlOperator.LESS:
                    case SqlOperator.GREATEREQUAL:
                    case SqlOperator.LESSEQUAL:
                    case SqlOperator.BETWEEN:
                    case SqlOperator.NOTBETWEEN:
                    case SqlOperator.IN:
                    case SqlOperator.NOTIN:
                    case SqlOperator.LIKE:
                    case SqlOperator.NOTLIKE:
                        break;
                        
                    case SqlOperator.CONTAINS:
                    case SqlOperator.NOTCONTAINS:
                        for (int i = 0; i < values.Count; i++)
                        {
                            values[i] = "%" + values[i] + "%";
                        }
                        break;

                    case SqlOperator.STARTSWITH:
                    case SqlOperator.NOTSTARTSWITH:
                        for (int i = 0; i < values.Count; i++)
                        {
                            values[i] = values[i] + "%";
                        }
                        break;

                    case SqlOperator.ENDSWITH:
                    case SqlOperator.NOTENDSWITH:
                        for (int i = 0; i < values.Count; i++)
                        {
                            values[i] = "%" + values[i];
                        }
                        break;

                    default:
                        throw new ArgumentException("Invalid criteria operator: " + oper + ".");
                        break;
                }
            }

            // surround value(s) with quotes (if type = text)
            if (type == CriteriaType.TEXT)
            {
                for (int i = 0; i < values.Count; i++)
                {
                    values[i] = "'" + values[i] + "'";
                }
            }

            // Re-join all of the values as a comma-delimited list for the IN and NOTIN operators (ONLY)
            // doing this after the above quoting prevents sql injection within mult-valued lists of strings
            if ((oper == SqlOperator.IN) | (oper == SqlOperator.NOTIN))
            {
                values[0] = string.Join(", ", values);
                values.RemoveRange(1, values.Count - 1);
            }

            return values.ToArray();
        }


        // Returns a generated SQL fragment for the criteria
        public string getSql(bool includeColumnFlag = true)
        {
            if (includeColumnFlag)
            {
                return column + " " + string.Format(sqlLookup[oper], getSqlValues());
            }
            else
            {
                return string.Format(sqlLookup[oper], getSqlValues());
            }
        }

    }

}