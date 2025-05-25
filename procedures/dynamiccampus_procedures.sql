USE [dynamiccampus_db]
GO
/****** Object:  StoredProcedure [dbo].[P_FactSalesQuota]    Script Date: 5/25/2025 3:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC P_FactSalesQuota 0.25,0.45,0.35,0.25,0.35,0.3,0.2,0.25,0.2,0.15,0.05,0.05,0.2,0.05,0.05,0.1,0.05,0.05

CREATE PROC [dbo].[P_FactSalesQuota]
(
	@NAmerican2007 float,-----The forecast parameter
	@NAmerican2008 float,
	@NAmerican2009 float,
	@Europe2007 float,
	@Europe2008 float,
	@Europe2009 float,
	@Asia2007 float,
	@Asia2008 float,
	@Asia2009 float,
	@NAmerican2007Budget float,
	@NAmerican2008Budget float,
	@NAmerican2009Budget float,
	@Europe2007Budget float,
	@Europe2008Budget float,
	@Europe2009Budget float,
	@Asia2007Budget float,
	@Asia2008Budget float,
	@Asia2009Budget float	
)
AS
BEGIN
---Generate Basic Data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
 
SELECT      S.channelKey,S.StoreKey,S.ProductKey,
            DATEADD(d,-DAY(S.DateKey)+1,S.DateKey) AS DateKey,
            S.CurrencyKey,1 AS ScenarioKey,--Actual
            SUM(S.SalesQuantity) AS SalesQuantityQuota,
            SUM(S.SalesAmount) AS SalesAmount,
            SUM(S.SalesAmount)-SUM(S.ReturnAmount)-SUM(S.TotalCost) AS GrossMarginQuota,
            1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM		FactSales S
GROUP BY    S.StoreKey,DATEADD(d,-DAY(S.DateKey)+1,S.DateKey),
			S.channelKey,S.ProductKey,S.CurrencyKey

                  
---Update the Basic Data
---NAmerican
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2007 + 0.9)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2007 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2007 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE	s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' 
		and SubString(e.EntityLabel,1,2) = '01'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2008 + 1)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2008 + 1) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2008 + 1) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '01'


INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '01'

---Europe
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2007 + 0.9)) ,
            s.SalesAmountQuota * (RAND()*@Europe2007 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@Europe2007 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2008 + 1)) ,
            s.SalesAmountQuota * (RAND()*@Europe2008 + 1) , 
            s.GrossMarginQuota * (RAND()*@Europe2008 + 1) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '02'

---Asia
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2007 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2007 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2007 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2008 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2008 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@Asia2008 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
           Convert(int, s.SalesQuantityQuota * (RAND()*@Asia2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '03'


---NAmerican budget data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '01'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '01'


INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '01'

---Europe budget data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '02'

---Asia budget
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
           Convert(int, s.SalesQuantityQuota * (RAND()*@Asia2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '03'

--End
End



GO
/****** Object:  StoredProcedure [dbo].[P_FactStrategyPlan]    Script Date: 5/25/2025 3:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[P_FactStrategyPlan]
(
	@AdminCost float,----The percentage of the account
	@ITCost float,
	@HRCost float,
	@EnergyCost float,
	@FixedCost float,
	@VariableCost float,
	@AdCost float,
	@SpringAdCost float,
	@BackSchool float,
	@HolidayAdCost float,
	@CostofGoodsSold float,
	@SellCost float
)
AS
Begin
---Basic Data
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 2 as ScenarioKey, 8 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,
SUM(SalesAmount)*(RAND()*0.2+0.95) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY a.CalendarMonth,a.EntityKey,a.ProductCategoryKey

---Generate data for different account.
---AdminCost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 1 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@AdminCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---ITCost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 2 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@ITCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---HR Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 3 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@HRCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
from FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Energy Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 4 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@EnergyCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Fixed Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 5 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@FixedCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Variable Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 6 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@VariableCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 7 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@AdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Total Product Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 9 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(a.TotalCost)) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey


---Spring / Back to Business Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 10 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@SpringAdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Back-to-School Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 11 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@BackSchool) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
from FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Holiday Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 12 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@HolidayAdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Cost of Goods Sold 
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 13 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@CostofGoodsSold) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Selling, General & Administrative Expenses  
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 14 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@SellCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

End


GO
