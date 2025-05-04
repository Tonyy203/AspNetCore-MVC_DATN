using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class TbPostTag
{
    public int PostId { get; set; }

    public string TagId { get; set; } = null!;
}
