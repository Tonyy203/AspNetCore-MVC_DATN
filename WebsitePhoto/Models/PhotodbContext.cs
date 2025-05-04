using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using WebsitePhoto.Areas.Admin.Models;

namespace WebsitePhoto.Models;

public partial class PhotodbContext : DbContext
{
    public PhotodbContext()
    {
    }

    public PhotodbContext(DbContextOptions<PhotodbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Login> Logins { get; set; }
    public virtual DbSet<TbAbout> TbAbouts { get; set; }

    public virtual DbSet<TbBrand> TbBrands { get; set; }

    public virtual DbSet<TbConfig> TbConfigs { get; set; }

    public virtual DbSet<TbContact> TbContacts { get; set; }

    public virtual DbSet<TbFeedback> TbFeedbacks { get; set; }

    public virtual DbSet<TbInvoice> TbInvoices { get; set; }

    public virtual DbSet<TbInvoiceDetail> TbInvoiceDetails { get; set; }

    public virtual DbSet<TbMenu> TbMenus { get; set; }

    public virtual DbSet<TbOrder> TbOrders { get; set; }

    public virtual DbSet<TbOrderDetail> TbOrderDetails { get; set; }

    public virtual DbSet<TbPost> TbPosts { get; set; }

    public virtual DbSet<TbPostCategory> TbPostCategories { get; set; }

    public virtual DbSet<TbPostComment> TbPostComments { get; set; }

    public virtual DbSet<TbPostTag> TbPostTags { get; set; }

    public virtual DbSet<TbProduct> TbProducts { get; set; }

    public virtual DbSet<TbProductCategory> TbProductCategories { get; set; }

    public virtual DbSet<TbProductComment> TbProductComments { get; set; }

    public virtual DbSet<TbSlide> TbSlides { get; set; }

    public virtual DbSet<TbSupplier> TbSuppliers { get; set; }

    public virtual DbSet<TbTag> TbTags { get; set; }

    public virtual DbSet<TbUser> TbUsers { get; set; }
    public IEnumerable<object> TbProduct { get; internal set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-6BCPVPQ;Database=Photodb;Trusted_Connection=True;MultipleActiveResultSets=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Nếu Login không phải là entity với khóa chính
        modelBuilder.Entity<Login>().HasNoKey();
        modelBuilder.Entity<TbAbout>(entity =>
        {
            entity.ToTable("tb_About");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.Detail).HasColumnType("ntext");
            entity.Property(e => e.MetaDescriptions).HasMaxLength(250);
            entity.Property(e => e.MetaKeywords).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbBrand>(entity =>
        {
            entity.ToTable("tb_Brand");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<TbConfig>(entity =>
        {
            entity.ToTable("tb_Config");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Type).HasMaxLength(50);
            entity.Property(e => e.Value).HasMaxLength(50);
        });

        modelBuilder.Entity<TbContact>(entity =>
        {
            entity.ToTable("tb_Contact");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Detail).HasColumnType("ntext");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<TbFeedback>(entity =>
        {
            entity.ToTable("tb_Feedback");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.Detail).HasMaxLength(500);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(150);
            entity.Property(e => e.Phone).HasMaxLength(50);
        });

        modelBuilder.Entity<TbInvoice>(entity =>
        {
            entity.HasKey(e => e.InvoiceId);

            entity.ToTable("tb_Invoice");

            entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeleteDate).HasColumnType("datetime");
            entity.Property(e => e.SupplierId).HasColumnName("SupplierID");
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbInvoiceDetail>(entity =>
        {
            entity.HasKey(e => new { e.InvoiceId, e.ProductId });

            entity.ToTable("tb_InvoiceDetail");

            entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.ProductName).HasMaxLength(50);
        });

        modelBuilder.Entity<TbMenu>(entity =>
        {
            entity.ToTable("tb_Menu");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Link).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.Taget).HasMaxLength(50);
        });

        modelBuilder.Entity<TbOrder>(entity =>
        {
            entity.HasKey(e => e.OrderId);

            entity.ToTable("tb_Orders");

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.DeliveryDate).HasColumnType("datetime");
            entity.Property(e => e.OrderDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbOrderDetail>(entity =>
        {
            entity.HasKey(e => new { e.OrderId, e.ProductId });

            entity.ToTable("tb_OrderDetail");

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.ProductName).HasMaxLength(50);
        });

        modelBuilder.Entity<TbPost>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("tb_Post");

            entity.Property(e => e.CateId).HasColumnName("CateID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Desription).HasMaxLength(500);
            entity.Property(e => e.Detail).HasColumnType("ntext");
            entity.Property(e => e.Image).HasMaxLength(250);
            entity.Property(e => e.MetaDescriptions).HasMaxLength(250);
            entity.Property(e => e.MetaKeywords).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.PostId).HasColumnName("PostID");
            entity.Property(e => e.SeoTitle).HasMaxLength(250);
            entity.Property(e => e.Status).HasDefaultValue(true);
            entity.Property(e => e.Tags).HasMaxLength(250);
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbPostCategory>(entity =>
        {
            entity.HasKey(e => e.CateId);

            entity.ToTable("tb_PostCategory");

            entity.Property(e => e.CateId).HasColumnName("CateID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.MetaDescriptions).HasMaxLength(250);
            entity.Property(e => e.MetaKeywords).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.SeoTitle).HasMaxLength(250);
            entity.Property(e => e.Status).HasDefaultValue(true);
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbPostComment>(entity =>
        {
            entity.HasKey(e => e.CommentId);

            entity.ToTable("tb_PostComment");

            entity.Property(e => e.CommentId).HasColumnName("CommentID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Detail).HasMaxLength(500);
            entity.Property(e => e.Email).HasMaxLength(150);
            entity.Property(e => e.Name).HasMaxLength(150);
            entity.Property(e => e.PostId).HasColumnName("PostID");
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbPostTag>(entity =>
        {
            entity.HasKey(e => new { e.PostId, e.TagId });

            entity.ToTable("tb_PostTag");

            entity.Property(e => e.PostId).HasColumnName("PostID");
            entity.Property(e => e.TagId)
                .HasMaxLength(50)
                .HasColumnName("TagID");
        });

        modelBuilder.Entity<TbProduct>(entity =>
        {
            entity.HasKey(e => e.ProductId);

            entity.ToTable("tb_Product");

            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.BrandId).HasColumnName("BrandID");
            entity.Property(e => e.CateId).HasColumnName("CateID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Desription).HasMaxLength(500);
            entity.Property(e => e.Detail).HasColumnType("ntext");
            entity.Property(e => e.Hot).HasColumnType("datetime");
            entity.Property(e => e.Image).HasMaxLength(250);
            entity.Property(e => e.ListImages).HasColumnType("xml");
            entity.Property(e => e.MetaDescriptions).HasMaxLength(250);
            entity.Property(e => e.MetaKeywords).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.Price)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 0)");
            entity.Property(e => e.PromotionPrice)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Quantity).HasDefaultValue(0);
            entity.Property(e => e.SeoTitle).HasMaxLength(250);
            entity.Property(e => e.Status).HasDefaultValue(true);
            entity.Property(e => e.SupplierId).HasColumnName("SupplierID");
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            entity.Property(e => e.Vat).HasColumnName("VAT");
            entity.Property(e => e.Warranty).HasDefaultValue(0);
        });

        modelBuilder.Entity<TbProductCategory>(entity =>
        {
            entity.HasKey(e => e.CateId);

            entity.ToTable("tb_ProductCategory");

            entity.Property(e => e.CateId).HasColumnName("CateID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.MetaDescriptions).HasMaxLength(250);
            entity.Property(e => e.MetaKeywords).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.SeoTitle).HasMaxLength(250);
            entity.Property(e => e.Status).HasDefaultValue(true);
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbProductComment>(entity =>
        {
            entity.HasKey(e => e.CommentId);

            entity.ToTable("tb_ProductComment");

            entity.Property(e => e.CommentId).HasColumnName("CommentID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Detail).HasMaxLength(500);
            entity.Property(e => e.Email).HasMaxLength(150);
            entity.Property(e => e.Name).HasMaxLength(150);
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.UpdateDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbSlide>(entity =>
        {
            entity.ToTable("tb_Slide");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Image).HasMaxLength(50);
            entity.Property(e => e.Link).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<TbSupplier>(entity =>
        {
            entity.ToTable("tb_Supplier");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(50);
        });

        modelBuilder.Entity<TbTag>(entity =>
        {
            entity.ToTable("tb_Tag");

            entity.Property(e => e.Id)
                .HasMaxLength(50)
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(500);
        });

        modelBuilder.Entity<TbUser>(entity =>
        {
            entity.ToTable("tb_User");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FullName).HasMaxLength(50);
            entity.Property(e => e.Image).HasMaxLength(50);
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(15);
            entity.Property(e => e.Status).HasDefaultValue(true);
            entity.Property(e => e.UpdatedDate).HasColumnType("datetime");
            entity.Property(e => e.UserName).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
