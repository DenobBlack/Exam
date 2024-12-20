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
    [Authorize(Roles = "Администратор")]
    public class OrdersController : ControllerBase
    {
        private readonly FragrantWorldDbContext _context;

        public OrdersController(FragrantWorldDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Order>>> GetOrders()
        {
            return await _context.Orders.Include(o=>o.OrderProducts).ToListAsync();
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrder(int id)
        {
            var order = await _context.Orders.FindAsync(id);

            if (order == null)
            {
                return NotFound();
            }

            return order;
        }

        [HttpPut("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> PutOrder(int id, OrderDto orderDto)
        {
            if (id != orderDto.OrderId)
            {
                return BadRequest();
            }
            var order = await _context.Orders.FindAsync(orderDto.OrderId);
            order.OrderPickupPoint = orderDto.OrderPickupPoint;
            order.OrderPickupCode = orderDto.OrderPickupCode;
            _context.Entry(order).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderExists(id))
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
        [AllowAnonymous]
        public async Task<ActionResult<Order>> PostOrder(OrderDto orderDto)
        {
            Order order = new() { OrderId = orderDto.OrderId, OrderDate = orderDto.OrderDate, OrderDeliveryDate = orderDto.OrderDeliveryDate, 
                OrderPickupCode = orderDto.OrderPickupCode,OrderPickupPoint = orderDto.OrderPickupPoint, OrderStatus=orderDto.OrderStatus, 
                OrderUserId = orderDto.OrderUserId, OrderPickupPointNavigation = await _context.PickupPoints.FindAsync(orderDto.OrderPickupPoint) };
            _context.Orders.Add(order);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOrder", new { id = order.OrderId }, order);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrder(int id)
        {
            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }

            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OrderExists(int id)
        {
            return _context.Orders.Any(e => e.OrderId == id);
        }
    }
}
