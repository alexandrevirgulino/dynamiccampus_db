USE [dynamiccampus_db]
GO
/****** Object:  Table [dbo].[DimAccount]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAccount](
	[AccountKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAccountKey] [int] NULL,
	[AccountLabel] [nvarchar](100) NULL,
	[AccountName] [nvarchar](50) NULL,
	[AccountDescription] [nvarchar](50) NULL,
	[AccountType] [nvarchar](50) NULL,
	[Operator] [nvarchar](50) NULL,
	[CustomMembers] [nvarchar](300) NULL,
	[ValueType] [nvarchar](50) NULL,
	[CustomMemberOptions] [nvarchar](200) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimAccount_AccountKey] PRIMARY KEY CLUSTERED 
(
	[AccountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimChannel]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimChannel](
	[ChannelKey] [int] IDENTITY(1,1) NOT NULL,
	[ChannelLabel] [nvarchar](100) NOT NULL,
	[ChannelName] [nvarchar](20) NULL,
	[ChannelDescription] [nvarchar](50) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimChannel_ChannelKey] PRIMARY KEY CLUSTERED 
(
	[ChannelKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCurrency]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyLabel] [nvarchar](10) NOT NULL,
	[CurrencyName] [nvarchar](20) NOT NULL,
	[CurrencyDescription] [nvarchar](50) NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED 
(
	[CurrencyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimCurrency_CurrencyLabel] UNIQUE NONCLUSTERED 
(
	[CurrencyLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NOT NULL,
	[CustomerLabel] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NameStyle] [bit] NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Suffix] [nvarchar](10) NULL,
	[Gender] [nvarchar](1) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[YearlyIncome] [money] NULL,
	[TotalChildren] [tinyint] NULL,
	[NumberChildrenAtHome] [tinyint] NULL,
	[Education] [nvarchar](40) NULL,
	[Occupation] [nvarchar](100) NULL,
	[HouseOwnerFlag] [nchar](1) NULL,
	[NumberCarsOwned] [tinyint] NULL,
	[AddressLine1] [nvarchar](120) NULL,
	[AddressLine2] [nvarchar](120) NULL,
	[Phone] [nvarchar](20) NULL,
	[DateFirstPurchase] [date] NULL,
	[CustomerType] [nvarchar](15) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimCustomer_CustomerKey] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_DimCustomer_CustomerLabel] UNIQUE NONCLUSTERED 
(
	[CustomerLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Datekey] [datetime] NOT NULL,
	[FullDateLabel] [nvarchar](20) NOT NULL,
	[DateDescription] [nvarchar](20) NOT NULL,
	[CalendarYear] [int] NOT NULL,
	[CalendarYearLabel] [nvarchar](20) NOT NULL,
	[CalendarHalfYear] [int] NOT NULL,
	[CalendarHalfYearLabel] [nvarchar](20) NOT NULL,
	[CalendarQuarter] [int] NOT NULL,
	[CalendarQuarterLabel] [nvarchar](20) NULL,
	[CalendarMonth] [int] NOT NULL,
	[CalendarMonthLabel] [nvarchar](20) NOT NULL,
	[CalendarWeek] [int] NOT NULL,
	[CalendarWeekLabel] [nvarchar](20) NOT NULL,
	[CalendarDayOfWeek] [int] NOT NULL,
	[CalendarDayOfWeekLabel] [nvarchar](10) NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[FiscalYearLabel] [nvarchar](20) NOT NULL,
	[FiscalHalfYear] [int] NOT NULL,
	[FiscalHalfYearLabel] [nvarchar](20) NOT NULL,
	[FiscalQuarter] [int] NOT NULL,
	[FiscalQuarterLabel] [nvarchar](20) NOT NULL,
	[FiscalMonth] [int] NOT NULL,
	[FiscalMonthLabel] [nvarchar](20) NOT NULL,
	[IsWorkDay] [nvarchar](20) NOT NULL,
	[IsHoliday] [int] NOT NULL,
	[HolidayName] [nvarchar](20) NOT NULL,
	[EuropeSeason] [nvarchar](50) NULL,
	[NorthAmericaSeason] [nvarchar](50) NULL,
	[AsiaSeason] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED 
(
	[Datekey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentEmployeeKey] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [date] NULL,
	[BirthDate] [date] NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Phone] [nvarchar](25) NULL,
	[MaritalStatus] [nchar](1) NULL,
	[EmergencyContactName] [nvarchar](50) NULL,
	[EmergencyContactPhone] [nvarchar](25) NULL,
	[SalariedFlag] [bit] NULL,
	[Gender] [nchar](1) NULL,
	[PayFrequency] [tinyint] NULL,
	[BaseRate] [money] NULL,
	[VacationHours] [smallint] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SalesPersonFlag] [bit] NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimEmployee_EmployeeKey] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEntity]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEntity](
	[EntityKey] [int] IDENTITY(1,1) NOT NULL,
	[EntityLabel] [nvarchar](100) NULL,
	[ParentEntityKey] [int] NULL,
	[ParentEntityLabel] [nvarchar](100) NULL,
	[EntityName] [nvarchar](50) NULL,
	[EntityDescription] [nvarchar](100) NULL,
	[EntityType] [nvarchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimEntity_EntityKey] PRIMARY KEY CLUSTERED 
(
	[EntityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGeography]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyType] [nvarchar](50) NOT NULL,
	[ContinentName] [nvarchar](50) NOT NULL,
	[CityName] [nvarchar](100) NULL,
	[StateProvinceName] [nvarchar](100) NULL,
	[RegionCountryName] [nvarchar](100) NULL,
	[Geometry] [geometry] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED 
(
	[GeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimMachine]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimMachine](
	[MachineKey] [int] NOT NULL,
	[MachineLabel] [nvarchar](100) NULL,
	[StoreKey] [int] NOT NULL,
	[MachineType] [nvarchar](50) NOT NULL,
	[MachineName] [nvarchar](100) NOT NULL,
	[MachineDescription] [nvarchar](200) NOT NULL,
	[VendorName] [nvarchar](50) NOT NULL,
	[MachineOS] [nvarchar](50) NOT NULL,
	[MachineSource] [nvarchar](100) NOT NULL,
	[MachineHardware] [nvarchar](100) NULL,
	[MachineSoftware] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ServiceStartDate] [datetime] NOT NULL,
	[DecommissionDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimMachine_MachineKey] PRIMARY KEY CLUSTERED 
(
	[MachineKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOutage]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOutage](
	[OutageKey] [int] IDENTITY(1,1) NOT NULL,
	[OutageLabel] [nvarchar](100) NOT NULL,
	[OutageName] [nvarchar](50) NOT NULL,
	[OutageDescription] [nvarchar](200) NOT NULL,
	[OutageType] [nvarchar](50) NOT NULL,
	[OutageTypeDescription] [nvarchar](200) NOT NULL,
	[OutageSubType] [nvarchar](50) NOT NULL,
	[OutageSubTypeDescription] [nvarchar](200) NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimOutage_OutageKey] PRIMARY KEY CLUSTERED 
(
	[OutageKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductLabel] [nvarchar](255) NULL,
	[ProductName] [nvarchar](500) NULL,
	[ProductDescription] [nvarchar](400) NULL,
	[ProductSubcategoryKey] [int] NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[BrandName] [nvarchar](50) NULL,
	[ClassID] [nvarchar](10) NULL,
	[ClassName] [nvarchar](20) NULL,
	[StyleID] [nvarchar](10) NULL,
	[StyleName] [nvarchar](20) NULL,
	[ColorID] [nvarchar](10) NULL,
	[ColorName] [nvarchar](20) NOT NULL,
	[Size] [nvarchar](50) NULL,
	[SizeRange] [nvarchar](50) NULL,
	[SizeUnitMeasureID] [nvarchar](20) NULL,
	[Weight] [float] NULL,
	[WeightUnitMeasureID] [nvarchar](20) NULL,
	[UnitOfMeasureID] [nvarchar](10) NULL,
	[UnitOfMeasureName] [nvarchar](40) NULL,
	[StockTypeID] [nvarchar](10) NULL,
	[StockTypeName] [nvarchar](40) NULL,
	[UnitCost] [money] NULL,
	[UnitPrice] [money] NULL,
	[AvailableForSaleDate] [datetime] NULL,
	[StopSaleDate] [datetime] NULL,
	[Status] [nvarchar](7) NULL,
	[ImageURL] [nvarchar](150) NULL,
	[ProductURL] [nvarchar](150) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProductCategory]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryLabel] [nvarchar](100) NULL,
	[ProductCategoryName] [nvarchar](30) NOT NULL,
	[ProductCategoryDescription] [nvarchar](50) NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimProductCategory_ProductCategoryLabel] UNIQUE NONCLUSTERED 
(
	[ProductCategoryLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProductSubcategory]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryLabel] [nvarchar](100) NULL,
	[ProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductSubcategoryDescription] [nvarchar](100) NULL,
	[ProductCategoryKey] [int] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryLabel] UNIQUE NONCLUSTERED 
(
	[ProductSubcategoryLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPromotion]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPromotion](
	[PromotionKey] [int] IDENTITY(1,1) NOT NULL,
	[PromotionLabel] [nvarchar](100) NULL,
	[PromotionName] [nvarchar](100) NULL,
	[PromotionDescription] [nvarchar](255) NULL,
	[DiscountPercent] [float] NULL,
	[PromotionType] [nvarchar](50) NULL,
	[PromotionCategory] [nvarchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[MinQuantity] [int] NULL,
	[MaxQuantity] [int] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimPromotion_PromotionKey] PRIMARY KEY CLUSTERED 
(
	[PromotionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimPromotion_PromotionLabel] UNIQUE NONCLUSTERED 
(
	[PromotionLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesTerritory]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesTerritory](
	[SalesTerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NOT NULL,
	[SalesTerritoryLabel] [nvarchar](100) NULL,
	[SalesTerritoryName] [nvarchar](50) NOT NULL,
	[SalesTerritoryRegion] [nvarchar](50) NOT NULL,
	[SalesTerritoryCountry] [nvarchar](50) NOT NULL,
	[SalesTerritoryGroup] [nvarchar](50) NULL,
	[SalesTerritoryLevel] [nvarchar](10) NULL,
	[SalesTerritoryManager] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED 
(
	[SalesTerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryLabel] UNIQUE NONCLUSTERED 
(
	[SalesTerritoryLabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimScenario]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimScenario](
	[ScenarioKey] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioLabel] [nvarchar](100) NOT NULL,
	[ScenarioName] [nvarchar](20) NULL,
	[ScenarioDescription] [nvarchar](50) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED 
(
	[ScenarioKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyKey] [int] NOT NULL,
	[StoreManager] [int] NULL,
	[StoreType] [nvarchar](15) NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[StoreDescription] [nvarchar](300) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[OpenDate] [datetime] NOT NULL,
	[CloseDate] [datetime] NULL,
	[EntityKey] [int] NULL,
	[ZipCode] [nvarchar](20) NULL,
	[ZipCodeExtension] [nvarchar](10) NULL,
	[StorePhone] [nvarchar](15) NULL,
	[StoreFax] [nvarchar](14) NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[CloseReason] [nvarchar](20) NULL,
	[EmployeeCount] [int] NULL,
	[SellingAreaSize] [float] NULL,
	[LastRemodelDate] [datetime] NULL,
	[GeoLocation] [geography] NULL,
	[Geometry] [geometry] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_DimStore_StoreKey] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactExchangeRate]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactExchangeRate](
	[ExchangeRateKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[AverageRate] [float] NOT NULL,
	[EndOfDayRate] [float] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactExchangeRate_ExchangeRateKey] PRIMARY KEY CLUSTERED 
(
	[ExchangeRateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactInventory]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInventory](
	[InventoryKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[OnHandQuantity] [int] NOT NULL,
	[OnOrderQuantity] [int] NOT NULL,
	[SafetyStockQuantity] [int] NULL,
	[UnitCost] [money] NOT NULL,
	[DaysInStock] [int] NULL,
	[MinDayInStock] [int] NULL,
	[MaxDayInStock] [int] NULL,
	[Aging] [int] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactInventory_InventoryKey] PRIMARY KEY CLUSTERED 
(
	[InventoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactITMachine]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactITMachine](
	[ITMachinekey] [int] IDENTITY(1,1) NOT NULL,
	[MachineKey] [int] NOT NULL,
	[Datekey] [datetime] NOT NULL,
	[CostAmount] [money] NULL,
	[CostType] [nvarchar](200) NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactITMachine] PRIMARY KEY CLUSTERED 
(
	[ITMachinekey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactITSLA]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactITSLA](
	[ITSLAkey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[MachineKey] [int] NOT NULL,
	[OutageKey] [int] NOT NULL,
	[OutageStartTime] [datetime] NOT NULL,
	[OutageEndTime] [datetime] NOT NULL,
	[DownTime] [int] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactITSLA_ITSLAKey] PRIMARY KEY CLUSTERED 
(
	[ITSLAkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactOnlineSales]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOnlineSales](
	[OnlineSalesKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [int] NULL,
	[SalesQuantity] [int] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[ReturnQuantity] [int] NOT NULL,
	[ReturnAmount] [money] NULL,
	[DiscountQuantity] [int] NULL,
	[DiscountAmount] [money] NULL,
	[TotalCost] [money] NOT NULL,
	[UnitCost] [money] NULL,
	[UnitPrice] [money] NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactOnlineSales_SalesKey] PRIMARY KEY CLUSTERED 
(
	[OnlineSalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesKey] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[channelKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[PromotionKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[SalesQuantity] [int] NOT NULL,
	[ReturnQuantity] [int] NOT NULL,
	[ReturnAmount] [money] NULL,
	[DiscountQuantity] [int] NULL,
	[DiscountAmount] [money] NULL,
	[TotalCost] [money] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactSales_SalesKey] PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesQuota]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesQuota](
	[SalesQuotaKey] [int] IDENTITY(1,1) NOT NULL,
	[ChannelKey] [int] NOT NULL,
	[StoreKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[DateKey] [datetime] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[ScenarioKey] [int] NOT NULL,
	[SalesQuantityQuota] [money] NOT NULL,
	[SalesAmountQuota] [money] NOT NULL,
	[GrossMarginQuota] [money] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactSalesQuota_SalesQuotaKey] PRIMARY KEY CLUSTERED 
(
	[SalesQuotaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactStrategyPlan]    Script Date: 5/25/2025 2:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactStrategyPlan](
	[StrategyPlanKey] [int] IDENTITY(1,1) NOT NULL,
	[Datekey] [datetime] NOT NULL,
	[EntityKey] [int] NOT NULL,
	[ScenarioKey] [int] NOT NULL,
	[AccountKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NULL,
	[Amount] [money] NOT NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_FactStrategyPlan_StrategyPlanKey] PRIMARY KEY CLUSTERED 
(
	[StrategyPlanKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimEntity] ADD  CONSTRAINT [DF_DimEntity_Status]  DEFAULT (N'Current') FOR [Status]
GO
ALTER TABLE [dbo].[DimCustomer]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomer_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimCustomer] CHECK CONSTRAINT [FK_DimCustomer_DimGeography]
GO
ALTER TABLE [dbo].[DimEmployee]  WITH CHECK ADD  CONSTRAINT [FK_DimEmployee_DimEmployee] FOREIGN KEY([ParentEmployeeKey])
REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[DimEmployee] CHECK CONSTRAINT [FK_DimEmployee_DimEmployee]
GO
ALTER TABLE [dbo].[DimMachine]  WITH CHECK ADD  CONSTRAINT [FK_DimMachine_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[DimMachine] CHECK CONSTRAINT [FK_DimMachine_DimStore]
GO
ALTER TABLE [dbo].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY([ProductSubcategoryKey])
REFERENCES [dbo].[DimProductSubcategory] ([ProductSubcategoryKey])
GO
ALTER TABLE [dbo].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimProductSubcategory]
GO
ALTER TABLE [dbo].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimProductCategory]
GO
ALTER TABLE [dbo].[DimSalesTerritory]  WITH CHECK ADD  CONSTRAINT [FK_DimSalesTerritory_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimSalesTerritory] CHECK CONSTRAINT [FK_DimSalesTerritory_DimGeography]
GO
ALTER TABLE [dbo].[DimStore]  WITH CHECK ADD  CONSTRAINT [FK_DimStore_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimStore] CHECK CONSTRAINT [FK_DimStore_DimGeography]
GO
ALTER TABLE [dbo].[FactExchangeRate]  WITH CHECK ADD  CONSTRAINT [FK_FactExchangeRate_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactExchangeRate] CHECK CONSTRAINT [FK_FactExchangeRate_DimCurrency]
GO
ALTER TABLE [dbo].[FactExchangeRate]  WITH CHECK ADD  CONSTRAINT [FK_FactExchangeRate_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactExchangeRate] CHECK CONSTRAINT [FK_FactExchangeRate_DimDate]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimCurrency]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimDate]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimProduct]
GO
ALTER TABLE [dbo].[FactInventory]  WITH CHECK ADD  CONSTRAINT [FK_FactInventory_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactInventory] CHECK CONSTRAINT [FK_FactInventory_DimStore]
GO
ALTER TABLE [dbo].[FactITMachine]  WITH CHECK ADD  CONSTRAINT [FK_FactITMachine_DimDate] FOREIGN KEY([Datekey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITMachine] CHECK CONSTRAINT [FK_FactITMachine_DimDate]
GO
ALTER TABLE [dbo].[FactITMachine]  WITH CHECK ADD  CONSTRAINT [FK_FactITMachine_DimMachine] FOREIGN KEY([MachineKey])
REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
ALTER TABLE [dbo].[FactITMachine] CHECK CONSTRAINT [FK_FactITMachine_DimMachine]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimDate]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimMachine] FOREIGN KEY([MachineKey])
REFERENCES [dbo].[DimMachine] ([MachineKey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimMachine]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimOutage] FOREIGN KEY([OutageKey])
REFERENCES [dbo].[DimOutage] ([OutageKey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimOutage]
GO
ALTER TABLE [dbo].[FactITSLA]  WITH CHECK ADD  CONSTRAINT [FK_FactITSLA_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactITSLA] CHECK CONSTRAINT [FK_FactITSLA_DimStore]
GO
ALTER TABLE [dbo].[FactOnlineSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOnlineSales_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] CHECK CONSTRAINT [FK_FactOnlineSales_DimCurrency]
GO
ALTER TABLE [dbo].[FactOnlineSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOnlineSales_DimCustomer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] CHECK CONSTRAINT [FK_FactOnlineSales_DimCustomer]
GO
ALTER TABLE [dbo].[FactOnlineSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOnlineSales_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactOnlineSales] CHECK CONSTRAINT [FK_FactOnlineSales_DimDate]
GO
ALTER TABLE [dbo].[FactOnlineSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOnlineSales_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] CHECK CONSTRAINT [FK_FactOnlineSales_DimProduct]
GO
ALTER TABLE [dbo].[FactOnlineSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOnlineSales_DimPromotion] FOREIGN KEY([PromotionKey])
REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] CHECK CONSTRAINT [FK_FactOnlineSales_DimPromotion]
GO
ALTER TABLE [dbo].[FactOnlineSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOnlineSales_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactOnlineSales] CHECK CONSTRAINT [FK_FactOnlineSales_DimStore]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimChannel] FOREIGN KEY([channelKey])
REFERENCES [dbo].[DimChannel] ([ChannelKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimChannel]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCurrency]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimDate]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimProduct]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimPromotion] FOREIGN KEY([PromotionKey])
REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimPromotion]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimStore]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimChannel] FOREIGN KEY([ChannelKey])
REFERENCES [dbo].[DimChannel] ([ChannelKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimChannel]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimCurrency]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimDate]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimProduct]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimScenario] FOREIGN KEY([ScenarioKey])
REFERENCES [dbo].[DimScenario] ([ScenarioKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimScenario]
GO
ALTER TABLE [dbo].[FactSalesQuota]  WITH CHECK ADD  CONSTRAINT [FK_FactSalesQuota_DimStore] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[DimStore] ([StoreKey])
GO
ALTER TABLE [dbo].[FactSalesQuota] CHECK CONSTRAINT [FK_FactSalesQuota_DimStore]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimAccount] FOREIGN KEY([AccountKey])
REFERENCES [dbo].[DimAccount] ([AccountKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimAccount]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimCurrency]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimDate] FOREIGN KEY([Datekey])
REFERENCES [dbo].[DimDate] ([Datekey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimDate]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimEntity] FOREIGN KEY([EntityKey])
REFERENCES [dbo].[DimEntity] ([EntityKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimEntity]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimProductCategory]
GO
ALTER TABLE [dbo].[FactStrategyPlan]  WITH CHECK ADD  CONSTRAINT [FK_FactStrategyPlan_DimScenario] FOREIGN KEY([ScenarioKey])
REFERENCES [dbo].[DimScenario] ([ScenarioKey])
GO
ALTER TABLE [dbo].[FactStrategyPlan] CHECK CONSTRAINT [FK_FactStrategyPlan_DimScenario]
GO
