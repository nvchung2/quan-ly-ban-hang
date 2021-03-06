USE [master]
GO
/****** Object:  Database [qlbanhang]    Script Date: 17/01/2022 2:58:05 PM ******/
CREATE DATABASE [qlbanhang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qlbanhang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\qlbanhang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qlbanhang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\qlbanhang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [qlbanhang] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qlbanhang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qlbanhang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qlbanhang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qlbanhang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qlbanhang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qlbanhang] SET ARITHABORT OFF 
GO
ALTER DATABASE [qlbanhang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [qlbanhang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qlbanhang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qlbanhang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qlbanhang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qlbanhang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qlbanhang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qlbanhang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qlbanhang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qlbanhang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qlbanhang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qlbanhang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qlbanhang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qlbanhang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qlbanhang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qlbanhang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qlbanhang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qlbanhang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qlbanhang] SET  MULTI_USER 
GO
ALTER DATABASE [qlbanhang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qlbanhang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qlbanhang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qlbanhang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qlbanhang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qlbanhang] SET QUERY_STORE = OFF
GO
USE [qlbanhang]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](100) NOT NULL,
	[InvDate] [date] NOT NULL,
	[Notes] [nvarchar](200) NULL,
	[Seller] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Invoice__3214EC07815E9D97] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[ProdId] [bigint] NOT NULL,
	[InvId] [bigint] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdId] ASC,
	[InvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CatId] [bigint] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](500) NULL,
	[Unit] [nvarchar](100) NOT NULL,
	[BuyPrice] [int] NOT NULL,
	[SellPrice] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RecDate] [date] NOT NULL,
	[Notes] [nvarchar](200) NULL,
	[ProvId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetails]    Script Date: 17/01/2022 2:58:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetails](
	[ProdId] [bigint] NOT NULL,
	[RecId] [bigint] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdId] ASC,
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'admin', N'root')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (1, N'Quạt-máy làm mát', N'Quạt-máy làm mát')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (2, N'Đồ sưởi', N'Đồ sưởi')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (3, N'Đồ dùng nhà bếp', N'Đồ dùng nhà bếp')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (4, N'Máy lọc nước', N'Máy lọc nước')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (21, N'asfa', CAST(N'2021-01-05' AS Date), N'af', N'asfa')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (23, N'Bùi Văn Thắng', CAST(N'2021-10-05' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (24, N'Trịnh Văn Thắng', CAST(N'2021-02-14' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (25, N'Bùi Văn Hiếu', CAST(N'2019-11-08' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (26, N'Nguyễn Văn Chiến', CAST(N'2021-05-07' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (27, N'Nguyễn Văn Chiến', CAST(N'2021-02-23' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (28, N'Trịnh Văn Quyết', CAST(N'2020-01-19' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (29, N'Hoàng Xuân Chiến', CAST(N'2019-02-06' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (30, N'Bùi Văn Hiếu', CAST(N'2019-05-24' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (31, N'Trịnh Văn Thắng', CAST(N'2021-11-10' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (32, N'Trịnh Văn Chiến', CAST(N'2021-11-28' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (33, N'Bùi Văn Hiếu', CAST(N'2019-11-28' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (34, N'Bùi Văn Thắng', CAST(N'2021-11-16' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (35, N'Bùi Văn Quyết', CAST(N'2021-05-13' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (36, N'Trịnh Văn Quyết', CAST(N'2021-11-07' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (37, N'Trịnh Văn Chiến', CAST(N'2021-04-03' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (38, N'Trịnh Văn Hiếu', CAST(N'2020-05-23' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (39, N'Nguyễn Văn Quyết', CAST(N'2020-05-11' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (40, N'Bùi Văn Quyết', CAST(N'2019-06-18' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (41, N'Trịnh Văn Thắng', CAST(N'2021-03-09' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (42, N'Hoàng Xuân Chiến', CAST(N'2020-06-21' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (43, N'Hoàng Xuân Quyết', CAST(N'2021-03-04' AS Date), N'không có ghi chú gì cả', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (44, N'Hoàng Xuân Quang', CAST(N'2022-01-17' AS Date), N'abc', N'Ngô Chung')
INSERT [dbo].[Invoice] ([Id], [CusName], [InvDate], [Notes], [Seller]) VALUES (45, N'Hoàng Xuân Hiếu', CAST(N'2022-01-01' AS Date), N'ok', N'Chung')
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (1, 25, 1, 500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (1, 26, 3, 500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (1, 29, 2, 500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (1, 38, 2, 500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (1, 43, 4, 500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (3, 27, 4, 2800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (3, 29, 4, 2800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (3, 32, 3, 2800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (3, 43, 4, 2800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (3, 45, 1, 2800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 21, 4, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 24, 2, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 25, 3, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 26, 3, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 28, 2, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 30, 2, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 35, 2, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 37, 1, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 42, 4, 300000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (4, 45, 2, 290000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (5, 33, 1, 800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (5, 34, 2, 800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (5, 41, 4, 800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (5, 45, 1, 800000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (16, 31, 3, 8500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (16, 34, 2, 8500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (16, 42, 3, 8500000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (17, 24, 1, 5390000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (17, 25, 4, 5390000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (17, 34, 4, 5390000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (17, 39, 3, 5390000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (17, 41, 4, 5390000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (17, 43, 1, 5390000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (19, 27, 3, 490000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (19, 30, 1, 490000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (19, 32, 3, 490000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (19, 33, 2, 490000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (19, 39, 1, 490000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (19, 43, 1, 490000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (21, 23, 3, 2200000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (21, 24, 2, 2200000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (21, 39, 2, 2200000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (21, 40, 1, 2200000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (21, 42, 4, 2200000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (21, 44, 2, 2200000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (22, 25, 3, 790000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (22, 26, 3, 790000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (22, 28, 2, 790000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (22, 31, 2, 790000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (22, 32, 3, 790000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 26, 4, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 28, 2, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 29, 2, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 30, 1, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 36, 4, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 39, 2, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 41, 2, 450000)
INSERT [dbo].[InvoiceDetails] ([ProdId], [InvId], [Amount], [Price]) VALUES (23, 44, 1, 450000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (1, 1, N'Quạt thông gió gắn trần Lioa EVF24CU7', N'quat-thong-gio-gan-tran-lioa-evf24cu7.jpg', N'cái', 399000, 500000, 29, N'Quạt thông gió 1 chiều')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (3, 1, N'Quạt đứng Panasonic F-409K', N'quat-dung-panasonic-f-409k.jpg', N'cái', 2500000, 2800000, 17, N'Quạt cây có điều khiển từ xa')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (4, 1, N'Quạt tích điện mini Mocato Air M503', N'quat-tich-dien-mini-mocato-air-m503-4.jpg', N'cái', 230000, 300000, 5, N'Quạt tích điện để bàn')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (5, 2, N'Đèn sưởi nhà tắm Sunhouse SHD3812', N'den-suoi-nha-tam-sunhouse-shd3812-s1.jpg', N'cái', 685000, 800000, 13, N'Đèn sưởi nhà tắm 2 bóng')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (16, 4, N'Máy lọc nước RO Sunhouse 10 lõi SHR76210CK', N'10036685-may-loc-nuoc-ro-sunhouse-10-loi-shr76210ck-1.jpg', N'cái', 8000000, 8500000, 20, N'Máy lọc nước RO Sunhouse 10 lõi SHR76210CK')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (17, 4, N'Máy lọc nước Kangaroo Hydrogen KG100HC VTU', N'10041706-may-loc-nuoc-kangaroo-hydrogen-kg100hc-vtu-1.jpg', N'cái', 4900000, 5390000, 15, N'Máy lọc nước Kangaroo Hydrogen KG100HC VTU')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (19, 3, N'Bếp gas Sunhouse SHB204MT', N'10036991-bep-gas-sunhouse-shb204mt-1.jpg', N'cái', 390000, 490000, 50, N'Bếp gas Sunhouse SHB204MT')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (21, 3, N'Lò vi sóng Sharp 20 lít R-G226VN-S', N'10027226-lo-vi-song-sharp-20l-R-g226vn-s-1.jpg', N'cái', 1800000, 2200000, 18, N'Lò vi sóng Sharp 20 lít R-G226VN-S')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (22, 3, N'Nồi chiên không dầu Ferroli 4 lít FAF-4.0M', N'10045580-noi-chien-khong-dau-ferroli-4l-faf-4-0-m-1.jpg', N'cái', 500000, 790000, 30, N'Nồi chiên không dầu Ferroli 4 lít FAF-4.0M')
INSERT [dbo].[Product] ([Id], [CatId], [Name], [Image], [Unit], [BuyPrice], [SellPrice], [Amount], [Description]) VALUES (23, 3, N'Máy xay sinh tố Sunhouse SHD5112', N'10034018-may-xay-sinh-to-sunhouse-shd5112-1_l954-d9.jpg', N'cái', 300000, 450000, 49, N'Máy xay sinh tố Sunhouse SHD5112')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([Id], [Name], [Address], [PhoneNumber], [Email]) VALUES (1, N'nokia', N'abc', N'113', N'abc@abc.com')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([Id], [RecDate], [Notes], [ProvId]) VALUES (1, CAST(N'2020-12-12' AS Date), N'ok', 1)
INSERT [dbo].[Receipt] ([Id], [RecDate], [Notes], [ProvId]) VALUES (2, CAST(N'2021-03-08' AS Date), N'ok', 1)
INSERT [dbo].[Receipt] ([Id], [RecDate], [Notes], [ProvId]) VALUES (3, CAST(N'2022-01-01' AS Date), N'ok', 1)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
INSERT [dbo].[ReceiptDetails] ([ProdId], [RecId], [Amount], [Price]) VALUES (1, 1, 10, 500000)
INSERT [dbo].[ReceiptDetails] ([ProdId], [RecId], [Amount], [Price]) VALUES (3, 2, 20, 100000)
INSERT [dbo].[ReceiptDetails] ([ProdId], [RecId], [Amount], [Price]) VALUES (4, 3, 15, 200000)
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [fk_id_inv] FOREIGN KEY([InvId])
REFERENCES [dbo].[Invoice] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [fk_id_inv]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [fk_id_prod] FOREIGN KEY([ProdId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [fk_id_prod]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_prod_cat] FOREIGN KEY([CatId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_prod_cat]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [fk_rec_prov] FOREIGN KEY([ProvId])
REFERENCES [dbo].[Provider] ([Id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [fk_rec_prov]
GO
ALTER TABLE [dbo].[ReceiptDetails]  WITH CHECK ADD  CONSTRAINT [fk_rd_prod] FOREIGN KEY([ProdId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ReceiptDetails] CHECK CONSTRAINT [fk_rd_prod]
GO
ALTER TABLE [dbo].[ReceiptDetails]  WITH CHECK ADD  CONSTRAINT [fk_rd_r] FOREIGN KEY([RecId])
REFERENCES [dbo].[Receipt] ([Id])
GO
ALTER TABLE [dbo].[ReceiptDetails] CHECK CONSTRAINT [fk_rd_r]
GO
USE [master]
GO
ALTER DATABASE [qlbanhang] SET  READ_WRITE 
GO
