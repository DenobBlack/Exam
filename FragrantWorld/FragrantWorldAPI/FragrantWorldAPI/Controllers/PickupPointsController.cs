using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FragrantWorldAPI.Contexts;
using FragrantWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;

namespace FragrantWorldAPI.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class PickupPointsController : ControllerBase
    {
        private readonly FragrantWorldDbContext _context;

        public PickupPointsController(FragrantWorldDbContext context)
        {
            _context = context;
        }

        // GET: api/PickupPoints
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PickupPoint>>> GetPickupPoints()
        {
            return await _context.PickupPoints.ToListAsync();
        }

        // GET: api/PickupPoints/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PickupPoint>> GetPickupPoint(short id)
        {
            var pickupPoint = await _context.PickupPoints.FindAsync(id);

            if (pickupPoint == null)
            {
                return NotFound();
            }

            return pickupPoint;
        }

        // PUT: api/PickupPoints/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [Authorize(Roles = "Administrator, Manager")]
        public async Task<IActionResult> PutPickupPoint(short id, PickupPoint pickupPoint)
        {
            if (id != pickupPoint.PickupPointId)
            {
                return BadRequest();
            }

            _context.Entry(pickupPoint).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PickupPointExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        [Authorize(Roles = "Administrator, Manager")]
        public async Task<ActionResult<PickupPoint>> PostPickupPoint(PickupPoint pickupPoint)
        {
            _context.PickupPoints.Add(pickupPoint);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPickupPoint", new { id = pickupPoint.PickupPointId }, pickupPoint);
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Administrator, Manager")]
        public async Task<IActionResult> DeletePickupPoint(short id)
        {
            var pickupPoint = await _context.PickupPoints.FindAsync(id);
            if (pickupPoint == null)
            {
                return NotFound();
            }

            _context.PickupPoints.Remove(pickupPoint);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PickupPointExists(short id)
        {
            return _context.PickupPoints.Any(e => e.PickupPointId == id);
        }
    }
}
