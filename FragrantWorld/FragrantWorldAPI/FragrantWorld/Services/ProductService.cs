using FragrantWorld.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace FragrantWorld.Services
{
    public class ProductService
    {
        private HttpClient _client = new() { BaseAddress = new Uri("http://localhost:5172/api/v1/") };

        public async Task<List<Product>> GetProductsAsync()
        {
            var response = await _client.GetAsync("Products");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<List<Product>>();
        }

        public async Task<List<Product>> GetProductsByOrderProductsAsync(List<OrderProduct> orderProducts)
        {
            var products = await GetProductsAsync();
            return products.Where(p => orderProducts.Any(op => op.ProductArticleNumber == p.ProductArticleNumber)).ToList();
        }
    }
}
