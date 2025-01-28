using Common.App.Core.Dapper.Models.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Dapper.ServiceContracts
{
    public interface IMastersServices
    {
        List<MastersCountry> GetCountryList(MastersCountry Modal);
        List<MastersState> GetStateList(MastersState Modal);
        List<MastersRegion> GetRegionList(MastersRegion Modal);
        List<MastersCity> GetCityList(MastersCity Modal);
        List<MastersArea> GetAreaList(MastersArea Modal);
        List<MastersDesignation> GetDesignationList(MastersDesignation Modal);
        List<MastersDepartment> GetDepartmentList(MastersDepartment Modal);
        List<MastersCompany> GetCompanyList(MastersCompany Modal);
    }
}
