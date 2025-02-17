using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Employee;
using Common.App.Core.Dapper.Models.Salary;
using Common.App.Core.Dapper.ServiceContracts;
using Common.App.Data;
using Common.App.Data.Entities.App;
using Common.App.Data.Helpers;
using Common.App.Utility.Enum;
using Common.App.Utility.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using System.Diagnostics.Metrics;
using System.Net;
using static Common.App.Utility.Enum.AllEnum;

namespace AppUserWeb.Controllers
{
    public class EmployeeController : BaseController
    {
        private readonly IEmployeeServices _employeeServices;
        private readonly IUnitOfWork _uow;
        private readonly AppDbContext _appDbContext;
        private readonly IContextHelper _contextHelper;
        private readonly ICommonServices _commonServices;
        private static readonly string[] AllowedExtensions = { ".jpg", ".jpeg" };
        GetResponse getResponse;

        public EmployeeController(IEmployeeServices employeeServices, IUnitOfWork uow, AppDbContext appDbContext, IContextHelper contextHelper, ICommonServices commonServices)
        {
            _employeeServices = employeeServices;
            _uow = uow;
            _appDbContext = appDbContext;
            _contextHelper = contextHelper;
            _commonServices = commonServices;

        }
        public async Task<IActionResult> EmployeeList(string src)
        {
            EmployeeMaster modal = new EmployeeMaster();
            List<EmployeeMaster> list = new List<EmployeeMaster>();
            list = _employeeServices.GetEmployeeMasterList(modal);
            return View(list);
        }
        //public async Task<IActionResult> AddEmployee(string src)
        //{
        //    string LoginId = _contextHelper.GetLoginID();
        //    long.TryParse(LoginId,out long LoginID);
        //    int id = Convert.ToInt32(EncryptDecrypt.Decrypt(src));
        //    DropdownRequest dropdownRequest = new DropdownRequest();
        //    dropdownRequest.Doctype = "Role";
        //    ViewBag.RoleList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Dealer";
        //    ViewBag.DealerList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Country";
        //    ViewBag.CountryList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Region";
        //    //dropdownRequest.ID = employee.CountryID;
        //    ViewBag.RegionList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "State";
        //    //dropdownRequest.ID = employee.StateID;
        //    ViewBag.StateList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "City";
        //    //dropdownRequest.ID = employee.CityID;
        //    ViewBag.CityList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Designation";
        //    ViewBag.DesignList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Department";
        //    ViewBag.DeptList = _commonServices.GetDropDown(dropdownRequest);

        //    //gender enum
        //    var genderlist = Enum.GetValues(typeof(Gender)).Cast<Gender>().Select(e => new SelectListItem
        //    {
        //        Value = e.ToString(),        // or (int)e for int representation
        //        Text = e.ToString()
        //    }).ToList();
        //    genderlist.Insert(0, new SelectListItem { Value = "", Text = "-- Select --" });
        //    ViewBag.GenderList = genderlist;

        //    //var emp = _appDbContext.Master_Emp.FirstOrDefault(x => (int)x.EMPID == id);
        //    EmployeeMaster model = new EmployeeMaster();

        //    model.EMPID = id;

        //    model = _employeeServices.GetEmployeeMaster(model);
        //    //ToastSuccess("")
        //    Master_Emp emp = new Master_Emp
        //    {
        //        EMPCode = model.EMPCode,
        //        EMPName = model.EMPName,
        //        UserID = model.UserID,
        //        Password = model.Password,
        //        RoleID = model.RoleID,
        //        FatherName = model.FatherName,
        //        DOB = model.DOB,
        //        Gender = model.Gender,
        //        DesignID = model.DesignID,
        //        DepartID = model.DepartID,
        //        DOJ = model.DOJ,
        //        PAN = model.PAN,
        //        EmailID = model.EmailID,
        //        Phone = model.Phone,
        //        UAN = model.UAN,
        //        ESIC = model.ESIC,
        //        IsPJPAutoAssign = model.IsPJPAutoAssign,
        //        CountryID = model.CountryID,
        //        RegionID = model.RegionID,
        //        StateID = model.StateID,
        //        CityID = model.CityID,
        //        Location = model.Location,
        //        Zipcode = model.Zipcode,
        //        BankBranch = model.BankBranch,
        //        BankName = model.BankName,
        //        AccountNo = model.AccountNo,
        //        IFSCCode = model.IFSCCode,
        //        ProfilePicPath = model.FilePath,
        //        LoginID = LoginID
        //    };
        //    return View(emp);
        //}
        public async Task<IActionResult> AddEmployee(string src)
        {
            getResponse = new GetResponse();
            ViewBag.src = src;
            string[] GetQueryString = AppSettings.DecryptQueryString(src);
            ViewBag.GetQueryString = GetQueryString;
            ViewBag.EMPID = GetQueryString[0];
            long EMPID = 0;
            long.TryParse(ViewBag.EMPID, out EMPID);
            getResponse.ID = EMPID;
            Employee.Add result = new Employee.Add();
            result = _employeeServices.GetEMP(getResponse);
            result.GenderList = Enum.GetValues(typeof(Gender)).Cast<Gender>().Select(e => new DropDownlist
            {
                ID = (int)e,        // or (int)e for int representation
                Name = e.ToString()
            }).ToList();
            return View(result);
        }





        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> AddEmployee(string src, Master_Emp employee)
        //{
        //    EMP_Documents doc = new EMP_Documents();
        //    DropdownRequest dropdownRequest = new DropdownRequest();
        //    dropdownRequest.Doctype = "Role";
        //    ViewBag.RoleList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Dealer";
        //    ViewBag.DealerList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Country";
        //    ViewBag.CountryList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Region";
        //    //dropdownRequest.ID = employee.CountryID;
        //    ViewBag.RegionList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "State";
        //    //dropdownRequest.ID = employee.StateID;
        //    ViewBag.StateList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "City";
        //    //dropdownRequest.ID = employee.CityID;
        //    ViewBag.CityList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Designation";
        //    ViewBag.DesignList = _commonServices.GetDropDown(dropdownRequest);

        //    dropdownRequest.Doctype = "Department";
        //    ViewBag.DeptList = _commonServices.GetDropDown(dropdownRequest);

        //    //gender enum
        //    var genderlist = Enum.GetValues(typeof(Gender)).Cast<Gender>().Select(e => new SelectListItem
        //    {
        //        Value = e.ToString(),        // or (int)e for int representation
        //        Text = e.ToString()
        //    }).ToList();
        //    genderlist.Insert(0, new SelectListItem { Value = "", Text = "-- Select --" });
        //    ViewBag.GenderList = genderlist;

        //    AppUsers login = new AppUsers();
        //    login.UserID = employee.EMPCode;
        //    login.Password = employee.Password;
        //    login.Name = employee.EMPName;
        //    login.Phone = employee.Phone;
        //    login.Email = employee.EmailID;
        //    login.RoleID = (long)employee.RoleID;
        //    login.AllowLogin = "";
        //    login.DeletedBy = 0;
        //    login.IPAddress = "";
        //    employee.Address2 = "";
        //    employee.DeletedBy = 0;
        //    employee.IPAddress = "";
        //    employee.PaymentMode = "";

        //    if (employee.RoleID < 1)
        //    {
        //        ModelState.AddModelError("RoleID", "Role Can't be Blank.");
        //    }
        //    if (!ModelState.IsValid)
        //    {
        //        ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
        //        return View(employee);
        //    }
        //    if (employee.ProfilePic != null && employee.ProfilePic.Length > 0)
        //    {
        //        var filename = Guid.NewGuid().ToString();
        //        var contentType = Path.GetExtension(employee.ProfilePic.FileName);
        //        if (AllowedExtensions.Contains(contentType.ToLower()))
        //        {
        //            var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Attachments", "EmpProfilePic");
        //            if (!Directory.Exists(directoryPath))
        //            {
        //                Directory.CreateDirectory(directoryPath);
        //            }
        //            var filepath = Path.Combine(directoryPath, filename + contentType);
        //            using (var stream = new FileStream(filepath, FileMode.Create))
        //            {
        //                await employee.ProfilePic.CopyToAsync(stream);
        //            }
        //            doc.FilePath = "/Attachments/EmpProfilePic/" + filename;
        //            doc.FileName = filename;
        //            doc.ContentType = contentType;
        //            doc.Description = "";
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("ProfilePic", "Please upload jpg or jpeg file");
        //            return View(employee);
        //        }
        //    }
        //    else
        //    {
        //        ModelState.AddModelError("ProfilePic", "Please upload jpg or jpeg file");
        //        return View(employee);
        //    }
        //    var loginres = _appDbContext.AppUsers.FirstOrDefault(x => x.UserID == login.UserID);
        //    if (loginres == null)
        //    {
        //        _appDbContext.AddAsync(login);
        //        _appDbContext.SaveChanges();
        //        employee.LoginID = login.LoginID;
        //        var result = _appDbContext.Master_Emp.FirstOrDefault(x => x.EMPCode == employee.EMPCode);
        //        if (result == null)
        //        {
        //            _appDbContext.AddAsync(employee);
        //            _appDbContext.SaveChanges();
        //            doc.EMPID = (long)employee.EMPID;
        //            doc.DocType = "ProfilePic";
        //            doc.DeletedBy = 0;
        //            doc.IPAddress = "";
        //            var docres = _appDbContext.EMP_Documents.FirstOrDefault(x => x.EMPID == doc.EMPID && x.DocType == doc.DocType);
        //            if (docres == null)
        //            {
        //                _appDbContext.AddAsync(doc);
        //                _appDbContext.SaveChanges();
        //            }
        //            else
        //            {
        //                docres.FilePath = doc.FilePath;
        //                docres.FileName = doc.FileName;
        //                docres.ContentType = doc.ContentType;
        //                _appDbContext.Update(docres);
        //                _appDbContext.SaveChanges();
        //            }
        //        }
        //        if (result != null)
        //        {
        //            result.EMPName = employee.EMPName;
        //            _appDbContext.Update(result);
        //            _appDbContext.SaveChanges();
        //            doc.EMPID = (long)employee.EMPID;
        //            doc.DocType = "ProfilePic";
        //            doc.DeletedBy = 0;
        //            doc.IPAddress = "";
        //            var docres = _appDbContext.EMP_Documents.FirstOrDefault(x => x.EMPID == doc.EMPID && x.DocType == doc.DocType);
        //            if (docres == null)
        //            {
        //                _appDbContext.AddAsync(doc);
        //                _appDbContext.SaveChanges();
        //            }
        //            else
        //            {
        //                docres.FilePath = doc.FilePath;
        //                docres.FileName = doc.FileName;
        //                docres.ContentType = doc.ContentType;
        //                _appDbContext.Update(docres);
        //                _appDbContext.SaveChanges();
        //            }
        //        }
        //    }
        //    else if (loginres != null)
        //    {
        //        loginres.Email = login.Email;
        //        _appDbContext.Update(loginres);
        //        _appDbContext.SaveChanges();
        //        employee.LoginID = loginres.LoginID;
        //        employee.EMPID = 0;
        //        try
        //        {
        //            var result = _appDbContext.Master_Emp.FirstOrDefault(x => x.EMPCode == employee.EMPCode);
        //            if (result == null)
        //            {
        //                _appDbContext.AddAsync(employee);
        //                _appDbContext.SaveChanges();
        //                doc.EMPID = (long)employee.EMPID;
        //                doc.DocType = "ProfilePic";
        //                doc.DeletedBy = 0;
        //                doc.IPAddress = "";
        //                var docres = _appDbContext.EMP_Documents.FirstOrDefault(x => x.EMPID == doc.EMPID && x.DocType == doc.DocType);
        //                if (docres == null)
        //                {
        //                    _appDbContext.AddAsync(doc);
        //                    _appDbContext.SaveChanges();
        //                }
        //                else
        //                {
        //                    docres.FilePath = doc.FilePath;
        //                    docres.FileName = doc.FileName;
        //                    docres.ContentType = doc.ContentType;
        //                    _appDbContext.Update(docres);
        //                    _appDbContext.SaveChanges();
        //                }
        //            }
        //            if (result != null)
        //            {
        //                result.EMPName = employee.EMPName;
        //                _appDbContext.Update(result);
        //                _appDbContext.SaveChanges();
        //                doc.EMPID = (long)employee.EMPID;
        //                doc.DocType = "ProfilePic";
        //                doc.DeletedBy = 0;
        //                doc.IPAddress = "";
        //                var docres = _appDbContext.EMP_Documents.FirstOrDefault(x => x.EMPID == doc.EMPID && x.DocType == doc.DocType);
        //                if (docres == null)
        //                {
        //                    _appDbContext.AddAsync(doc);
        //                    _appDbContext.SaveChanges();
        //                }
        //                else
        //                {
        //                    docres.FilePath = doc.FilePath;
        //                    docres.FileName = doc.FileName;
        //                    docres.ContentType = doc.ContentType;
        //                    _appDbContext.Update(docres);
        //                    _appDbContext.SaveChanges();
        //                }
        //            }
        //        }
        //        catch(Exception ex)
        //        {
        //            throw;
        //        }
        //    }
        //    return RedirectToAction("EmployeeList", "Employee", new { src = EncryptDecrypt.Encrypt("0") });
        //}

        [HttpPost]
        public async Task<IActionResult> AddEmployee(string src, Employee.Add Modal)
        {
            PostResponse Result = new PostResponse();
            ViewBag.src = src;
            string[] GetQueryString = AppSettings.DecryptQueryString(src);
            ViewBag.GetQueryString = GetQueryString;
            ViewBag.MenuID = GetQueryString[0];
            Result.SuccessMessage = "Employee Can't Update";
            if (ModelState.IsValid)
            {
                Modal.LoginID = 1;
                Modal.IPAddress = "";
                if (Modal.ProfilePic == null || Modal.ProfilePic.Length == 0)
                {
                    Result.SuccessMessage = "Please Upload Profile Photo";
                    return Json(Result);
                }
                else
                {
                    UploadAttachment attach = new UploadAttachment();
                    attach.File = Modal.ProfilePic;
                    attach.LoginID = Modal.LoginID;
                    attach.IPAddress = Modal.IPAddress;
                    attach.Doctype = "";
                }

                Result = _employeeServices.fnSetEMP(Modal);
            }
            if (Result.Status)
            {
                Result.RedirectURL = "/EmployeeList?src=" + EncryptDecrypt.Encrypt("0");
            }
            return Json(Result);

        }
    }
}
