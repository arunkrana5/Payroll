using Common.App.Core.Dapper.Models.Masters;
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
    public class MastersServices:IMastersServices
    {
        private readonly DapperContext _dapper;
        public MastersServices(DapperContext dapper)
        {
            _dapper = dapper;
        }
        public List<MastersCountry> GetCountryList(MastersCountry Modal)
        {
            List<MastersCountry> result = new List<MastersCountry>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    //param.Add("@CompID", dbType: DbType.Int64, value: Modal.CompID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetCountryList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<MastersCountry>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return result;
        }

        public List<MastersState> GetStateList(MastersState Modal)
        {
            List<MastersState> result = new List<MastersState>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    //param.Add("@CompID", dbType: DbType.Int64, value: Modal.CompID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetStateList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<MastersState>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return result;
        }

        public List<MastersRegion> GetRegionList(MastersRegion Modal)
        {
            List<MastersRegion> result = new List<MastersRegion>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    //param.Add("@CompID", dbType: DbType.Int64, value: Modal.CompID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetRegionList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<MastersRegion>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return result;
        }

        public List<MastersCity> GetCityList(MastersCity Modal)
        {
            List<MastersCity> result = new List<MastersCity>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    //param.Add("@CompID", dbType: DbType.Int64, value: Modal.CompID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetCityList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<MastersCity>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {

            }
            return result;
        }

        public List<MastersArea> GetAreaList(MastersArea Modal)
        {
            List<MastersArea> result = new List<MastersArea>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    //param.Add("@CompID", dbType: DbType.Int64, value: Modal.CompID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetAreaList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<MastersArea>().ToList();
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
