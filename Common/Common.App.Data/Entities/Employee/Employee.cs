using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Employee
{
    public class Employee : BaseEntity
    {
        [Key]
        public long? EMPID { get; set; }
        public string? EMPCode { get; set; }
        [Required(ErrorMessage = "Name Can't be Blank")]
        public string? EMPName { get; set; }

        [Required(ErrorMessage = "UserID Can't be Blank")]
        public string? UserID { get; set; }

        [Required(ErrorMessage = "Password Can't be Blank")]
        public string? Password { get; set; }

        [Required(ErrorMessage = "Role  Can't be Blank")]
        public long RoleID { get; set; }
        [Required(ErrorMessage = "Phone Can't be Blank")]
        public string? Phone { get; set; }
        public string? PAN { get; set; }
        [Required(ErrorMessage = "Email Can't be Blank")]
        [EmailAddress]
        public string? EmailID { get; set; }

        [Required(ErrorMessage = "Father Can't be Blank")]
        public string? FatherName { get; set; }
        [Required(ErrorMessage = "Date of Birth Can't be Blank")]
        public string? DOB { get; set; }

        [Required(ErrorMessage = "Date of Birth Can't be Blank")]
        public string? DOJ { get; set; }
        [Required(ErrorMessage = "Gender Can't be Blank")]
        public string? Gender { get; set; }

        [Required(ErrorMessage = "Desigantion Can't be Blank")]
        public long? DesignID { get; set; }
        [Required(ErrorMessage = "Department Can't be Blank")]
        public long? DepartID { get; set; }

        [Required(ErrorMessage = "Country Can't be Blank")]
        public long? CountryID { get; set; }

        [Required(ErrorMessage = "Region Can't be Blank")]
        public long? RegionID { get; set; }
        [Required(ErrorMessage = "State Can't be Blank")]
        public long? StateID { get; set; }
        [Required(ErrorMessage = "City Can't be Blank")]
        public long? CityID { get; set; }

        [Required(ErrorMessage = "Address Can't be Blank")]
        public string? Address1 { get; set; }
        public string? Address2 { get; set; }
        public string? Location { get; set; }
        public string? Zipcode { get; set; }

        [Required(ErrorMessage = "Account No Can't be Blank")]
        public string? AccountNo { get; set; }

        [Required(ErrorMessage = "Bank Name Can't be Blank")]
        public string? BankName { get; set; }

        [Required(ErrorMessage = "IFSC Code Can't be Blank")]
        public string IFSCCode { get; set; }

        [Required(ErrorMessage = "Bank Branch Can't be Blank")]
        public string BankBranch { get; set; }

        [Required(ErrorMessage = "Dealer Can't be Blank")]
        public long? DealerID { get; set; }

        public bool IsPJPAutoAssign { get; set; }
        public long AttachID { get; set; }
        public int Priority { get; set; }
        public string UAN { get; set; }
        public string ESIC { get; set; }
        public string PaymentMode { get; set; }
        public long LoginID { get; set; }
        public string IPAddress { get; set; }
        public string DOL { get; set; }
    }
}
