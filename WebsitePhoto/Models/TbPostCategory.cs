using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class TbPostCategory
{
    public int CateId { get; set; }

    public string? Name { get; set; }

    public string? SeoTitle { get; set; }

    public bool? Status { get; set; }

    public int? Sort { get; set; }

    public int? ParentId { get; set; }

    public string? MetaKeywords { get; set; }

    public string? MetaDescriptions { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedDate { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdateDate { get; set; }
}
