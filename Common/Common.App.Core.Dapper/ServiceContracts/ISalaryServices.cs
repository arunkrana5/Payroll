using Common.App.Core.Dapper.Models.Salary;
using Common.App.Utility.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts
{
    public interface ISalaryServices
    {
        List<SalaryComponents> GetSalaryComponentsList(SalaryComponents Modal);
        List<SalaryStructureTran> GetSalaryStructureTran(SalaryStructureTran Modal);
        List<SalaryStructures> GetSalaryStructuresList(SalaryStructures Modal);
        SalaryAssignment GetSalaryCalculations(SalaryAssignment Modal);
        List<SalaryAssignment> GetSalaryAssignmentList(SalaryAssignment Modal);
    }
}
