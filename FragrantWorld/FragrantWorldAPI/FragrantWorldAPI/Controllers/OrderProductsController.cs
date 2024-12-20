using FragrantWorldAPI.Contexts;
using FragrantWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FragrantWorldAPI.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator, Manager")]
    public class OrderProductsController : ControllerBase
    {
        private readonly FragrantWorldDbContext _context;

        public OrderProductsController(FragrantWorldDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<ActionResult<IEnumerable<OrderProduct>>> GetOrderProducts()
        {
            return await _context.OrderProducts.ToListAsync();
        }

        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<ActionResult<OrderProduct>> GetOrderProduct(int id)
        {
            var orderProduct = await _context.OrderProducts.FindAsync(id);

            if (orderProduct == null)
            {
                return NotFound();
            }

            return orderProduct;
        }

        [HttpPut("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> PutOrderProduct(int id, OrderProductDto orderProductDto)
        {
            if (id != orderProductDto.OrderId)
            {
                return BadRequest();
            }
            var orderProduct = await _context.OrderProducts.FirstOrDefaultAsync(op => op.ProductArticleNumber == orderProductDto.ProductArticleNumber 
            && op.OrderId == orderProductDto.OrderId); 
            orderProduct.ProductAmount = orderProductDto.ProductAmount;
            _context.Entry(orderProduct).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderProductExists(id))
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
        public async Task<ActionResult<OrderProduct>> PostOrderProduct(OrderProductDto orderProductDto)
        {
            OrderProduct orderProduct = new()
            {
                OrderId = 0,
                ProductAmount = orderProductDto.ProductAmount,
                ProductArticleNumber = orderProductDto.ProductArticleNumber,
                Order = await _context.Orders.FindAsync(orderProductDto.OrderId),
                ProductArticleNumberNavigation = await _context.Products.FindAsync(orderProductDto.ProductArticleNumber)
            };
            _context.OrderProducts.Add(orderProduct);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OrderProductExists(orderProduct.OrderId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetOrderProduct", new { id = orderProduct.OrderId }, orderProduct);
        }

        [HttpDelete("{id}/{article}")]
        public async Task<IActionResult> DeleteOrderProduct(int id, string article)
        {
            var orderProduct = await _context.OrderProducts.FindAsync(id, article);
            if (orderProduct == null)
            {
                return NotFound();
            }

            _context.OrderProducts.Remove(orderProduct);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OrderProductExists(int id)
        {
            return _context.OrderProducts.Any(e => e.OrderId == id);
        }
    }
}
