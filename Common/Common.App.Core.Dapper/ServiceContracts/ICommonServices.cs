using Common.App.Core.Dapper.Helpers;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Common.App.Core.Dapper.ServiceContracts
{
    public interface ICommonServices
    {
        List<SelectListItem> GetDropDown(DropdownRequest Modal);
    }
}
