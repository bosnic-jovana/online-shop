using Microsoft.EntityFrameworkCore;
using OnlineShop.Application.Exceptions;
using OnlineShop.Application.UseCases.DTO;
using OnlineShop.Application.UseCases.Queries;
using OnlineShop.DataAccess;
using OnlineShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Implementation.UseCases.Queries
{
    public class EFFindProductQuery : IFindProductQuery
    {
        private OnlineShopContext _context;
        public EFFindProductQuery(OnlineShopContext context)
        {
            _context = context;
        }
        public int Id => 2;

        public string Name => "Entity Framework find product by id";

        public ProductDTO Execute(int id)
        {
            var query = _context.Products
                               .Include(x => x.Images)
                               .Include(x => x.Category)
                               .Include(x => x.ProductFeatures).ThenInclude(x => x.Feature)
                               .Include(x => x.ProductKeywords).ThenInclude(x => x.Keyword)
                               .FirstOrDefault(x => x.Id == id);

            if (query == null)
            {
                throw new EntityNotFoundException(nameof(Product), id);
            }

            return new ProductDTO
            {
                Id = query.ProdId,
                Name = query.Name,
                Description = query.Description,
                Features = "<p>" + string.Join("</p>\n <p>", query.ProductFeatures.Select(x => x.Feature.Text)) + "</p>\n",
                Price = query.Price,
                Keywords = string.Join(", ", query.ProductKeywords.Select(x => x.Keyword.Text)),
                Url = query.Url,
                Category = query.Category.ParentId != null ? query.Category.ParentCategory.Name : query.Category.Name,
                Subcategory = query.Category.Name,
                Images = query.Images.Select(x => x.Url).ToList()
            };
        }
    }
}
