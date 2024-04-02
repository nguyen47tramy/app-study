USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT

-- Trong thực tế có những lúc dữ liệu / thông tin / info chưa xác định được nó là gì
-- ví dụ: khi ký tên trong dánh sách thi giữa kỳ, trên danh sách có cột điểm nhưng chưa thể có điểm tại lúc thi
-- Hiện tượng dữ liệu chưa biết, chưa xác định, hay từ từ đứa vào sau
-- Tức hiện tại chưa thấy có data tức là giá trị NULL
-- NULL đại diện cho thứ chưa xác định, mà chưa xác định tức là không có giá trị, 
-- không có giá trị thì không thể so sánh >= , <=, !=, =, ...
-- ==> CẤM DÙNG TOÁN TỬ SO SÁNH DÙNG VỚI NULL
-- ==> DÙNG TOÁN TỬ IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ LỌC Ô CÓ GIÁ TRỊ NULL
------------------------------------

-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Ai chưa xác định khu vực ở, region null
SELECT * FROM Employees WHERE Region = 'NULL' -- 0 ROW

SELECT * FROM Employees WHERE Region = NULL	-- 0 ROW

SELECT * FROM Employees WHERE Region IS NULL	--4 ROWS

-- 3. Ai đã xác định được khu vực cư trú
SELECT * FROM Employees WHERE Region IS NOT NULL -- 5 ROWS

SELECT * FROM Employees WHERE NOT (Region IS NULL)
-- CHÚ Ý: NOT(MỆNH ĐỀ)

-- 4. Những nhân viên đại diện kinh doanh và đã xác định nơi cư trú
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND Region IS NOT NULL

SELECT * FROM Employees WHERE Title = 'Sales Representative' AND NOT(Region IS NULL)

-- 5.Liệt kê danh sách khách hàng đến từ anh, pháp, mỹ, có cả số fax và region (tức bỏ null ở hai trường đó)
SELECT * FROM Customers 
WHERE Country IN ('UK', 'FRANCE', 'USA') AND Fax IS NOT NULL AND Region IS NOT NULL
