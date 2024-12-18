using FragrantWorld.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace FragrantWorld.Services
{
    public class OrderService
    {
        private HttpClient _client = new() { BaseAddress = new Uri("http://localhost:5172/api/v1/") };

        public async Task<List<OrderProduct>> GetOrderProductsByOrderAsync(Order order)
        {
            var response = await _client.GetAsync("OrderProducts");
            response.EnsureSuccessStatusCode();
            var orderProducts = await response.Content.ReadFromJsonAsync<List<OrderProduct>>();
            return orderProducts.Where(p => p.OrderId == order.OrderId).ToList();
        }

        public async Task<Order> AddOrderAsync(Order order)
        {
            var response = await _client.PostAsJsonAsync("Orders", order);
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<Order>();
        }

        public async Task AddProductToOrderAsync(OrderProduct orderProduct)
        {
            var response = await _client.PostAsJsonAsync("OrderProducts", orderProduct);
            response.EnsureSuccessStatusCode();
        }

        public async Task UpdateProductOrderAsync(OrderProduct orderProduct)
        {
            var response = await _client.PutAsJsonAsync($"OrderProducts/{orderProduct.OrderId}", orderProduct);
            response.EnsureSuccessStatusCode();
        }

        public async Task UpdateOrderAsync(Order order)
        {
            var response = await _client.PutAsJsonAsync($"Orders/{order.OrderId}", order);
            response.EnsureSuccessStatusCode();
        }

        public async Task DeleteProductFromOrderAsync(OrderProduct orderProduct)
        {
            var response = await _client.DeleteAsync($"OrderProducts/{orderProduct.OrderId}/{orderProduct.ProductArticleNumber}");
            response.EnsureSuccessStatusCode();
        }
    }
}
