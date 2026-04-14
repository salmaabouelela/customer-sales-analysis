CREATE DATABASE customer_sales_analysis;
USE customer_sales_analysis;
SELECT * FROM superstore LIMIT 10;

SELECT SUM(Sales) AS total_revenue
FROM superstore;


SELECT Region, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Region;

SELECT `Customer Name`, SUM(Sales) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Monthly sales and profit trend

SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY month
ORDER BY month;

-- Year-over-year sales by year

SELECT YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS order_year,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY order_year
ORDER BY order_year;

-- Top customer in each region using window functions

WITH customer_region_sales AS (
    SELECT Region,
           `Customer Name`,
           ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore
    GROUP BY Region, `Customer Name`
),
ranked_customers AS (
    SELECT Region,
           `Customer Name`,
           total_sales,
           RANK() OVER (PARTITION BY Region ORDER BY total_sales DESC) AS sales_rank
    FROM customer_region_sales
)
SELECT Region, `Customer Name`, total_sales
FROM ranked_customers
WHERE sales_rank = 1;


-- Most profitable sub-category in each category

WITH subcategory_profit AS (
    SELECT Category,
           `Sub-Category`,
           ROUND(SUM(Profit), 2) AS total_profit
    FROM superstore
    GROUP BY Category, `Sub-Category`
),
ranked_subcategories AS (
    SELECT Category,
           `Sub-Category`,
           total_profit,
           RANK() OVER (PARTITION BY Category ORDER BY total_profit DESC) AS profit_rank
    FROM subcategory_profit
)
SELECT Category, `Sub-Category`, total_profit
FROM ranked_subcategories
WHERE profit_rank = 1;

-- Products with high sales but negative profit

SELECT `Product Name`,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product Name`
HAVING SUM(Sales) > 1000 AND SUM(Profit) < 0
ORDER BY total_sales DESC;

-- Discount impact by discount band using CASE

SELECT 
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.2 THEN 'Low Discount'
        WHEN Discount > 0.2 AND Discount <= 0.5 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_band,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY discount_band
ORDER BY total_sales DESC;

-- Segment contribution to total sales

SELECT Segment,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(100 * SUM(Sales) / (SELECT SUM(Sales) FROM superstore), 2) AS sales_percentage
FROM superstore
GROUP BY Segment
ORDER BY total_sales DESC;

-- Regional profit margin

SELECT Region,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit,
       ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin_percent
FROM superstore
GROUP BY Region
ORDER BY profit_margin_percent DESC;

-- Average shipping delay by ship mode

SELECT `Ship Mode`,
       ROUND(AVG(DATEDIFF(
           STR_TO_DATE(`Ship Date`, '%m/%d/%Y'),
           STR_TO_DATE(`Order Date`, '%m/%d/%Y')
       )), 2) AS avg_shipping_days
FROM superstore
GROUP BY `Ship Mode`
ORDER BY avg_shipping_days;

-- Running monthly sales total

WITH monthly_sales AS (
    SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
           ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore
    GROUP BY month
)
SELECT month,
       total_sales,
       ROUND(SUM(total_sales) OVER (ORDER BY month), 2) AS running_total_sales
FROM monthly_sales
ORDER BY month;

-- Rank regions by profit

SELECT Region,
       ROUND(SUM(Profit), 2) AS total_profit,
       RANK() OVER (ORDER BY SUM(Profit) DESC) AS profit_rank
FROM superstore
GROUP BY Region;

-- Find repeat customers by number of orders

SELECT `Customer Name`,
       COUNT(DISTINCT `Order ID`) AS total_orders,
       ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
HAVING COUNT(DISTINCT `Order ID`) > 5
ORDER BY total_orders DESC, total_sales DESC;

-- Identify loss-making categories within each region

SELECT Region,
       Category,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Region, Category
HAVING SUM(Profit) < 0
ORDER BY Region, total_profit;

-- Top 3 products by sales within each category

WITH product_sales AS (
    SELECT Category,
           `Product Name`,
           ROUND(SUM(Sales), 2) AS total_sales
    FROM superstore
    GROUP BY Category, `Product Name`
),
ranked_products AS (
    SELECT Category,
           `Product Name`,
           total_sales,
           RANK() OVER (PARTITION BY Category ORDER BY total_sales DESC) AS sales_rank
    FROM product_sales
)
SELECT Category, `Product Name`, total_sales, sales_rank
FROM ranked_products
WHERE sales_rank <= 3
ORDER BY Category, sales_rank;

-- Compare average order value by segment

SELECT Segment,
       ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS avg_order_value
FROM superstore
GROUP BY Segment
ORDER BY avg_order_value DESC;