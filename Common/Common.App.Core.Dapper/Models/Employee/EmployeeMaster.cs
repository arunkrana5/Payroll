using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Models.Employee
{
    public class EmployeeMaster
    { 
        public long EMPID { get; set; }
        public string? EMPCode { get; set; } 
        public string? EMPName { get; set; } 
        public string? UserID { get; set; } 
        public string? Password { get; set; } 
        public long RoleID { get; set; } 
        public string? Phone { get; set; }
        public string? PAN { get; set; } 
        public string? EmailID { get; set; } 
        public string? FatherName { get; set; } 
        public string? DOB { get; set; } 
        public string? DOJ { get; set; } 
        public string? Gender { get; set; } 
        public long DesignID { get; set; } 
        public long DepartID { get; set; } 
        public long CountryID { get; set; } 
        public long RegionID { get; set; } 
        public long StateID { get; set; } 
        public long CityID { get; set; } 
        public string? Address2 { get; set; }
        public string? Location { get; set; }
        public string? Zipcode { get; set; } 
        public string? AccountNo { get; set; } 
        public string? BankName { get; set; } 
        public string? IFSCCode { get; set; } 
        public string? BankBranch { get; set; } 
        public bool IsPJPAutoAssign { get; set; }
        public long AttachID { get; set; }
        public int Priority { get; set; }
        public string? UAN { get; set; }
        public string? ESIC { get; set; }
        public string? PaymentMode { get; set; }
        public long LoginID { get; set; }
        public string? FilePath { get; set; }
    }
}
