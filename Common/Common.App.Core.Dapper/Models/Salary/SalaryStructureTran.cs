using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Salary
{
    public class SalaryStructureTran
    {
        public long StructTranID { get; set; }
        public long StructID { get; set; }
        public string? Structure { get; set; }
        public long CompID { get; set; }
        public string? Component { get; set; }
        public decimal Amount { get; set; }
        public string? Condition { get; set; }
        public string? Formula { get; set; }
        public string? Doctype { get; set; }
        public int LoginID { get; set; }
    }
}
