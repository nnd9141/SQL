🟢 Easy-Level Tasks

Top 5 employees from the Employees table:

SELECT TOP 5 * FROM Employees;


Select unique Category values from the Products table using SELECT DISTINCT:

SELECT DISTINCT Category FROM Products;


Filter the Products table to show products with Price > 100:

SELECT * FROM Products WHERE Price > 100;


Select all Customers whose FirstName starts with 'A' using the LIKE operator:

SELECT * FROM Customers WHERE FirstName LIKE 'A%';


Order the results of Products by Price in ascending order:

SELECT * FROM Products ORDER BY Price ASC;


Filter Employees with Salary >= 60000 and DepartmentName = 'HR':

SELECT * FROM Employees WHERE Salary >= 60000 AND DepartmentName = 'HR';


Use ISNULL to replace NULL values in the Email column with "noemail@example.com
":

SELECT EmployeeID, FirstName, LastName, ISNULL(Email, 'noemail@example.com') AS Email FROM Employees;


Show all products with Price BETWEEN 50 AND 100:

SELECT * FROM Products WHERE Price BETWEEN 50 AND 100;


Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table:

SELECT DISTINCT Category, ProductName FROM Products;


Order the previous DISTINCT results by ProductName in descending order:

SELECT DISTINCT Category, ProductName FROM Products ORDER BY ProductName DESC;

🟠 Medium-Level Tasks

Select the top 10 products ordered by Price DESC:

SELECT TOP 10 * FROM Products ORDER BY Price DESC;


Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table:

SELECT EmployeeID, COALESCE(FirstName, LastName) AS Name FROM Employees;


Select distinct Category and Price from the Products table:

SELECT DISTINCT Category, Price FROM Products;


Filter Employees with Age between 30 and 40 or DepartmentName = 'Marketing':

SELECT * FROM Employees WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';


Use OFFSET-FETCH to select rows 11 to 20 from Employees table, ordered by Salary DESC:

SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


Display all products with Price <= 1000 and StockQuantity > 50, sorted by StockQuantity in ascending order:

SELECT * FROM Products WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;


Filter the Products table for ProductName containing the letter 'e' using LIKE:

SELECT * FROM Products WHERE ProductName LIKE '%e%';


Use IN operator to filter Employees in 'HR', 'IT', or 'Finance' departments:

SELECT * FROM Employees WHERE DepartmentName IN ('HR', 'IT', 'Finance');


Use ORDER BY to display a list of Customers ordered by City ASC and PostalCode DESC:

SELECT * FROM Customers ORDER BY City ASC, PostalCode DESC;

🔴 Hard-Level Tasks

Select the top 5 products with the highest sales, using TOP(5) and ordered by SaleAmount DESC:

SELECT TOP 5 p.ProductName, SUM(s.SaleAmount) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;


Combine FirstName and LastName into one column named FullName in the Employees table:

SELECT EmployeeID, FirstName + ' ' + LastName AS FullName, DepartmentName, Salary FROM Employees;


Select distinct Category, ProductName, and Price for products priced above $50:

SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;


Select products whose Price is less than 10% of the average price in the Products table:

SELECT * FROM Products
WHERE Price < (SELECT AVG(Price) * 0.1 FROM Products);


Filter Employees with Age less than 30 and who work in 'HR' or 'IT':

SELECT * FROM Employees
WHERE Age < 30 AND DepartmentName IN ('HR', 'IT');


Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com':

SELECT * FROM Customers WHERE Email LIKE '%@gmail.com';


Use the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department:

SELECT * FROM Employees
WHERE Salary > ALL (SELECT Salary FROM Employees WHERE DepartmentName = 'Sales');


Filter the Orders table for orders placed in the last 180 days:

SELECT * FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE();
