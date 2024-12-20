using System.Net.Http;
using System;
using System.Collections.Generic;
using System.Net.Http.Json;
using System.Threading.Tasks;
using System.Security.RightsManagement;
using FragrantWorld.Models;
using System.Net.Http.Headers;

namespace FragrantWorld.Services
{
    public class AuthorizationService
    {
        private HttpClient _client = new() { BaseAddress = new Uri("http://localhost:5172/api/v1/") };
        public async Task Login(User user)
        {
            var response = await _client.PostAsJsonAsync("Account", user);
            response.EnsureSuccessStatusCode();
            var token = await response.Content.ReadAsStringAsync();
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
        public async Task<string> GetUserFullname(User user)
        {
            var response = await _client.GetAsync($"Account/{user.UserLogin}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsStringAsync();
        }
        public async Task<string> GetUserRole(User user)
        {
            var response = await _client.GetAsync($"Roles/{user.UserLogin}");
            response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsStringAsync();
        }
    }
}
