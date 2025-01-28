using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Masters
{
    public class Masters_Company : BaseEntity
    {
        public long ID { get; set; }

        [Required(ErrorMessage = "Company Code Can't be Blank")]
        public string? CompanyCode { get; set; }
        [Required(ErrorMessage = "Company Name Can't be Blank")]
        public string? CompanyName { get; set; }
        [Required(ErrorMessage = "Can't be Blank")]
        public long GroupID { get; set; }
        public int? Priority { get; set; }
        public string? Description { get; set; }
    }
}
