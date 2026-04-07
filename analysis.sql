-- Топ городов по выручке
SELECT city, SUM(price) AS revenue
FROM orders
WHERE status = 'delivered'
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;

-- Доля отмен по городам
SELECT 
    city,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
    100.0 * SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) / COUNT(*) AS cancel_rate
FROM orders
GROUP BY city;

-- Топ клиентов по выручке
SELECT 
    user_id,
    SUM(price) AS total_spent
FROM orders
WHERE status = 'delivered'
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 10;
