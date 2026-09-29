/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/
use DataWarehouse;
-- Calculate the total sales per month 
-- and the running total of sales over time 
SELECT
    sales_amount,
    SUM(sales_amount) OVER(ORDER BY SUM(sales_amount)) as Cumulative_sales
FROM gold.fact_sales
GROUP BY sales_amount;