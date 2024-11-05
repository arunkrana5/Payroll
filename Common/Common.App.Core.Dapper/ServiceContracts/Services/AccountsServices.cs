using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.App.Core.Dapper.Models.App;
using Common.App.Core.Dapper.Configuration;
using Common.App.Utility.Helpers;
using System.Reflection;

namespace Common.App.Core.Dapper.ServiceContracts.Services
{
    public class AccountsServices:IAccountsServices
    {
        public AppUsers GetLogin(AppUsers model)
        {

            try
            {
                using (IDbConnection dbContext = new SqlConnection(DBConnectionHelper.AppConnectionString))
                {
                    var param = new DynamicParameters(new
                    {
                        UserID = model.UserID,
                        Password = model.Password,
                        EntrySource = DataConstant.EntrySource
                    });
                    return dbContext.QueryFirstOrDefault<AppUsers>("spu_GetLogin",param, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {

            }
            return null;
        }
    }
}
