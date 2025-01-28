using Common.App.Core.Dapper.Models.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts
{ 
    public interface IEmployeeServices
    {
        List<EmployeeMaster> GetEmployeeMasterList(EmployeeMaster Modal);
        EmployeeMaster GetEmployeeMaster(EmployeeMaster Modal);
    }
}
