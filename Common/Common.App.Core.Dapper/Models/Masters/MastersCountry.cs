using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersCountry
    {
        public long ID { get; set; }
         
        public string? CountryCode { get; set; } 
        public string? CountryName { get; set; } 
        public long GroupID { get; set; }
        public int Priority { get; set; }
        public string? Description { get; set; }
    }
}
