using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class TbAbout
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public string? Detail { get; set; }

    public bool? Status { get; set; }

    public string? MetaKeywords { get; set; }

    public string? MetaDescriptions { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedDate { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdateDate { get; set; }
}
