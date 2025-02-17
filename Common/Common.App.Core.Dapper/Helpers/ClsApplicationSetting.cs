using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Drawing;
using System.Reflection;
using static System.Net.Mime.MediaTypeNames;

namespace Common.App.Core.Dapper.Helpers
{
    public class ClsApplicationSetting
    {
        public static PostResponse UploadAttachment(UploadAttachment modal)
        {
            PostResponse result = new PostResponse();
            result.SuccessMessage = "Something went wrong";
            string PhysicalPath = "";
            try
            {
                var rv = ClsApplicationSetting.ValidateFile(modal.File);
                if (rv.IsValid)
                {
                    rv.ID = modal.AttachID;
                    rv.LoginID = modal.LoginID;
                    rv.IPAddress = modal.IPAddress;
                    rv.tableid = modal.TableID;
                    rv.TableName = modal.TableName;
                    rv.Token = modal.Token;
                    rv.Description = modal.Description;
                    rv.Doctype = modal.Doctype;
                    if (modal.Doctype.ToLower() == "empdoc")
                    {
                        rv.FileName = modal.FixFileName;
                        PhysicalPath = GetPhysicalPath("empdoc", modal.TableName);
                        //result = Common_SPU.fnSetEMPDocuments(rv);
                        PhysicalPath = Path.Combine(PhysicalPath, rv.FileName + "" + rv.FileExt);
                        if (File.Exists(PhysicalPath))
                        {
                            File.Delete(PhysicalPath);
                        }
                    }
                }
            }
            catch
            {

            }
            return result;
        }
        public static FileResponse ValidateFile(IFormFile File)
        {
            var obj = new FileResponse();
            try
            {
                obj.FileType = File.ContentType;
                obj.InputStream = File.OpenReadStream();
                obj.FileName = Guid.NewGuid().ToString();
                obj.FileLength = File.Length;
                obj.FileExt = Path.GetExtension(File.FileName).ToLower();
                obj.IsValid = true;
                string AIMGExt = "jpg";
                string AFExt = "pdf";
                long AIMGSize, AFSize = 0, AMaxmiumSize = 0;
                long.TryParse("5", out AIMGSize);
                long.TryParse("10", out AFSize);
                AMaxmiumSize = (AIMGSize > AFSize ? AIMGSize : AFSize);

                obj.ReadAbleFileSize = GetFileSize(obj.FileLength);
                BinaryReader chkBinary = new BinaryReader(obj.InputStream);
                Byte[] chkbytes = chkBinary.ReadBytes(0x10);
                string data_as_hex = BitConverter.ToString(chkbytes);
                string magicCheck = data_as_hex.Substring(0, 8);
                Dictionary<string, string> MDict = new Dictionary<string, string>();
                MDict = GetMagicNumnberDictionary();
                if (MDict != null && MDict.Count > 0)
                {
                    if ((".txt").Contains(obj.FileExt))
                    {
                        obj.IsValid = true;
                    }
                    else if (MDict.ContainsKey(obj.FileExt))
                    {
                        if ((".jpg,.jpeg,.png").Contains(obj.FileExt))
                        {
                            obj.IsImage = true;
                            if (MDict[".jpg"].Substring(0, 8).Replace(" ", "-") != magicCheck && MDict[".jpeg"].Substring(0, 8).Replace(" ", "-") != magicCheck && MDict[".png"].Substring(0, 8).Replace(" ", "-") != magicCheck)
                            {
                                obj.IsValid = false;
                                var myKey = MDict.FirstOrDefault(x => x.Value.Contains(magicCheck)).Key;
                                obj.Message = "Please Upload Valid File with Original extension," + (!string.IsNullOrEmpty(myKey) ? "It seems it is " + myKey + " file" : "");
                            }
                        }
                        else if (MDict[obj.FileExt].Substring(0, 8).Replace(" ", "-") != magicCheck)
                        {
                            obj.IsValid = false;
                            var myKey = MDict.FirstOrDefault(x => x.Value.Contains(magicCheck)).Key;
                            obj.Message = "Please Upload Valid File with Original extension," + (!string.IsNullOrEmpty(myKey) ? "It seems it is " + myKey + " file" : "");
                        }
                    }
                    else if (obj.IsValid)
                    {
                        if (!(AIMGExt.Replace("|", ",")).Contains(obj.FileExt))
                        {
                            obj.IsValid = false;
                            obj.Message = "Can't Upload Image Extention Must Be Matched";

                        }
                        else if (!(AFExt.Replace("|", ",")).Contains(obj.FileExt))
                        {
                            obj.IsValid = false;
                            obj.Message = "Can't Upload File Extention Must Be Matched";

                        }
                        if (obj.IsValid)
                        {
                            if ((AIMGExt.Replace("|", ",")).Contains(obj.FileExt) && obj.FileLength > AIMGSize)
                            {
                                obj.IsValid = false;
                                obj.Message = "Can't Upload Image Size Must Be Matched";

                            }
                            else if ((AFExt.Replace("|", ",")).Contains(obj.FileExt) && obj.FileLength > AFSize)
                            {
                                obj.IsValid = false;
                                obj.Message = "Can't Upload File Size Must Be Matched";

                            }
                        }
                    }
                }
                else
                {
                    obj.IsValid = false;
                    obj.Message = "Please Add Magic Number Into .Txt File";
                }
            }
            catch (Exception ex)
            {
                //ClsCommon.LogError("Error during Problem in ValidateFileWithMagicNumber. The query was executed :", ex.ToString(), "", "ClsApplicationSetting", "ClsApplicationSetting", "");
            }
            return obj;
        }

        public static Dictionary<string, string> GetMagicNumnberDictionary()
        {
            Dictionary<string, string> MagicNumnberDictionary = new Dictionary<string, string>();
            try
            {
                string GetPath = AppContext.BaseDirectory + "/Attachments/UserDetails/temp";
                if (!Directory.Exists(GetPath))
                {
                    Directory.CreateDirectory(GetPath);
                }
                if (File.Exists(GetPath + "/MagicNumber.txt"))
                {
                    using (StreamReader r = new StreamReader(GetPath + "/MagicNumber.txt"))
                    {
                        string json = r.ReadToEnd();
                        MagicNumnberDictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return MagicNumnberDictionary;
        }
        public static string GetFileSize(double byteCount)
        {
            string size = "0 Bytes";
            if (byteCount >= 1073741824.0)
                size = String.Format("{0:##.##}", byteCount / 1073741824.0) + " GB";
            else if (byteCount >= 1048576.0)
                size = String.Format("{0:##.##}", byteCount / 1048576.0) + " MB";
            else if (byteCount >= 1024.0)
                size = String.Format("{0:##.##}", byteCount / 1024.0) + " KB";
            else if (byteCount > 0 && byteCount < 1024.0)
                size = byteCount.ToString() + " Bytes";

            return size;
        }
        public static string GetPhysicalPath(string pathFor = "", string EMPCODE = "")
        {
            string PhysicalPath = AppContext.BaseDirectory;
            string InnerPath = "";
            string functionReturnValue = "";
            if (pathFor.ToLower() == "recruit")
            {
                InnerPath = "/Attachments/Recruit";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            if (pathFor.ToLower() == "banner")
            {
                InnerPath = "/Attachments/Banner";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "images")
            {
                InnerPath = "/assets/design/images";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "json")
            {
                InnerPath = "/Attachments/UserDetails/Jsondata";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;

            }
            else if (pathFor.ToLower() == "import")
            {
                InnerPath = "/Attachments/ImportExcels";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;

            }
            else if (pathFor.ToLower() == "onboarding")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");
                InnerPath = "/Attachments/Onboarding/" + Year + "/" + Month;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "emptalentpool")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");
                InnerPath = "/Attachments/EMPTalentPool/" + Year + "/" + Month;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "ssrentry")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");
                InnerPath = "/Attachments/Images/" + Year + "/" + Month;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "tlentry")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");

                InnerPath = "/Attachments/TLImages/" + Year + "/" + Month;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }

            else if (pathFor.ToLower() == "autonsm")
            {
                InnerPath = "/Attachments/AutoReport/NSM";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "autorsm")
            {
                InnerPath = "/Attachments/AutoReport/RSM";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;

            }
            else if (pathFor.ToLower() == "autobsm")
            {
                InnerPath = "/Attachments/AutoReport/BSM";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "travel")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");
                InnerPath = "/Attachments/Travel/" + Year + "/" + Month;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "pdfexport")
            {
                InnerPath = "/Attachments/ExportPDF/";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "empdoc")
            {
                InnerPath = "/Attachments/EmpDoc/" + EMPCODE;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "isdsummaryreports")
            {
                InnerPath = "/Attachments/ISDSummaryReports";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "pjpdoc")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");
                InnerPath = "/Attachments/PJPDoc/" + Year + "/" + Month + "/" + EMPCODE;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "candidatedata")
            {
                InnerPath = "/Attachments/CandidateData/";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else if (pathFor.ToLower() == "workforce")
            {
                string Year = DateTime.Now.Year.ToString();
                string Month = DateTime.Now.Month.ToString("d2");

                InnerPath = "/Attachments/WorkForce/" + Year + "/" + Month;
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            else
            {
                InnerPath = "/Attachments";
                if (!Directory.Exists(PhysicalPath + InnerPath))
                {
                    Directory.CreateDirectory(PhysicalPath + InnerPath);
                }
                functionReturnValue = PhysicalPath + InnerPath;
            }
            return functionReturnValue;
        }
    }
}
