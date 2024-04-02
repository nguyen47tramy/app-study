USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT
-- 
-- KHI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >=.. AND <=...
-- TA CÓ THỂ THAY THẾ BẰNG MỆNH ĐỀ BETWEEN, IN

-- CÚ PHÁP: CỘT BETWEEN VALUE-1 AND VALUE-2
--	>> tHAY THẾ CHO 2 MỆNH ĐỀ >= <= AND

-- CÚ PHÁP: CỘT IN (MỘT TẬP CÁC GIÁ TRỊ CÁCH NHAU BỞI DẤU PHẨY)
--	>> THAY THẾ CHO MỘT LOẠT CÁC NỆNH ĐỀ OR
------------------------------------

-- 1. Liệt kê danh sách nhân viên sinh trong khoảng 1960-1970
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970
						ORDER BY BirthDate DESC

SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970
						ORDER BY BirthDate DESC

-- 2. Liệt kê các đơn hàng có trọng lượng từ 100...500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500

-- 3. Liệt kê các đơn hàng gửi đến anh, pháp, mỹ
SELECT * FROM Orders 
WHERE ShipCountry = 'USA' OR ShipCountry = 'FRANCE' OR ShipCountry = 'UK'

SELECT * FROM Orders 
WHERE ShipCountry IN ('USA', 'FRANCE', 'UK')

-- 4. Liệt kê các đơn hàng không gửi đến anh, pháp, mỹ
SELECT * FROM Orders 
WHERE NOT(ShipCountry IN ('USA', 'FRANCE', 'UK'))

SELECT * FROM Orders 
WHERE ShipCountry NOT IN ('USA', 'FRANCE', 'UK')

-- 5. Liệt kê các đơn hàng xuất hiện trong năm 1996 ngoại trừ các tháng 6, 7, 8, 9
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (6, 7, 8, 9)

-- LƯU Ý IN CHỈ DÙNG KHI TA LIỆT KÊ ĐƯỢC TẬP GIÁ TRỊ
-- KHOẢNG SỐ THỰC THÌ KHÔNG DÙNG IN ĐƯỢC

-- 6. Liệ kê các đơn hàng có trọng lượng từ 100-110
SELECT * FROM Orders WHERE Freight >= 100  AND Freight <= 110
ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight BETWEEN 100  AND 110
ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight IN (???) -- KHÔNG LIỆT KÊ ĐƯỢC


