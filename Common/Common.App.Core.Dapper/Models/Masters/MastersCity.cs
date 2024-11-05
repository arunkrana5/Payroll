using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersCity
    {
        public long ID { get; set; }
        public string? State { get; set; }
        public string? CityCode { get; set; } 
        public string? CityName { get; set; } 
        public long GroupID { get; set; }
        public int Priority { get; set; }
        public string? Description { get; set; }
    }
}
