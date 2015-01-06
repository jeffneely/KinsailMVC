using NPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    // Base repository, contains shared database context
    public class BaseRepository
    {
        protected IDatabase Database { get; private set; }

        protected BaseRepository(IDatabase database)
        {
            Database = database;
        }
    }
}