using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.App
{
    public  class AppUsers: BaseEntity
    {
        [Key]
        public long LoginID { get; set; }
        public string UserID { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public long RoleID { get; set; }
        public DateTime? LastLogin { get; set; }
        public long AttachID { get; set; }
        public string AllowLogin { get; set; }
    }
}
