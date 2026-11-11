USE Ucheb_12_Ivanov;
GO

IF OBJECT_ID('dbo.Student','U') IS NOT NULL DROP TABLE dbo.Student;
GO
CREATE TABLE dbo.Student (
    FIO     nvarchar(40) NULL,
    Data    date         NULL,
    spez    nvarchar(20) NULL,
    godpost int          NULL
);
GO
INSERT INTO dbo.Student (FIO, Data, spez, godpost) VALUES
(N'Александров Николай Николаевич','2001-01-01',N'Физика',2018),
(N'Бельский Василий Владимирович','2001-05-02',N'математика',2019),
(N'Белопольский Андрей Иванович','2004-10-21',N'Информатика',2022),
(N'Петров Иван Петрович','2004-07-17',N'Физика',2022),
(N'Михайлов Николай Иванович','2005-12-09',N'математика',2023),
(N'Мироненко Светлана Владимировна','1998-12-09',N'Радиофизика',2016),
(N'Коваленко Владимир Иванович','2001-12-09',N'Информатика',2019),
(N'Виноградов Павел Гаврилович','2003-12-09',N'Химия',2021),
(N'Иванов Владимир Николаевич','1999-12-09',N'Радиофизика',2018),
(N'Семашкевич Виктория Михайловна','1998-12-09',N'Химия',2017);
GO

PRINT '';
PRINT '=== 3.2 Все студенты ===';
SELECT * FROM Student;
GO

PRINT '';
PRINT '=== 3.3 ФИО и дата рождения ===';
SELECT FIO, Data FROM Student;
GO

PRINT '';
PRINT '=== 3.4 Вычисляемое поле "Информация" ===';
SELECT N'Студент ' + FIO + N', специализация: ' + spez AS Информация FROM Student;
GO

PRINT '';
PRINT '=== 3.5 Через год после поступления ===';
SELECT FIO, [Через год] = godpost + 1 FROM Student;
GO

PRINT '';
PRINT '=== 3.6 DISTINCT специализации ===';
SELECT DISTINCT spez FROM Student;
GO

PRINT '';
PRINT '=== 3.7 Сортировка по году поступления ===';
SELECT * FROM Student ORDER BY godpost;
GO

PRINT '';
PRINT '=== 3.8 spez DESC, FIO ASC ===';
SELECT * FROM Student ORDER BY spez DESC, FIO ASC;
GO

PRINT '';
PRINT '=== 3.9 TOP 2 по ФИО ===';
SELECT TOP 2 * FROM Student ORDER BY FIO ASC;
GO

PRINT '';
PRINT '=== 3.10 TOP 30 PERCENT по godpost ===';
SELECT TOP 30 PERCENT * FROM Student ORDER BY godpost;
GO

PRINT '';
PRINT '=== 3.11 TOP 4 WITH TIES ===';
SELECT TOP 4 WITH TIES * FROM Student ORDER BY godpost;
GO

PRINT '';
PRINT '=== 3.12 OFFSET 2 ROWS ORDER BY FIO ===';
SELECT * FROM Student ORDER BY FIO OFFSET 2 ROWS;
GO

PRINT '';
PRINT '=== Самостоятельная работа (задания 1-13) ===';
PRINT '';
PRINT '--- 1. ФИО, специализация, дата рождения всех студентов ---';
SELECT FIO, spez, Data FROM Student;
GO

PRINT '';
PRINT '--- 2. Вычисляемое поле "О поступлении" ---';
SELECT FIO + N' поступил в ' + CAST(godpost AS nvarchar(4)) AS [О поступлении] FROM Student;
GO

PRINT '';
PRINT '--- 3. "Через 5 лет после поступления" ---';
SELECT FIO, godpost + 5 AS [Через 5 лет] FROM Student;
GO

PRINT '';
PRINT '--- 4. DISTINCT годы поступления ---';
SELECT DISTINCT godpost FROM Student;
GO

PRINT '';
PRINT '--- 5. Сортировка по убыванию даты рождения ---';
SELECT * FROM Student ORDER BY Data DESC;
GO

PRINT '';
PRINT '--- 6. spez DESC, godpost DESC, FIO ASC ---';
SELECT * FROM Student ORDER BY spez DESC, godpost DESC, FIO ASC;
GO

PRINT '';
PRINT '--- 7. Первая строка (FIO DESC) ---';
SELECT TOP 1 * FROM Student ORDER BY FIO DESC;
GO

PRINT '';
PRINT '--- 8. Кто раньше всех поступил ---';
SELECT TOP 1 FIO, godpost FROM Student ORDER BY godpost ASC;
GO

PRINT '';
PRINT '--- 9. TOP 10 PERCENT по ФИО ---';
SELECT TOP 10 PERCENT * FROM Student ORDER BY FIO ASC;
GO

PRINT '';
PRINT '--- 10. TOP 5 WITH TIES по godpost ---';
SELECT TOP 5 WITH TIES * FROM Student ORDER BY godpost;
GO

PRINT '';
PRINT '--- 11. OFFSET 4 ROWS по Data ---';
SELECT * FROM Student ORDER BY Data OFFSET 4 ROWS;
GO

PRINT '';
PRINT '--- 12. 7-я строка (FIO ASC) ---';
SELECT * FROM Student ORDER BY FIO OFFSET 6 ROWS FETCH NEXT 1 ROWS ONLY;
GO

PRINT '';
PRINT '--- 13. Строки 5-9 (FIO ASC) ---';
SELECT * FROM Student ORDER BY FIO OFFSET 4 ROWS FETCH NEXT 5 ROWS ONLY;
GO

PRINT '';
PRINT '=== 2.5 Добавляем 7 записей студентов группы ---';
INSERT INTO dbo.Student (FIO, Data, spez, godpost) VALUES
(N'Ибрагимов Наврузбек Рустамович','2004-03-15',N'Информатика',2022),
(N'Ахмедов Тимур Рустамович','2004-08-22',N'Математика',2022),
(N'Каримов Азамат Шерзодович','2003-06-10',N'Физика',2021),
(N'Юлдашев Бекзод Алишерович','2005-01-25',N'Информатика',2023),
(N'Рахимова Дилноза Баходыровна','2004-11-05',N'Химия',2022),
(N'Тошматов Улугбек Фарходович','2003-04-18',N'Радиофизика',2021),
(N'Мирзаева Мадина Акмаловна','2005-09-30',N'Математика',2023);
GO

PRINT '--- Всего записей в Student ---';
SELECT COUNT(*) AS Всего FROM Student;
GO

PRINT '--- Итоговая выборка ---';
SELECT * FROM Student;
GO

PRINT '';
PRINT '=== Готово ===';
GO
