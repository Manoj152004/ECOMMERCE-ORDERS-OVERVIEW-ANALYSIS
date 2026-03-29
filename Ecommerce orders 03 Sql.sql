--Summary of all ecommerce orders how much product sale,returned etc.Down below

--1 .All data ?
SELECT * FROM orders LIMIT 10;

-- 2. Specific columns?
SELECT order_id, customer_id, product_name, revenue FROM orders;

-- 3. Filter by category?
SELECT * FROM orders WHERE product_category = 'Electronics';

-- 4. Sort by revenue?
SELECT order_id, product_name, revenue FROM orders ORDER BY revenue DESC;

-- 5. Count total orders?
SELECT COUNT(*) AS total_orders FROM orders;

-- 6. Total revenue by category?
SELECT product_category,SUM(revenue) AS total_revenue
FROM orders
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 7. Avg unit price per category
SELECT product_category, ROUND(AVG(unit_price), 2) AS avg_price
FROM orders
GROUP BY product_category;

-- 8. Orders with discount > 10%
SELECT order_id, product_name, discount_pct
FROM orders
WHERE CAST(discount_pct AS NUMERIC) > 10;

-- 9. Top 5 cities by revenue
SELECT city,
	ROUND(SUM(revenue)::numeric, 2) AS city_revenue
FROM orders
GROUP BY city
ORDER BY city_revenue DESC
LIMIT 5;

-- 10. Returned orders only
SELECT order_id, product_name, city
FROM orders
WHERE return_status = 'Returned';

-- 11. Monthly revenue trend
SELECT 
  TO_CHAR(order_date, 'YYYY-MM') AS month,
 ROUND(SUM(revenue)::numeric,2) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 12. Revenue by state and category
SELECT state, product_category,ROUND(SUM(revenue)::numeric,2) AS revenue
FROM orders
GROUP BY state, product_category
ORDER BY state, revenue DESC;

-- 13. Payment method breakdown
SELECT payment_method, COUNT(*) AS orders, SUM(revenue) AS total_revenue
FROM orders
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- 14. Delivery days per order
SELECT 
  order_id,
  product_name,
  order_date,
  delivery_date,
  (delivery_date - order_date) AS delivery_days
FROM orders
ORDER BY delivery_days DESC;

-- 15. Running total revenue (Window Function)
SELECT 
  order_id,
  order_date,
  revenue,
  SUM(revenue) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- 16. Rank products by revenue within each category
SELECT 
  product_category,
  product_name,
  SUM(revenue) AS revenue,
  RANK() OVER (PARTITION BY product_category ORDER BY SUM(revenue) DESC) AS rank
FROM orders
GROUP BY product_category, product_name;

-- 17. Customers with more than 3 orders
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3
ORDER BY order_count DESC;

-- 18. Above average revenue orders
SELECT order_id, product_name, revenue
FROM orders
WHERE revenue > (SELECT AVG(revenue) FROM orders)
ORDER BY revenue DESC;

-- 19. Month-over-month revenue change (CTE)
WITH monthly AS (
  SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(revenue) AS monthly_revenue
  FROM orders
  GROUP BY month
)
SELECT 
  month,
  monthly_revenue,
  LAG(monthly_revenue) OVER (ORDER BY month) AS prev_month,
  ROUND(monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month), 2) AS mom_change
FROM monthly
ORDER BY month;