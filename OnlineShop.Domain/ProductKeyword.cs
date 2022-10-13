using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Domain
{
    public class ProductKeyword
    {
        public int ProductId { get; set; }
        public int KeywordId { get; set; }

        public virtual Product Product { get; set; }
        public virtual Keyword Keyword { get; set; }
    }
}
