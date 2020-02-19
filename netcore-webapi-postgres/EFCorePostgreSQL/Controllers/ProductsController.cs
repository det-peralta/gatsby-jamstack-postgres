using EFCorePostgreSQL.Entities;
using Microsoft.AspNetCore.Mvc;
using System;

namespace EFCorePostgreSQL.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ProductsController : ControllerBase
	{
		private readonly ApplicationContext _context;

		public ProductsController(ApplicationContext context)
		{
			_context = context;
		}

		[HttpGet]
		public IActionResult Get()
		{
			var products = _context.products;
			return Ok(products);
		}

		[HttpGet("{id}", Name = "")]
		public IActionResult GetById(string id)
		{
			var product = _context.Find<products>(Convert.ToInt32(id));
			return Ok(product.stock);		}

		[HttpPost]
		public IActionResult Post([FromBody] products product)
		{			_context.Add(product);

			_context.SaveChanges();

			return CreatedAtRoute(nameof(GetById), new { id = product.id}, product);
		}
	}
}
