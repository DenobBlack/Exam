using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FragrantWorld.Models
{
    public class PickupPoint
    {
        public short PickupPointId { get; set; }

        public string PickupPointAddress { get; set; } = null!;

        public int PickupPointMailIndex { get; set; }
    }
}
