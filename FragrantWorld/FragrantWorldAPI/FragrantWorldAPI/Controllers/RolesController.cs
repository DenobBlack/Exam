using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FragrantWorldAPI.Contexts;
using FragrantWorldAPI.Models;

namespace FragrantWorldAPI.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly FragrantWorldDbContext _context;

        public RolesController(FragrantWorldDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Role>>> GetRoles()
        {
            return await _context.Roles.ToListAsync();
        }

        // GET: api/Roles/5
        [HttpGet("{login}")]
        public async Task<ActionResult<string>> GetRoleByUserLogin(string login)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u=>u.UserLogin == login);
            if (user == null) 
            {
                return NotFound();
            }
            var role = await _context.Roles.FindAsync(user.UserRole);

            if (role == null)
            {
                return NotFound();
            }

            return role.RoleName;
        }
    }
}
