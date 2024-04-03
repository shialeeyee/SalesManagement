-- Cleansed DIM_Product Table --
SELECT 
  p.[ProductKey] AS [Product Key], 
  p.[ProductAlternateKey] AS [Product Code], 
  --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  p.[EnglishProductName] AS [Product Name], 
  ps.EnglishProductSubcategoryName AS [Sub Category], 
  -- Joined in from Sub Category Table
  pc.EnglishProductCategoryName AS [Product Category], 
  -- Joined in from Category Table
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  p.[Color] AS [Product Color], 
  --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  p.[Size]AS [Product Size], 
  --,[SizeRange]
  --,[Weight]
  --,[DaysToManufacture]
  p.[ProductLine]AS [Product Line], 
  --,[DealerPrice]
  --,[Class]
  --,[Style]
  p.[ModelName]AS [Product Model Name], 
  --,[LargePhoto]
  p.[EnglishDescription]AS [English Description], 
  --,[FrenchDescription]
  p.[ChineseDescription]AS [Chinese Description], 
  --,[ArabicDescription]
  --,[HebrewDescription]
  --,[ThaiDescription]
  --,[GermanDescription]
  --,[JapaneseDescription]
  --,[TurkishDescription]
  --,[StartDate]
  --,[EndDate]
  --,[Status]
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as p 
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc
