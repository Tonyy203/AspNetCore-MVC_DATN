using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class Product
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public decimal? Price { get; set; }

    public string? Description { get; set; }

    public int? CategoryId { get; set; }

    public int? StockQuantity { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual ICollection<ProductDetail> ProductDetails { get; set; } = new List<ProductDetail>();

    public virtual ICollection<ProductImage> ProductImages { get; set; } = new List<ProductImage>();
}
