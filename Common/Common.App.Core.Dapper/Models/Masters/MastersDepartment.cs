using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersDepartment
    {
        public long ID { get; set; }
        public string? DeptCode { get; set; } 
        public string? DeptName { get; set; }
    }
}
