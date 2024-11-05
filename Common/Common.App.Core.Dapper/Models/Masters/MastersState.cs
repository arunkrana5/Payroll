using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersState
    {
        public long ID { get; set; }
         
        public string? Region { get; set; } 
        public string? StateCode { get; set; } 
        public string? StateName { get; set; } 
        public long GroupID { get; set; }
        public int Priority { get; set; }
        public string? Description { get; set; }
    }
}
