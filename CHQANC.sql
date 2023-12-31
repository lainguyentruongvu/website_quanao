USE [master]
GO
/****** Object:  Database [CHQANC]    Script Date: 8/31/2023 2:11:24 PM ******/
CREATE DATABASE [CHQANC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHQANC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CHQANC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CHQANC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CHQANC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CHQANC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHQANC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHQANC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHQANC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHQANC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHQANC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHQANC] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHQANC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHQANC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHQANC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHQANC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHQANC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHQANC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHQANC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHQANC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHQANC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHQANC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CHQANC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHQANC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHQANC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHQANC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHQANC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHQANC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHQANC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHQANC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CHQANC] SET  MULTI_USER 
GO
ALTER DATABASE [CHQANC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHQANC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHQANC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHQANC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CHQANC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CHQANC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CHQANC] SET QUERY_STORE = OFF
GO
USE [CHQANC]
GO
/****** Object:  User [ASUS\perfe]    Script Date: 8/31/2023 2:11:25 PM ******/
CREATE USER [ASUS\perfe] FOR LOGIN [ASUS\perfe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nchar](11) NULL,
	[images] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Token] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang_1] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authoritys]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authoritys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[IDRole] [varchar](10) NULL,
 CONSTRAINT [PK_Authority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDCart] [bigint] NOT NULL,
	[IDProduct] [bigint] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_CartDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Color] [nvarchar](50) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDOrder] [bigint] NULL,
	[IDProduct] [bigint] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Createdate] [date] NULL,
	[Username] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDProducts] [bigint] NULL,
	[IDColor] [bigint] NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [float] NULL,
	[IDCategory] [bigint] NULL,
	[Information] [nvarchar](255) NULL,
	[Gender] [bit] NULL,
	[Date] [date] NULL,
	[Images] [nvarchar](255) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productsizecolor]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productsizecolor](
	[Id] [bigint] NULL,
	[IDProduct] [bigint] NULL,
	[IDSize] [bigint] NULL,
	[IDColor] [bigint] NULL,
	[Quanlity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSizes]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSizes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDProducts] [bigint] NOT NULL,
	[IDSize] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 8/31/2023 2:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'admin', N'123', N'admin a', 1, N'perfectavu19@gmail.com', N'0123456789 ', N'3.jpg', N'Cần Thơ', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'concho', N'123', N'hahahaha', 1, N'vulntpc04433@fpt.edu.vn', N'0123456789 ', N'3.jpg', N'Cần Thơ', N'PBYwRuzwEWqGy6uvrf7cMgcUpoKDpNm9gai1x7eoIjg3Bj0qAK')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'linhhh', N'123', N'phùng nhật lin', 1, NULL, NULL, N'aa.jpeg', NULL, N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'linhlo', N'123', N'Phùng Nhật Linh', 0, NULL, NULL, N'aa.jpeg', NULL, N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'sangnv', N'123', N'Trịnh Trọng Sang', 1, N'giamytran83@gmail.com', N'546465654  ', N'2.jpg', N'Cà Mau', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'teonv', N'rMjxft', NULL, NULL, N'sangttpc03777@fpt.edu.vn', NULL, NULL, NULL, N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'tiennv', N'123', N'Nguyễn Hoàng Tiến', NULL, N'tienkun1147@gmail.com', N'0763447035 ', N'4.jpg', N'Vĩnh Long', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'user1', N'123', N'ông chủ', 1, N'a@fgmahdj', N'076345755  ', N'q12321', NULL, N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'vuiii', N'iA9swL', N'Phùng Nhật Linh', NULL, N'tienkun11478@gmail.com', N'09887654321', N'aa.jpeg', N'Vĩnh long', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'vuvu', N'123', N'Lại Nguyễn Trường Vũ', 1, N'nguyentruongvu2kay@gmail.com', N'04376583056', N'3.jpg', N'Vĩnh Long', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Name], [Gender], [Email], [SDT], [images], [Address], [Token]) VALUES (N'vuvuii', N'123', NULL, NULL, N'tienkun1147@gmail.com', NULL, NULL, NULL, N'token')
GO
SET IDENTITY_INSERT [dbo].[Authoritys] ON 

INSERT [dbo].[Authoritys] ([Id], [Username], [IDRole]) VALUES (1, N'admin', N'DIRE')
INSERT [dbo].[Authoritys] ([Id], [Username], [IDRole]) VALUES (2, N'admin', N'STAF')
INSERT [dbo].[Authoritys] ([Id], [Username], [IDRole]) VALUES (3, N'admin', N'CUST')
SET IDENTITY_INSERT [dbo].[Authoritys] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetails] ON 

INSERT [dbo].[CartDetails] ([ID], [IDCart], [IDProduct], [Quantity]) VALUES (14, 17, 2, 3)
INSERT [dbo].[CartDetails] ([ID], [IDCart], [IDProduct], [Quantity]) VALUES (113, 24, 3, 1)
SET IDENTITY_INSERT [dbo].[CartDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([ID], [Username]) VALUES (16, N'tiennv')
INSERT [dbo].[Carts] ([ID], [Username]) VALUES (17, N'sangnv')
INSERT [dbo].[Carts] ([ID], [Username]) VALUES (21, N'admin')
INSERT [dbo].[Carts] ([ID], [Username]) VALUES (22, N'linhlo')
INSERT [dbo].[Carts] ([ID], [Username]) VALUES (23, N'teonv')
INSERT [dbo].[Carts] ([ID], [Username]) VALUES (24, N'vuiii')
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (1, N'Quần Jean')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (2, N'Quần Tây')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (3, N'Áo Thun')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (4, N'Áo Khoác')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (5, N'Áo Sơ Mi')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (6, N'Áo Polo')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (7, N'Áo Hoodie')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (8, N'Áo Len')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (9, N'Quần Kaki')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (10, N'Quần Short')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (11, N'Quần Baggy')
INSERT [dbo].[Categorys] ([ID], [Name]) VALUES (12, N'Quần Ống Rộng')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (76, 68, 2, 2, 397000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (82, 71, 2, 2, 397000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (83, 72, 2, 1, 397000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (84, 72, 3, 1, 125000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (87, 74, 5, 1, 109000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (88, 74, 7, 1, 90000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (89, 74, 26, 1, 345000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (104, 84, 5, 2, 109000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (105, 114, 4, 1, 150000)
INSERT [dbo].[OrderDetails] ([ID], [IDOrder], [IDProduct], [Quantity], [Price]) VALUES (106, 114, 5, 1, 109000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (68, CAST(N'2023-06-15' AS Date), N'tiennv', N'Cần Thơ 131', 794000, N'Đã giao')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (71, CAST(N'2023-06-16' AS Date), N'tiennv', N'Vĩnh Long', 794000, N'Đã thanh toán')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (72, CAST(N'2023-06-16' AS Date), N'tiennv', N'Vĩnh Long', 125000, N'Đã giao')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (74, CAST(N'2023-06-16' AS Date), N'tiennv', N'Kiên Giang', 345000, N'Đã giao')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (84, CAST(N'2023-06-17' AS Date), N'vuiii', N'Vĩnh Long', 218000, N'Đã giao')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (104, CAST(N'2023-08-07' AS Date), N'admin', N'Vĩnh long', NULL, N'Chờ xử lý')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (105, CAST(N'2023-08-07' AS Date), N'admin', N'Vĩnh long', NULL, N'Chờ xử lý')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (113, CAST(N'2023-08-07' AS Date), N'admin', N'Vĩnh long', NULL, N'Chờ xử lý')
INSERT [dbo].[Orders] ([ID], [Createdate], [Username], [Address], [Total], [Status]) VALUES (114, CAST(N'2023-08-07' AS Date), N'admin', N'Vĩnh long', NULL, N'Chờ xử lý')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (2, N'Áo khoác đỏ  aaa', 397000, 4, N' ', 1, NULL, N'aokhoacdo.jpg', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (3, N'Áo Bà Ba Tím', 125000, 3, N'Áo đẹp', 0, CAST(N'2023-06-06' AS Date), N'aobabatim.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (4, N'Áo khoác hoodie nữ ', 150000, 4, N' ', 0, CAST(N'2023-06-06' AS Date), N'aok1.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (5, N'ÁO LÔNG GẤU XÁM DÀY ẤM SIÊU ĐÁNG YÊU', 109000, 4, N'ÁO LÔNG GẤU XÁM DÀY ẤM SIÊU ĐÁNG YÊU', 0, CAST(N'2023-06-06' AS Date), N'ao11.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (6, N'Áo hoodie nữ hình gấu', 355000, 7, N'Áo hoodie dài tay nữ thu đông', 0, CAST(N'2023-06-06' AS Date), N'hoodie3.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (7, N'Áo nỉ hoodie dày dặn ', 90000, 7, N'Áo nỉ hoodie dày dặn ', 0, CAST(N'2023-06-06' AS Date), N'hoodie4.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (8, N'Áo hoodie zip Local Brand khoác chống nắng City Cycle nỉ cua form rộng oversize unisex', 738000, 4, N' ', NULL, CAST(N'2023-06-06' AS Date), N'aokhoac1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (9, N'Áo khoác hình thú cưng', 150000, 7, N'Ao siêu dễ thươngmẫu mới nhất 2022', 0, CAST(N'2023-06-06' AS Date), N'hoodie1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (10, N'Áo khoác nỉ phối hai màu siêu xinh mẫu mới 2020', 125000, 7, N'Áo khoác nỉ phối hai màu  là một trong những mẫu áo thun với thiết kế hình khủng long đang được các bạn cực kì yêu thích. Chỉ một chiếc Áo khoác nỉ phối hai màu này, bạn sẽ cảm thấy tự tin và lung linh hơn rất nhiều luôn.', 0, CAST(N'2023-06-06' AS Date), N'hoodie2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (11, N'Ao khoác nam form crop dễ phối đồ phong cách Hàn Quốc', 799000, 4, N'áo khoác nam form crop dễ phối đồ phong cách Hàn Quốc', 1, CAST(N'2023-06-06' AS Date), N'aokhoac2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (12, N'Áo khoác nữ hình chú sóc ngộ nghĩnh', 440000, 4, NULL, 0, CAST(N'2023-06-06' AS Date), N'aokhoac3.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (13, N'ÁO KHOÁC NỈ HỌA TIẾT CON HEO DỄ THƯƠNG NAM NỮ TP552', 125000, 4, NULL, 0, CAST(N'2023-06-06' AS Date), N'aokhoac4.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (14, N'Áo len nam Amazon Essentials Midweight Fisherman Sweater', 1363000, 8, NULL, 1, CAST(N'2023-06-06' AS Date), N'aolen1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (15, N'Áo len thu đông nữ', 231000, 8, NULL, 0, CAST(N'2023-06-06' AS Date), N'aolen3.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (16, N'Áo polo nam ngắn tay có cổ Vicenzo regular fit chuẩn hàng xuất, áo phông thun polo nam tay ngắn', 75000, 6, NULL, 1, CAST(N'2023-06-06' AS Date), N'aopolo1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (17, N'Áo polo nam cổ bẻ MIO vải cá sấu Cotton xuất xịn,chuẩn form, sang trọng - thanh lịch - POLOMANOR', 275000, 6, NULL, 1, CAST(N'2023-06-06' AS Date), N'aopolo2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (18, N'Sơ mi nam Eric Home dài tay chất vải cotton thoáng mát form dáng chuẩn D365-SM61', 220000, 5, NULL, 1, CAST(N'2023-06-06' AS Date), N'aosomi1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (19, N'Áo sơ mi nam dài tay hoạ tiết Dobby Tezo - 2111SMDH04', 250000, 5, NULL, 1, CAST(N'2023-06-06' AS Date), N'aosomi2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (20, N'Áo thun nam tay ngắn in hình độc lạ cá tính mạnh mẽ thun cotton 4 chiều co giãn tuyệt đối,ÁO THUN NAM NỮ IN HÌNH RICK CÁ TÍNH COTTON CO GIÃN 4 CHIỀU', 110000, 3, NULL, 1, CAST(N'2023-06-06' AS Date), N'aothun4.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (21, N'ÁO THUN NAM 100% COTTON USA', 149000, 3, NULL, 1, CAST(N'2023-06-06' AS Date), N'aothun1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (22, N'Quần jogger nữ thêu chữ from quần ống rộng chun gấu vải nỉ ép không xù', 120000, 11, NULL, 0, CAST(N'2023-06-06' AS Date), N'quanbaggy1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (23, N'Quần bò nữ, Quần Baggy jean nữ lưng cao phong cách, Cạp quần cao vừa phải chất bò mịn đẹp Cherry T019', 150000, 11, NULL, 0, CAST(N'2023-06-06' AS Date), N'quanbaggy2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (24, N'Quần Jean Slim-fit ICONDENIM Light Blue', 550000, 1, NULL, 1, CAST(N'2023-06-06' AS Date), N'quanjean1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (25, N'Quần Jeans Nam Ống Đứng Slimfit Basic', 264000, 1, NULL, 1, CAST(N'2023-06-06' AS Date), N'quanjean2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (26, N'Quần Jogger Kaki Dáng Dài Slimfit', 345000, 9, NULL, 1, CAST(N'2023-06-06' AS Date), N'quankaki1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (27, N'Quần Kaki Nam Form Relax - 10S22PCA001', 595000, 9, NULL, 1, CAST(N'2023-06-06' AS Date), N'quankaki2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (28, N'Quần kaki', 35000, 9, N'', 1, NULL, N'quankaki4.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (29, N'Chuyển đến phần đầu của thư viện hình ảnh
Quần Short Nam Trơn Form Loose - 10F21PSH004', 450000, 10, NULL, 1, CAST(N'2023-06-06' AS Date), N'quansort1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (30, N'Quần short nam Insidemen ISO028S2', 351000, 10, NULL, 1, CAST(N'2023-06-06' AS Date), N'quansort3.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (31, N'QUẦN ÂU CHUN HÔNG ZIOZIA NAM HÀN Q', 1500000, 2, NULL, 1, CAST(N'2023-06-06' AS Date), N'quantay1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (32, N'Quần tây nam màu be ống đứng Casual', 299000, 2, NULL, 1, CAST(N'2023-06-06' AS Date), N'quantay2.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [IDCategory], [Information], [Gender], [Date], [Images], [Quantity]) VALUES (66, N'Áo Khoác', 150000, 4, N'aaaaa', 0, NULL, N'EfIL7p.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'cust')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'dire')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'staf')
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([ID], [Size]) VALUES (1, N'S')
INSERT [dbo].[Sizes] ([ID], [Size]) VALUES (2, N'M')
INSERT [dbo].[Sizes] ([ID], [Size]) VALUES (3, N'L')
INSERT [dbo].[Sizes] ([ID], [Size]) VALUES (4, N'XL')
INSERT [dbo].[Sizes] ([ID], [Size]) VALUES (5, N'XXL')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
ALTER TABLE [dbo].[Authoritys]  WITH CHECK ADD  CONSTRAINT [FK_Authority_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authoritys] CHECK CONSTRAINT [FK_Authority_Accounts]
GO
ALTER TABLE [dbo].[Authoritys]  WITH CHECK ADD  CONSTRAINT [FK_Authority_Roles] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authoritys] CHECK CONSTRAINT [FK_Authority_Roles]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Cart] FOREIGN KEY([IDCart])
REFERENCES [dbo].[Carts] ([ID])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Cart]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Products] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Colors] FOREIGN KEY([IDColor])
REFERENCES [dbo].[Colors] ([ID])
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Colors]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Products] FOREIGN KEY([IDProducts])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categorys] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Categorys] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categorys]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Products] FOREIGN KEY([IDProducts])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSize_Products]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Size] FOREIGN KEY([IDSize])
REFERENCES [dbo].[Sizes] ([ID])
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSize_Size]
GO
USE [master]
GO
ALTER DATABASE [CHQANC] SET  READ_WRITE 
GO
