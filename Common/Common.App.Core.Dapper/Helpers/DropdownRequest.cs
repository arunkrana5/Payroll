using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Helpers
{
    public class DropdownRequest
    {
        public string Doctype { get; set; }
        public long LoginID {  get; set; }
        public long? ID { get; set; }
    }
}
