USE [Photodb]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_About]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_About](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Brand]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_tb_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Config]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tb_Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Contact]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tb_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Feedback]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Detail] [nvarchar](500) NULL,
 CONSTRAINT [PK_tb_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Invoice]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
	[SupplierID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_InvoiceDetail]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_InvoiceDetail](
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tb_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Menu]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Link] [nvarchar](250) NULL,
	[Taget] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_tb_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_OrderDetail]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tb_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Orders]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Delivered] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_tb_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Post]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Post](
	[PostID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Image] [nvarchar](250) NULL,
	[Desription] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[ViewCount] [int] NULL,
	[CateID] [int] NULL,
	[Tags] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_PostCategory]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_PostCategory](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Sort] [int] NULL,
	[ParentID] [int] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_PostCategory] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_PostComment]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_PostComment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Detail] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[PostID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_PostComment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_PostTag]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_PostTag](
	[PostID] [int] NOT NULL,
	[TagID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_PostTag] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Product]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Image] [nvarchar](250) NULL,
	[ListImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[VAT] [bit] NULL,
	[Quantity] [int] NULL,
	[Warranty] [int] NULL,
	[Hot] [datetime] NULL,
	[Desription] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[ViewCount] [int] NULL,
	[CateID] [int] NULL,
	[BrandID] [int] NULL,
	[SupplierID] [int] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ProductCategory]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ProductCategory](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Sort] [int] NULL,
	[ParentID] [int] NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ProductComment]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ProductComment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Detail] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[ProductID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_ProductComment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Slide]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Sort] [int] NULL,
	[Link] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tb_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Supplier]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Tag]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Tag](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_tb_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_User]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Address] [nvarchar](250) NULL,
	[Image] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tb_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCart]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCartItem]    Script Date: 5/5/2025 12:02:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCartItem](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[TotalPrice]  AS ([Price]*[Quantity]),
PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [Username], [Password]) VALUES (1, N'admin', N'123456')
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Orders] ON 

INSERT [dbo].[tb_Orders] ([OrderID], [OrderDate], [Status], [Delivered], [DeliveryDate], [CustomerID], [Discount]) VALUES (1, CAST(N'2025-07-11T12:00:00.000' AS DateTime), NULL, NULL, NULL, 1, 10)
SET IDENTITY_INSERT [dbo].[tb_Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Product] ON 

INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (3, N'Ricoh M2701', N'ricoh-m2701', 1, N'/assets/img/Products/1.png', NULL, CAST(45000000 AS Decimal(18, 0)), CAST(40000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In mạng, Quét màu. 27 trang/phút.', N'Máy Ricoh tốc độ 27ppm.', 0, 1, 1, 1, N'ricoh, m2701', N'Ricoh M2701 máy in đa chức năng', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (4, N'Ricoh IM2702', N'ricoh-im2702', 1, N'/assets/img/Products/2.png', NULL, CAST(65000000 AS Decimal(18, 0)), CAST(54000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu. 45 trang/phút.', N'Máy photocopy cao cấp Ricoh.', 0, 1, 1, 1, N'ricoh, im2702', N'Ricoh IM2702 cho văn phòng lớn', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (5, N'Ricoh IM 2500', N'ricoh-im2500', 1, N'/assets/img/Products/3.png', NULL, CAST(97000000 AS Decimal(18, 0)), CAST(78000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Photocopy, In, Scan. 25 trang/phút.', N'Dòng máy Ricoh IM 2500 đa chức năng.', 0, 1, 1, 1, N'ricoh, im2500', N'Máy photocopy Ricoh IM 2500', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (6, N'Ricoh MP 305', N'ricoh-mp-305', 1, N'/assets/img/Products/10.png', NULL, CAST(48000000 AS Decimal(18, 0)), CAST(42000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy photocopy nhỏ gọn Ricoh MP 305+. 30 trang/phút.', N'Dành cho văn phòng vừa và nhỏ.', 0, 1, 1, 1, N'ricoh, mp305', N'Ricoh MP 305+ nhỏ gọn tiện lợi.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (7, N'Ricoh IM C3000', N'ricoh-im-c3000', 1, N'/assets/img/Products/11.png', NULL, CAST(102000000 AS Decimal(18, 0)), CAST(89500000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy photocopy màu Ricoh IM C3000. 30 trang/phút.', N'Máy đa năng, tốc độ trung bình.', 0, 1, 1, 1, N'ricoh, imc3000', N'Máy in màu Ricoh cao cấp.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (8, N'Ricoh SP 6430DN', N'ricoh-sp6430dn', 1, N'/assets/img/Products/20.png', NULL, CAST(38000000 AS Decimal(18, 0)), CAST(33500000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy in đen trắng A3. 38 trang/phút.', N'Máy Ricoh đơn năng, hiệu suất cao.', 0, 1, 1, 1, N'ricoh, sp6430dn', N'Máy in A3 Ricoh.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (9, N'Sindoh N511', N'sindoh-n511', 1, N'/assets/img/Products/4.png', NULL, CAST(47000000 AS Decimal(18, 0)), CAST(45500000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In mạng, Scan màu. 28 trang/phút.', N'Sindoh N511 phù hợp doanh nghiệp.', 0, 1, 2, 1, N'sindoh, n511', N'Sindoh N511 tốc độ cao', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (10, N'Sindoh D332', N'sindoh-d332', 1, N'/assets/img/Products/5.png', NULL, CAST(90000000 AS Decimal(18, 0)), CAST(85000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu. 28 trang/phút.', N'Sindoh D332 chất lượng cao.', 0, 1, 2, 1, N'sindoh, d332', N'Máy photocopy Sindoh D332', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (11, N'Sindoh N512', N'sindoh-n512', 1, N'/assets/img/Products/6.png', NULL, CAST(68000000 AS Decimal(18, 0)), CAST(55000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In mạng, Scan màu. 36 trang/phút.', N'Sindoh N512 tiết kiệm chi phí.', 0, 1, 2, 1, N'sindoh, n512', N'Sindoh N512 phù hợp văn phòng.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (12, N'Sindoh D400', N'sindoh-d400', 1, N'/assets/img/Products/12.png', NULL, CAST(72000000 AS Decimal(18, 0)), CAST(68000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu. 40 trang/phút.', N'Sindoh D400 hiệu suất cao.', 0, 1, 2, 1, N'sindoh, d400', N'Sindoh hiệu quả cho doanh nghiệp.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (13, N'Sindoh N430', N'sindoh-n430', 1, N'/assets/img/Products/13.png', NULL, CAST(62000000 AS Decimal(18, 0)), CAST(55000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy Sindoh N430 43 trang/phút.', N'Máy in tốc độ cao từ Sindoh.', 0, 1, 2, 1, N'sindoh, n430', N'Máy in tốc độ nhanh.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (14, N'Sindoh A610', N'sindoh-a610', 1, N'/assets/img/Products/14.png', NULL, CAST(99000000 AS Decimal(18, 0)), CAST(87000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy scan tốc độ cao. 50 trang/phút.', N'Dòng máy Sindoh cho công việc nặng.', 0, 1, 2, 1, N'sindoh, a610', N'Sindoh máy scan tốc độ cao.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (15, N'Canon iR2224N', N'canon-ir2224n', 1, N'/assets/img/Products/7.png', NULL, CAST(36000000 AS Decimal(18, 0)), CAST(32000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In mạng, Scan màu. 24 trang/phút.', N'Canon iR2224N nhỏ gọn.', 0, 1, 3, 1, N'canon, ir2224n', N'Máy Canon văn phòng nhỏ.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (16, N'Canon iR2925i', N'canon-ir2925i', 1, N'/assets/img/Products/8.png', NULL, CAST(60000000 AS Decimal(18, 0)), CAST(50000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu, Wifi. 25 trang/phút.', N'Máy photocopy wifi Canon.', 0, 1, 3, 1, N'canon, ir2925i', N'Máy Canon hỗ trợ WiFi', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (17, N'Canon iR2425', N'canon-ir2425', 1, N'/assets/img/Products/9.png', NULL, CAST(36000000 AS Decimal(18, 0)), CAST(33000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu. 22 trang/phút.', N'Máy Canon iR2425 cho văn phòng.', 0, 1, 3, 1, N'canon, ir2425', N'Canon 22ppm nhỏ gọn.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (18, N'Canon imageRUNNER C3326i', N'canon-c3326i', 1, N'/assets/img/Products/15.png', NULL, CAST(89000000 AS Decimal(18, 0)), CAST(76000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu. 26 trang/phút.', N'Máy in đa năng Canon imageRUNNER.', 0, 1, 3, 1, N'canon, c3326i', N'Máy Canon màu văn phòng.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (19, N'Canon imageCLASS MF746Cx', N'canon-mf746cx', 1, N'/assets/img/Products/16.png', NULL, CAST(21500000 AS Decimal(18, 0)), CAST(18500000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy in laser đa chức năng. 27 trang/phút.', N'Canon MF746Cx với chức năng không dây.', 0, 1, 3, 1, N'canon, mf746cx', N'Canon nhỏ gọn, không dây.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (20, N'Canon i-SENSYS MF754Cdw', N'canon-mf754cdw', 1, N'/assets/img/Products/17.png', NULL, CAST(28500000 AS Decimal(18, 0)), CAST(24000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy in màu Canon. 33 trang/phút.', N'Máy phù hợp cho doanh nghiệp vừa.', 0, 1, 3, 1, N'canon, mf754cdw', N'Máy in Canon i-SENSYS.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (21, N'Canon iR ADV DX C3730i', N'canon-c3730i', 1, N'/assets/img/Products/18.png', NULL, CAST(110000000 AS Decimal(18, 0)), CAST(97500000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Copy, In, Scan màu. 30 trang/phút.', N'Máy Canon cho văn phòng lớn.', 0, 1, 3, 1, N'canon, c3730i', N'Máy văn phòng cao cấp.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_Product] ([ProductID], [Name], [SeoTitle], [Status], [Image], [ListImages], [Price], [PromotionPrice], [VAT], [Quantity], [Warranty], [Hot], [Desription], [Detail], [ViewCount], [CateID], [BrandID], [SupplierID], [MetaKeywords], [MetaDescriptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdateDate]) VALUES (22, N'Canon iR ADV 4525i', N'canon-4525i', 1, N'/assets/img/Products/19.png', NULL, CAST(78000000 AS Decimal(18, 0)), CAST(65000000 AS Decimal(18, 0)), 0, 10, 12, NULL, N'Máy in Canon ADV 4525i. 25 trang/phút.', N'Máy phù hợp công ty vừa và lớn.', 0, 1, 3, 1, N'canon, 4525i', N'Máy in văn phòng chuyên nghiệp.', 1, CAST(N'2025-05-04T22:53:12.820' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Supplier] ON 

INSERT [dbo].[tb_Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (1, N'Nguyễn Tuấn Tài', N'nguyentuantai630@gmail.com', N'0364995238', N'zXXZx')
INSERT [dbo].[tb_Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (2, N'Ricoh', NULL, NULL, NULL)
INSERT [dbo].[tb_Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (3, N'Sindoh', NULL, NULL, NULL)
INSERT [dbo].[tb_Supplier] ([ID], [Name], [Email], [Phone], [Address]) VALUES (4, N'Canon', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_User] ON 

INSERT [dbo].[tb_User] ([ID], [UserName], [Password], [FullName], [Email], [Phone], [Address], [Image], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'admin', N'TuanTai2003', N'Nguyễn Tuấn Tài', N'nguyentuantai630@gmail.com', N'0364995238', N'zXXZx', NULL, 1, NULL, CAST(N'2025-05-04T19:49:24.070' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_User] ([ID], [UserName], [Password], [FullName], [Email], [Phone], [Address], [Image], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'capowmoba', N'123456', N'Nguyễn Tuấn Tài', N'nguyentuantai630@gmail.com', N'0364995238', N'zXXZx', NULL, 1, NULL, CAST(N'2025-05-04T20:58:02.507' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_User] ([ID], [UserName], [Password], [FullName], [Email], [Phone], [Address], [Image], [Status], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'capowmoba', N'123456', N'Nguyễn Tuấn Tài', N'nguyentuantai630@gmail.com', N'0364995238', N'zXXZx', NULL, 1, NULL, CAST(N'2025-05-04T21:36:37.810' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_User] OFF
GO
ALTER TABLE [dbo].[tb_About] ADD  CONSTRAINT [DF_tb_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_Invoice] ADD  CONSTRAINT [DF_tb_Invoice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_Post] ADD  CONSTRAINT [DF_tb_Post_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tb_Post] ADD  CONSTRAINT [DF_tb_Post_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_PostCategory] ADD  CONSTRAINT [DF_tb_PostCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tb_PostCategory] ADD  CONSTRAINT [DF_tb_PostCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_PostComment] ADD  CONSTRAINT [DF_tb_PostComment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_PromotionPrice]  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_Warranty]  DEFAULT ((0)) FOR [Warranty]
GO
ALTER TABLE [dbo].[tb_Product] ADD  CONSTRAINT [DF_tb_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_ProductCategory] ADD  CONSTRAINT [DF_tb_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tb_ProductCategory] ADD  CONSTRAINT [DF_tb_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_ProductComment] ADD  CONSTRAINT [DF_tb_ProductComment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tb_User] ADD  CONSTRAINT [DF_tb_User_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tb_User] ADD  CONSTRAINT [DF_tb_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TbCart] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[TbCartItem]  WITH CHECK ADD FOREIGN KEY([CartId])
REFERENCES [dbo].[TbCart] ([CartId])
GO
