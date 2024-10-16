using Common.App.Core.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AppAPI.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        public async Task<IActionResult> Test()
        {
            return Ok("Hello world");
        }
    }
}
