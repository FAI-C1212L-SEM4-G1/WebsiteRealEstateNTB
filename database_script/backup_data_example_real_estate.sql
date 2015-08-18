/** SẮP XẾP THỨ TỰ INSERT INTO PHÙ HỢP KHÓA NGOẠI BẢNG **/

-- INSERT TABLE Account
INSERT INTO dbo.Account (loginId, [status], role)
VALUES
	('admin', 'ACTIVE', '1'),
	('user', 'WAITING', '0'),
	('anhnnp', 'ACTIVE', '0'),
	('sangpv', 'ACTIVE', '0'),
	('tuanna', 'BLOCKED', '0');
GO
	
-- INSERT TABLE Account
INSERT INTO dbo.Person 
VALUES 
	('123456789', 'admin', 'Administrator', '1990-09-09', 'Male', '', 'Enge Kerksteeg 2, 1011 GV Amsterdam, The Netherlands', '+31613572888', 'admin@readestate.admin.com', 'etc ...'),
	('123652546', 'user', 'Username', '1989-05-12', 'Female', '', 'Enge Kerksteeg 3, 1012 GV Amsterdam, The Netherlands', '+31613572799', 'user.readestate@gmail.com', 'etc ...'),
	('152425136', 'anhnnp', 'Nguyen Ngoc Phan Anh', '1991-02-02', 'Male', '', 'street Khuong Thuong, Dong Da, Ha Noi, Vietnam', '+84933086689', 'anhnnp.hdn.vn@gmail.com', 'etc ...'),
	('124525256', 'sangpv', 'Phan Van Sang', '1993-11-09', 'Male', '', 'street Pham Hung, Nam Tu Liem, Ha Noi, Vietnam', '+841666202886', 'phanvansang@gmail.com', 'etc ...'),
	('123636525', 'tuanna', 'Nguyen Tuan Anh', '1991-10-06', 'Male', '', 'street Minh Khai, Hoang Mai, Ha Noi, Vietnam', '+841293003361', 'tuanna@gmail.com', 'etc ...');
GO

-- INSERT TABLE RegionalPrice
INSERT INTO dbo.RegionalPrice 
VALUES 
	('CGHN120500', N'Khu TT Thanh Xuân Bắc, Thanh Xuân Bắc, Thanh Xuân', N'Hà Nội', N'Việt Nam', '1250'),
	('CGHN122000', N'Đường Cầu Giấy, Phường Quan Hoa', N'Hà Nội', N'Việt Nam', '2760'),
	('CGHN118728', N'Nguyễn Thái Học, Điện Biên, Ba Đinh', N'Hà Nội', N'Việt Nam', '2500'),
	('CGHN100100', N'Đinh Tiên Hoàng, Lý Thái Tổ', N'Hà Nội', N'Việt Nam', '3500'),
	('CGHN128300', N'Khu chung cư Định Công, Định Công', N'Hà Nội', N'Việt Nam', '2400');
GO

-- INSERT TABLE ProfileLand
INSERT INTO dbo.ProfileLand 
VALUES 
	(''),
	('');
GO

-- INSERT TABLE PaymentMode
INSERT INTO dbo.PaymentMode 
VALUES 
	(''),
	('');
GO

-- INSERT TABLE BuyLand
INSERT INTO dbo.BuyLand 
VALUES 
	(''),
	('');
GO

-- INSERT TABLE InvoiceTransaction
INSERT INTO dbo.InvoiceTransaction 
VALUES 
	(''),
	('');
GO