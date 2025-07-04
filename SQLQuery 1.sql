SELECT AVG (price) AS avgprice FROM Properties;


SELECT Property_Type , COUNT (*) *100 / (SELECT VOUNT(*) FROM Properties) 
As Percentage FROM Properties
GROUP BY Property_Type;


SELECT Property_Type , COUNT(*) AS Count FROM Properties
GROUP BY Property_Type 
ORDER BY Count DESC



SELECT Property_Type , SUM(TRY_CAST (Price AS FLOAT )) 
As TotalSales FROM Properties
GROUP BY Property_Type
ORDER BY TotalSales DESC;



SELECT District , COUNT(*) AS PropertCount
FROM Properties
GROUP BY District
ORDER BY PropertCount DESC;


SELECT 
     District ,
	 SUM (TRY_CAST(REPLACE(Area, 'ã2' , '') AS FLOAT )) AS TotalArea,
	 AVG(Price) AS Avgprice 
FROM Properties
WHERE (TRY_CAST(REPLACE(Area, 'ã2' , '') AS FLOAT ) IS NOT NULL
GROUP BY District
ORDER BY Avgprice  DESC;




SELECT Property_Type,  MAX(Price) AS Maxprice FROM Properties GROUP BY Property_Type
ORDER BY Maxprice DESC





SELECT District , Property_Type, Price ,COUNT(*) AS LuxuryPropertCount
FROM Properties
WHERE Price >1000000
GROUP BY District, Property_Type, Price
ORDER BY LuxuryPropertCount DESC;


DECLARE @LuxuryThreshold FLOAT;
--ÍÓÇÈ ÇáÍÏ ÇáÇÏäì áÃÚáì 10% ãä ÇáÇÓÚÇÑ 
SELECT @LuxuryThreshold = Threshold 
FROM (
     SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY TRY_CAST(Price AS FLOAT ))
	 OVER () AS Threshold
	 FROM Properties
) AS T
WHERE Threshold IS NOT NULL;
-- ÇÓÊÎÑÇÌ ÇáÇÍíÇÁ ÇáÊí ÊÍÊæí Úáì ÇßÈÑ ÚÏÏ ãä ÇáÚÞÇÑÇÊ ÇáÝÇÎÑÉ
SELECT District , COUNT (*) AS LuxuryPropertyCount
FROM Properties 
WHERE TRY_CAST(Price AS FLOAT ) >= @LuxuryThreshold
GROUP BY District
ORDER BY LuxuryPropertyCount DESC;




SELECT TOP 1 *
FROM Properties
ORDER BY Price DESC;


SELECT TOP 1 *
FROM Properties
ORDER BY Price ASC;




SELECT TOP 5  District , Property_Type,Area, Description ,Location, AVG (Price) AS AvgPrice
FROM Properties
GROUP BY  District , Property_Type,Area, Description ,Location
ORDER BY AvgPrice DESC;


SELECT Agency_Name , AVG (Price) AS Avg_price
FROM [Riyadhaqar]] .[dbo].[Properties]
GROUP BY Agency_Name 
ORDER BY Avg_price;



SELECT 
   District, 
   CASE 
       WHEN Price < 500000 THEN 'Under 500K'
	   WHEN Price BETWEEN 500000 AND 1000000 THEN '500K -1M'
	   ELSE 'Above 1M'
   END AS PricRange ,
   (COUNT (*) *100.0) / (SELECT COUNT (*) FROM Properties) AS PriceRangePercentage
FROM Properties 
GROUP BY 
    District,
	CASE 
	   WHEN Price < 500000 THEN 'Under 500K'
	   WHEN Price BETWEEN 500000 AND 1000000 THEN '500K -1M'
	   ELSE 'Above 1M' 
	END
ORDER BY District , PriceRangePercentage;


SELECT Agency_Name, COUNT(*) AS Affordable_Proprties
FROM [Riyadhaqar]] .[dbo].[Properties]
WHERE Price <1000000
GROUP BY Agency_Name 
ORDER BY Affordable_Proprties DESC;


SELECT Agency_Name , COUNT(*) AS Property_Count
FROM [Riyadhaqar]] .[dbo].[Properties]
WHERE District = 'Íí ÇáÚáíÇ'
GROUP BY Agency_Name 
ORDER BYProperty_Count DESC;