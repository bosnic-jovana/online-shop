using OnlineShop.Application.Exceptions;
using OnlineShop.Application.UseCases.Commands;
using OnlineShop.DataAccess;
using OnlineShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Implementation.UseCases.Commands
{
    public class EFRemoveFromCartCommand : IRemoveFromCartCommand
    {
        private OnlineShopContext _context;
        public EFRemoveFromCartCommand(OnlineShopContext context)
        {
            _context = context;
        }
        public int Id => 4;

        public string Name => "Entity Framework remove product from cart.";

        public void Execute(int request)
        {
            var cart = _context.Carts.FirstOrDefault(x => x.Id == request);

            if (cart == null)
            {
                throw new EntityNotFoundException(nameof(Cart), request);
            }

            if(cart.Quantity > 1)
            {
                cart.Quantity--;
            }
            else
            {
                _context.Carts.Remove(cart);
            }

            _context.SaveChanges();
        }
    }
}
