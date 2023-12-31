USE [master]
GO
/****** Object:  Database [POS]    Script Date: 2023/7/3 上午 10:40:38 ******/
CREATE DATABASE [POS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\POS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'POS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\POS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [POS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS] SET RECOVERY FULL 
GO
ALTER DATABASE [POS] SET  MULTI_USER 
GO
ALTER DATABASE [POS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [POS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [POS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'POS', N'ON'
GO
ALTER DATABASE [POS] SET QUERY_STORE = ON
GO
ALTER DATABASE [POS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [POS]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2023/7/3 上午 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CAccount] [nvarchar](10) NULL,
	[CPassword] [nvarchar](10) NULL,
	[CLastname] [nvarchar](100) NULL,
	[CFirstname] [nvarchar](100) NULL,
	[CPhone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/7/3 上午 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[EAccount] [nvarchar](10) NULL,
	[EPassword] [nvarchar](10) NULL,
	[ELastname] [nvarchar](100) NULL,
	[EFirstname] [nvarchar](100) NULL,
	[ETitle] [nvarchar](50) NULL,
	[EStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2023/7/3 上午 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](100) NULL,
	[Price] [int] NULL,
	[Amount] [int] NULL,
	[TotalPrice] [int] NULL,
	[Variation] [nvarchar](100) NULL,
	[Ice] [nvarchar](100) NULL,
	[Milk] [nvarchar](100) NULL,
	[Extra] [nvarchar](100) NULL,
	[Datetime] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/7/3 上午 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[InOrOut] [bit] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [int] NULL,
	[Quanity] [int] NULL,
	[TotalPrice] [int] NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/7/3 上午 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Category] [nvarchar](50) NULL,
	[UnitPrice] [int] NULL,
	[Image] [nchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CID], [CAccount], [CPassword], [CLastname], [CFirstname], [CPhone]) VALUES (1, N'hello', N'123', N'Joy', N'Wang', N'0912521486')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (1, N'jing1997', N'123', N'Jing', N'Hsu', N'Administrator', N'Employed')
INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (2, N'shu1875', N'456', N'Shu', N'Wu', N'Manager', N'Employed')
INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (3, N'nana2019', N'789', N'Nana', N'Lin', N'Employee', N'Quit')
INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (4, N'lisa1997', N'012', N'Lisa', N'Manoban', N'Employee', N'Employed')
INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (5, N'jennie1995', N'234', N'Jennie', N'Kim', N'Manager', N'Employed')
INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (6, N'jisoo1994', N'345', N'Jisoo', N'Kim', N'Employee', N'Employed')
INSERT [dbo].[Employees] ([EID], [EAccount], [EPassword], [ELastname], [EFirstname], [ETitle], [EStatus]) VALUES (7, N'rose1995', N'567', N'Rosé', N'Park', N'Employee', N'Employed')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1, NULL, NULL, NULL, 150, 2, 300, N'Hot｜Venti', N'No Ice', N'Oatmilk', NULL, NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (3, NULL, NULL, N'Lattle', 135, 1, 135, N'Hot｜Grande', NULL, N'Whole Milk', N'Espresso', NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (4, NULL, NULL, N'Caffé Americano', 110, 1, 110, N'Iced｜Grande', N'', N'Coconut Milk', N'', NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (5, NULL, NULL, N'Latte', 150, 4, 600, N'Iced｜Grande', N'No Ice', N'Coconut Milk', N'Espresso', NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (6, NULL, NULL, N'Cappuccino', 170, 3, 510, N'Hot｜Grande', N'No Ice', N'Oatmilk', N'Espresso', NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (7, NULL, NULL, N'Caffé Americano', 125, 5, 625, N'Iced｜Grande', N'Less Ice', N'Whole Milk', N'Espresso', NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (8, NULL, NULL, N'Chocolate Chip', 170, 3, 510, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Oatmilk', N'', NULL)
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (9, NULL, NULL, N'Caffé Americano', 155, 3, 465, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T02:30:02.190' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (10, NULL, NULL, N'Latte', 170, 3, 510, N'Iced｜Venti', N'Less Ice', N'Almond Milk', N'', CAST(N'2023-07-02T02:30:28.660' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (11, NULL, NULL, N'Chocolate Chip', 165, 3, 495, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-02T02:31:57.403' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (12, NULL, NULL, N'Caffé Americano', 135, 1, 135, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T14:55:01.257' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (13, NULL, NULL, N'Caffé Americano', 150, 1, 150, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T14:55:41.627' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (14, NULL, NULL, N'Caramel Macchiato', 180, 1, 180, N'Hot｜Grande｜※ Espresso Choice', N'', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-02T15:20:06.060' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1009, NULL, NULL, N'Chocolate Chip', 165, 3, 495, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T16:52:54.150' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1010, NULL, NULL, N'Cappuccino', 175, 2, 350, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-02T16:53:09.433' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1011, NULL, NULL, N'Latte', 175, 3, 525, N'Hot｜Venti｜※ Espresso Choice', N'', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T18:22:25.877' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1012, NULL, NULL, N'Caramel Macchiato', 185, 1, 185, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Oatmilk', N'', CAST(N'2023-07-02T18:23:44.240' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1013, NULL, NULL, N'Latte', 160, 1, 160, N'Iced｜Venti｜※ Espresso Choice', N'', N'Soy', N'', CAST(N'2023-07-02T18:24:48.350' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1014, NULL, NULL, N'Caramel Macchiato', 170, 1, 170, N'Iced｜Grande', N'Less Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T18:42:28.023' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1015, NULL, NULL, N'Caramel Macchiato', 180, 1, 180, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T18:42:45.410' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1016, NULL, NULL, N'Caffé Americano', 135, 1, 135, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T18:50:40.273' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1017, NULL, NULL, N'Caramel Macchiato', 180, 3, 540, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T18:51:00.337' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1018, NULL, NULL, N'Caramel Macchiato', 180, 3, 540, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T18:55:30.627' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1019, NULL, NULL, N'Caffé Americano', 170, 1, 170, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Almond Milk', N'Espresso', CAST(N'2023-07-02T18:57:26.203' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1020, NULL, NULL, N'Chocolate Chip', 200, 1, 200, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Almond Milk', N'Espresso', CAST(N'2023-07-02T19:05:57.607' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1021, NULL, NULL, N'Caffé Americano', 150, 1, 150, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T19:21:31.373' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1022, NULL, NULL, N'Chocolate Chip', 155, 1, 155, N'Iced｜Grande', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T19:21:44.413' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1023, NULL, NULL, N'Caramel Macchiato', 190, 1, 190, N'Iced｜Grande', N'Less Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T19:40:03.760' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1024, NULL, NULL, N'Caramel Macchiato', 185, 1, 185, N'Iced｜Venti', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T19:41:34.047' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1025, NULL, NULL, N'Caffé Americano', 145, 1, 145, N'Hot｜Venti', N'', N'Almond Milk', N'', CAST(N'2023-07-02T19:41:39.360' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1026, NULL, NULL, N'Chocolate Chip', 190, 3, 570, N'Iced｜Venti', N'No Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T19:41:46.470' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1027, NULL, NULL, N'Caffé Americano', 150, 3, 450, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T19:46:44.673' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1028, NULL, NULL, N'Caffé Americano', 135, 3, 405, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T20:08:54.620' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1029, NULL, NULL, N'Latte', 180, 3, 540, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Almond Milk', N'Espresso', CAST(N'2023-07-02T20:09:14.517' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1030, NULL, NULL, N'Caramel Macchiato', 180, 1, 180, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T20:15:40.600' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1031, NULL, NULL, N'Caramel Macchiato', 180, 3, 540, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T20:16:57.830' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1032, NULL, NULL, N'Caffé Americano', 125, 3, 375, N'Iced｜Grande', N'No Ice', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-02T20:19:33.270' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1033, NULL, NULL, N'Caramel Macchiato', 195, 3, 585, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-02T20:21:01.427' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1034, NULL, NULL, N'Caffé Americano', 155, 4, 620, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T20:31:45.253' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1035, NULL, NULL, N'Caffé Americano', 155, 6, 930, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T20:41:16.777' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1036, NULL, NULL, N'Caffé Americano', 150, 7, 1050, N'Iced｜Venti｜※ Espresso Choice', N'', N'Soy', N'Espresso', CAST(N'2023-07-02T20:42:15.613' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1038, NULL, NULL, N'Caramel Macchiato', 200, 3, 600, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T20:56:35.303' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1039, NULL, NULL, N'Caramel Macchiato', 180, 1, 180, N'Hot｜Venti｜※ Espresso Choice', N'', N'Whole Milk', N'', CAST(N'2023-07-02T20:57:53.283' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1040, NULL, NULL, N'Caffé Americano', 125, 4, 500, N'Iced｜Grande', N'No Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T20:58:23.310' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1041, NULL, NULL, N'Chocolate Chip', 180, 1, 180, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T20:58:43.380' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1042, NULL, NULL, N'Caffé Americano', 170, 12, 2040, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T21:00:21.230' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1045, NULL, NULL, N'Caramel Macchiato', 180, 3, 540, N'Iced｜Grande ｜※ Espresso Choice', N'', N'Soy', N'Espresso', CAST(N'2023-07-02T21:06:17.860' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1046, NULL, NULL, N'Caramel Macchiato', 180, 4, 720, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:07:34.353' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1047, NULL, NULL, N'Caffé Americano', 135, 1, 135, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:07:40.483' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1048, NULL, NULL, N'Chocolate Chip', 165, 2, 330, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:09:32.867' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1049, NULL, NULL, N'Chocolate Chip', 180, 3, 540, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:22:45.637' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1050, NULL, NULL, N'Caffé Americano', 155, 3, 465, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T21:25:30.460' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1051, NULL, NULL, N'Chocolate Chip', 155, 3, 465, N'Iced｜Grande', N'Less Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T21:28:16.143' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1052, NULL, NULL, N'Caffé Americano', 135, 3, 405, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:30:07.457' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1055, NULL, NULL, N'Caffé Americano', 150, 4, 600, N'Iced｜Venti｜※ Espresso Choice', N'Less Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:40:14.407' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1056, NULL, NULL, N'Caramel Macchiato', 180, 4, 720, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Soy', N'Espresso', CAST(N'2023-07-02T21:46:40.813' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1057, NULL, NULL, N'Chocolate Chip', 165, 2, 330, N'Iced｜Venti｜※ Espresso Choice', N'Less Ice', N'Whole Milk', N'', CAST(N'2023-07-02T21:47:07.160' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1058, NULL, NULL, N'Caffé Americano', 135, 2, 270, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:47:56.120' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1059, NULL, NULL, N'Caffé Americano', 150, 3, 450, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T21:51:58.780' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1064, NULL, NULL, N'Caffé Americano', 140, 4, 560, N'Iced｜Venti', N'Less Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T22:05:23.290' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1067, NULL, NULL, N'Caffé Americano', 170, 1, 170, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Almond Milk', N'Espresso', CAST(N'2023-07-02T22:05:52.897' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1068, NULL, NULL, N'Chocolate Chip', 150, 3, 450, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Whole Milk', N'', CAST(N'2023-07-02T22:20:05.973' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1070, NULL, NULL, N'Caffé Americano', 125, 2, 250, N'Iced｜Venti', N'', N'Soy', N'', CAST(N'2023-07-02T22:24:20.240' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1071, NULL, NULL, N'Caffé Americano', 150, 1, 150, N'Iced｜Venti｜※ Espresso Choice', N'Less Ice', N'Whole Milk', N'Espresso', CAST(N'2023-07-02T22:26:40.817' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1072, NULL, NULL, N'Caffé Americano', 145, 2, 290, N'Iced｜Grande', N'Less Ice', N'Almond Milk', N'Espresso', CAST(N'2023-07-02T22:27:19.320' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1073, NULL, NULL, N'Caramel Macchiato', 180, 2, 360, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Coconut Milk', N'Espresso', CAST(N'2023-07-02T22:43:15.037' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1074, NULL, NULL, N'Chocolate Chip', 185, 3, 555, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T22:43:49.697' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1075, NULL, NULL, N'Chocolate Chip', 165, 1, 165, N'Iced｜Grande ｜※ Espresso Choice', N'Less Ice', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-02T22:45:20.340' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1076, NULL, NULL, N'Caffé Americano', 170, 3, 510, N'Iced｜Venti｜※ Espresso Choice', N'No Ice', N'Oatmilk', N'Espresso', CAST(N'2023-07-02T22:46:18.573' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1077, NULL, NULL, N'Caffé Americano', 135, 3, 405, N'Iced｜Grande ｜※ Espresso Choice', N'', N'Whole Milk', N'Espresso', CAST(N'2023-07-03T00:10:11.763' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1078, NULL, NULL, N'Caramel Macchiato', 185, 3, 555, N'Hot｜Venti', N'', N'Low Fat Milk', N'Espresso', CAST(N'2023-07-03T03:09:17.220' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1079, NULL, NULL, N'Cappuccino', 160, 3, 480, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Soy', N'Espresso', CAST(N'2023-07-03T03:09:37.343' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1080, NULL, NULL, N'Caramel Macchiato', 195, 4, 780, N'Hot｜Venti｜※ Espresso Choice', N'', N'Whole Milk', N'Espresso', CAST(N'2023-07-03T03:10:32.810' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1081, NULL, NULL, N'Cappuccino', 150, 3, 450, N'Iced｜Grande', N'No Ice', N'Soy', N'Espresso', CAST(N'2023-07-03T03:10:51.453' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1082, NULL, NULL, N'Caffé Americano', 150, 3, 450, N'Hot｜Venti｜※ Espresso Choice', N'', N'Soy', N'Espresso', CAST(N'2023-07-03T03:11:36.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([DID], [OrderID], [ProductID], [ProductName], [Price], [Amount], [TotalPrice], [Variation], [Ice], [Milk], [Extra], [Datetime]) VALUES (1084, NULL, NULL, N'Latte', 145, 2, 290, N'Iced｜Grande ｜※ Espresso Choice', N'No Ice', N'Low Fat Milk', N'', CAST(N'2023-07-03T03:12:16.403' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [UnitPrice], [Image]) VALUES (1, N'Latte', N'Popular', 135, N'1.png                                                                                               ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [UnitPrice], [Image]) VALUES (2, N'Caramel Macchiato', N'Popular', 155, N'2.png                                                                                               ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [UnitPrice], [Image]) VALUES (3, N'Caffé Americano', N'Popular', 110, N'3.png                                                                                               ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [UnitPrice], [Image]) VALUES (5, N'Chocolate Chip', N'Popular', 140, N'4.png                                                                                               ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [UnitPrice], [Image]) VALUES (6, N'Cappuccino', N'Popular', 135, N'5.png                                                                                               ')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
USE [master]
GO
ALTER DATABASE [POS] SET  READ_WRITE 
GO
