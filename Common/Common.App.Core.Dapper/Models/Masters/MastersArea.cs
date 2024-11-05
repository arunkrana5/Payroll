using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersArea
    {
        public long ID { get; set; }
        public string? City { get; set; }
        public string? AreaCode { get; set; } 
        public string? AreaName { get; set; } 
        public long GroupID { get; set; }
        public int Priority { get; set; }
        public string? Description { get; set; }
    }
}
