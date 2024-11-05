using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Masters
{
    public class Masters_Area : BaseEntity
    {
        public long ID { get; set; }

        [Required(ErrorMessage = "Area Code Can't be Blank")]
        public string? AreaCode { get; set; }
        [Required(ErrorMessage = "Area Name Can't be Blank")]
        public string? AreaName { get; set; }
        [Required(ErrorMessage = "Can't be Blank")]
        public int GroupID { get; set; }
        public int? Priority { get; set; }
        public string? Description { get; set; }
    }
}
