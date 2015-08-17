USE master
GO
CREATE DATABASE RealEstate
GO

--BẢNG GIÁ ĐẤT THEO KHU VỰC--
CREATE TABLE RegionalPrice 
(
	code varchar(15) PRIMARY KEY, -- Mã khu vực
	regionalName nvarchar(100) NOT NULL UNIQUE, -- Tên khu vực
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
	totalFloor int					--Tổng số tầng
);
GO

--THÔNG TIN NGƯỜI MUA--
CREATE TABLE Buyers
(
	code varchar(15) PRIMARY KEY, -- Lưu code là: mã tòa nhà + Mã tầng + Mã phòng
	codeProfileLand varchar(15) FOREIGN KEY REFERENCES ProfileLand(code), -- Khóa ngoại đến khu vực đất
	peopleId varchar(15) NOT NULL, -- Chứng thư nhân dân
	name nvarchar(50) NOT NULL, -- Tên khách hàng
	addr nvarchar(100) NOT NULL, -- Địa chỉ
	totalPrice varchar(10) NOT NULL, -- Tổng giá nhà phải trả
	havePaid varchar(10) DEFAULT 0, -- Đã trả
);
GO
