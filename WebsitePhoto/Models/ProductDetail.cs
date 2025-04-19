using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class ProductDetail
{
    public int Id { get; set; }

    public int? ProductId { get; set; }

    public string? SpecName { get; set; }

    public string? SpecValue { get; set; }

    public virtual Product? Product { get; set; }
}
