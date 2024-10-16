using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.App
{
    public class AppRoles: BaseEntity
    {
        [Key]
        public long RoleID { get; set; }
        public string RoleName { get; set; }
        public string DisplayName { get; set; }
        public string? Description { get; set; }

    }
}
