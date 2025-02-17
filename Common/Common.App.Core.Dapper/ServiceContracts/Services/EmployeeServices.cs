using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Employee;
using Common.App.Core.Dapper.Models.Salary;
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
        public Employee.Add GetEMP(GetResponse Modal)
        {

            Employee.Add result = new Employee.Add();
            try
            {
                using (IDbConnection DBContext = _dapper.CreateConnection())
                {
                    int commandTimeout = 0;
                    var param = new DynamicParameters();
                    param.Add("@EMPID", dbType: DbType.Int64, value: Modal.ID, direction: ParameterDirection.Input);
                    param.Add("@LoginID", dbType: DbType.Int64, value: Modal.LoginID, direction: ParameterDirection.Input);
                    DBContext.Open();
                    using (var reader = DBContext.QueryMultiple("spu_GetEmployee", param: param, commandType: CommandType.StoredProcedure, commandTimeout: commandTimeout))
                    {
                        result = reader.Read<Employee.Add>().FirstOrDefault();
                        if (result == null)
                        {
                            result = new Employee.Add();
                        }
                        if (!string.IsNullOrEmpty(result.Password))
                        {
                            result.Password = EncryptDecrypt.Decrypt(result.Password);
                        }
                        if (!reader.IsConsumed)
                        {
                            result.DepartmentList = reader.Read<DropDownlist>().ToList();
                        }
                        if (!reader.IsConsumed)
                        {
                            result.DesignationList = reader.Read<DropDownlist>().ToList();
                        }
                        if (!reader.IsConsumed)
                        {
                            result.RoleList = reader.Read<DropDownlist>().ToList();
                        }
                        if (!reader.IsConsumed)
                        {
                            result.CountryList = reader.Read<DropDownlist>().ToList();
                        }
                        if (!reader.IsConsumed)
                        {
                            result.RegionList = reader.Read<DropDownlist>().ToList();
                        }
                        if (!reader.IsConsumed)
                        {
                            result.StateList = reader.Read<DropDownlist>().ToList();
                        }
                        if (!reader.IsConsumed)
                        {
                            result.CityList = reader.Read<DropDownlist>().ToList();
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
        public PostResponse fnSetEMP(Employee.Add model)
        {
            PostResponse Result = new PostResponse();
            using (SqlConnection con = new SqlConnection(DBConnectionHelper.AppConnectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand command = new SqlCommand("spu_SetEMP", con))
                    {
                        SqlDataAdapter da = new SqlDataAdapter();
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@EMPID", SqlDbType.Int).Value = model.EMPID ?? 0;
                        command.Parameters.Add("@EMPName", SqlDbType.NVarChar).Value = model.EMPName ?? "";
                        command.Parameters.Add("@EMPCode", SqlDbType.NVarChar).Value = model.EMPCode ?? "";
                        command.Parameters.Add("@Phone", SqlDbType.VarChar, 50).Value = model.Phone ?? "";
                        command.Parameters.Add("@EmailID", SqlDbType.VarChar, 500).Value = model.EmailID ?? "";
                        command.Parameters.Add("@FatherName", SqlDbType.NVarChar).Value = model.FatherName ?? "";
                        command.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = model.DOB ?? "";
                        command.Parameters.Add("@Gender", SqlDbType.VarChar, 50).Value = model.Gender.ToString() ?? "";
                        command.Parameters.Add("@DesignID", SqlDbType.Int).Value = model.DesignID ?? 0;
                        command.Parameters.Add("@DepartID", SqlDbType.Int).Value = model.DepartID ?? 0;
                        command.Parameters.Add("@DealerID", SqlDbType.Int).Value = model.DealerID;

                        command.Parameters.Add("@CountryID", SqlDbType.Int).Value = model.CountryID ?? 0;
                        command.Parameters.Add("@RegionID", SqlDbType.Int).Value = model.RegionID ?? 0;
                        command.Parameters.Add("@StateID", SqlDbType.Int).Value = model.StateID ?? 0;
                        command.Parameters.Add("@CityID", SqlDbType.Int).Value = model.CityID ?? 0;
                        command.Parameters.Add("@Address1", SqlDbType.NVarChar).Value = model.Address1 ?? "";
                        command.Parameters.Add("@Address2", SqlDbType.NVarChar).Value = model.Address2 ?? "";
                        command.Parameters.Add("@Location", SqlDbType.NVarChar).Value = model.Location ?? "";
                        command.Parameters.Add("@Zipcode", SqlDbType.NVarChar).Value = model.Zipcode ?? "";


                        command.Parameters.Add("@BankName", SqlDbType.NVarChar).Value = model.BankName ?? "";
                        command.Parameters.Add("@AccountNo", SqlDbType.NVarChar).Value = model.AccountNo ?? "";
                        command.Parameters.Add("@IFSCCode", SqlDbType.NVarChar).Value = model.IFSCCode ?? "";
                        command.Parameters.Add("@BankBranch", SqlDbType.NVarChar).Value = model.BankBranch ?? "";


                        command.Parameters.Add("@DOJ", SqlDbType.VarChar).Value = model.DOJ ?? "";
                        command.Parameters.Add("@PAN", SqlDbType.VarChar, 50).Value = model.PAN ?? "";
                        command.Parameters.Add("@UAN", SqlDbType.VarChar, 50).Value = model.UAN ?? "";
                        command.Parameters.Add("@ESIC", SqlDbType.VarChar, 50).Value = model.ESIC ?? "";
                        command.Parameters.Add("@PaymentMode", SqlDbType.VarChar, 50).Value = model.PaymentMode ?? "";

                        command.Parameters.Add("@UserID", SqlDbType.VarChar).Value = model.UserID;
                        command.Parameters.Add("@Password", SqlDbType.VarChar).Value = EncryptDecrypt.Encrypt(model.Password);
                        command.Parameters.Add("@RoleID", SqlDbType.Int).Value = model.RoleID;
                        command.Parameters.Add("@AttachID", SqlDbType.Int).Value = model.AttachID;
                        command.Parameters.Add("@IsPJPAutoAssign", SqlDbType.Int).Value = model.IsPJPAutoAssign;
                        command.Parameters.Add("@IsActive", SqlDbType.Int).Value = 1;
                        command.Parameters.Add("@Priority", SqlDbType.Int).Value = model.Priority;
                        command.Parameters.Add("@createdby", SqlDbType.Int).Value = model.LoginID;
                        command.Parameters.Add("@IPAddress", SqlDbType.VarChar).Value = model.IPAddress;
                        command.CommandTimeout = 0;
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Result.ID = Convert.ToInt64(reader["RET_ID"]);
                                Result.StatusCode = Convert.ToInt32(reader["STATUS"]);
                                Result.SuccessMessage = reader["MESSAGE"].ToString();
                                if (Result.StatusCode > 0)
                                {
                                    Result.Status = true;
                                }
                            }
                        }

                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    con.Close();
                    Result.StatusCode = -1;
                    Result.SuccessMessage = ex.Message.ToString();
                }
            }
            return Result;
        }
    }
}
