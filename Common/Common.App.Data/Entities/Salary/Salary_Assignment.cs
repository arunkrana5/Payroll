using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Salary
{
    public class Salary_Assignment:BaseEntity
    {
        [Key]
        public long SAID { get; set; }
        public long SalaryStructID { get; set; }
        public long EMPID { get; set; }
        public DateTime StartDate { get; set; }
        public Decimal GrossSalary { get; set; }
    }
    public class Salary_AssignmentBreakUp : BaseEntity
    {
        [Key]
        public long SABreakID { get; set; }
        public long SAID { get; set; }
        public long CompID { get; set; }
        public Decimal BreakUpAmount { get; set; }
    }
}
