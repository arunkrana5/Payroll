using Common.App.Core.Dapper.Models;
using Common.App.Core.Models;
using Common.App.Core.ServiceContracts;
using Common.App.Data;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Security.Claims;

namespace AppAPI.Controllers
{
    [AllowAnonymous]
    public class AccountController : BaseController
    {
        private readonly IJwtService _jwtService;
        public AccountController(IJwtService jwtService)
        {
            _jwtService = jwtService;
        }

        [HttpPost]
        public async Task<IActionResult> Login(Login_VM loginDTO)
        {
            //Validation
            if (ModelState.IsValid == false)
            {
                string errorMessage = string.Join(" | ", ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage));
                return Problem(errorMessage);
            }

            ApplicationUser? user = new ApplicationUser();
            
                var authenticationResponse = _jwtService.CreateJwtToken(user);
                CreateIdentity(authenticationResponse.User);
                return Ok(authenticationResponse);
           
            //else
            //{
            //    return Problem("Invalid email or password");
            //}
        }
        private async Task<IActionResult> CreateIdentity(ApplicationUser userDetails)
        {
            var claims = new List<Claim> {
             new Claim(ClaimTypes.Name,userDetails.UserID),
             new Claim(DataConstant.CT_UserID,userDetails.UserID),
             new Claim(DataConstant.CT_LoginID,userDetails.LoginID.ToString()),
            };

            var claimIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var authProperties = new AuthenticationProperties
            {
                ExpiresUtc = DateTime.Now.AddMinutes(60)
            };

            HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimIdentity), authProperties);
            return NoContent();

        }

        [HttpGet("logout")]
        public async Task<IActionResult> GetLogout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return NoContent();
        }
    }
}