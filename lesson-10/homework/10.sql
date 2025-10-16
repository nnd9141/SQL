Easy-Level Tasks (10)

Employees with salary greater than 50000 and their department names:

SELECT E.EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 50000;


Customers who placed orders in the year 2023:

SELECT C.FirstName, C.LastName, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) = 2023;


All employees with their department names, including those with no department:

SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;


Suppliers and the products they supply, including suppliers with no products:

SELECT S.SupplierName, P.ProductName
FROM Suppliers S
LEFT JOIN Products P ON S.SupplierID = P.SupplierID;


Orders and their payments, including orders without payments and payments without orders:

SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
UNION
SELECT O.OrderID, O.OrderDate, NULL AS PaymentDate, NULL AS Amount
FROM Orders O
WHERE O.OrderID NOT IN (SELECT OrderID FROM Payments);


Employees with their manager names:

SELECT E.EmployeeName, M.EmployeeName AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;


Students enrolled in the course 'Math 101':

SELECT S.StudentName, C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'Math 101';


Customers who ordered more than 3 items:

SELECT C.FirstName, C.LastName, O.Quantity
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.Quantity > 3;


Employees working in the 'Human Resources' department:

SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Human Resources';

Medium-Level Tasks (9)

Departments with more than 5 employees:

SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;


Products that have never been sold:

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL;


Customers who placed at least one order:

SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID;


Employees and departments where both employee and department exist (no NULLs):

SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.EmployeeID IS NOT NULL AND D.DepartmentID IS NOT NULL;


Pairs of employees who report to the same manager:

SELECT E1.EmployeeName AS Employee1, E2.EmployeeName AS Employee2, E1.ManagerID
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID != E2.EmployeeID;


Orders placed in 2022 with customer names:

SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 2022;


Employees in 'Sales' department with salary above 60000:

SELECT E.EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sales' AND E.Salary > 60000;


Orders that have a corresponding payment:

SELECT O.OrderID, O.OrderDate, P.PaymentDate, P.Amount
FROM Orders O
JOIN Payments P ON O.OrderID = P.OrderID;


Products that were never ordered:

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.ProductID IS NULL;

Hard-Level Tasks (9)

Employees with salary greater than the average salary in their own department:

SELECT E.EmployeeName, E.Salary
FROM Employees E
WHERE E.Salary > (
  SELECT AVG(E2.Salary)
  FROM Employees E2
  WHERE E2.DepartmentID = E.DepartmentID
);


Orders placed before 2020 with no corresponding payment:

SELECT O.OrderID, O.OrderDate
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE YEAR(O.OrderDate) < 2020 AND P.PaymentID IS NULL;


Products without a matching category:

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryID IS NULL;


Employees who report to the same manager and earn more than 60000:

SELECT E1.EmployeeName AS Employee1, E2.EmployeeName AS Employee2, E1.ManagerID, E1.Salary
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID != E2.EmployeeID AND E1.Salary > 60000;


Employees working in departments starting with 'M':

SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName LIKE 'M%';


Sales where the amount is greater than 500, including product names:

SELECT S.SaleID, P.ProductName, S.SaleAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE S.SaleAmount > 500;


Students who have not enrolled in 'Math 101':

SELECT S.StudentID, S.StudentName
FROM Students S
WHERE S.StudentID NOT IN (
  SELECT E.StudentID
  FROM Enrollments E
  JOIN Courses C ON E.CourseID = C.CourseID
  WHERE C.CourseName = 'Math 101'
);


Orders missing payment details:

SELECT O.OrderID, O.OrderDate, P.PaymentID
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;


Products in 'Electronics' or 'Furniture' category:

SELECT P.ProductID, P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');
