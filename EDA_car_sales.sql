-- Top 10 colors by total odometer reading
SELECT 
    color, SUM(odometer) AS odometer_sum
FROM
    car_prices
GROUP BY color
ORDER BY odometer_sum DESC
LIMIT 10;

-- Top 5 car body types by total odometer reading
SELECT 
    body, SUM(odometer) AS odometer_sum
FROM
    car_prices
GROUP BY body
ORDER BY odometer_sum DESC
LIMIT 5;

-- make vs mmr
SELECT 
    make, SUM(mmr) AS mmr_sum
FROM
    car_prices
GROUP BY make
ORDER BY mmr_sum DESC;

-- transmission vs odometer reading
SELECT 
    transmission, SUM(odometer) AS odometer_sum
FROM
    car_prices
GROUP BY transmission
ORDER BY odometer_sum DESC;

-- make, sellng price vs count
SELECT 
    make, sellingprice, COUNT(sellingprice) AS cnt
FROM
    car_prices
GROUP BY make , sellingprice
ORDER BY cnt DESC;

-- Body type with the most cars sold and their average selling price
SELECT 
    body,
    COUNT(*) AS total_cars_sold,
    AVG(sellingprice) AS avg_selling_price
FROM
    car_prices
GROUP BY body
ORDER BY total_cars_sold DESC;

-- percentage of Cars Sold Above Manufacturer's Market Retail (MMR) by Make
WITH CarDetails AS (
    SELECT make, 
           CASE WHEN sellingprice > MMR THEN 1 ELSE 0 END AS AboveMMR
    FROM car_prices
    WHERE mmr IS NOT NULL
)
SELECT make, 
       ROUND(AVG(AboveMMR) * 100,2) AS PercentageAboveMMR
FROM CarDetails
GROUP BY make
ORDER BY PercentageAboveMMR DESC;

-- Total revenue by seller
SELECT 
    Seller,
    SUM(SellingPrice) AS TotalRevenue
FROM
    car_prices
GROUP BY Seller
ORDER BY TotalRevenue DESC;






