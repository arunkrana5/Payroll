using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.App.Core.Dapper.Models.Salary;
using Common.App.Utility.Enum;
using System.Collections;
using System.Reflection;

namespace Common.App.Core.Dapper.ServiceContracts.Services
{
    public class SalaryServices: ISalaryServices
    {
        private readonly DapperContext _dapper;
        public SalaryServices(DapperContext dapper)
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

        public List<SalaryStructureTran> GetSalaryStructureTran(SalaryStructureTran Modal)
        {

            List<SalaryStructureTran> result = new List<SalaryStructureTran>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@StructTranID", dbType: DbType.Int64, value: Modal.StructTranID, direction: ParameterDirection.Input);
                    param.Add("@StructID", dbType: DbType.Int64, value: Modal.StructID, direction: ParameterDirection.Input);
                    param.Add("@DocType", dbType: DbType.String, value: Modal.Doctype, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetSalaryStructureTranList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<SalaryStructureTran>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {
                
            }
            return result;
        }
        public List<SalaryStructures> GetSalaryStructuresList(SalaryStructures Modal)
        {

            List<SalaryStructures> result = new List<SalaryStructures>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@StructID", dbType: DbType.Int64, value: Modal.StructID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetSalaryStructuresList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<SalaryStructures>().ToList();
                    }

                    DBContext.Close();
                }
            }
            catch (Exception ex)
            {
                
            }
            return result;
        }
        public SalaryAssignment GetSalaryCalculations(SalaryAssignment Modal)
        {

            SalaryAssignment result = new SalaryAssignment();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    //param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@SalaryStID", dbType: DbType.Int64, value: Modal.SalaryStructID, direction: ParameterDirection.Input);
                    param.Add("@Salary", dbType: DbType.Decimal, value: Modal.GrossSalary, direction: ParameterDirection.Input);
                    param.Add("@EMPID", dbType: DbType.Int64, value: Modal.EMPID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetSalaryAssignment", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result.CalculationList = reader.Read<SalaryCalculations>().ToList();
                        if (!reader.IsConsumed)
                        {
                            result.TotalList = reader.Read<TotalSalaryCal>().ToList();
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
        public List<SalaryAssignment> GetSalaryAssignmentList(SalaryAssignment Modal)
        {

            List<SalaryAssignment> result = new List<SalaryAssignment>();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@LoginID", dbType: DbType.Int64, value: 1, direction: ParameterDirection.Input);
                    param.Add("@SAID", dbType: DbType.Int64, value: Modal.SAID, direction: ParameterDirection.Input);

                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetSalaryAssignmentList", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<SalaryAssignment>().ToList();
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
