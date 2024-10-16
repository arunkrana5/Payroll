using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities
{
    public class BaseEntity
    {
        [Column(Order = 999)]
        public string EntrySource { get; set; }
        [Column(Order = 1000)]
        public bool IsActive { get; set; } = true;
        public DateTime? DeletedDate { get; set; }
        public int? DeletedBy { get; set; }
        public int IsDeleted { get; set; } = 0;
        public int Createdby { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Modifiedby { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string? IPAddress { get; set; }



    }
}
