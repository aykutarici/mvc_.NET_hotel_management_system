USE [master]
GO
/****** Object:  Database [MVC_HotelProject2]    Script Date: 21.05.2016 10:07:32 ******/
CREATE DATABASE [MVC_HotelProject2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_HotelProject2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MVC_HotelProject2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVC_HotelProject2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MVC_HotelProject2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MVC_HotelProject2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_HotelProject2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_HotelProject2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_HotelProject2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_HotelProject2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC_HotelProject2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC_HotelProject2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_HotelProject2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC_HotelProject2] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_HotelProject2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_HotelProject2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_HotelProject2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_HotelProject2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MVC_HotelProject2]
GO
/****** Object:  User [ariciaykut]    Script Date: 21.05.2016 10:07:32 ******/
CREATE USER [ariciaykut] FOR LOGIN [ariciaykut] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [ariciaykut]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [ariciaykut]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 21.05.2016 10:07:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[NumOfReservedDays] [int] NULL,
	[RoomNum] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[RoomPrice] [float] NOT NULL,
	[LaundryPrice] [float] NULL,
	[RentCarPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NULL,
	[BillDate] [date] NULL CONSTRAINT [DF_Bills_BillDate]  DEFAULT (getdate()),
	[noadult] [int] NULL,
	[nochild] [int] NULL,
	[customerID] [int] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckIn]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[CheckInID] [int] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [date] NULL CONSTRAINT [DF_CheckIn_CheckInDate]  DEFAULT (getdate()),
	[NumOfReservedDays] [int] NULL,
	[CustomerID] [int] NOT NULL,
	[RoomNum] [int] NOT NULL,
	[NoAdults] [int] NULL,
	[NoChildren] [int] NULL,
	[PassportNo] [int] NOT NULL,
	[checkoutstatus] [int] NULL,
 CONSTRAINT [PK_CheckIn] PRIMARY KEY CLUSTERED 
(
	[CheckInID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckOut]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckOut](
	[CheckOutID] [int] IDENTITY(1,1) NOT NULL,
	[CheckOutDate] [date] NULL CONSTRAINT [DF_CheckOut_CheckOutDate]  DEFAULT (getdate()),
	[CheckInID] [int] NOT NULL,
	[RoomNum] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[noadults] [int] NOT NULL,
	[nochild] [int] NULL,
	[passportnum] [int] NOT NULL,
 CONSTRAINT [PK_CheckOut] PRIMARY KEY CLUSTERED 
(
	[CheckOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[PassportNo] [int] NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[Country] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[checkstatus] [nvarchar](3) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Laundry]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laundry](
	[LoundryID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ServiceName] [nvarchar](50) NULL,
	[ServiceInfo] [nvarchar](50) NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Laundry] PRIMARY KEY CLUSTERED 
(
	[LoundryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[UserID_from] [int] NOT NULL,
	[UserID_to] [int] NOT NULL,
	[message] [nvarchar](200) NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[UserID_from] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[RoomNum] [int] NOT NULL,
	[ServicePrice] [float] NOT NULL,
	[FirstDay] [date] NULL CONSTRAINT [DF_Order_FirstDay]  DEFAULT (getdate()),
	[LastDay] [date] NULL,
	[Quantity] [int] NULL,
	[OrderPrice] [float] NOT NULL,
	[CarID] [int] NULL,
	[LoundryID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentCar]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentCar](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[serviceID] [int] NOT NULL,
	[CarBrand] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_RentCar] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomNum] [int] NOT NULL,
	[RoomInfo] [nvarchar](max) NULL,
	[RoomStatus] [nchar](10) NOT NULL,
	[Extra] [nchar](10) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RoomPrice] [float] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[image] [image] NULL,
	[MemorizeQuestion] [nvarchar](50) NULL,
	[MemorizeAnswer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([BillID], [NumOfReservedDays], [RoomNum], [Type], [RoomPrice], [LaundryPrice], [RentCarPrice], [TotalPrice], [name], [surname], [BillDate], [noadult], [nochild], [customerID]) VALUES (2068, 1, 209, N'king', 500, 0, 0, 500, N'rama', N'sdfsedfsrf', CAST(N'2015-12-22' AS Date), 1, 0, 2091)
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[CheckIn] ON 

INSERT [dbo].[CheckIn] ([CheckInID], [CheckInDate], [NumOfReservedDays], [CustomerID], [RoomNum], [NoAdults], [NoChildren], [PassportNo], [checkoutstatus]) VALUES (2060, CAST(N'2015-12-22' AS Date), 1, 2091, 209, 1, 0, 234567321, 0)
INSERT [dbo].[CheckIn] ([CheckInID], [CheckInDate], [NumOfReservedDays], [CustomerID], [RoomNum], [NoAdults], [NoChildren], [PassportNo], [checkoutstatus]) VALUES (2061, CAST(N'2015-12-22' AS Date), 1, 2094, 100, 2, 1, 5123698, 0)
INSERT [dbo].[CheckIn] ([CheckInID], [CheckInDate], [NumOfReservedDays], [CustomerID], [RoomNum], [NoAdults], [NoChildren], [PassportNo], [checkoutstatus]) VALUES (2062, CAST(N'2015-12-22' AS Date), 10, 73, 108, 1, 1, 545146735, 0)
INSERT [dbo].[CheckIn] ([CheckInID], [CheckInDate], [NumOfReservedDays], [CustomerID], [RoomNum], [NoAdults], [NoChildren], [PassportNo], [checkoutstatus]) VALUES (3060, CAST(N'2016-08-05' AS Date), 2, 68, 100, 2, 3, 5465565, 1)
INSERT [dbo].[CheckIn] ([CheckInID], [CheckInDate], [NumOfReservedDays], [CustomerID], [RoomNum], [NoAdults], [NoChildren], [PassportNo], [checkoutstatus]) VALUES (4060, CAST(N'2016-10-05' AS Date), 2, 74, 206, 3, 2, 214123, 1)
SET IDENTITY_INSERT [dbo].[CheckIn] OFF
SET IDENTITY_INSERT [dbo].[CheckOut] ON 

INSERT [dbo].[CheckOut] ([CheckOutID], [CheckOutDate], [CheckInID], [RoomNum], [customerID], [noadults], [nochild], [passportnum]) VALUES (2031, CAST(N'2015-12-22' AS Date), 2061, 100, 2094, 2, 1, 5123698)
INSERT [dbo].[CheckOut] ([CheckOutID], [CheckOutDate], [CheckInID], [RoomNum], [customerID], [noadults], [nochild], [passportnum]) VALUES (2032, CAST(N'2015-12-22' AS Date), 2062, 108, 73, 1, 1, 545146735)
INSERT [dbo].[CheckOut] ([CheckOutID], [CheckOutDate], [CheckInID], [RoomNum], [customerID], [noadults], [nochild], [passportnum]) VALUES (2033, CAST(N'2015-12-22' AS Date), 2060, 209, 2091, 1, 0, 234567321)
SET IDENTITY_INSERT [dbo].[CheckOut] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (68, N'sede', N'ingiz', N'address', N'email', N'02125456845', 545124975, N'mrs       ', N'Turkey', N'İstanbul', CAST(N'2015-06-01' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (69, N'emrah', N'solak', N'address', N'email', N'02125456745', 523447975, N'mr        ', N'Turkey', N'bursa', NULL, N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (70, N'engin', N'koray', N'address', N'email', N'02125456745', 545126975, N'mr        ', N'Turkey', N'adıyaman', CAST(N'1977-03-22' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (72, N'engin', N'şimşek', N'address', N'email', N'06346534545', 334124475, N'mr        ', N'Turkey', N'hatay', CAST(N'1965-12-15' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (73, N'petek', N'güngör', N'address', N'email', N'02125678645', 545146735, N'mrs       ', N'Turkey', N'giresun', CAST(N'1990-11-18' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (74, N'burak', N'yılmaz', N'address', N'email', N'02156784335', 235124435, N'mr        ', N'Turkey', N'tekirdağ', CAST(N'1982-05-04' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (75, N'ayşe', N'yılmaz', N'address', N'email', N'02234536845', 342124675, N'mrs       ', N'Turkey', N'ankara', CAST(N'1981-03-06' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (76, N'ahmet', N'yaman', N'address', N'email', N'02127343455', 523123445, N'mr        ', N'Turkey', N'erzincan', CAST(N'1980-02-23' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (77, N'nilüfer', N'küçük', N'address', N'email', N'02122346445', 534579275, N'mrs       ', N'Turkey', N'İstanbul', CAST(N'1974-05-28' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (78, N'deniz', N'özdemir', N'address', N'email', N'02123453845', 345285675, N'mrs       ', N'Turkey', N'İstanbul', CAST(N'1975-04-30' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (79, N'hasan', N'kayı', N'address', N'email', N'02345643845', 545126825, N'mr        ', N'Turkey', N'izmir', CAST(N'1986-06-10' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (80, N'emine', N'uzun', N'address', N'email', N'02123456545', 345560225, N'mrs       ', N'Turkey', N'bursa', CAST(N'1978-05-15' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (1081, N'aykuuuuuut', N'arıcı', N's', N'sa', N'02123456545', 44657, N'mr        ', N'Turkey', N'İstanbul', CAST(N'2015-12-21' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (1086, N'lorin', N'orduluoğlu', N'', N'lorinorduluoglu23@hotmail.com', N'5392295806', 4587, N'mrs       ', N'Turkey', N'İstanbul', CAST(N'1994-09-23' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (2091, N'rama', N'sdfsedfsrf', N'fsdfdfesw5', N'fdxfgxdc h', N'23456782324', 234567321, N'mrs       ', N'Turkey', N'İstanbul', CAST(N'2015-12-22' AS Date), N'no')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Surname], [Address], [Email], [Phone], [PassportNo], [Gender], [Country], [City], [BirthDate], [checkstatus]) VALUES (2094, N'ahmet', N'asmdasd', N'', N'', N'', 5123698, N'5891      ', N'5829', N'52123', CAST(N'2015-12-22' AS Date), N'no')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Laundry] ON 

INSERT [dbo].[Laundry] ([LoundryID], [ServiceID], [ServiceName], [ServiceInfo], [Price]) VALUES (1, 1, N'tshirt', N'1', 5)
INSERT [dbo].[Laundry] ([LoundryID], [ServiceID], [ServiceName], [ServiceInfo], [Price]) VALUES (2, 1, N'pant', N'', 10)
INSERT [dbo].[Laundry] ([LoundryID], [ServiceID], [ServiceName], [ServiceInfo], [Price]) VALUES (3, 1, N'jacket', N'', 20)
INSERT [dbo].[Laundry] ([LoundryID], [ServiceID], [ServiceName], [ServiceInfo], [Price]) VALUES (5, 1, N'shirt', N'', 5)
INSERT [dbo].[Laundry] ([LoundryID], [ServiceID], [ServiceName], [ServiceInfo], [Price]) VALUES (7, 1, N'', N'', 25)
SET IDENTITY_INSERT [dbo].[Laundry] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [ServiceID], [RoomNum], [ServicePrice], [FirstDay], [LastDay], [Quantity], [OrderPrice], [CarID], [LoundryID]) VALUES (3041, 1, 100, 1, NULL, NULL, 1000, 5000, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [ServiceID], [RoomNum], [ServicePrice], [FirstDay], [LastDay], [Quantity], [OrderPrice], [CarID], [LoundryID]) VALUES (3042, 2, 100, 200, CAST(N'2015-12-22' AS Date), CAST(N'2015-12-24' AS Date), NULL, 400, 4, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[RentCar] ON 

INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (4, 2, N'mercedes(34wa758)', NULL, 200)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (5, 2, N'volkswagen(34ga458)', NULL, 150)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (6, 2, N'fiat(34p978)', NULL, 125)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (7, 2, N'fiat(34vs558)', NULL, 125)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (8, 2, N'fiat(34wa7458)', NULL, 125)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (9, 2, N'dacia(34la858)', NULL, 100)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (10, 2, N'dacia(34wa7458)', NULL, 100)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (21, 2, N'volkswagen(34e8748)', NULL, 150)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (22, 2, N'bmw(34qw158)', NULL, 200)
INSERT [dbo].[RentCar] ([CarID], [serviceID], [CarBrand], [CustomerID], [Price]) VALUES (23, 2, N'bmw(34w3258)', NULL, 250)
SET IDENTITY_INSERT [dbo].[RentCar] OFF
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (100, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (101, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (102, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (103, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (104, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (105, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (106, NULL, N'available ', NULL, N'standard', 100)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (107, NULL, N'available ', NULL, N'premium', 150)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (108, NULL, N'available ', NULL, N'premium', 150)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (109, NULL, N'available ', NULL, N'premium', 150)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (201, NULL, N'available ', NULL, N'premium', 150)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (202, NULL, N'available ', NULL, N'suit', 250)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (203, NULL, N'available ', NULL, N'suit', 250)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (204, NULL, N'available ', NULL, N'suit', 250)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (205, NULL, N'available ', NULL, N'honeymoon', 350)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (206, NULL, N'available ', NULL, N'honeymoon', 350)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (207, NULL, N'available ', NULL, N'honeymoon', 350)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (208, NULL, N'available ', NULL, N'king', 500)
INSERT [dbo].[Rooms] ([RoomNum], [RoomInfo], [RoomStatus], [Extra], [Type], [RoomPrice]) VALUES (209, NULL, N'available ', NULL, N'king', 500)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Password], [image], [MemorizeQuestion], [MemorizeAnswer]) VALUES (1, N'aykut', N'123', NULL, N'surname?', N'arıcı')
INSERT [dbo].[Users] ([ID], [Name], [Password], [image], [MemorizeQuestion], [MemorizeAnswer]) VALUES (2, N'rama', N'123', NULL, N'surname?', N'mousali')
INSERT [dbo].[Users] ([ID], [Name], [Password], [image], [MemorizeQuestion], [MemorizeAnswer]) VALUES (3, N'metin', N'1234', NULL, N'surname?', N'zontul')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Rooms] FOREIGN KEY([RoomNum])
REFERENCES [dbo].[Rooms] ([RoomNum])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Rooms]
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD  CONSTRAINT [FK_CheckIn_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CheckIn] CHECK CONSTRAINT [FK_CheckIn_Customers]
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD  CONSTRAINT [FK_CheckIn_Rooms] FOREIGN KEY([RoomNum])
REFERENCES [dbo].[Rooms] ([RoomNum])
GO
ALTER TABLE [dbo].[CheckIn] CHECK CONSTRAINT [FK_CheckIn_Rooms]
GO
ALTER TABLE [dbo].[CheckOut]  WITH CHECK ADD  CONSTRAINT [FK_CheckOut_CheckIn] FOREIGN KEY([CheckInID])
REFERENCES [dbo].[CheckIn] ([CheckInID])
GO
ALTER TABLE [dbo].[CheckOut] CHECK CONSTRAINT [FK_CheckOut_CheckIn]
GO
ALTER TABLE [dbo].[CheckOut]  WITH CHECK ADD  CONSTRAINT [FK_CheckOut_Customers] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CheckOut] CHECK CONSTRAINT [FK_CheckOut_Customers]
GO
ALTER TABLE [dbo].[CheckOut]  WITH CHECK ADD  CONSTRAINT [FK_CheckOut_Rooms] FOREIGN KEY([RoomNum])
REFERENCES [dbo].[Rooms] ([RoomNum])
GO
ALTER TABLE [dbo].[CheckOut] CHECK CONSTRAINT [FK_CheckOut_Rooms]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([UserID_from])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Laundry] FOREIGN KEY([LoundryID])
REFERENCES [dbo].[Laundry] ([LoundryID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Laundry]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_RentCar] FOREIGN KEY([CarID])
REFERENCES [dbo].[RentCar] ([CarID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_RentCar]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Rooms] FOREIGN KEY([RoomNum])
REFERENCES [dbo].[Rooms] ([RoomNum])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Rooms]
GO
/****** Object:  Trigger [dbo].[tgr_bill]    Script Date: 21.05.2016 10:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgr_bill]
on [dbo].[CheckOut]
After INSERT
as
begin
declare @NumOfReservedDays int
declare @RoomNum int
declare @Type nvarchar(50)
declare @RoomPrice float
declare @LaundryPrice float
declare @TotalPrice float
declare @name nvarchar(50)
declare @surname nvarchar(50)
declare @BillDate Date
declare @noadults int
declare @nochild int
declare @customerID int
declare @checkindate date
declare @checkoutdate date
declare @rentcarPrice float
select 
 
@RoomNum=RoomNum,

@noadults=noadults,
@nochild=nochild,
@customerID=customerID,
@checkoutdate=CheckOutDate
 From inserted



Select @Type=[Type],@RoomPrice=RoomPrice from Rooms where RoomNum=@RoomNum;
Select @name=name,@surname=surname from Customers where CustomerID=@customerID;
select @checkindate=@checkindate from CheckIn where CustomerID=@customerID;


set @NumOfReservedDays=(Select DATEDIFF(day,@Checkindate,@Checkoutdate))



set @LaundryPrice=(Select sum(ServicePrice*Quantity) from dbo.[order] where serviceID=1 and RoomNum=@RoomNum);
set @rentcarPrice=(Select sum(ServicePrice*DATEDIFF(day,FirstDay,LastDay)) from dbo.[order] where serviceID=2 and RoomNum=@RoomNum);

set @TotalPrice=@LaundryPrice+@rentcarPrice;



insert into Bills
(NumOfReservedDays,
RoomNum,
[Type],
RoomPrice,
LaundryPrice,
TotalPrice,
name,
surname,
BillDate,
noadult,
nochild,
customerID
)
 values(
 @NumOfReservedDays,
@RoomNum,
@Type,
@RoomPrice,
@LaundryPrice,
@TotalPrice,
@name,
@surname,
@checkoutdate,
@noadults,
@nochild,
@customerID
 
 )





end
GO
USE [master]
GO
ALTER DATABASE [MVC_HotelProject2] SET  READ_WRITE 
GO
