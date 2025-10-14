🟢 Easy-Level Tasks (10 ta topshiriq)

BULK INSERT ta’rif va maqsadi:

BULK INSERT — bu SQL Serverda katta hajmdagi ma’lumotlarni tashqi fayldan (masalan, CSV, TXT) tez va samarali ichki jadvalga import qilish uchun ishlatiladigan buyruq.


SQL Serverga import qilinishi mumkin bo‘lgan 4 ta fayl formati:

- CSV (Comma Separated Values)
- TXT (Text files)
- Excel (XLS, XLSX)
- XML (Extensible Markup Language)


Products jadvalini yaratish:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);


Products jadvaliga 3 ta yozuv kiritish:

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Kompyuter', 1200.00),
(2, 'Printer', 450.50),
(3, 'Klaviatura', 80.00);


NULL va NOT NULL farqi:

- **NULL**: Ustunda qiymat mavjud emasligini bildiradi, ya’ni bo‘sh (no value).
- **NOT NULL**: Ustun qiymat kiritilishi majburiy, bo‘sh bo‘lishi mumkin emas.


ProductName ustuniga UNIQUE cheklov qo‘shish:

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);


SQL so‘rov ichida kommentariya yozish:

-- Bu so‘rov Products jadvaliga yangi yozuv qo‘shadi
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, 'Monitor', 300.00);


Products jadvaliga CategoryID ustunini qo‘shish:

ALTER TABLE Products
ADD CategoryID INT;


Categories jadvalini yaratish (CategoryID PRIMARY KEY va CategoryName UNIQUE):

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);


IDENTITY ustunining maqsadi:

IDENTITY ustuni SQL Serverda avtomatik o‘suvchi raqamli ustun bo‘lib, yangi yozuv qo‘shilganda qiymat avtomatik oshib boradi (masalan, ID yaratish uchun).

🟠 Medium-Level Tasks (10 ta topshiriq)

BULK INSERT bilan fayldan ma’lumot import qilish:

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',  -- ustunlar orasidagi ajratuvchi
    ROWTERMINATOR = '\n',   -- qator ajratuvchi
    FIRSTROW = 2            -- agar birinchi qatorda sarlavha bo‘lsa
);


Products jadvaliga FOREIGN KEY qo‘shish (Categories ga bog‘lash):

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


PRIMARY KEY va UNIQUE KEY o‘rtasidagi farqlar:

- **PRIMARY KEY**: Jadvalda har bir yozuvni noyob aniqlovchi, NOT NULL bo‘lishi shart, faqat bitta bo‘lishi mumkin.
- **UNIQUE KEY**: Har qanday ustun yoki ustunlar kombinatsiyasida noyob qiymatlar bo‘lishini ta’minlaydi, NULL qiymatga ruxsat berilishi mumkin, jadvalda bir nechta bo‘lishi mumkin.


Price ustuniga CHECK cheklovi qo‘shish (Price > 0):

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);


Products jadvaliga Stock ustunini NOT NULL qilib qo‘shish:

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;


ISNULL funksiyasi yordamida NULL qiymatlarni 0 bilan almashtirish:

SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;


FOREIGN KEY cheklovining maqsadi va qo‘llanilishi:

FOREIGN KEY jadvaldagi ustunni boshqa jadvaldagi PRIMARY KEY yoki UNIQUE ustunga bog‘laydi, ma’lumotlarning yaxlitligini ta’minlaydi (referential integrity). Bu yordamida bog‘langan jadvaldagi mos yozuv o‘chirilsa yoki o‘zgartirilsa, bog‘liq jadvaldagi ma’lumotlarga ta’siri boshqariladi.

🔴 Hard-Level Tasks (10 ta topshiriq)

Customers jadvalini yaratish, Age uchun CHECK (Age >= 18):

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    CONSTRAINT CHK_Age CHECK (Age >= 18)
);


IDENTITY ustuni bilan jadval yaratish (start 100, increment 10):

CREATE TABLE SampleTable (
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    Description VARCHAR(100)
);


OrderDetails jadvalida composite PRIMARY KEY yaratish:

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);


COALESCE va ISNULL funksiyalarining NULL bilan ishlashi:

- **ISNULL(expr, replacement)**: expr NULL bo‘lsa replacement qiymat qaytaradi. Faqat ikki argument oladi.
- **COALESCE(expr1, expr2, ..., exprN)**: berilgan ifodalardan birinchisi NULL bo‘lmagan qiymatni qaytaradi. Ko‘p argumentli.


Employees jadvalini yaratish, PRIMARY KEY va UNIQUE KEY (Email) bilan:

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);


FOREIGN KEY bilan ON DELETE CASCADE va ON UPDATE CASCADE yozuvi:

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
ON DELETE CASCADE
ON UPDATE CASCADE;
