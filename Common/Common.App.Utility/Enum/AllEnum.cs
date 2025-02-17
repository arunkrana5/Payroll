using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Utility.Enum
{
    public class AllEnum
    {
        public enum ComponentType
        {
            Earning,
            Deduction,
            Contribution
        }
        public enum Gender
        {
            Male,
            Female,
            Other
        }
    }
    public class DropDownlist
    {
        public long ID { get; set; }
        public string Name { get; set; }
        public string Other { get; set; }

    }
}
