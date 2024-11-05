using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Masters
{
    public class Masters_Region : BaseEntity
    {
        public long ID { get; set; }

        [Required(ErrorMessage = "Country Code Can't be Blank")]
        public string? RegionCode { get; set; }
        [Required(ErrorMessage = "Country Name Can't be Blank")]
        public string? RegionName { get; set; }
        [Required(ErrorMessage = "Can't be Blank")]
        public long GroupID { get; set; }
        public int? Priority { get; set; }
        public string? Description { get; set; }
    }
}
