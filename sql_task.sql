-- 1. Write a SQL query to retrieve the top 5 customers by total spending
SELECT 
    c.customer_id, 
    c.name, 
    SUM(o.total_amount) AS total_spent
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
ORDER BY 
    total_spent DESC
LIMIT 5;


-- 2. Write a SQL query to find the number of orders placed each month in the last year.
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS number_of_orders
FROM 
    orders
WHERE 
    order_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY 
    month
ORDER BY 
    month;
    

-- 3. Write a SQL query to determine the average order value (AOV).
SELECT 
    AVG(total_amount) AS average_order_value
FROM 
    orders;
    

-- 4. Write a SQL query to find customers who have not placed any orders in the last 6 months.
SELECT 
    c.customer_id, 
    c.name, 
    c.email
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id 
    AND o.order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
WHERE 
    o.order_id IS NULL;
