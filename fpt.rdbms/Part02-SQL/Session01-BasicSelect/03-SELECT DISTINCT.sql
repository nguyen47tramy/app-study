USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- CÚ PHÁP MỞ RỘNG: 
-- Khi ta SELECT ít cột từ table gốc thì có nguy cơ duex liệu bị trùng lại
-- Không phải người thiết kế và người nhập liệu bị sai
-- Mà do ta có nhiều đặc điểm trùng nhau
-- 
-- lệnh SELECT hỗ trợ các loại từu dùng trùng nhau/ trùng 100%
-- SELECT DISTINCT TÊN-ÁC-CỘT FROM <TÊN-TABBLE>
------------------------------------

-- 1. Liệt kê danh sách nhân viên
SELECT * FROM Employees
-- Phân tích: 9 người nhưng chỉ có 4 title, tương đương 100 triệu người nhưng có 63 tỉnh
SELECT TitleOfCourtesy FROM Employees
SELECT DISTINCT EmployeeID, TitleOfCourtesy FROM Employees
-- NẾU DISTINCT ĐI KÈM VỚI ID/KEY THÌ BỊ VÔ DỤNG

-- 2. In ra thông tin khách hàng
SELECT * FROM Customers -- 91 ROWS

-- 3. Có bao nhiêu quốc gia xuất hiện trong thông tin khách hàng
SELECT DISTINCT Country FROM Customers -- 21 ROWS

