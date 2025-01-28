using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data.Entities.Employee
{
    public class EMP_Documents : BaseEntity
    {
        [Key]
        public long Attach_ID { get; set; }
        public long EMPID { get; set; }
        public string? DocType { get; set; }
        public string? FileName { get; set; }
        public string? FilePath { get; set; }
        public string? ContentType { get; set; }
        public string? Description { get; set; }
    }
}
