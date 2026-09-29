/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/
use DataWarehouse;

-- Quick Date Functions
SELECT * FROM Gold.fact_sales;
-- Analyse sales performance over time
SELECT
    YEAR(order_date) as Year,
    SUM(sales_amount) as Total_revenue,
    COUNT(DISTINCT customer_key) as total_customers,
    SUM(quantity) as total_quantity
FROM Gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY  YEAR(order_date);


-- DATETRUNC()
SELECT
    DATETRUNC(month,order_date) as order_date,
    SUM(sales_amount) as Total_revenue,
    COUNT(DISTINCT customer_key) as total_customers,
    SUM(quantity) as total_quantity
FROM Gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
ORDER BY  DATETRUNC(month,order_date);


-- FORMAT()
SELECT
    FORMAT(order_date,'yyyy-MMM') as order_date,
    SUM(sales_amount) as Total_revenue,
    COUNT(DISTINCT customer_key) as total_customers,
    SUM(quantity) as total_quantity
FROM Gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY  FORMAT(order_date,'yyyy-MMM')
ORDER BY   FORMAT(order_date,'yyyy-MMM');
