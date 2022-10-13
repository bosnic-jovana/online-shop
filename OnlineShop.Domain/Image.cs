using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Domain
{
    public class Image : Entity
    {
        public string Url { get; set; }
        public int ProductId { get; set; }

        public virtual Product Product { get; set; }

    }
}
