USE Northwind 

------------------------------------
----- LÝ THUYẾT

-- CÚ PHÁP CHUẨN CỦA CÂU LỆNH SELECT
-- SELECT * FROM <TABLE> WHERE 
-- >>> WHERE CỘT = VALUE NÀO ĐÓ
-- >>> WHERE CỘT LIKE PATTERN NÀO ĐÓ
-- >>> WHERE CỘT BETWEEN RANGE
-- >>> WHERE CỘT IN (TẬP HỢP CÁC GIÁ TRỊ ĐƯỢC LIỆT KÊ)

-- Mà trong đó, một câu SELECT tùy các viết có thể trả về đúng một value (một cell)
-- một câu SELECT tùy các viết có thể trả về một tập các value (đồng nhất, là các giá trị khác nhau của một biến)
--

-- !!!!!
-- WHERE CỘT = VALUE NÀO ĐÓ
--			>>> THAY VALUE NÀY = 1 CÂU SQL NÀO ĐÓ MIỄN TRẢ VỀ MỘT GIÁ TRỊ
-- KĨ THUẬT ĐƯỢC GỌI LÀ VIẾT CẤU SQL THEO KIỂU HỎI GIẢN TIẾP, LỒNG NHAU, TRONG CÂU SQL CHỨA CÂU SQL KHÁC
------------------------------------

-- 1. Ina ra danh sách nhân viên
SELECT * FROM Employees

SELECT FirstName FROM Employees WHERE EmployeeID = 1 -- 1 value trả về

SELECT FirstName FROM Employees -- trả về một tập các giá trị đồng nhất
-- Lấy một cột thì được gọi là PHÉP CHIẾU - PROJECT

-- 2. Liệt kê các nhân viên ở Luân Đôn
SELECT * FROM Employees WHERE City = 'LONDON'

-- 3. Liệt kê các nhân viên cùng quên với king Robert
-- BREAK DOWN CÂU:
-- Tìm dữ liệu của người tên King robert 
SELECT * FROM Employees WHERE FirstName = 'ROBERT'

-- Tìm tên city của người tên King robert (phải trả về 1 giá trị)
SELECT City FROM Employees WHERE FirstName = 'ROBERT'

-- Ghép đáp án
SELECT * FROM Employees 
WHERE City = (
				SELECT City FROM Employees 
							WHERE FirstName = 'ROBERT'
				)

-- => SUBQUERY loại 1, tránh Hard-code
-- Tuy nhiên câu trên cần phải loại bớt dữ liệu của Robert

SELECT * FROM Employees 
WHERE City = (
				SELECT City FROM Employees 
							WHERE FirstName = 'ROBERT'
				)
	  AND FirstName != 'ROBERT'

-- 4. Liệt kê các đơn hàng
SELECT * FROM Orders ORDER BY Freight DESC

-- 4.1 Liệt kê các đơn hàng trọng lượng lớn hơn 252 kg
SELECT * FROM Orders WHERE Freight > 252 ORDER BY Freight DESC 

-- 4.2 Liệt kê các đơn hàng có trọng lượng lớn hơn trọng lượng của đơn hàng 10555
-- Trọng lượng của đơn hàng 10555
SELECT Freight FROM Orders WHERE OrderID = 10555

-- Ghép đáp án
SELECT * FROM Orders 
	WHERE Freight > (SELECT Freight FROM Orders WHERE OrderID = 10555)
	ORDER BY Freight DESC 

-- BTVN
-- 1. Liệt kê danh sách các công ty vận chuyển hàng
SELECT DISTINCT ShipVia FROM Orders

-- 2. Liệt kê danh sách các đơn hàng (ORDERID) được vận chuyển bởi công ty giao vận 1
SELECT OrderID FROM Orders WHERE ShipVia = 1

-- 3. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express
-- Tìm công ty giao vận có tên Speedy Express (table Shippers)
SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express'

-- Ghép đáp án
SELECT OrderID	FROM Orders 
				WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')

-- 4. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express và trọng lượng từ 50-100
SELECT OrderID	FROM Orders 
				WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')
				      AND Freight BETWEEN 50 AND 100
				ORDER BY Freight

-- 5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
-- Tìm CategoryId của Filo Mix
SELECT CategoryID FROM Products WHERE ProductName = 'FILO MIX'

-- Ghép đáp án, loại đi Filo Mix
SELECT * FROM Products 
	WHERE CategoryID = (SELECT CategoryID FROM Products WHERE ProductName = 'FILO MIX')
	      AND ProductName != 'FILO MIX'

-- 6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet
-- Tìm tuổi của Janet
SELECT YEAR(GETDATE()) - YEAR(BirthDate) FROM Employees WHERE FirstName = 'JANET'

-- Ghép đáp án
SELECT FirstName FROM Employees 
	WHERE YEAR(GETDATE()) - YEAR(BirthDate) < (SELECT YEAR(GETDATE()) - YEAR(BirthDate) 
													FROM Employees WHERE FirstName = 'JANET')