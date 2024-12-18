using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FragrantWorld.Models
{
    public class Order
    {
        public int OrderId { get; set; }

        public string OrderStatus { get; set; } = null!;

        public DateTime OrderDate { get; set; }

        public DateTime OrderDeliveryDate { get; set; }

        public short OrderPickupPoint { get; set; }

        public int? OrderUserId { get; set; } // А могли авторизацию делать 

        public short OrderPickupCode { get; set; }
    }
}
