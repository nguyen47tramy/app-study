USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- MỘT DB là nơi chứa data (bán hàng, thư viện, qlsv,...)
-- DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE(nghệ thuật design database, NF - dạng chuẩn)
-- Dùng lệnh SELECT để xem/ in dữ liệu từ table, cũng hiển thị dưới dạng table
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN-TABLE>
--						 * đại diện cho việc muốn lấy tất cả thông tin
-- CÚ PHÁP MỞ RỘNG:
--				  SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁCH-NHAU-DẤU-PHẨY
--				  SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÝ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--	              FORM <TÊN-TABLE>

-- DATA trả về có cell/ô có NULL, hiểu rằng chưa xác định value 
-- từ từ cập nhật sau. Ví dụ sv ký tên vào ds thi thì cột điểm lúc ký tên gọi là NULL

-- Microsoft đặt tên bằng bằng danh từ số nhiều
------------------------------------

-- 1. Xem thông tin của tất cả các khách hàng giao dịch với chúng ta
SELECT * FROM Customers

-- 2. Xem thông tin nhân viên
SELECT * FROM Employees

-- 3. Xem các sản phầm đang có trong kho
SELECT * FROM Products

-- 4. Mua hàng thì thông tin sẽ nằm ở table Orders và OrderDetails
SELECT * FROM Orders -- 830 bill, tương đương 830 rows

-- 5. Xem thông tin công ty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers(CompanyName, Phone) VALUES ('Fedex Vietnam', '(084)')

-- 6. Xem chi tiết mua hàng 
SELECT * FROM [Order Details]

-- 7. In ra thông tin khách hàng, chỉ gồm cột ID, 
SELECT CustomerID, CompanyName, ContactName, Country FROM Customers

-- 8. In ra thông tin nhân viên, chỉ cần Id, Last, First, Title, dob
-- Tên người tách thành Last và First: dành cho mục tiêu sort và in
-- theo quy ước của mỗi quốc gia
SELECT EmployeeID, LastName, FirstName, Title, BirthDate FROM Employees

-- 9. In ra thông tin nhân viên, Ghép tên, tính tuổi
SELECT EmployeeID, LastName + ' ' + FirstName as [FULL NAME], Title, YEAR(GETDATE()) - YEAR(BirthDate) AS [AGE] FROM Employees

-- 10. In ra thông tin chi tiết mua hàng
SELECT * FROM [Order Details]
-- Công thức tính tổng tiền phải trả từng món, có trừ đi giảm giá
-- SL * DG - Tiền giảm giá = Total
-- SL * DG - (SL * DG * Discount) = Total
-- SL * DG * (1 - DISCOUNT) = TOTAL
SELECT *, UnitPrice * Quantity * (1 - Discount) AS [Total] FROM [Order Details]
