using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace FragrantWorldAPI.Models;

public partial class PickupPoint
{
    public short PickupPointId { get; set; }

    public string PickupPointAddress { get; set; } = null!;

    public int PickupPointMailIndex { get; set; }

    [JsonIgnore]
    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
