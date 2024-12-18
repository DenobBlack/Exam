using System;
using System.Collections.Generic;

namespace FragrantWorldAPItest.Models;

public partial class PickupPoint
{
    public short PickupPointId { get; set; }

    public string PickupPointAddress { get; set; } = null!;

    public int PickupPointMailIndex { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
