USE [master]
GO
/****** Object:  Database [AW2012_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
CREATE DATABASE [AW2012_STG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AW2012_STG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THINH1\MSSQL\DATA\AW2012_STG.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AW2012_STG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THINH1\MSSQL\DATA\AW2012_STG_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AW2012_STG] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AW2012_STG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AW2012_STG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AW2012_STG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AW2012_STG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AW2012_STG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AW2012_STG] SET ARITHABORT OFF 
GO
ALTER DATABASE [AW2012_STG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AW2012_STG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AW2012_STG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AW2012_STG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AW2012_STG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AW2012_STG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AW2012_STG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AW2012_STG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AW2012_STG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AW2012_STG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AW2012_STG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AW2012_STG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AW2012_STG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AW2012_STG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AW2012_STG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AW2012_STG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AW2012_STG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AW2012_STG] SET RECOVERY FULL 
GO
ALTER DATABASE [AW2012_STG] SET  MULTI_USER 
GO
ALTER DATABASE [AW2012_STG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AW2012_STG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AW2012_STG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AW2012_STG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AW2012_STG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AW2012_STG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AW2012_STG', N'ON'
GO
ALTER DATABASE [AW2012_STG] SET QUERY_STORE = ON
GO
ALTER DATABASE [AW2012_STG] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AW2012_STG]
GO
/****** Object:  Table [dbo].[Dim_SalesPerson_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_SalesPerson_STG](
	[SalesPersonID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL,
	[Fullname] [nvarchar](152) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Territory_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Territory_STG](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Time_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Time_STG](
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_STG](
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_SalesOrder_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_SalesOrder_STG](
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[OrderDate] [date] NULL,
	[Revenue] [money] NULL,
	[NumberOrder] [numeric](20, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodcut Sub Category_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodcut Sub Category_STG](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product Category_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product Category_STG](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_STG](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Weight] [numeric](8, 2) NULL,
	[ProductSubcategoryID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrderDetail_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderDetail_STG](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL,
	[LineTotal] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleOrderHeader_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleOrderHeader_STG](
	[SalesOrderID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TerritoryID] [int] NULL,
	[TotalDue] [money] NULL,
	[Status] [tinyint] NULL,
	[SalesPersonID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Save Person_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Save Person_STG](
	[BusinessEntityID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PersonType] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territory_STG]    Script Date: 6/2/2024 2:59:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territory_STG](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [AW2012_STG] SET  READ_WRITE 
GO
