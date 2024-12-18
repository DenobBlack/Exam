using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace FragrantWorldAPI.Models;

public partial class OrderProduct
{
    public int OrderId { get; set; }

    public string ProductArticleNumber { get; set; } = null!;

    public byte ProductAmount { get; set; }
    public virtual Order Order { get; set; } = null!;

    public virtual Product ProductArticleNumberNavigation { get; set; } = null!;
}
