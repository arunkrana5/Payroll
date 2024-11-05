using Common.App.Core.Dapper.Models.Salary;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts.Services
{
    public class EmployeeServices : IEmployeeServices
    {
        private readonly DapperContext _dapper;
        public EmployeeServices(DapperContext dapper)
        {
            _dapper = dapper;
        }

        public List<SalaryComponents> GetSalaryComponentsList(SalaryComponents Modal)
        {
            List<SalaryComponents> result = new List<SalaryComponents>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@CompID", dbType: DbType.Int64, value: Modal.CompID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetSalaryComponentList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<SalaryComponents>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return result;
        }
    }
}
