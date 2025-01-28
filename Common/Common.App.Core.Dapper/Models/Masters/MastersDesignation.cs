using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersDesignation
    {
        public long ID { get; set; }
        public string? DesignCode { get; set; } 
        public string? DesignName { get; set; }
    }
}
