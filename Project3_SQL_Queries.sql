SELECT Order_ID, Date, Product, Quantity, Revenue, Order_Status
FROM ecommerce_dataset
WHERE Order_Status = 'Shipped'
	AND Revenue > 1000
    ORDER BY Revenue DESC;
    
SELECT
	Product,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    AVG(Revenue) AS Avg_Order_Value
FROM ecommerce_dataset
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT
	Customer_ID, 
    COUNT(Order_ID) AS Order_Count,
    SUM(Revenue) AS Total_Spent,
    AVG(Revenue) AS Avg_Order_Value
FROM ecommerce_dataset
GROUP BY Customer_ID
HAVING SUM(Revenue) > 5000
ORDER BY Total_Spent DESC;

SELECT 
       YEAR(STR_TO_DATE(Date, '%m/%d/%Y')) AS Year,
	   MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month,
       ROUND(SUM(Total_Price), 2) AS Monthly_Revenue,
       COUNT(Order_ID) AS Orders
FROM ecommerce_db.ecommerce_dataset
WHERE Date IS NOT NULL
GROUP BY
         YEAR(STR_TO_DATE(Date, '%m/%d/%Y')),
         MONTH(STR_TO_DATE(Date, '%m/%d/%Y'))
ORDER BY Monthly_Revenue 
DESC;