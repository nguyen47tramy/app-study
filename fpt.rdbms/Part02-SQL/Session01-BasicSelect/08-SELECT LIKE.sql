USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT

-- Trong thực tế, có những lúc ta muốn tìm dữ liệu / filter theo kiểu gần đúng
-- trên kiểu chuỗi, ví dụ ái đó có tên là An khác câu liệt kê ai đó
-- có tên bắt đầu bằng chữ A
-- ==> TÌM GẦN ĐÚNG
--	> Không thể dùng toán tử =
--  > Dùng toán tử LIKE

-- Để sử dụng toán tử LIKE, ta cần hai thứ trợ giúp, dấu % và dấu _
-- Dấu %: đại diện cho một chữ bất kỳ nào đó
-- Dấu _: đại diện cho một ký tự bất kỳ nào đó
-- Ví dụ: Name LIKE 'A%': bất kỳ ai có tên xuất hiện bằng chữ A, phần còn lại có bao nhiêu không quan tâm
--		  Name LIKE 'A_': người nào trong tên có hai chữ cái và chữ đầu tiên là chữ A
			
------------------------------------

-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Nhân viên nào có tên bắt đầu bằng chữ A
SELECT * FROM Employees WHERE FirstName = 'A%'	--0 dòng trả về (không lỗi) vì dùng toán tử = 

SELECT * FROM Employees WHERE FirstName LIKE 'A%'

-- 3. Nhân viên nào có tên bắt đầu bằng chữ A, in ra cả fullname được ghép
SELECT EmployeeID, FirstName, LastName, FirstName + ' ' + LastName AS FullName FROM Employees WHERE FirstName LIKE 'A%'

SELECT EmployeeID, FirstName, LastName, CONCAT(FirstName,  ' ', LastName) AS FullName FROM Employees WHERE FirstName LIKE 'A%'

-- 4. Nhân viên nào tên có chữ A cuối cùng
SELECT * FROM Employees WHERE FirstName LIKE '%A'

-- 5. Nhân viên nào tên có 4 ký tự
SELECT * FROM Employees WHERE FirstName LIKE '____'
-- Hoặc dùng hàm kiểm tra độ dài của tên xem có bằng 4 không

-- 6. Xem danh sách các sản phẩm/ món đồ đang có - table ProductS
SELECT * FROM Products ORDER BY ProductName

-- 7. Những sản phẩm nào tên bắt đầu bằng CH
SELECT * FROM Products WHERE ProductName LIKE 'CH%'

-- 8. Những sản phẩm mà tên có từ cuối cùng có 5 ký tự
SELECT * FROM Products WHERE ProductName LIKE '%_____'	-- tên có từ 5 ký tự trở lên

SELECT * FROM Products WHERE ProductName LIKE '% _____' -- tên có từ hai từ trở lên và từ cuối cùng có 5 ký tự

SELECT * FROM Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '_____'
