using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Salary
{
    public class Salary_Component:BaseEntity
    {
        [Key]
        public long CompID { get; set; }
        [Required(ErrorMessage="Please Enter Components Code")]
        public string CompCode { get; set; }
        public string CompName { get; set; }
        public string CompType { get; set; }
        public string Description { get; set; }
        public bool IsDepend_PD { get; set; }
        public bool IsTaxApplicable { get; set; }
        public bool IsStatisticalComp { get; set; }
        public bool IsRemoveZero { get; set; }
    }

}
