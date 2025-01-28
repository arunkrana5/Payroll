using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Masters
{
    public class Masters_Department : BaseEntity
    {
        public long ID { get; set; }

        [Required(ErrorMessage = "Department Code Can't be Blank")]
        public string? DeptCode { get; set; }
        [Required(ErrorMessage = "Department Name Can't be Blank")]
        public string? DeptName { get; set; }
    }
}
