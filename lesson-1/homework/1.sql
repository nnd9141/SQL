1. Tushunchalar ta’riflari:

Data (Ma’lumot): Tashkilot yoki tizimda saqlanadigan faktlar, raqamlar, matn yoki boshqa shakldagi axborotlar.

Database (Ma’lumotlar bazasi): Ma’lumotlarni tartiblangan holda saqlash uchun mo‘ljallangan strukturalangan joy.

Relational Database (Aloqador ma’lumotlar bazasi): Jadval shaklida ma’lumotlarni saqlaydigan va jadvaldagi ma’lumotlar orasida aloqalarni o‘rnatadigan ma’lumotlar bazasi turi.

Table (Jadval): Ma’lumotlar bazasidagi ma’lumotlarni qatorlar va ustunlar ko‘rinishida saqlovchi struktura.


2. SQL Server’ning beshta asosiy xususiyati:

Ma’lumotlarni yuqori darajada saqlash va boshqarish imkoniyati.

Keng ko‘lamli xavfsizlik mexanizmlari (authentication, authorization).

Tarmoqqa ulangan ko‘p foydalanuvchilarni qo‘llab-quvvatlash.

Kengaytirilgan so‘rovlar va tahlil qilish vositalari (T-SQL).

Backup va restore funksiyalari, replikatsiya va zaxira nusxalarini yaratish imkoniyati.

3. SQL Server autentifikatsiya rejimlari (kamida 2):

Windows Authentication (Windows autentifikatsiyasi): Foydalanuvchilar Windows hisoblari orqali tizimga kiradilar.

SQL Server Authentication (SQL Server autentifikatsiyasi): Maxsus SQL Server foydalanuvchi nomi va paroli bilan tizimga kirish.

4. Yangi ma’lumotlar bazasi yaratish (SSMS ichida):

CREATE DATABASE SchoolDB;
GO

5. Students jadvalini yaratish uchun so‘rov:

USE SchoolDB;
GO

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
GO


6. SQL Server, SSMS va SQL farqlari:

SQL Server: Microsoft kompaniyasining ma’lumotlar bazasini boshqarish tizimi (DBMS). Ma’lumotlarni saqlash, boshqarish va ishlash uchun platforma.

SSMS (SQL Server Management Studio): SQL Server uchun vizual boshqaruv dasturi. Unda ma’lumotlar bazasi bilan ishlash, so‘rovlar yozish, ma’lumotlarni boshqarish mumkin.

SQL (Structured Query Language): Ma’lumotlar bazasiga so‘rovlar yozish va ularni boshqarish uchun maxsus til.


7. SQL buyruqlari turlari va misollar:

DQL (Data Query Language): Ma’lumotlarni so‘rov orqali olish uchun buyruqlar.
SELECT * FROM Students;

DML (Data Manipulation Language): Ma’lumotlarni kiritish, o‘zgartirish, o‘chirish uchun buyruqlar.
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);
UPDATE Students SET Age = 21 WHERE StudentID = 1;
DELETE FROM Students WHERE StudentID = 1;


DDL (Data Definition Language): Ma’lumotlar bazasi obyektlarini yaratish, o‘zgartirish va o‘chirish uchun buyruqlar.
CREATE TABLE Teachers (TeacherID INT PRIMARY KEY, Name VARCHAR(50));
ALTER TABLE Students ADD Grade CHAR(1);
DROP TABLE Teachers;

8. Students jadvaliga 3 ta yozuv qo‘shish

INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);
INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Vali', 22);
INSERT INTO Students (StudentID, Name, Age) VALUES (3, 'Guli', 19);

9. AdventureWorksDW2022.bak faylini SQL Server’ga tiklash (restore) bosqichlari:
  
AdventureWorksDW2022.bak faylini SQL Server’ga tiklash (restore) bosqichlari:

AdventureWorksDW2022.bak faylini SQL Server’ga tiklash (restore) bosqichlari:
  
SSMS ni oching va serverga ulaning.

Databases ustiga o‘ng tugmani bosing, Restore Database... ni tanlanadi.

Ochilgan oynada, Source qismida Device ni tanlanadi.

Fayl tanlash oynasida, yuklab olingan AdventureWorksDW2022.bak faylini tanlanadi.

Destination qismida yangi yoki mavjud ma’lumotlar bazasining nomini kiritiladi 

Files va Options bo‘limlarini kerak bo‘lsa sozlaymiz 

OK tugmasini bosib tiklash jarayonini boshlaymiz.

Tiklash jarayoni tugagach, ma’lumotlar bazasi serverda paydo bo‘ladi va undan foydalanish mumkin bo‘ladi.

