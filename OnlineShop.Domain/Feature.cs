using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Domain
{
    public class Feature : Entity
    {
        public string Text { get; set; }
        public virtual ICollection<ProductFeature> ProductFeatures { get; set; } = new List<ProductFeature>();
    }
}
