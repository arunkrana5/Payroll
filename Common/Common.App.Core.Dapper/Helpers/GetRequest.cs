using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.Helpers
{
    public class GetResponse
    {
        public int Approved { get; set; }
        public long ID { get; set; }
        public long AdditionalID { get; set; }
        public string Doctype { get; set; }
        public string Date { get; set; }
        public string Param1 { get; set; }
        public string Param2 { get; set; }
        public long LoginID { get; set; }
        public long RoleID { get; set; }
        public string IPAddress { get; set; }

    }
    public class PostResponse
    {
        public string ViewAsString { get; set; }
        public bool Status { get; set; }
        public int StatusCode { get; set; }
        public string SuccessMessage { get; set; }
        public string RedirectURL { get; set; }
        public long ID { get; set; }
        public string AdditionalMessage { get; set; }
    }
    public class UploadAttachment
    {
        public string Token { get; set; }
        public bool IsValid { get; set; }
        public string Message { get; set; }
        public string Doctype { get; set; }
        public IFormFile? File { get; set; }
        public long? AttachID { get; set; }
        public float Width { get; set; }
        public float Height { get; set; }
        public string Description { get; set; }
        public long? TableID { get; set; }
        public string TableName { get; set; }
        public long LoginID { get; set; }
        public string IPAddress { get; set; }
        public string FixFileName { get; set; }

    }
    public class FileResponse
    {
        public bool IsValid { get; set; }
        public bool IsImage { get; set; }
        public string Message { get; set; }
        public string FileName { get; set; }
        public long FileLength { get; set; }
        public string ReadAbleFileSize { get; set; }
        public string FileExt { get; set; }
        public string FileType { get; set; }
        public Stream InputStream { get; set; }
        public string Token { get; set; }
        public long? ID { get; set; }
        public string Description { get; set; }
        public long? tableid { get; set; }
        public string TableName { get; set; }
        public long LoginID { get; set; }
        public string IPAddress { get; set; }
        public string ImageBase64String { get; set; }
        public string Doctype { get; set; }
        public string ExpenseType { get; set; }
    }
}
