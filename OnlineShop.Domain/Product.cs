using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Domain
{
    public class Product : Entity
    {
        public string ProdId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public decimal Price { get; set; }
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<Image> Images { get; set; } = new List<Image>();
        public virtual ICollection<Cart> Carts { get; set; } = new List<Cart>();
        public virtual ICollection<ProductFeature> ProductFeatures { get; set; } = new List<ProductFeature>();
        public virtual ICollection<ProductKeyword> ProductKeywords { get; set; } = new List<ProductKeyword>();


    }
}
