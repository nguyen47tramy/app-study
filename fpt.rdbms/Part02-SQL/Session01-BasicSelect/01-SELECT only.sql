USE Northwind --Chọn để chơi với một thùng chưa nào đó
			  --Tại một thời điểm chỉ chơi với một thùng chứa

SELECT * FROM Customers

SELECT * FROM Employees

------------------------------------
----- LÝ THUYẾT
-- 1. DB Engine cung cấp câu lệnh SELECT dùng cho hai việc
--			in ra màn hình một cái gì đó, tương đương printf(), sout
--			in ra dữ liệu có trong table (hàng/cột) <ĐÂY LÀ PHẦN QUAN TRỌNG>
--		dùng cho mục đích nào thì kết quả hiển thị luôn là một table			
------------------------------------

-- 1. Hôm nay là ngày bao nhiêu?
SELECT GETDATE() -- hàm trong lập trình, CÓ RETURN VALUE 
				 -- lấy đồng hồ từ server

SELECT GETDATE() AS [Hôm nay là ngày]

-- 2. Bây giờ là tháng mấy?
SELECT YEAR(GETDATE())	--hàm trong hàm
SELECT MONTH(GETDATE())	AS [Bây giờ tháng]

-- 3. Giá trị tuyệt đối của -5?
SELECT ABS(-5) AS [Giá trị tuyệt đối của (-5)]

-- 4. 5 + 5 là mấy?
SELECT 5 + 5 AS [5 + 5  =]

-- 5. In ra tên của mình
SELECT N'Nguyễn Trà My'	-- chuỗi dùng nháy đơn ''
						-- chuỗi unicode dùng N''
SELECT N'Nguyễn' + N' Trà My'

-- 6. Tính tuổi
SELECT YEAR(GETDATE()) - 1999

-- SELECT N'Nguyễn' + N' Trà My' + (YEAR(GETDATE()) - 1999) 
-- LỖI VÌ LỘN XỘN KIỂU DATA MÁY KHÔNG XỬ LÝ ĐƯỢC
-- XỬ LÝ BẰNG CONVERT VÀ CAST

-- Dùng convert, tên table có dấu cách dùng []
SELECT N'Nguyễn' + N' Trà My ' + CONVERT(VARCHAR, YEAR(GETDATE()) - 1999) + N' tuổi' AS [My Profile]
-- Dúng cast, tên table không có dấu cách không cần ngoạc vuông []
SELECT N'Nguyễn' + N' Trà My ' + CAST(YEAR(GETDATE()) - 1999 AS VARCHAR) + N' tuổi' AS MyProfile

-- 7. Phép nhân hai số
SELECT 10 * 10 AS [10 *10]

