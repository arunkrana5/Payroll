using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Masters
{
    public class Masters_City : BaseEntity
    {
        public long ID { get; set; }

        [Required(ErrorMessage = "City Code Can't be Blank")]
        public string? CityCode { get; set; }
        [Required(ErrorMessage = "City Name Can't be Blank")]
        public string? CityName { get; set; }
        [Required(ErrorMessage = "Can't be Blank")]
        public int GroupID { get; set; }
        public int? Priority { get; set; }
        public string? Description { get; set; }
    }
}
