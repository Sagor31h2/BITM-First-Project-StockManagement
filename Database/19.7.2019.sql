USE [master]
GO
/****** Object:  Database [StockDB]    Script Date: 19/07/2019 23:21:43 ******/
CREATE DATABASE [StockDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StockDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/07/2019 23:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Catagory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 19/07/2019 23:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 19/07/2019 23:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
	[Reorder] [int] NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 19/07/2019 23:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[ComapnyId] [int] NULL,
	[StockOutQuantity] [int] NULL,
	[StockOutType] [varchar](50) NULL,
	[Date] [date] NULL,
	[ItemName] [varchar](50) NULL,
 CONSTRAINT [PK_Sale_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Cosmetics')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Electronics')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1002, N'Kitchen Items')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Stationary')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (1, N'Nova')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (4, N'RFL')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (2, N'Unilever')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (3, N'Walton')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [ItemName], [CategoryId], [CompanyId], [Reorder], [AvailableQuantity]) VALUES (1, N'Refrigerator', 3, 3, 20, 1)
INSERT [dbo].[Items] ([Id], [ItemName], [CategoryId], [CompanyId], [Reorder], [AvailableQuantity]) VALUES (2, N'Air-Conditioner', 3, 3, 20, 6)
INSERT [dbo].[Items] ([Id], [ItemName], [CategoryId], [CompanyId], [Reorder], [AvailableQuantity]) VALUES (3, N'Self', 1002, 4, 40, 1)
INSERT [dbo].[Items] ([Id], [ItemName], [CategoryId], [CompanyId], [Reorder], [AvailableQuantity]) VALUES (4, N'Shampoo', 2, 2, 100, 95)
INSERT [dbo].[Items] ([Id], [ItemName], [CategoryId], [CompanyId], [Reorder], [AvailableQuantity]) VALUES (5, N'Soap', 2, 2, 100, 18)
INSERT [dbo].[Items] ([Id], [ItemName], [CategoryId], [CompanyId], [Reorder], [AvailableQuantity]) VALUES (1002, N'pen', 1, 1, 20, 17)
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (1, 4, 2, 5, N'Sell', CAST(0xEA3F0B00 AS Date), N'')
INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (2, 4, 2, 5, N'Sell', CAST(0xEA3F0B00 AS Date), NULL)
INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (3, 3, 4, 2, N'Sell', CAST(0xEA3F0B00 AS Date), NULL)
INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (4, 1002, 1, 5, N'Sell', CAST(0xEA3F0B00 AS Date), NULL)
INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (5, 3, 4, 1, N'Sell', CAST(0xEA3F0B00 AS Date), NULL)
INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (6, 5, 2, 2, N'Sell', CAST(0xEA3F0B00 AS Date), NULL)
INSERT [dbo].[StockOut] ([Id], [ItemId], [ComapnyId], [StockOutQuantity], [StockOutType], [Date], [ItemName]) VALUES (7, 3, 4, 1, N'Sell', CAST(0xEA3F0B00 AS Date), N'Self')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Catagory]    Script Date: 19/07/2019 23:21:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Catagory] ON [dbo].[Category]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Company]    Script Date: 19/07/2019 23:21:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Company] ON [dbo].[Company]
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Items]    Script Date: 19/07/2019 23:21:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Items] ON [dbo].[Items]
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_Reorder]  DEFAULT ((0)) FOR [Reorder]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_AvailableQuantity]  DEFAULT ((0)) FOR [AvailableQuantity]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Company]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Items] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Items]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Items_Company] FOREIGN KEY([ComapnyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_Sale_Items_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Items_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_Sale_Items_Items]
GO
USE [master]
GO
ALTER DATABASE [StockDB] SET  READ_WRITE 
GO
