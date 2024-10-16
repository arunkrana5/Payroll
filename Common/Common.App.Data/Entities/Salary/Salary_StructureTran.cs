using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Salary
{
    public class Salary_StructureTran:BaseEntity
    {
        [Key]
        public long StructTranID { get; set; }
        public long StructID { get; set; }
        public long CompID { get; set; }
        public decimal Amount { get; set; }
        public string Condition { get; set; }
        public string Formula { get; set; }
    }
}
