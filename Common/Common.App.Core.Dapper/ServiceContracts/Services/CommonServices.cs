using Common.App.Core.Dapper.Helpers;
using Dapper;
using System.Data;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Common.App.Core.Dapper.ServiceContracts.Services
{
    public class CommonServices: ICommonServices
    {
        private readonly DapperContext _dapper;
        public CommonServices(DapperContext dapper)
        {
            _dapper = dapper;
        }
        public List<SelectListItem> GetDropDown(DropdownRequest Modal)
        {
            List<SelectListItem> result = new List<SelectListItem>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@DocType", dbType: DbType.String, value: Modal.Doctype, direction: ParameterDirection.Input);
                    param.Add("@ID", dbType: DbType.Int64, value: Modal.ID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetDropdownList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<SelectListItem>().ToList();
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
