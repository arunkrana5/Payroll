using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Masters;
using Common.App.Core.Dapper.Models.Salary;
using Common.App.Core.Dapper.ServiceContracts;
using Common.App.Core.Dapper.ServiceContracts.Services;
using Common.App.Data;
using Common.App.Data.Entities.Employee;
using Common.App.Data.Entities.Masters;
using Common.App.Utility.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace AppUserWeb.Controllers
{
    public class MastersController : Controller
    {
        private readonly IMastersServices _mastersServices;
        private readonly ICommonServices _commonServices;
        private readonly AppDbContext _appDbContext;
        public MastersController(IMastersServices mastersServices, AppDbContext appDbContext, ICommonServices commonServices)
        {
            _mastersServices = mastersServices;
            _appDbContext = appDbContext;
            _commonServices = commonServices;
        }
        public IActionResult AddCountry(string src, Masters_Country modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            if (String.IsNullOrEmpty(Convert.ToString(modal.Priority)))
            {
                modal.Priority = 0;
            }
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_Country.FirstOrDefault(x => x.CountryCode == modal.CountryCode);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.ID = ID;
                result.CountryCode = modal.CountryCode;
                result.CountryName = modal.CountryName;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("CountryList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult CountryList(string src)
        {
            MastersCountry modal = new MastersCountry();
            List<MastersCountry> list = new List<MastersCountry>();
            list = _mastersServices.GetCountryList(modal);
            return View(list);
        }
        public IActionResult AddRegion(string src, Masters_Region modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            DropdownRequest dropdownRequest = new DropdownRequest();
            dropdownRequest.Doctype = "Country";
            ViewBag.CountryList = _commonServices.GetDropDown(dropdownRequest);
            if (String.IsNullOrEmpty(Convert.ToString(modal.Priority)))
            {
                modal.Priority = 0;
            }
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_Region.FirstOrDefault(x => x.RegionCode == modal.RegionCode && x.GroupID == modal.GroupID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.ID = ID;
                result.RegionCode = modal.RegionCode;
                result.RegionName = modal.RegionName;
                result.Description = modal.Description;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("RegionList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult RegionList(string src)
        {
            MastersRegion modal = new MastersRegion();
            List<MastersRegion> list = new List<MastersRegion>();
            list = _mastersServices.GetRegionList(modal);
            return View(list);
        }
        public IActionResult AddState(string src, Masters_State modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            DropdownRequest dropdownRequest = new DropdownRequest();
            dropdownRequest.Doctype = "Region";
            ViewBag.RegionList = _commonServices.GetDropDown(dropdownRequest);
            if (String.IsNullOrEmpty(Convert.ToString(modal.Priority)))
            {
                modal.Priority = 0;
            }
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_State.FirstOrDefault(x => x.StateCode == modal.StateCode && x.GroupID == modal.GroupID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.ID = ID;
                result.StateCode = modal.StateCode;
                result.StateName = modal.StateName;
                result.Description = modal.Description;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("StateList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult StateList(string src)
        {
            MastersState modal = new MastersState();
            List<MastersState> list = new List<MastersState>();
            list = _mastersServices.GetStateList(modal);
            return View(list);
        }
        public IActionResult AddCity(string src, Masters_City modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            DropdownRequest dropdownRequest = new DropdownRequest();
            dropdownRequest.Doctype = "State";
            ViewBag.StateList = _commonServices.GetDropDown(dropdownRequest);
            if (String.IsNullOrEmpty(Convert.ToString(modal.Priority)))
            {
                modal.Priority = 0;
            }
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_City.FirstOrDefault(x => x.CityCode == modal.CityCode && x.GroupID == modal.GroupID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.CityCode = modal.CityCode;
                result.CityName = modal.CityName;
                result.Description = modal.Description;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("CityList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult CityList(string src)
        {
            MastersCity modal = new MastersCity();
            List<MastersCity> list = new List<MastersCity>();
            list = _mastersServices.GetCityList(modal);
            return View(list);
        }
        public IActionResult AddArea(string src, Masters_Area modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            DropdownRequest dropdownRequest = new DropdownRequest();
            dropdownRequest.Doctype = "City";
            ViewBag.CityList = _commonServices.GetDropDown(dropdownRequest);
            if (String.IsNullOrEmpty(Convert.ToString(modal.Priority)))
            {
                modal.Priority = 0;
            }
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_Area.FirstOrDefault(x => x.AreaCode == modal.AreaCode && x.GroupID == modal.GroupID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.ID = ID;
                result.AreaCode = modal.AreaCode;
                result.AreaName = modal.AreaName;
                result.Description = modal.Description;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("AreaList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult AreaList(string src)
        {
            MastersArea modal = new MastersArea();
            List<MastersArea> list = new List<MastersArea>();
            list = _mastersServices.GetAreaList(modal);
            return View(list);
        }
        public IActionResult AddDesignation(string src, Masters_Designation modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_Designation.FirstOrDefault(x => x.DesignCode == modal.DesignCode);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.DesignName = modal.DesignName;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("DesignationList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult DesignationList(string src)
        {
            MastersDesignation modal = new MastersDesignation();
            List<MastersDesignation> list = new List<MastersDesignation>();
            list = _mastersServices.GetDesignationList(modal);
            return View(list);
        }
        public IActionResult AddDepartment(string src, Masters_Department modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_Department.FirstOrDefault(x => x.DeptCode == modal.DeptCode);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.DeptName = modal.DeptName;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("DepartmentList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult DepartmentList(string src)
        {
            MastersDepartment modal = new MastersDepartment();
            List<MastersDepartment> list = new List<MastersDepartment>();
            list = _mastersServices.GetDepartmentList(modal);
            return View(list);
        }
        public IActionResult AddCompany(string src, Masters_Company modal)
        {
            int ID = 0;
            int.TryParse(EncryptDecrypt.Decrypt(src), out ID);
            if (String.IsNullOrEmpty(Convert.ToString(modal.Priority)))
            {
                modal.Priority = 0;
            }
            if (String.IsNullOrEmpty(Convert.ToString(modal.DeletedBy)))
            {
                modal.DeletedBy = 0;
            }
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            if (String.IsNullOrEmpty(modal.IPAddress))
            {
                modal.IPAddress = "";
            }
            var result = _appDbContext.Masters_Company.FirstOrDefault(x => x.CompanyCode == modal.CompanyCode);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.CompanyName = modal.CompanyName;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            return RedirectToAction("CompanyList", "Masters", new { src = EncryptDecrypt.Encrypt("0") });
        }
        public IActionResult CompanyList(string src)
        {
            MastersCompany modal = new MastersCompany();
            List<MastersCompany> list = new List<MastersCompany>();
            list = _mastersServices.GetCompanyList(modal);
            return View(list);
        }
    }
}
