using System;

namespace EFCorePostgreSQL.Entities
{
	public class products
	{
		public int id { get; set; }
		public int author_id { get; set; }
		public string title { get; set; }
		public string body { get; set; }
		public decimal price { get; set; }		
		public bool stock { get; set; }
		public DateTime created_at { get; set; }
	}
}
