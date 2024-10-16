using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Salary
{
    public class Salary_Structure:BaseEntity
    {
        [Key]
        public long StructID { get; set; }
        public string StructCode { get; set; }
        public string Description { get; set; }
    }
}
