using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FragrantWorld.Models
{
    public class OrderProduct
    {
        public int OrderId { get; set; }

        public string ProductArticleNumber { get; set; } = null!;

        public byte ProductAmount { get; set; }
    }
}
