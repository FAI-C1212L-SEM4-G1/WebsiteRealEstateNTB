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
	[password] varchar(30) DEFAULT '0000', -- Mật khẩu tài khoản
	[status] varchar(15) DEFAULT 'WAITING' CHECK ([status] IN ('WAITING', 'ACTIVE', 'INACTIVE', 'BLOCKED')), -- Trạng thái tài khoản ('WAITING', 'ACTIVE', 'INACTIVE', 'BLOCKED')
	createDate date DEFAULT GETDATE(),
	[role] int DEFAULT 2 -- Mặc định là Customer (2). User (1). Admin(0)
);
GO

--BẢNG CHI TIẾT THÔNG TIN CÁ NHÂN--
CREATE TABLE Person 
(
	id varchar(15) PRIMARY KEY, -- Nhập chứng thư nhân dân
	[username] varchar(30) UNIQUE NOT NULL FOREIGN KEY REFERENCES Account([loginId]), -- Khóa ngoại tài khoản đăng nhập
	fullname nvarchar(30) NOT NULL, -- Nhập tên đầy đủ
	birthday date, -- Nhập ngày sinh
	gender varchar(6) CHECK (gender IN ('Male', 'Female', 'Other')), -- Giới tính chọn 1 trong 3 ('Male, Female', 'Other')
	avatar varchar(100), -- Ảnh đại diện
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
	unitPrice varchar(10) DEFAULT '0'-- Đơn giá cho khu vực
);
GO

--BẢNG HỒ SƠ DỰ ÁN--
CREATE TABLE ProfileLand
(
	code varchar(15) PRIMARY KEY,	--Mã dự án
	codeRegional varchar(15) FOREIGN KEY REFERENCES RegionalPrice(code), --Khóa ngoại giá khu vực
	name nvarchar(100) NOT NULL,	--Tên dự án	
	location nvarchar(300) NOT NULL,--Địa chỉ chi tiết
	typeOf nvarchar(50),			--Loại hình dự án
	investors nvarchar(50),			--Chủ đầu tư
	totalArea float,				--Tổng diện tích xây dựng (m2)
	capitalInvestment varchar(10),	--Vốn đầu tư (đơn vị Dolar $)
	dateStart date,					--Ngày bắt đầu
	dateEnd date,					--Ngày hoàn thành
	currentStatus nvarchar(100),	--Hiện trạng pháp lý (Giấy phép xây dựng)
	populationSize float,			--Quy mô dân cư (bao nhiêu dân số)
	totalRoom int,					--Tổng số phòng
	totalFloor int,					--Tổng số tầng
	[roomArea] int,					--Diện tích phòng	
	introduction nvarchar(4000),	--Giới thiệu ngắn gọn
	[description] nvarchar(4000),	--Mô tả chi tiết
	[image] varchar(1000)			--Lưu các ảnh (tập tin ảnh dạng text string hoặc đường dẫn của file ảnh)
);
GO

--BẢNG PHƯƠNG THỨC THANH TOÁN--
CREATE TABLE PaymentMode
(
	code varchar(15) PRIMARY KEY, -- Mã phương thức thanh toán
	codeProfileLand varchar(15) UNIQUE NOT NULL FOREIGN KEY REFERENCES ProfileLand(code), -- Khóa ngoại đến dự án khu vực
	countPay int DEFAULT 3, -- Số lần trả
	percentPay varchar(50) DEFAULT '20,30,50', -- Phần trăm trả mỗi lần
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
	buyDate date DEFAULT GETDATE(), -- Ngày mua, mặc định ngày khởi tạo
	totalPaid varchar(10) DEFAULT '0', -- Tổng tiền phải thanh toán
	havePay varchar(10) DEFAULT '0' -- Tổng số tiền đã thanh toán  
);
GO

--BẢNG CHI TIẾT GIAO DỊCH--
CREATE TABLE InvoiceTransaction
(
	code varchar(15) PRIMARY KEY, -- Mã giao dịch
	codeBuyLand varchar(15) FOREIGN KEY REFERENCES BuyLand(code), -- Khóa ngoại bảng khách hàng mua đất
	dateTrans date DEFAULT GETDATE(), -- Ngày giao dịch, mặc định ngày khởi tạo
	paid varchar(10) DEFAULT '0' -- Số tiền thanh toán 
);
GO