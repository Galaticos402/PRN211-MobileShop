USE [master]
GO
/****** Object:  Database [SmartphoneShopping]    Script Date: 6/22/2021 8:28:13 PM ******/
CREATE DATABASE [SmartphoneShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartphoneShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SmartphoneShopping.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmartphoneShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SmartphoneShopping_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SmartphoneShopping] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartphoneShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartphoneShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartphoneShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartphoneShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartphoneShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartphoneShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET RECOVERY FULL 
GO
ALTER DATABASE [SmartphoneShopping] SET  MULTI_USER 
GO
ALTER DATABASE [SmartphoneShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartphoneShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartphoneShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartphoneShopping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SmartphoneShopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartphoneShopping', N'ON'
GO
USE [SmartphoneShopping]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackContent] [nvarchar](3000) NOT NULL,
	[RatedStar] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Note] [nvarchar](1000) NULL,
	[OrderedDate] [date] NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttachedImages]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductAttachedImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](2500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductID] [int] NOT NULL,
	[ImageID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Thumbnail] [varchar](2500) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/22/2021 8:28:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Role] [tinyint] NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[DateCreated] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (1, N'Apple')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (2, N'Samsung')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (3, N'Xiaomi')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (4, N'Oppo')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (5, N'Realme')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__A9D1053411479798]    Script Date: 6/22/2021 8:28:13 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderedDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([ImageID])
REFERENCES [dbo].[ProductAttachedImages] ([ImageID])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategories] ([CategoryID])
GO
USE [master]
GO
ALTER DATABASE [SmartphoneShopping] SET  READ_WRITE 
GO
