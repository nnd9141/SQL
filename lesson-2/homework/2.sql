Employees jadvalini yaratish:

CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

Turli INSERT INTO usullari bilan 3 ta yozuv kiritish:

-- 1-yozuv (bitta satrli)
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali Karimov', 6500.00);

-- 2-yozuv va 3-yozuv (ko‘p satrli)
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(2, 'Dilnoza Yuldosheva', 5500.00),
(3, 'Javlon Abdullaev', 4800.00);


EmpID = 1 bo‘lgan xodimning maoshini 7000 ga yangilash:

UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;


EmpID = 2 bo‘lgan xodimni o‘chirish:

DELETE FROM Employees
WHERE EmpID = 2;


DELETE, TRUNCATE va DROP o‘rtasidagi farq:

- **DELETE**: Jadvaldagi ma’lumotlarni o‘chiradi, ammo tuzilmani saqlaydi. WHERE sharti bilan ishlaydi. Rollback qilish mumkin.
- **TRUNCATE**: Barcha ma’lumotlarni tez o‘chiradi, lekin tuzilmani saqlaydi. WHERE ishlamaydi. Rollback qilish odatda mumkin emas.
- **DROP**: Jadvallarning o‘zini butunlay o‘chiradi (strukturasi bilan birga).


Name ustunini VARCHAR(100) ga o‘zgartirish:

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);


Yangi Department ustunini qo‘shish:

ALTER TABLE Employees
ADD Department VARCHAR(50);


Salary ustunining tipini FLOAT ga o‘zgartirish:

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;


Departments jadvalini yaratish:

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


Employees jadvalidan barcha yozuvlarni o‘chirish, lekin struktura qolishi:

TRUNCATE TABLE Employees;

🟡 Intermediate-Level Tasks (6 ta topshiriq)

INSERT INTO SELECT orqali Departments jadvaliga 5 ta yozuv kiritish:

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'IT'
UNION ALL
SELECT 2, 'HR'
UNION ALL
SELECT 3, 'Sales'
UNION ALL
SELECT 4, 'Finance'
UNION ALL
SELECT 5, 'Logistics';


Maoshi 5000 dan katta bo‘lgan xodimlarga Department ni 'Management' deb yangilash:

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;


Employees jadvalidan barcha yozuvlarni o‘chirish (strukturani saqlab):

DELETE FROM Employees;


Employees jadvalidan Department ustunini o‘chirish:

ALTER TABLE Employees
DROP COLUMN Department;


Employees jadvalining nomini StaffMembers ga o‘zgartirish:

EXEC sp_rename 'Employees', 'StaffMembers';


Departments jadvalini butunlay o‘chirish:

DROP TABLE Departments;

🔴 Advanced-Level Tasks (9 ta topshiriq)

Products jadvalini yaratish:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(255)
);


Price ustuniga CHECK cheklovi qo‘shish (manfiy qiymatga ruxsat yo‘q):

ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);


StockQuantity ustunini DEFAULT qiymat bilan qo‘shish:

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;


Category ustunining nomini ProductCategory ga o‘zgartirish:

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


Products jadvaliga 5 ta yozuv kiritish:

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Notebook', 'Electronics', 800.00, '15-inch laptop'),
(2, 'Smartphone', 'Electronics', 600.00, 'Android device'),
(3, 'Chair', 'Furniture', 120.00, 'Ergonomic chair'),
(4, 'Table', 'Furniture', 200.00, 'Office desk'),
(5, 'Backpack', 'Accessories', 50.00, 'Waterproof backpack');


Products jadvalidan nusxa (backup) jadval yaratish:

SELECT * INTO Products_Backup
FROM Products;


Products jadvalining nomini Inventory ga o‘zgartirish:

EXEC sp_rename 'Products', 'Inventory';


Inventory jadvalidagi Price ustunining tipini FLOAT ga o‘zgartirish:

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;


Inventory jadvaliga IDENTITY ustun qo‘shish:

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);

