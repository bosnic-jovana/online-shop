using Microsoft.EntityFrameworkCore;
using OnlineShop.Application.UseCases.DTO;
using OnlineShop.Application.UseCases.DTO.Searches;
using OnlineShop.Application.UseCases.Queries;
using OnlineShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Implementation.UseCases.Queries
{
    public class EFGetProductsQuery : IGetProductsQuery
    {
        private OnlineShopContext _context;
        public EFGetProductsQuery(OnlineShopContext context)
        {
            _context = context;
        }
        public int Id => 1;

        public string Name => "Entity Framework get products query";

        public IEnumerable<ProductDTO> Execute(ProductSearch search)
        {
            var query = _context.Products
                                .Include(x => x.Images)
                                .Include(x => x.Category)
                                .Include(x => x.ProductFeatures).ThenInclude(x => x.Feature)
                                .Include(x => x.ProductKeywords).ThenInclude(x => x.Keyword)
                                .AsQueryable();


            if (!string.IsNullOrEmpty(search.Keyword))
            {
                var kw = search.Keyword.ToLower();
                query = query.Where(x => x.Name.Contains(kw) || x.Description.Contains(kw));
            }

            if (search.CategoryId.HasValue)
            {
                query = query.Where(x => x.CategoryId == search.CategoryId);
            }

            if (!string.IsNullOrEmpty(search.Sort))
            {
                query = search.Sort == "asc" ? query.OrderBy(x => x.Price) : query.OrderByDescending(x => x.Price);
            }

            return query.Select(x => new ProductDTO
            {
                Id = x.ProdId,
                Name = x.Name,
                Description = x.Description,
                Features = "<p>" + string.Join("</p>\n <p>", x.ProductFeatures.Select(x => x.Feature.Text)) + "</p>\n",
                Price = x.Price,
                Keywords = string.Join(", ", x.ProductKeywords.Select(x => x.Keyword.Text)),
                Url = x.Url,
                Category = x.Category.ParentId != null ? x.Category.ParentCategory.Name : x.Category.Name,
                Subcategory = x.Category.Name,
                Images = x.Images.Select(x => x.Url).ToList()
            }).ToList();

        }
    }
}
