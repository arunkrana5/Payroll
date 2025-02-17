using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Dealer;
using Common.App.Core.Dapper.Models.Employee;
using Common.App.Utility.Enum;
using Common.App.Utility.Helpers;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts.Services
{
    public class DealerServices:IDealerServices
    {
        private readonly DapperContext _dapper;
        public DealerServices(DapperContext context)
        {
            _dapper = context;
        }
        public List<Dealer.List> GetDealerList(JqueryDatatableParam modal)
        {
            List<Dealer.List> result = new List<Dealer.List>();
            try
            {
                using (IDbConnection DbContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);

                    DbContext.Open();
                    using (var reader = DbContext.QueryMultiple("spu_GetDealerList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<Dealer.List>().ToList();
                    }

                    DbContext.Close();
                }
            }
            catch (Exception ex) 
            { 
            
            }
            return result;
        }
        public Dealer.Add GetDealer(GetResponse Modal)
        {

            Dealer.Add result = new Dealer.Add();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@DealerID", dbType: DbType.Int64, value: Modal.ID, direction: ParameterDirection.Input);
                    param.Add("@LoginID", dbType: DbType.Int64, value: Modal.LoginID, direction: ParameterDirection.Input);
                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetDealer", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<Dealer.Add>().FirstOrDefault();
                        if (result == null)
                        {
                            result = new Dealer.Add();
                        }
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {
                //Common_SPU.LogError(ex.Message.ToString(), ex.ToString(), "GetEMP", "spu_GetEmployeeList", "DataModal", Modal.LoginID, Modal.IPAddress);
            }
            return result;
        }
    }
}
