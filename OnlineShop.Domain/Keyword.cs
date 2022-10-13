using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Domain
{
    public class Keyword : Entity
    {
        public string Text { get; set; }

        public virtual ICollection<ProductKeyword> ProductKeywords { get; set; } = new List<ProductKeyword>();
    }
}
