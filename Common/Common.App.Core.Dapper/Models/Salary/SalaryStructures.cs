using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Salary
{
    public class SalaryStructures
    {
        public long StructID { get; set; }
        public int LoginID { get; set; }
        public string StructCode { get; set; }
        public string Description { get; set; }
    }
}
