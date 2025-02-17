using Common.App.Core.Dapper.Helpers;
using Common.App.Utility.Enum;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Common.App.Core.Dapper.ServiceContracts
{
    public interface ICommonServices
    {
        List<SelectListItem> GetDropDown(DropdownRequest Modal);
    }
}
