using EFCorePostgreSQL.Entities;
using Microsoft.EntityFrameworkCore;

namespace EFCorePostgreSQL
{
	public class ApplicationContext : DbContext
	{
		public ApplicationContext(DbContextOptions options)
				: base(options)
		{
		}

		public DbSet<products> products { get; set; }
	}
}
