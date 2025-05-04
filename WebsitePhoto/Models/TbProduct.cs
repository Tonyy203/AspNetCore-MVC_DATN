using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class TbProduct
{
    public int ProductId { get; set; }

    public string? Name { get; set; }

    public string? SeoTitle { get; set; }

    public bool? Status { get; set; }

    public string? Image { get; set; }

    public string? ListImages { get; set; }

    public decimal? Price { get; set; }

    public decimal? PromotionPrice { get; set; }

    public bool? Vat { get; set; }

    public int? Quantity { get; set; }

    public int? Warranty { get; set; }

    public DateTime? Hot { get; set; }

    public string? Desription { get; set; }

    public string? Detail { get; set; }

    public int? ViewCount { get; set; }

    public int? CateId { get; set; }

    public int? BrandId { get; set; }

    public int? SupplierId { get; set; }

    public string? MetaKeywords { get; set; }

    public string? MetaDescriptions { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedDate { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdateDate { get; set; }
}
