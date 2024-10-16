using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Utility.Helpers
{
    public static class DBConnectionHelper
    {
        private static string _appConnectionString = string.Empty;

        public static string AppConnectionString
        {
            get { return _appConnectionString; }
            set { _appConnectionString = value; }
        }
    }
}
