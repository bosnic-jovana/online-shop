using OnlineShop.Application.UseCases.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineShop.Application.UseCases.Commands
{
    public interface IAddToCartCommand : ICommand<AddCartDto>
    {
    }
}
