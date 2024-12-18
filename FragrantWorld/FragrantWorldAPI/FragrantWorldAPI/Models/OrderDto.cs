namespace FragrantWorldAPI.Models
{
    public class OrderDto
    {
        public int OrderId { get; set; }

        public string OrderStatus { get; set; } = null!;

        public DateTime OrderDate { get; set; }

        public DateTime OrderDeliveryDate { get; set; }

        public short OrderPickupPoint { get; set; }

        public int? OrderUserId { get; set; }

        public short OrderPickupCode { get; set; }
    }
}
