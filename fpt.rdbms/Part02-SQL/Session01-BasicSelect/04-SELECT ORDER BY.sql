USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT: 
-- Ta muốn sắp xếp dữ liệu/sort theo tiêu chí nào đó, thường sẽ là tăng dần ascending/ giảm dần descending
--
-- Mặc định khôn gnois gì thì là sort tăng dần

-- Ta có thể sort trên nhiều cột, logic này từ từ tính

-- SELECT .... FROM <TÊN-TABLE> ORDER BY
------------------------------------

-- 1. In ra ds nhân viên
SELECT * FROM Employees

-- 2. In ra ds nhân viên tăng dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate ASC
SELECT * FROM Employees ORDER BY BirthDate 

-- 3. In ra ds nhân viên GIẢM dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate DESC

-- 4. Tính tiền chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS SubTotal 
FROM [Order Details] ORDER BY SubTotal

-- 5. Tính tiền chi tiết mua hàng, sắp xếp giảm dần theo tiền
SELECT *, UnitPrice * Quantity * (1 - Discount) AS SubTotal 
FROM [Order Details] ORDER BY SubTotal

-- 6. In ra ds nhân viên giảm dần theo tuổi
SELECT EmployeeID, 
       LastName + FirstName AS FullName, 
	   YEAR(BirthDate) AS DoB, 
       YEAR(GETDATE()) - YEAR(BirthDate) AS Age 
	   FROM Employees ORDER BY Age DESC