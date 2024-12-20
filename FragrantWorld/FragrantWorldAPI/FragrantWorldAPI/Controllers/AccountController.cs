using FragrantWorldAPI.Contexts;
using FragrantWorldAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace FragrantWorldAPI.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly FragrantWorldDbContext _context;

        public AccountController(FragrantWorldDbContext context)
        {
            _context = context;
        }
        [HttpGet("{login}")]
        public async Task<ActionResult<string>> GetFullNameUser(string login)
        {
            User user = await _context.Users.FirstOrDefaultAsync(user => user.UserLogin == login);
            if (user == null)
            {
                return BadRequest("Пользователь не найден");
            }
            return String.Join(" ",user.UserSurname,user.UserName,user.UserPatronymic);
        }
        
        [HttpPost]
        public async Task<ActionResult<string>> AuthorizationUser(UserDto userDto)
        {
            User user = await _context.Users.FirstOrDefaultAsync(user => user.UserLogin == userDto.UserLogin);
            if (user == null)
            {
                return BadRequest("Пользователь не найден");
            }
            if (user.UserPassword != userDto.UserPassword)
            {
                return BadRequest("Пароль не совпадает");
            }
            return GenerateToken(user);
        }
        private string GenerateToken(User user)
        {
            var securityKey = AuthOptions.GetSymmetricSecurityKey();
            var credetial = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            Dictionary<string, string> roles = new();
            roles["Администратор"] = "Administrator";
            roles["Менеджер"] = "Manager";
            roles["Клиент"] = "Client";
            List<Claim> claims = new List<Claim>(){
                    new Claim("UserId",Convert.ToString(user.UserId)),
                    new Claim("UserName", user.UserName),
                    new Claim("UserPassword", user.UserPassword),
                    new Claim("Role", roles[_context.Roles.Find(user.UserRole).RoleName])
            };
            var token = new JwtSecurityToken
                (
                AuthOptions.Issuer,
                AuthOptions.Audience,
                claims,
                expires: DateTime.UtcNow.AddHours(1),
                signingCredentials: credetial
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

    }
}
