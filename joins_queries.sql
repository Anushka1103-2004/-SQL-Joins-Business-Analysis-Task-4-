-- ===============================
-- TASK 4: SQL JOINS ANALYSIS
-- ===============================

-- 1. INNER JOIN: Orders with Customers
SELECT 
    o.OrderID,
    c.CustomerID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    o.OrderDate,
    o.TotalAmount
FROM orders o
INNER JOIN customers c
ON o.CustomerID = c.CustomerID;


-- 2. LEFT JOIN: Customers who never placed an order
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM customers c
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- 3. Revenue per Product
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(o.Quantity * o.UnitPrice) AS TotalRevenue
FROM order_items o
INNER JOIN products p
ON o.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC;


-- 4. Category-wise Revenue
SELECT 
    cat.CategoryName,
    SUM(o.Quantity * o.UnitPrice) AS CategoryRevenue
FROM order_items o
INNER JOIN products p ON o.ProductID = p.ProductID
INNER JOIN categories cat ON p.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName
ORDER BY CategoryRevenue DESC;


-- 5. Business Question:
-- Sales between two dates
SELECT 
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.Country
FROM orders o
INNER JOIN customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
AND c.Country = 'USA';
