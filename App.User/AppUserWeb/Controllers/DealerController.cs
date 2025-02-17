using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Dealer;
using Common.App.Core.Dapper.Models.Employee;
using Common.App.Core.Dapper.ServiceContracts;
using Common.App.Core.Dapper.ServiceContracts.Services;
using Common.App.Data.Helpers;
using Common.App.Utility.Enum;
using Microsoft.AspNetCore.Mvc;
using static Common.App.Utility.Enum.AllEnum;
using System.Net;

namespace AppUserWeb.Controllers
{
    public class DealerController : BaseController
    {
        private readonly IDealerServices _dealerServices;
        GetResponse getResponse;
        public DealerController(IDealerServices dealerServices)
        {
            _dealerServices = dealerServices;
        }
        public async Task<IActionResult> DealerList()
        {
            List<Dealer.List> list = new List<Dealer.List>(); 
            return View(list);
        }
        public async Task<IActionResult> EmployeeList(string src)
        {
            JqueryDatatableParam modal = new JqueryDatatableParam();
            List<Dealer.List> list = new List<Dealer.List>();
            list = _dealerServices.GetDealerList(modal);
            return View(list);
        }
        public async Task<IActionResult> AddDealer(string src)
        {
            getResponse = new GetResponse();
            ViewBag.src = src;
            string[] GetQueryString = AppSettings.DecryptQueryString(src);
            ViewBag.GetQueryString = GetQueryString;
            ViewBag.DealerID = GetQueryString[0];
            long DealerID = 0;
            long.TryParse(ViewBag.DealerID, out DealerID);
            getResponse.ID = DealerID;
            Dealer.Add result = new Dealer.Add();
            result = _dealerServices.GetDealer(getResponse);
            return View(result);
        }
    }
}
