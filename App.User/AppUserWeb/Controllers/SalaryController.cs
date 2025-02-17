using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Salary;
using Common.App.Core.Dapper.ServiceContracts;
using Common.App.Data;
using Common.App.Data.Entities.Salary;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using static Common.App.Utility.Enum.AllEnum;


namespace AppUserWeb.Controllers
{
    public class SalaryController : BaseController
    {
        private readonly ISalaryServices _salaryServices;
        private readonly IUnitOfWork _uow;
        private readonly AppDbContext _appDbContext;
        private readonly IContextHelper _contextHelper;
        private readonly ICommonServices _commonServices;

        public SalaryController(ISalaryServices salaryServices, IUnitOfWork uow, AppDbContext appDbContext, IContextHelper contextHelper, ICommonServices commonServices)
        {
            _salaryServices = salaryServices;
            _uow = uow;
            _appDbContext = appDbContext;
            _contextHelper = contextHelper;
            _commonServices = commonServices;


        }
        public async Task<IActionResult> ComponentList(string src)
        {
            SalaryComponents modal = new SalaryComponents();
            modal.CompID = Convert.ToInt32(src);
            List<SalaryComponents> list = new List<SalaryComponents>();
            list = _salaryServices.GetSalaryComponentsList(modal);
            return View(list);
        }
        public async Task<IActionResult> StructureList(string src)
        {
            SalaryStructures modal = new SalaryStructures();
            modal.StructID = Convert.ToInt32(src);
            if (string.IsNullOrEmpty(_contextHelper.GetLoginID()))
            {
                modal.LoginID = 0;
            }
            else
            {
                modal.LoginID = Convert.ToInt32(_contextHelper.GetLoginID());
            }

            List<SalaryStructures> list = new List<SalaryStructures>();
            list = _salaryServices.GetSalaryStructuresList(modal);
            return View(list);
        }

        public async Task<IActionResult> StructureTranList(string src)
        {
            List<SalaryStructureTran> list = new List<SalaryStructureTran>();
            ViewBag.StructID = Convert.ToInt32(src.Split("*")[1]);
            ViewBag.Doctype = src.Split("*")[0];
            return View(list);
        }
        public async Task<IActionResult> _StructureTranList(string src)
        {
            SalaryStructureTran modal = new SalaryStructureTran();
            modal.StructID = Convert.ToInt32(src.Split("*")[1]);
            if (string.IsNullOrEmpty(_contextHelper.GetLoginID()))
            {
                modal.LoginID = 0;
            }
            else
            {
                modal.LoginID = Convert.ToInt32(_contextHelper.GetLoginID());
            }
            modal.Doctype = src.Split("*")[0];
            ViewBag.Doctype = src.Split("*")[0];
            List<SalaryStructureTran> list = new List<SalaryStructureTran>();
            list = _salaryServices.GetSalaryStructureTran(modal);
            return PartialView(list);
        }
        public async Task<IActionResult> SalaryAssignmentList(string src)
        {
            SalaryAssignment modal = new SalaryAssignment();
            modal.SAID = 0;
            if (String.IsNullOrEmpty(_contextHelper.GetLoginID()))
            {
                modal.LoginID = 0;
            }
            else
            {
                modal.LoginID = Convert.ToInt32(_contextHelper.GetLoginID());
            }
            List<SalaryAssignment> list = new List<SalaryAssignment>();
            list = _salaryServices.GetSalaryAssignmentList(modal);
            return View(list);
        }

        public async Task<IActionResult> AddComponent(string src)
        {
            var componentTypes = Enum.GetValues(typeof(ComponentType)).Cast<ComponentType>().Select(e => new SelectListItem
            {
                Value = e.ToString(),        // or (int)e for int representation
                Text = e.ToString()
            }).ToList();
            componentTypes.Insert(0, new SelectListItem { Value = "", Text = "-- Select --" });
            ViewBag.CompType = componentTypes;
            Salary_Component modal;
            int id = Convert.ToInt32(src);
            if (id == 0)
            {
                modal = new Salary_Component(); // Create a new instance for adding
            }
            else
            {
                // Retrieve the entity by ID
                modal = await _appDbContext.Salary_Component.FindAsync(id);

                if (modal == null)
                {
                    return NotFound(); // Handle the case where the entity is not found
                }
            }

            return View(modal);
        }
        [HttpPost]
        public async Task<IActionResult> AddComponent(string src, Salary_Component modal)
        {
            var componentTypes = Enum.GetValues(typeof(ComponentType)).Cast<ComponentType>().Select(e => new SelectListItem
            {
                Value = e.ToString(),        // or (int)e for int representation
                Text = e.ToString()
            }).ToList();
            componentTypes.Insert(0, new SelectListItem { Value = "", Text = "-- Select --" });
            ViewBag.CompType = componentTypes;
            int ID = 0;
            int.TryParse(src, out ID);
            modal.CreatedDate = DateTime.Now;
            modal.ModifiedDate = DateTime.Now;
            modal.DeletedBy = 0;
            modal.IPAddress = "";
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            if (String.IsNullOrEmpty(modal.Description))
            {
                modal.Description = "";
            }
            var result = _appDbContext.Salary_Component.FirstOrDefault(x => x.CompCode == modal.CompCode);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.CompID = ID;
                result.CompCode = modal.CompCode;
                result.CompName = modal.CompName;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }

            return RedirectToAction("ComponentList");
        }
        public async Task<IActionResult> AddStructure(string src, Salary_Structure modal)
        {
            int ID = 0;
            int.TryParse(src, out ID);
            modal.CreatedDate = DateTime.Now;
            modal.ModifiedDate = DateTime.Now;
            modal.DeletedBy = 0;
            modal.IPAddress = "";
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            var result = _appDbContext.Salary_Structure.FirstOrDefault(x => x.StructID == ID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.StructID = ID;
                result.StructCode = modal.StructCode;
                result.Description = modal.Description;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }

            return RedirectToAction("StructureList");
        }

        public async Task<IActionResult> AddStructureTran(string src, Salary_StructureTran modal)
        {
            DropdownRequest dropdownRequest = new DropdownRequest();
            dropdownRequest.Doctype = "Components";
            ViewBag.CompList = _commonServices.GetDropDown(dropdownRequest);
            int ID = 0;
            int.TryParse(src, out ID);
            modal.CreatedDate = DateTime.Now;
            modal.ModifiedDate = DateTime.Now;
            modal.DeletedBy = 0;
            modal.IPAddress = "";
            if (String.IsNullOrEmpty(modal.Condition))
            {
                modal.Condition = "";
            }
            ViewBag.DocType = src.Split("*")[0];
            ViewBag.StructID = src.Split("*")[1];
            ViewBag.src = src;
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            var result = _appDbContext.Salary_StructureTran.FirstOrDefault(x => x.StructTranID == ID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                result.StructTranID = ID;
                result.StructID = modal.StructID;
                result.CompID = modal.CompID;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }

            return RedirectToAction("StructureTranList", "Salary", new { src = "Earning*" + modal.StructID });
        }
        public async Task<IActionResult> AddSalaryAssignment(string src, Salary_Assignment modal, List<Salary_AssignmentBreakUp> list)
        {
            DropdownRequest dropdownRequest = new DropdownRequest();
            dropdownRequest.Doctype = "Structures";
            ViewBag.StructList = _commonServices.GetDropDown(dropdownRequest);
            dropdownRequest.Doctype = "Employees";
            ViewBag.EmpList = _commonServices.GetDropDown(dropdownRequest);
            int ID = Convert.ToInt32(src);
            modal.SAID = ID;
            modal.CreatedDate = DateTime.Now;
            modal.ModifiedDate = DateTime.Now;
            modal.DeletedBy = 0;
            modal.IPAddress = "";
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            var result = _appDbContext.Salary_Assignment.FirstOrDefault(x => x.SalaryStructID == modal.SalaryStructID && x.EMPID == modal.EMPID);
            if (result == null)
            {
                _appDbContext.AddAsync(modal);
                _appDbContext.SaveChanges();
            }
            else
            {
                modal.SAID = result.SAID;
                result.SalaryStructID = modal.SalaryStructID;
                result.EMPID = modal.EMPID;
                result.GrossSalary = modal.GrossSalary;
                _appDbContext.Update(result);
                _appDbContext.SaveChanges();
            }
            if (modal.SAID > 0)
            {
                Salary_AssignmentBreakUp sbmodal = new Salary_AssignmentBreakUp();
                if (list.Count > 0)
                {
                    foreach (var item in list)
                    {
                        sbmodal.SABreakID = ID;
                        sbmodal.CompID = item.CompID;
                        sbmodal.SAID = modal.SAID;
                        sbmodal.BreakUpAmount = item.BreakUpAmount;
                        sbmodal.CreatedDate = DateTime.Now;
                        sbmodal.ModifiedDate = DateTime.Now;
                        sbmodal.DeletedBy = 0;
                        sbmodal.IPAddress = "";
                        sbmodal.EntrySource = item.EntrySource;
                        var res = _appDbContext.Salary_AssignmentBreakUp.FirstOrDefault(x => x.SAID == sbmodal.SAID && x.CompID == sbmodal.CompID);
                        if (res == null)
                        {
                            _appDbContext.AddAsync(sbmodal);
                            _appDbContext.SaveChanges();
                        }
                        else
                        {
                            res.BreakUpAmount = item.BreakUpAmount;
                            res.Modifiedby = 1;
                            res.ModifiedDate = modal.ModifiedDate;
                            _appDbContext.Update(res);
                            _appDbContext.SaveChanges();
                        }
                    }
                }
            }
            return View(modal);
        }
        public async Task<IActionResult> _SalaryCalculation(string src, SalaryAssignment modal)
        {
            if (string.IsNullOrEmpty(_contextHelper.GetLoginID()))
            {
                modal.LoginID = 0;
            }
            else
            {
                modal.LoginID = Convert.ToInt32(_contextHelper.GetLoginID());
            }
            if (modal.EMPID > 0)
            {
                modal = _salaryServices.GetSalaryCalculations(modal);
                ViewBag.EarningList = modal.CalculationList.Where(item => item.CompType.Trim().ToLower() == "earning").ToList();
                ViewBag.DeductionList = modal.CalculationList.Where(item => item.CompType.Trim().ToLower() == "deduction").ToList();
                ViewBag.ContributionList = modal.CalculationList.Where(item => item.CompType.Trim().ToLower() == "contribution").ToList();
            }
            return PartialView(modal);
        }
    }
}
