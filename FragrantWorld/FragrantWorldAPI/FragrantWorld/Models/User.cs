using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace FragrantWorld.Models
{
    public class User
    {
        public string UserLogin { get; set; } = null!;

        public string UserPassword { get; set; } = null!;
        public string UserFullName { get; set; }
        public string UserRole { get; set; }
    }
}
