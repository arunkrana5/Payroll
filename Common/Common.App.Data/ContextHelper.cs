using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Data
{
    public interface IContextHelper
    {
        string GetLoginID();
    }
    public class ContextHelper : IContextHelper
    {
        private IHttpContextAccessor _httpContextAccessor;
        private IConfiguration _configuration;
        public ContextHelper(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }
        public string GetLoginID()
        {
            ClaimsIdentity identity = _httpContextAccessor.HttpContext.User.Identity as ClaimsIdentity;
            Claim claim = identity?.FindFirst(DataConstant.CT_LoginID);
            return claim?.Value ?? string.Empty;
        }


    }
}
