using Microsoft.AspNetCore.Mvc;
using OnlineShop.Application.UseCases.Commands;
using OnlineShop.Application.UseCases.DTO;
using OnlineShop.Application.UseCases.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace OnlineShop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        // GET api/<CartController>/5
        [HttpGet("{id}")]
        public IActionResult Get([FromServices] IGetCartQuery query, int id)
        {
            var response = query.Execute(id);
            return Ok(response);
        }

        // POST api/<CartController>
        [HttpPost]
        public IActionResult Post([FromBody] AddCartDto dto, [FromServices] IAddToCartCommand command)
        {
            command.Execute(dto);
            return NoContent();
        }

        // DELETE api/<CartController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IRemoveFromCartCommand command)
        {
            command.Execute(id);
            return NoContent();
        }
    }
}
