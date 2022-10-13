using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Domain
{
    public class ProductFeature
    {
        public int ProductId { get; set; }
        public int FeatureId { get; set; }

        public virtual Product Product { get; set; }
        public virtual Feature Feature { get; set; }
    }
}
