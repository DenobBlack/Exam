using FragrantWorld.Models;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace FragrantWorld.Services
{
    public class PickupPointService
    {
        private HttpClient _client = new() { BaseAddress = new Uri("http://localhost:5172/api/v1/") };

        public async Task<List<PickupPoint>> GetPickupPointsAsync()
        {
            var response = await _client.GetAsync("PickupPoints");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<List<PickupPoint>>();
        }
    }
}
