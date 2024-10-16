using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Models
{
    public class Login_VM
    {
        [Required(ErrorMessage ="UserID can't be blank")]
        public string UserID { get; set; }
        [Required(ErrorMessage = "Passwrod can't be blank")]
        public string Password { get; set; }

        public bool Remember { get; set; }
    }
}
