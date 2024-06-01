-- Tạo cơ sở dữ liệu AW2012_DWH
CREATE DATABASE AW2012_DWH;
GO

-- Sử dụng cơ sở dữ liệu AW2012_DWH
USE AW2012_DWH;
GO

-- Tạo bảng Dim_Time
CREATE TABLE Dim_Time (
    DateKey NVARCHAR(8) PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT
);
GO

-- Tạo bảng Dim_Territory
CREATE TABLE Dim_Territory (
    TerritoryKey INT IDENTITY(1,1) PRIMARY KEY,
    TerritoryId INT,
    Name NVARCHAR(50),
    CountryRegionCode NVARCHAR(3)
);
GO

-- Tạo bảng Dim_SalesPerson
CREATE TABLE Dim_SalesPerson (
    SalesPersonKey INT IDENTITY(1,1) PRIMARY KEY,
    SalesPersonId INT,
    FullName NVARCHAR(500),
    NationalIDNumber NVARCHAR(15),
    Gender NCHAR(1),
    HireDate DATE
);
GO

-- Tạo bảng Dim_ProductCategory
CREATE TABLE Dim_ProductCategory (
    ProductCategoryKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductCategoryId INT,
    Name NVARCHAR(50)
);
GO

-- Tạo bảng Dim_ProductSubCategory
CREATE TABLE Dim_ProductSubCategory (
    ProductSubCategoryKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductSubCategoryId INT,
    Name NVARCHAR(50),
    ProductCategoryKey INT,
    FOREIGN KEY (ProductCategoryKey) REFERENCES Dim_ProductCategory(ProductCategoryKey)
);
GO

-- Tạo bảng Dim_Product
CREATE TABLE Dim_Product (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    ProductName NVARCHAR(25),
    StandardCost MONEY,
    ListPrice MONEY,
    Weight DECIMAL(8,2),
    ProductSubCategoryKey INT,
    FOREIGN KEY (ProductSubCategoryKey) REFERENCES Dim_ProductSubCategory(ProductSubCategoryKey)
);
GO

-- Tạo bảng Fact_SalesOrder
CREATE TABLE Fact_SalesOrder (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DateKey NVARCHAR(8),
    TerritoryKey INT,
    SalesPersonKey INT,
    Revenue DECIMAL(18,4),
    NumberOrder INT,
    FOREIGN KEY (DateKey) REFERENCES Dim_Time(DateKey),
    FOREIGN KEY (TerritoryKey) REFERENCES Dim_Territory(TerritoryKey),
    FOREIGN KEY (SalesPersonKey) REFERENCES Dim_SalesPerson(SalesPersonKey)
);
GO

-- Tạo bảng Fact_Product
CREATE TABLE Fact_Product (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DateKey NVARCHAR(8),
    TerritoryKey INT,
    ProductKey INT,
    Qty INT,
    FOREIGN KEY (DateKey) REFERENCES Dim_Time(DateKey),
    FOREIGN KEY (TerritoryKey) REFERENCES Dim_Territory(TerritoryKey),
    FOREIGN KEY (ProductKey) REFERENCES Dim_Product(ProductKey)
);
GO
