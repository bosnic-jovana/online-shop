using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Application.UseCases.DTO
{
    public class ProductDTO
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Features { get; set; }
        public decimal Price { get; set; }
        public string Keywords { get; set; }
        public string Url { get; set; }
        public string Category { get; set; }
        public string Subcategory { get; set; }
        public IEnumerable<string> Images { get; set; } 
       
    }
}
