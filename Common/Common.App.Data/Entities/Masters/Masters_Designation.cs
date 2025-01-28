using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Masters
{
    public class Masters_Designation : BaseEntity
    {
        public long ID { get; set; }

        [Required(ErrorMessage = "Designation Code Can't be Blank")]
        public string? DesignCode { get; set; }
        [Required(ErrorMessage = "Designation Name Can't be Blank")]
        public string? DesignName { get; set; }
    }
}
