namespace FragrantWorldAPI.Models
{
    public class OrderProductDto
    {
        public int OrderId { get; set; }

        public string ProductArticleNumber { get; set; } = null!;

        public byte ProductAmount { get; set; }
    }
}
