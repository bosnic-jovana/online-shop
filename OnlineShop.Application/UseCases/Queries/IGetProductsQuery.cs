using OnlineShop.Application.UseCases.DTO;
using OnlineShop.Application.UseCases.DTO.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Application.UseCases.Queries
{

    public interface IGetProductsQuery : IQuery<ProductSearch, IEnumerable<ProductDTO>>
    {
    }
}
