using Common.App.Utility.Helpers;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Configuration
{
    public static class ConfigureDB
    {
        public static void ConfigureDBConnection(IConfiguration configuration)
        {
            DBConnectionHelper.AppConnectionString = configuration.GetConnectionString("AppConnection");
        }
    }
}
