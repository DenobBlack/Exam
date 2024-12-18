using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace FragrantWorldAPI.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public string OrderStatus { get; set; } = null!;

    public DateTime OrderDate { get; set; }

    public DateTime OrderDeliveryDate { get; set; }

    public short OrderPickupPoint { get; set; }

    [JsonIgnore]
    public int? OrderUserId { get; set; }

    public short OrderPickupCode { get; set; }

    public virtual PickupPoint OrderPickupPointNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();
    [JsonIgnore]
    public virtual User? OrderUser { get; set; }
}
