-- 1. Top 5 Products by Units Wasted
SELECT 
  Product,
  SUM([Units Wasted]) AS Total_Waste
FROM waste_data
GROUP BY Product
ORDER BY Total_Waste DESC
LIMIT 5;

-- 2. Waste Percentage per Product
SELECT 
  Product,
  SUM([Units Sold]) AS Total_Sold,
  SUM([Units Wasted]) AS Total_Wasted,
  ROUND((CAST(SUM([Units Wasted]) AS FLOAT) / NULLIF(SUM([Units Sold]), 0)) * 100, 2) AS Waste_Percentage
FROM waste_data
GROUP BY Product
ORDER BY Waste_Percentage DESC;

-- 3. Regional Waste Summary
SELECT 
  Region,
  SUM([Units Wasted]) AS Region_Waste,
  SUM([Units Sold]) AS Region_Sold
FROM waste_data
GROUP BY Region
ORDER BY Region_Waste DESC;
