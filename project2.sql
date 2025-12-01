------------project 2.----


--------use WideWorldImporters

--------go


----------ex.1--


--------select YEAR (so.orderdate) year,
--------SUM(sil.extendedprice)-sum(sil.taxamount) as incomeperyear,
--------count(distinct month(so.orderdate)) as NumberofDistinctMonth,
--------SUM(sil.extendedprice)-sum(sil.taxamount)/count(distinct month(so.orderdate))*12 YearLinearincome,
--------from sales.Orders so join Sales.invoices si
--------on so.orderid=si.orderid
--------left join sales.invoicelines sil on sil.invoiceid=si.invoiceid
--------group by year(so.orderdate)
--------order by year(so.orderdate)



----ex.2--


--with cte1
--as(
--select YEAR(so.orderdate) TheYear,DATEPART(quarter,so.OrderDate) TheQuarter,sc.customername as CustomerName,sc.customerid as Customerid
--from Sales.Customers sc join Sales.Orders so 
--on sc.CustomerID=so.CustomerID
--),

--cte2 as(
--select TheYear,TheQuarter,CustomerName,sum(sil.extendedprice=sil.taxamount) as IncomeperYear
--from cte1 join Sales.Invoices si
--on cte1.Customerid=si.CustomerID 
--left join Sales.InvoiceLines sil
--on sil.InvoiceID-si.InvoiceID
--group by TheYear,TheQuarter,CustomerName
--),

--cte3 as(
--select TheYear,TheQuarter,CustomerName,IncomeperYear,
--ROW_NUMBER()over(partition by TheYear,TheQuarter order by incomeperyear desc)as DNR
--from cte2
--)
--select *
--from cte3
--where DNR<6



--------ex.3--


------select stockitemid,stockitemname,totalprofit
------from(
------select sil.StockItemID,wsi.StockItemName,
------SUM(sil.extendedprice)-sum(sil.taxamount) as totalprofit,
------row_number()over( order by SUM(sil.extendedprice)-sum(sil.taxamount) desc) as DNR
------from Warehouse.StockItems wsi join sales.InvoiceLines sil
------on wsi.stockitemid=sil.StockItemID

------group by  sil.StockItemID,wsi.StockItemName) a
------where DNR<11


------ex.4--


----with cte1
----as ( select StockItemID,StockItemName,UnitPrice,
----RecommendedRetailPrice,RecommendedRetailPrice-UnitPrice as NominalProductProfit
----from Warehouse.StockItems), 


----cte2 as
----(select ROW_NUMBER()over(order by NominalProductProfit desc) RN,StockItemID,StockItemName,UnitPrice
----,RecommendedRetailPrice,NominalProductProfit
----from cte1)

----select RN,StockItemID,StockItemName,UnitPrice,RecommendedRetailPrice,
----NominalProductProfit,DENSE_RANK()over(order by NominalProductProfit desc) dnr
----from cte2


----ex.5--


--select supplierDetails,STRING_AGG(concat(stockitemid,' ',stockitemname),'/') ProductDetails
--from(
--select wsi.SupplierID,CONCAT(wsi.supplierid,'--',ps.SupplierName) supplierDetails,wsi.StockItemID,wsi.StockItemName
--from Purchasing.Suppliers ps join Warehouse.StockItems wsi
--on ps.SupplierID=wsi.SupplierID) a
--group by supplierdetails,supplierid


--ex.6--


--with cte1
--as(
--select si.CustomerID as CustomerID, sum(sil.ExtendedPrice) as totalextendedprice
--from
--  sales.InvoiceLines sil join
--  Sales.Invoices si on sil.InvoiceID= si.InvoiceID
--group by si.CustomerID)
--select top (5) 
-- cte1.CustomerID,ac.CityName,ac1.CountryName,ac1.Continent,ac1.Region, cte1.totalextendedprice
-- FROM cte1 cte1 join Sales.Customers sc on cte1.CustomerID = sc.CustomerID
-- join Application.Cities ac on sc.PostalCityID=ac.CityID
-- join Application.StateProvinces asp on ac.StateProvinceID=asp.StateProvinceID
-- join Application.Countries ac1 on asp.CountryID=ac1.CountryID
 


-- ORDER BY cte1.totalextendedprice desc

--ex.7-- 


--WITH cte1
--AS (
--SELECT YEAR(so.OrderDate) OrderYear,MONTH(so.OrderDate) OrderMonth,
--SUM(sol.PickedQuantity * sol.UnitPrice) MonthlyTotal
--FROM Sales.Orders  so JOIN Sales.OrderLines  sol
--ON so.OrderID = sol.OrderID
--GROUP BY ROLLUP(YEAR(so.OrderDate), MONTH(so.OrderDate))
--)
--SELECT OrderYear,ISNULL(FORMAT(OrderMonth, '00'), N'Grand Total') OrderMonth,
--MonthlyTotal,SUM(MonthlyTotal) OVER (PARTITION BY OrderYear ORDER BY OrderMonth) CumulativeTotal
--FROM cte1
--WHERE OrderYear IS NOT NULL
--ORDER BY OrderYear, OrderMonth



--WITH cte1
--as
--(
--SELECT 
--  YEAR(so.OrderDate) as OrderYear,
--  MONTH(so.OrderDate) as OrderMonth,
--  SUM(sol.PickedQuantity * sol.UnitPrice) as MonthlyTotal
--FROM Sales.Orders so join Sales.OrderLines sol on sol.OrderID = so.OrderID

--GROUP BY YEAR(so.OrderDate), Month(so.OrderDate)
--ORDER BY OrderYear, OrderMonth
--)
--SELECT OrderYear, OrderMonth, 

--ex.8--


--WITH CTE1
--AS (
--select Year(OrderDate) OrderYear, Month(OrderDate) OrderMonth, OrderId
--FROM Sales.Orders
--)
--SELECT OrderMonth, [2013], [2014], [2015], [2016]
--FROM
--(Select OrderYear, OrderMonth, OrderId FROM CTE1) AS SourceTable
--PIVOT
--(
-- Count(OrderId) FOR OrderYear IN ([2013], [2014], [2015], [2016])
--) As PivotTable
--Order By OrderMonth




---ex.9--

--with cte1 as(

--select sc. customerid,sc.customername,max(si.invoicedate) orderdate,lag(si.invoicedate)
--over(partition by sc.customerid order by max(si.invoicedate)) preorderdate
--from sales.Customers sc join Sales.Invoices si
--on sc.CustomerID=si.CustomerID
--group by sc.customerid,sc.customername,si.InvoiceDate),

--cte2 as (
--select customerid,customername,orderdate,preorderdate,DATEDIFF(dd,preorderdate,orderdate) dayssincelastorder
--from cte1 
--where orderdate is not null) ,

--cte3 as(
--select  customerid,customername,orderdate,preorderdate,dayssincelastorder,
--AVG(dayssincelastorder) over(partition by customerid) AVGdaysBetweenOrders
--from cte2)

--select*, case when (dayssincelastorder *2)> AVGdaysBetweenOrders then 'Potential Churn'
--else 'Active' end as Cuscheck
--from cte3
--order by customerid,orderdate,customername,dayssincelastorder,Cuscheck

--ex.10--


--with cte1
--as(
--select cc.CustomerCategoryName,COUNT(DISTINCT c.CustomerID)  CustomerCOUNT
--from Sales.Customers c
--JOIN Sales.CustomerCategories  cc
--on c.CustomerCategoryID = cc.CustomerCategoryID
--WHERE c.CustomerName NOT LIKE 'Tailspin%' AND c.CustomerName NOT LIKE 'Wingtip%'
--GROUP BY cc.CustomerCategoryName
--)
--select cte1.CustomerCategoryName,CTE1.CustomerCOUNT,SUM(cte1.CustomerCOUNT) OVER ()  TotalCustCount,
--FORMAT((cte1.CustomerCOUNT * 100.0) / NULLIF(SUM(cte1.CustomerCOUNT) OVER (), 0), 'N2') + N'%' DistributionFactor
--from cte1
--ORDER BY cte1.CustomerCategoryName