using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Application.UseCases.DTO
{
    public class CartDTO
    {
        public IEnumerable<CartItem> Items { get; set; }
        public decimal TotalPrice { get; set; }

    }

    public class CartItem
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}
