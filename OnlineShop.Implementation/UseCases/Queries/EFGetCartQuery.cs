using Microsoft.EntityFrameworkCore;
using OnlineShop.Application.UseCases.DTO;
using OnlineShop.Application.UseCases.Queries;
using OnlineShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Implementation.UseCases.Queries
{
    public class EFGetCartQuery : IGetCartQuery
    {
        private OnlineShopContext _context;
        public EFGetCartQuery(OnlineShopContext context)
        {
            _context = context;
        }
        public int Id => 5;

        public string Name => "Entity framework get cart by user id.";

        public CartDTO Execute(int id)
        {
            var cart = _context.Carts.Include(x => x.User).Include(x => x.Product)
                                        .Where(x => x.UserId == id).ToList();

            return new CartDTO {
                Items = cart.Select(x => new CartItem
                {
                    Id = x.Product.ProdId,
                    Name = x.Product.Name,
                    Price = x.Product.Price,
                    Quantity = x.Quantity
                }).ToList(),
                TotalPrice = cart.Sum(x => x.Product.Price * x.Quantity)
            };
        }
    }
}
