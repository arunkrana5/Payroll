using Common.App.Core.Dapper.Helpers;
using Common.App.Core.Dapper.Models.Dealer;
using Common.App.Core.Dapper.Models.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts
{
    public interface IDealerServices
    {
        List<Dealer.List> GetDealerList(JqueryDatatableParam modal);
        //EmployeeMaster GetEmployeeMaster(EmployeeMaster Modal);
        Dealer.Add GetDealer(GetResponse Modal);
        //PostResponse fnSetEMP(Employee.Add modal);
    }
}
