using Microsoft.AspNetCore.Mvc;

namespace AppUserWeb.Controllers
{
    public class BaseController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
