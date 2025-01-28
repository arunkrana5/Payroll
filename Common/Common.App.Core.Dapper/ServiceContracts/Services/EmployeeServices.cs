using Common.App.Core.Dapper.Models.Employee;
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

        public List<EmployeeMaster> GetEmployeeMasterList(EmployeeMaster Modal)
        {
            List<EmployeeMaster> result = new List<EmployeeMaster>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetEmployeeMasterList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<EmployeeMaster>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return result;
        }

        public EmployeeMaster GetEmployeeMaster(EmployeeMaster Modal)
        {
            EmployeeMaster result = new EmployeeMaster();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@EMPID", dbType: DbType.Int64, value: Modal.EMPID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetEmployeeMaster", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<EmployeeMaster>().FirstOrDefault();
                        if (result == null)
                        {
                            result = new EmployeeMaster();
                        }
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
