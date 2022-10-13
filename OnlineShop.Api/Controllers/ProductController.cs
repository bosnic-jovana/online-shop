using Microsoft.AspNetCore.Mvc;
using OnlineShop.Application.UseCases.DTO.Searches;
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
    public class ProductController : ControllerBase
    {
        // GET: api/<ProductController>
        [HttpGet]
        public IActionResult Get([FromServices] IGetProductsQuery query, [FromQuery] ProductSearch search)
        {
            var response = query.Execute(search);
            return Ok(response);
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IFindProductQuery query)
        {
            var response = query.Execute(id);
            return Ok(response);
        }

    }
}
