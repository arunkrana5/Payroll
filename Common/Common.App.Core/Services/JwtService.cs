using Common.App.Core.DTO;
using Common.App.Core.Models;
using Common.App.Core.ServiceContracts;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Common.App.Core.Services
{
    public class JwtService : IJwtService
    {
        private readonly IConfiguration _configuration;
        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public AuthenticationResponse CreateJwtToken(ApplicationUser applicationUser)
        {
            var Expiration_Mintues = _configuration["Jwt:Expiration_Mintues"];
            var SecretKey = _configuration["Jwt:SecretKey"];
            var ValidAudience = _configuration["Jwt:ValidAudience"];
            var ValidIssuer = _configuration["Jwt:ValidIssuer"];
            DateTime ExpirationValue = DateTime.Now.AddMinutes(Convert.ToDouble(Expiration_Mintues));
            var claims = new Claim[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,applicationUser.LoginID.ToString()),
                new Claim(JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat,DateTime.Now.ToString()),
                //Optional Details
                 new Claim(ClaimTypes.NameIdentifier,applicationUser.UserID)
            };

            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(SecretKey));
            SigningCredentials signingCredentials= new SigningCredentials(securityKey,SecurityAlgorithms.HmacSha256);

            var tokenOptions = new JwtSecurityToken(
                    issuer: ValidIssuer,
                    audience: ValidAudience,
                    claims: claims,
                    expires: ExpirationValue,
                    signingCredentials: signingCredentials);

            var token = new JwtSecurityTokenHandler().WriteToken(tokenOptions);

            return new AuthenticationResponse()
            {
                Token = token,
                User= applicationUser,
                RefreshToken = GenerateRefreshToken(),
                RefreshTokenExpirationDateTime = DateTime.Now.AddMinutes(Convert.ToInt32(_configuration["RefreshToken:EXPIRATION_MINUTES"]))
            };

        }

        private string GenerateRefreshToken()
        {
            byte[] bytes = new byte[64];
            var randomNumberGenerator = RandomNumberGenerator.Create();
            randomNumberGenerator.GetBytes(bytes);
            return Convert.ToBase64String(bytes);
        }

        public ClaimsPrincipal? GetPrincipalFromJwtToken(string? token)
        {
            var Expiration_Mintues = _configuration["Jwt:Expiration_Mintues"];
            var SecretKey = _configuration["Jwt:SecretKey"];
            var ValidAudience = _configuration["Jwt:ValidAudience"];
            var ValidIssuer = _configuration["Jwt:ValidIssuer"];

            var tokenValidationParameters = new TokenValidationParameters()
            {
                ValidateAudience = true,
                ValidAudience = ValidAudience,
                ValidateIssuer = true,
                ValidIssuer = ValidIssuer,

                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(SecretKey)),

                ValidateLifetime = false //should be false
            };

            JwtSecurityTokenHandler jwtSecurityTokenHandler = new JwtSecurityTokenHandler();

            ClaimsPrincipal principal = jwtSecurityTokenHandler.ValidateToken(token, tokenValidationParameters, out SecurityToken securityToken);

            if (securityToken is not JwtSecurityToken jwtSecurityToken || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
            {
                throw new SecurityTokenException("Invalid token");
            }

            return principal;
        }
    }
}
