using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Masters
{
    public class MastersCompany
    {
        public long ID { get; set; }

        public string? CompanyCode { get; set; }
        public string? CompanyName { get; set; }
        public long GroupID { get; set; }
        public int Priority { get; set; }
        public string? Description { get; set; }
    }
}
