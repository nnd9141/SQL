Here are SQL queries for the Easy-Level Tasks based on the provided schema and data:

1. Total number of products available in each category:
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

2. Average price of products in the 'Electronics' category:
SELECT AVG(Price) AS AvgPrice
FROM Products
WHERE Category = 'Electronics';

3. List all customers from cities that start with 'L':
SELECT * 
FROM Customers
WHERE City LIKE 'L%';

4. Get all product names that end with 'er':
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';

5. List all customers from countries ending in 'A':
SELECT * 
FROM Customers
WHERE Country LIKE '%A';

6. Show the highest price among all products:
SELECT MAX(Price) AS MaxPrice
FROM Products;

7. Label stock as 'Low Stock' if quantity < 30, else 'Sufficient':
SELECT ProductName, 
       CASE 
           WHEN StockQuantity < 30 THEN 'Low Stock'
           ELSE 'Sufficient'
       END AS StockStatus
FROM Products;

8. Find the total number of customers in each country:
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

9. Find the minimum and maximum quantity ordered:
SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM Orders;
