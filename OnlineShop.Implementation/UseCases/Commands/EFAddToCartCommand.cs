using OnlineShop.Application.UseCases.Commands;
using OnlineShop.Application.UseCases.DTO;
using OnlineShop.DataAccess;
using OnlineShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Implementation.UseCases.Commands
{
    public class EFAddToCartCommand : IAddToCartCommand
    {
        private OnlineShopContext _context;
        public EFAddToCartCommand(OnlineShopContext context)
        {
            _context = context;
        }
        public int Id => 3;

        public string Name => "Entity Framework add product to cart.";

        public void Execute(AddCartDto request)
        {
            var cart = _context.Carts.Where(x => x.ProductId == request.ProductId && x.UserId == request.UserId).FirstOrDefault();

            if(cart != null)
            {
                cart.Quantity++;
            }
            else
            {
                var newCart = new Cart { 
                    ProductId = request.ProductId,
                    UserId = request.UserId,
                    Quantity = 1
                };

                _context.Carts.Add(newCart);
            }

            _context.SaveChanges();
        }
    }
}
