USE master
GO
CREATE DATABASE RealEstate
GO

USE RealEstate
GO

--BẢNG TÀI KHOẢN--
CREATE TABLE Account
(
	[loginId] varchar(30) PRIMARY KEY, -- Tên đăng nhập
	[password] varchar(30) NOT NULL, -- Mật khẩu tài khoản
	[role] int DEFAULT 0 -- Mặc định là Khách hàng (0). Admin(1)
);
GO

--BẢNG CHI TIẾT THÔNG TIN CÁ NHÂN--
CREATE TABLE Person 
(
	id varchar(15) PRIMARY KEY, -- Nhập chứng thư nhân dân
	[username] varchar(30) FOREIGN KEY REFERENCES Account([loginId]), -- Khóa ngoại tài khoản đăng nhập
	fullname nvarchar(30) NOT NULL, -- Nhập tên đầy đủ
	birthday date, -- Nhập ngày sinh
	[address] nvarchar(100), -- Nhập địa chỉ
	tel varchar(15), -- Nhập điện thoại liên hệ
	email varchar(30), -- Nhập địa chỉ mail
	note nvarchar(100), -- Ghi chú thêm
);

--BẢNG GIÁ ĐẤT THEO KHU VỰC--
CREATE TABLE RegionalPrice 
(
	code varchar(15) PRIMARY KEY, -- Mã khu vực
	regionalName nvarchar(100) NOT NULL UNIQUE, -- Tên khu vực chi tiết Đường/Phường/Quận
	city nvarchar(20) NOT NULL, -- Thành phố
	country nvarchar(20) NOT NULL, -- Quốc gia
	unitPrice varchar(10) DEFAULT 0-- Đơn giá cho khu vực
);
GO

--BẢNG HỒ SƠ DỰ ÁN--
CREATE TABLE ProfileLand
(
	code varchar(15) PRIMARY KEY,	--Mã dự án
	codeRegional varchar(15) FOREIGN KEY REFERENCES RegionalPrice(code), --Khóa ngoại giá khu vực
	name nvarchar(50) NOT NULL,		--Tên dự án	
	location nvarchar(100) NOT NULL,--Địa chỉ chi tiết
	typeOf nvarchar(20),			--Loại hình dự án
	investors nvarchar(50),			--Chủ đầu tư
	totalArea float,				--Tổng diện tích xây dựng (m2)
	capitalInvestment varchar(10),	--Vốn đầu tư (đơn vị Dolar $)
	dateStart date,					--Ngày bắt đầu
	dateEnd date,					--Ngày hoàn thành
	currentStatus nvarchar(50),		--Hiện trạng pháp lý (Giấy phép xây dựng)
	populationSize float,			--Quy mô dân cư (bao nhiêu dân số)
	totalRoom int,					--Tổng số phòng
	totalFloor int,					--Tổng số tầng
	[roomArea] int,					--Diện tích phòng	
	introduction nvarchar(100),		--Giới thiệu ngắn gọn
	[description] nvarchar(500),	--Mô tả chi tiết
	[image] varchar(500)			--Lưu các ảnh (tập tin ảnh dạng text string hoặc đường dẫn của file ảnh)
);
GO

--BẢNG PHƯƠNG THỨC THANH TOÁN--
CREATE TABLE PaymentMode
(
	code varchar(15) PRIMARY KEY, -- Mã phương thức thanh toán
	codeProfileLand varchar(15) FOREIGN KEY REFERENCES ProfileLand(code), -- Khóa ngoại đến dự án khu vực
	countPay int DEFAULT 3, -- Số lần trả
	percentPay varchar(50), -- Phần trăm trả mỗi lần
	note nvarchar(100) -- Chi chú thêm
);
GO

--BẢNG DANH SÁCH KHÁCH HÀNG MUA BĐS--
CREATE TABLE BuyLand
(
	code varchar(15) PRIMARY KEY, -- Lưu code là: mã tòa nhà + Mã tầng + Mã phòng
	codeProfileLand varchar(15) FOREIGN KEY REFERENCES ProfileLand(code), -- Khóa ngoại đến dự án khu vực
	username varchar(30) FOREIGN KEY REFERENCES Account([loginId]), -- Khóa ngoại tài khoản đăng nhập
	note nvarchar(100), -- Ghi chú
	buyDate date NOT NULL, -- Ngày mua
	totalPaid varchar(10) DEFAULT 0, -- Tổng tiền phải thanh toán
	havePay varchar(10) DEFAULT 0 -- Số tiền còn phải thanh toán  
);
GO

--BẢNG CHI TIẾT GIAO DỊCH--
CREATE TABLE InvoiceTransaction
(
	code varchar(15) PRIMARY KEY, -- Mã giao dịch
	codeBuyLand varchar(15) FOREIGN KEY REFERENCES BuyLand(code), -- Khóa ngoại bảng khách hàng mua đất
	dateTrans date NOT NULL, -- Ngày giao dịch
	paid varchar(10) DEFAULT 0 -- Số tiền thanh toán 
);
GO