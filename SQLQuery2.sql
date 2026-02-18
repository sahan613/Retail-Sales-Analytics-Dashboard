Alter Table Orders_Clean
ADD Profit_Margin Float;

Update Orders_clean
SET Order_Quater=DATEPART(QUARTER,Order_Date); 

Update Orders_clean
SET Profit_Margin=Profit/Sales 

Select top 10
Order_Date,Order_year,Order_month,Order_Quater
From Orders_clean;

Select TOP 100*
From Orders_Clean;

Create View ww_KPI_Summary AS
Select
   Sum(Sales) AS Total_Sales,
   Sum(Profit) AS Total_Profit,
   Count (Distinct Order_ID) AS Total_Orders,
   Count (Distinct Customer_ID) AS Total_Customers,
   SUM(Profit)/SUM(SALES) AS Overall_Profit_Margin
From Orders_Clean;

SELECT * FROM ww_KPI_Summary;


Create View vw_Monthly_Sales AS
SELECT
 Order_Year,
 Order_Month,
 SUM(Sales) AS Monthly_Sales,
 SUM(Profit) AS Monthly_Profit,
 Count(DISTINCT Order_ID) AS Monthly_Orders
From Orders_Clean
GROUP BY Order_Year,Order_Month;


SELECT * FROM vw_Monthly_Sales
ORDER BY Order_year,Order_Month;




Create View vw_Region_Performance As
Select
   Region,
   SUM(Sales) AS Total_Sales,
   SUM(Profit) AS Total_Profit,
   Count(Distinct Order_ID) AS Total_Orders,
   SUM(Profit)/SUM(Sales) AS Profit_Margin
From Orders_Clean
GROUP BY Region;

SELECT * from vw_Region_Performance;





CREATE VIEW vw_Peoduct_Performance AS
SELECT
  Product_Name,
  Category,
  Sub_Category,
  Sum(Sales) AS Total_Sales,
  Sum(Profit) AS Total_Profit,
  Sum(Quantity) AS Total_Quantity
FROM Orders_Clean
GROUP BY Product_Name,Category,Sub_Category;

Select * from vw_Peoduct_Performance;






CREATE VIEW vw_Customer_Performance AS
SELECT
   Customer_ID,
   Customer_Name,
   Segment,
   SUM(Sales) AS Total_Sales,
   SUM(Profit)AS Total_Profit,
   COUNT(DISTINCT Order_ID)AS Total_Orders
FROM orders_Clean
GROUP BY Customer_ID,Customer_Name,Segment;

Select * From vw_Customer_Performance
Order by Customer_ID;