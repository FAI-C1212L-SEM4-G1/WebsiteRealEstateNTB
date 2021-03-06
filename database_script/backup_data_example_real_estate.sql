/** SẮP XẾP THỨ TỰ INSERT INTO PHÙ HỢP KHÓA NGOẠI BẢNG **/

-- INSERT TABLE Account
INSERT INTO dbo.Account (loginId, [status], role)
VALUES
	('admin', 'ACTIVE', '0'),
	('user', 'WAITING', '1'),
	('anhnnp', 'ACTIVE', '1'),
	('sangpv', 'ACTIVE', '1'),
	('tuanna', 'BLOCKED', '2');
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
	('RP0818151015', N'Nguyễn Hữu Thọ, Phước Kiển, Nhà Bè', N'Hồ Chí Minh', N'Việt Nam', '1250'),
	('RP0818151025', N'Trung Kính, Cầu Giấy', N'Hà Nội', N'Việt Nam', '2760'),
	('RP0818151048', N'Mỗ Lao, Hà Đông', N'Hà Nội', N'Việt Nam', '2500'),
	('RP0818151100', N'Vạn Phúc, Hà Đông', N'Hà Nội', N'Việt Nam', '3500'),
	('RP0818151110', N'Nguyễn Huy Tưởng, Thanh Xuân', N'Hà Nội', N'Việt Nam', '2400');
GO

-- INSERT TABLE ProfileLand
INSERT INTO dbo.ProfileLand 
VALUES 
	('PL0818151015', 'RP0818151015', N'Chung cư Hưng Phát Sliver Star', N'Đường Nguyễn Hữu Thọ, Xã Phước Kiển, Nhà Bè, Hồ Chí Minh, Việt Nam', N'Khu căn hộ', 'National Territory Builders (NTB)', '8956', '15000', '2015-08-08', '2018-10-10', N'Có giấy phép xây dựng', 1000, 45, 15, 130, 
	N'Các căn hộ tại dự án Hưng Phát Sliver Star được thiết kế thông minh, diện tích sử dụng được tối ưu hóa một cách tối đa, tất cả phòng bên trong căn hộ đều có ánh sáng và gió tự nhiên. Đặc biệt, điều làm các khách hàng hài lòng nhất là 90% căn hộ có ban công thoáng mát để cư dân có thể ngắm cảnh, thư giãn sau những mệt mỏi, căng thẳng của cuộc sống.', 
	N'Chung cư Hưng Phát Sliver Star được phát triển bởi công ty Hưng Lộc Phát với đầy đủ những tiện nghi và sở hữu một vị trí thuận lợi. Căn hộ này hoàn toàn xứng đáng để người dân định cư và xây dựng tổ ấm. Dự án chỉ cách Phú Mỹ Hưng 800m, quy mô xây dựng 8956m2, bao gồm 3 block căn hộ cao từ 16-24 tầng với 5 tầng trung tâm thương mại.', ''),
	('PL0818151025', 'RP0818151025', N'Chung cư 219 Trung Kính', N'219 Trung Kính, Cầu Giấy, Hà Nội, Việt Nam', N'Khu căn hộ', 'National Territory Builders (NTB)', '7106', '', '2015-01-01', '2017-01-01', N'Có giấy phép xây dựng, Có sổ đỏ', 1000, 400, 29, 70, 
	N'Chung cư 219 Trung Kính nằm tại vị trí trung tâm Cầu Giấy – nơi tập trung các dịch vụ thương mại, kinh tế, chính trị năng động nhất của quận Cầu Giấy, đây được coi là dự án BĐS hot nhất năm 2015. Các căn hộ được thiết kế đẹp, tinh tế tạo nên một không gian sống lý tưởng cho cư dân với giá cả hợp lý', 
	N'Tọa lạc tại mặt đường Trung Kính, Phường Yên Hoà, Chung cư 219 Trung Kính đươc điểm 10 cho vị trí đắc lợi tại trung tâm Cầu Giấy – một trong những trục đường đẹp nhất của ở Hà Nội. Bên cạnh vị trí thuận tiện, dự án còn có ưu thế đặc biệt nhờ thiết kế sang trọng, hiện đại với nhiều không gian xanh, thoáng mát trong lành, khí hậu mát mẻ. Một môi trường sống đầy lý tưởng, năng động cho tổ ấm cũng như cuộc sống cư dân.', ''),
	('PL0818151048', 'RP0818151048', N'Chung cư cao cấp Seasons Avenue', N'Mỗ Lao, Hà Đông, đối diện Mulberry Lane, Hà Nội, Việt Nam', N'Khu căn hộ', 'National Territory Builders (NTB)', '8000', '', '2014-05-17', '2016-12-25', N'Có giấy phép xây dựng, Có sổ đỏ', 1000, 400, 40, 100, 
	N'Seasons Avenue hay còn có tên gọi khác là Đại lộ bốn mùa là một trong những tổ hợp chung cư cao cấp với hệ thống tiện ích nội khu cùng thiết kế tối ưu khi vừa có logia phơi đồ kín để giữ cảnh quan chung lại vừa có bạn công đáp ứng sở thích của khách hàng. Cùng với đó là hàng loạt tiện ích đẳng cấp, nổi trội.', 
	N'Chung cư Seasons Avenue gồm 4 tòa S1, S2, S3, S4 với thiết kế tương ứng với cảm hứng của từng mùa trong năm với độ cao 40 tầng, gồm 4 tầng nổi, bắt đầu ở từ tầng 5; không có tầng hầm kết hợp hài hòa giữa cảnh quan thiên nhiên, môi trường và hệ thống dịch vụ tiện ích vượt trội, đem lại cho cư dân nơi đây một cuộc sống tiện nghi và hoàn hảo. Chung cư cao cấp Seasons Avenue được thiết kế với chiều cao 40 tầng nhưng lại có mật độ dân cư thấp: từ 10-11 căn/tầng với 2 loại căn hộ khác nhau.', ''),
	('PL0818151100', 'RP0818151100', N'Chung cư Gold Silk Complex', N'430 Cầm Am, Vạn Phúc, Hà Đông, Hà Nội, Việt Nam', N'Khu căn hộ', 'National Territory Builders (NTB)', '8000', '', '2014-05-17', '2016-12-25', N'Có giấy phép xây dựng, Có sổ đỏ', 1000, 400, 40, 100, 
	N'Tọa lạc tại vị trí đẹp nhất của quận Hà Đông cùng mật độ xây dựng khá thấp,  dự án chung cư Gold  Silk Complex được đánh giá sẽ đóng góp vào sự phát triển bền vững cho khu vực Hà Đông nói riêng và Hà Nội nói chung một khu đô thị mới, khang trang, xanh và đẹp.',
	N'Các căn hộ Gold  Silk Complex được thiết kế theo hai phong cách kiến trúc : phong cách kiến trúc hiện đại  và phong cách kiến trúc tân cổ điển. Layout các tầng được thiết kế tối ưu hoá về diện tích và công năng sử dụng. Các phòng điều hoà được tính toán kỹ để có độ thông thoáng và khả năng đón ánh sáng tự nhiên.',''),
	('PL0818151110', 'RP0818151110', N'Imperia Garden Hà Nội', N'203 Nguyễn Huy Tưởng, Thanh Xuân, Hà Nội, Việt Nam', N'Khu căn hộ', 'National Territory Builders (NTB)', '8000', '', '2014-05-17', '2016-12-25', N'Có giấy phép xây dựng, Có sổ đỏ', 1000, 400, 40, 100, 
	N'Imperia garden 203 Nguyễn Huy Tưởng là cụm căn hộ cao cấp quy mô nhất tọa lạc trên trục đường Nguyễn Huy Tưởng thuộc khu vực trung tâm kinh tế mới tại quận Thanh Xuân – Cầu Giấy. Được thiết kế xây dựng và quản lý theo tiêu chuẩn Quốc tế, hứa hẹn là một trong những điểm nhấn lớn nhất phía Tây Hà Nội.',
	N'Chung cư Imperia Garden 203 Nguyễn Huy Tưởng hứa hẹn mang tới cho khách hàng một cuộc sống hoàn hảo cho hơn 5.000 cư dân một không gian sống thực sự đẳng cấp, sang trọng, thoải mái, dự án được đầu tư hệ thống hạ tầng tiện ích và dịch vụ đồng bộ, khép kín bao gồm: các trung tâm chăm sóc sức khỏe và làm đẹp như bể bơi 4 mùa, khu tập gym, khu vui chơi trẻ em, trường học, siêu thị mua sắm, hầm đỗ xe thông minh …', '');	
GO

-- INSERT TABLE PaymentMode
INSERT INTO dbo.PaymentMode
VALUES 
	('PM00000001', 'PL0818151015', '3', '20,30,50', 'Loading ...'),
	('PM00000002', 'PL0818151025', '4', '20,30,30,20', 'Loading ...'),
	('PM00000003', 'PL0818151048', '3', '30,30,40', 'Loading ...'),
	('PM00000004', 'PL0818151100', '3', '25,35,40', 'Loading ...'),
	('PM00000005', 'PL0818151110', '5', '20,20,20,20,20', 'Loading ...');
GO

-- INSERT TABLE BuyLand
INSERT INTO dbo.BuyLand 
VALUES 
	('10_01', 'PL0818151025', 'anhnnp', 'Loading ...', '2009-08-09', '345000', '345000'),
	('08_03', 'PL0818151025', 'sangpv', 'Loading ...', '2010-01-01', '231000', '231000'),
	('05_04', 'PL0818151025', 'tuanna', 'Loading ...', '2011-09-11', '115000', '115000');
GO

-- INSERT TABLE InvoiceTransaction
INSERT INTO dbo.InvoiceTransaction 
VALUES 
	('IT082420151639', '10_01', '2012-10-11', '1000'),
	('IT082420151641', '08_03', '2012-10-11', '1000'),
	('IT082420151642', '05_04', '2012-10-11', '1000');
GO