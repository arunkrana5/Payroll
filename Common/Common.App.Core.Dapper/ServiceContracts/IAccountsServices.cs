
using Common.App.Core.Dapper.Models.App;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts
{
    public interface IAccountsServices
    {
        AppUsers GetLogin(AppUsers model);
    }
}
