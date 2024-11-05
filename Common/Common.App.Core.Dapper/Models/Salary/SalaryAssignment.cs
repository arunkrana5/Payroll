using Common.App.Utility.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Salary
{
    public class SalaryAssignment
    {
        public long SAID { get; set; }
        public long SalaryStructID { get; set; }
        public string? SalaryStruct { get; set; }
        public long EMPID { get; set; }
        public string? Employee { get; set; }
        public DateTime StartDate { get; set; }
        public Decimal GrossSalary { get; set; }
        public long LoginID { get; set; }
        public List<SalaryCalculations>? CalculationList { get; set; }
        public List<TotalSalaryCal>? TotalList { get; set; }
    }
}
