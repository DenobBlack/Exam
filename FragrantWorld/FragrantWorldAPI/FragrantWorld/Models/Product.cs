namespace FragrantWorld.Models
{
    public class Product
    {
        public string ProductArticleNumber { get; set; } = null!;

        public string ProductName { get; set; } = null!;

        public string ProductDescription { get; set; } = null!;

        public string ProductCategory { get; set; } = null!;

        public byte[]? ProductPhoto { get; set; }

        public string ProductManufacturer { get; set; } = null!;

        public decimal ProductCost { get; set; }

        public decimal ProductCostWithDiscount { get =>
                ProductDiscountAmount != null? ProductCost - ProductCost * ((decimal)ProductDiscountAmount / 100) : ProductCost;
            set { } } 

        public byte? ProductDiscountAmount { get; set; }

        public int ProductQuantityInStock { get; set; }

        public string ProductStatus { get; set; } = null!;
        public int Amount { get; set; }
    }
}
