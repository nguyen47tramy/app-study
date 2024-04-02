USE Northwind 

------------------------------------
----- LÝ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT
-- MỆNH ĐỀ WHERE DÙNG LÀM BỘ LỌC/FILTER ĐỂ LỌC RA CÁC DỮ LIỆU THEO MỘT TIÊU CHÍ NÀO ĐÓ

-- CÚ PHÁP DÙNG BỘ LỌC
-- SELECT * (cột bạn muốn in ra)
-- FROM <Tên-Table> 
-- WHERE <Điều-Kiện-Lọc>
-- Trong đó điều kiện lọc là tìm từng dòng, với cái cột có giá trị cần lọc
-- lọc theo tên cột với value thế nào, lấy tên cột, xem value trong cột có thỏa điều kiện lọc không

-- ĐỂ VIẾT ĐƯỢC ĐIỀU KIỆN LỌC CẦN
--   > tên cột
--   > value của cột (cell)
--	 > toán tử (operator)
--	 Nếu có nhiều đk lọc đi kèm nhau thì dùng thêm toán tử logic: AND, OR, NOT

-- LỌC LIÊN QUAN ĐẾN GIÁ TRỊ/ VALUE/ CEEL CHỨA GÌ NÊN TA PHẢI QUAN TÂM ĐẾN DATA TYPES
-- Số: ghi truyền thống
-- Chuỗi ký tự: ''
-- Date: 'YYYY-MM-DD'
-- ...
------------------------------------

-- 1. In ra danh sách các khách hàng
SELECT * FROM Customers	--92 rows

-- 2. In ra danh sách khách hàng đến từ Ý
SELECT * FROM Customers WHERE Country = 'Italy'	-- 3 rows
-- Nguyên tắc hoạt động của thuật toán là nó bắt buộc chạy qua từng dòng 
-- rồi nó so sánh với điều kiện lọc của mình trong từng dòng rồi nó mới chuyển sang dòng tiếp theo
-- Nếu data nhiều thì nó sẽ chậm

-- 3. In ra danh sách khách hàng đến từ Mỹ
SELECT * FROM Customers WHERE Country = 'USA'	--13 rows

-- 4. In ra danh sách khách hàng đến từ Mỹ, Ý
-- Lưu ý: đời thường có thể nói những khách hàng đến từ Ý và Mỹ
SELECT * FROM Customers WHERE Country = 'USA' AND Country = 'Italy'-- 0 rows

-- nhưng phải hiểu logic là lấy ra khách hàng đến từ Mỹ hoặc kh đến từ ý
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' --16 rows

-- sort để dễ theo dõi
SELECT * FROM Customers
WHERE Country = 'USA' OR Country = 'Italy' ORDER BY Country

-- 5. In ra khách hàng đến từ thủ đô nước Đức
SELECT * FROM Customers WHERE City = 'Berlin'

-- 6. In ra các thông tin của nhân viên
SELECT * FROM Employees		-- 9 rows

-- 7. In ra thông tin của nhân viên có năm sinh từ 1960 đổ lại
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960

-- 8. In ra thông tin của nhân viên có tuổi từ 60 trở lên
SELECT * FROM Employees WHERE YEAR(GETDATE()) - YEAR(BirthDate) >= 60

SELECT *, YEAR(GETDATE()) - YEAR(BirthDate) AS AGE 
FROM Employees
WHERE YEAR(GETDATE()) - YEAR(BirthDate) >= 60

-- 9. Những nhân viên nào ở Luân Đôn?
SELECT * FROM Employees WHERE City = 'London'	-- 4 rows

-- 10. Những ai không ở Luân Đôn?
SELECT * FROM Employees WHERE City != 'London'	-- 5 rows

SELECT * FROM Employees WHERE City <> 'London'	-- 5 rows

-- TUYỆT CHIÊU: ĐẢO MỆNH ĐỀ
SELECT * FROM Employees WHERE NOT(City = 'London')	-- 5 rows
-- Muốn dùng đảo của mệnh đề , phép so sánh thì dùng NOT

-- 11. In ra hồ sơ của nhân viên thứ nhất
-- Tương đương đi vào vào ngân hàng đưa cmnd để thực hiện giao dịch
SELECT * FROM Employees WHERE EmployeeID = 1	-- 1 row
-- WHERE TRÊN KEY CHỈ RA MỘT
-- SELECT MÀ CÓ WHERE KEY THÌ CHỈ CÓ MỘT DÒNG TRẢ VỀ, DISTINCT LÀ VÔ NGHĨA
-- DISTINCT KHÔNG SO SÁNH ĐƯỢC GIÁ TRỊN NHỊ PHÂN (ví dụ như ảnh được chuyển thành mã nhị phân)

--	CÔNG THỨC FULL CỦA SELECT
-- SELECT ... FROM ...	WHERE ... GROUP BY ... HAVING ... ORDER BY

-- 12. Xem thông tin đơn hàng
SELECT * FROM Orders --830 rows

-- 13. Xem thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng
SELECT * FROM Orders ORDER BY Freight DESC

-- 14. In thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng >= 500kg
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC

-- 15. In thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, 
-- trọng lượng nằm trong khoảng 100 - 500kg và ship bởi cty giao vận số 1
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 ORDER BY OrderID

-- RẤT CẨN THẬN KHI TRONG MỆNH ĐỀ WHERE MÀ LẠI CÓ AND OR TRỘN VỚI NHAU
-- LÚC ĐÓ TA PHẢI DÙNG () ĐỂ PHÂN TÁCH THỨ TỰ FILTER

-- 16. ..Và không ship tới London
SELECT * FROM Orders 
WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND NOT(ShipCity = 'London')
ORDER BY Freight DESC

-- 17. Liệt kê các khách hàng đến từ Mỹ hoặc Mexico
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Mexico'

-- 18. Liệt kê các khách hàng không đến từ Mỹ hoặc Mexico
SELECT * FROM Customers WHERE NOT(Country = 'USA') AND NOT(Country = 'Mexico')

SELECT * FROM Customers WHERE Country != 'USA' AND Country != 'Mexico'

-- 19. Liệt kê các nhân viên sinh ra trong đoạn từ 1960-1970
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970