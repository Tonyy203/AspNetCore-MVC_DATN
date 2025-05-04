using System;
using System.Collections.Generic;

namespace WebsitePhoto.Models;

public partial class TbInvoice
{
    public int InvoiceId { get; set; }

    public bool? Status { get; set; }

    public int? SupplierId { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedDate { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? UpdateDate { get; set; }

    public DateTime? DeleteDate { get; set; }
}
