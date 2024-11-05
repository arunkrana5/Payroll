using Common.App.Utility.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Salary
{
    public class SalaryCalculations
    {
        public long CompID { get; set; }
        public string? CompCode { get; set; }
        public string? CompName { get; set; }
        public string? CompType { get; set; }
        public string? StrucCode { get; set; }
        public string? Formula { get; set; }
        public Decimal Amount { get; set; }
        public string? Condition { get; set; }
        public Decimal CalculatedValue { get; set; }
        public List<TotalSalaryCal> TotalList { get; set; }
    }
    public class TotalSalaryCal
    {
        public Decimal Earning { get; set; }
        public Decimal Deduction { get; set; }
        public Decimal Contribution { get; set; }
        public Decimal CTC { get; set; }
        public Decimal NetPay { get; set; }
        public Decimal GrossSalary { get; set; }
    }
}
