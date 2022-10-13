using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Application.UseCases.DTO.Searches
{
    public class ProductSearch
    {
        public string Keyword { get; set; }
        public int? CategoryId { get; set; }
        public string? Sort { get; set; }
    }
}
