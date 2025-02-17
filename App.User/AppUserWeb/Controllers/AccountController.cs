
using Common.App.Core.Dapper.Models.App;
using Common.App.Core.Dapper.ServiceContracts;
using Common.App.Core.Models;
using Common.App.Data;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace AppUserWeb.Controllers
{
    public class AccountController : BaseController
    {
        private readonly IAccountsServices _accountsServices;
        public AccountController(IAccountsServices accountsServices)
        {
            _accountsServices = accountsServices;
        }
        public IActionResult Login()
        {
            Login_VM modal = new Login_VM();
            modal.Password = "12345";
            modal.UserID = "superadmin";
            return View(modal);
        }
        [HttpPost]
        public async Task<IActionResult> Login(Login_VM modal)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Errors = ModelState.Values.SelectMany(temp => temp.Errors).Select(temp => temp.ErrorMessage);
                return View(modal);
            }
            AppUsers userDetails = new AppUsers();
            userDetails.UserID = modal.UserID;
            userDetails.Password = modal.Password;
            userDetails = _accountsServices.GetLogin(userDetails);
            if (userDetails != null)
            {
                await CreateIdentity(userDetails);
            }

            return RedirectToAction("Dashboard", "Home");
        }

        private async Task<IActionResult> CreateIdentity(AppUsers userDetails)
        {
            var claims = new List<Claim> {
             new Claim(ClaimTypes.Name,userDetails.UserID),
             new Claim(DataConstant.CT_UserID,userDetails.UserID),
             new Claim(DataConstant.CT_RoleID,userDetails.RoleID.ToString()),
             new Claim(DataConstant.CT_LoginID,userDetails.LoginID.ToString()),
            };

            var claimIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var authProperties = new AuthenticationProperties
            {
                ExpiresUtc = DateTime.Now.AddMinutes(60)
            };

            HttpContext?.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimIdentity), authProperties);
            //Toast
            return RedirectToAction("Dashboard", "Home");
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login", "Account");
        }
    }
}
