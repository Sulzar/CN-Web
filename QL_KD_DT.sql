﻿CREATE DATABASE [QLKD_DIENTHOAI] ON PRIMARY (
NAME = QLDT_Primary,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLDTDD_Primary.mdf',
SIZE= 5MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
)
LOG ON
(
NAME= QLDT_Log,
Filename='C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLDTDD_Log.ldf',
SIZE=1MB,
MAXSIZE=5MB,
FILEGROWTH=1MB
)
USE [QLKD_DIENTHOAI]

CREATE TABLE KHACHHANG(
MAKH INT IDENTITY NOT NULL,
TENKH NVARCHAR(40),
TENDN VARCHAR(30),
MATKHAU VARCHAR(30),
NGAYSINH DATE,
DCHI NVARCHAR(40),
DIENTHOAI CHAR(12),
CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
)

CREATE TABLE HANG (
MADT INT IDENTITY NOT NULL,
TENDT NVARCHAR(50),
HINHANH VARCHAR(20),
SOLUONG INT,
MANSX CHAR(10),
MANCC CHAR(10),
NGAYAD DATE,
GIA FLOAT,
CONSTRAINT PK_HANG PRIMARY KEY (MADT)
)

CREATE TABLE NHASX (
MANSX CHAR(10) NOT NULL,
TENNHASX NVARCHAR(40),
DCHI NVARCHAR(40),
DIENTHOAI CHAR(12),
CONSTRAINT PK_NHASX PRIMARY KEY (MANSX)
)

CREATE TABLE NHACC (
MANCC CHAR(10) NOT NULL,
TENNHACC NVARCHAR(40),
DCHI NVARCHAR(40),
DIENTHOAI CHAR(12),
CONSTRAINT PK_NHACC PRIMARY KEY (MANCC)
)

CREATE TABLE HOADON (
MAHD INT IDENTITY NOT NULL,
NGAYBAN DATE,
MAKH INT,
THANHTIEN FLOAT,
CONSTRAINT PK_HOADON PRIMARY KEY (MAHD)
)


CREATE TABLE CHITIETHD (
MAHD INT NOT NULL,
MADT INT NOT NULL,
SOLUONG INT,
GIABAN FLOAT,
CONSTRAINT PK_CHITIETHD PRIMARY KEY (MAHD,MADT)
)

CREATE TABLE ADMINISTRATOR (
TENDN_ADMIN VARCHAR(40) NOT NULL,
PASSWORD_ADMIN VARCHAR(50) NOT NULL,
CONSTRAINT PK_ADMINISTRATOR PRIMARY KEY (TENDN_ADMIN)
)


ALTER TABLE HANG 
ADD CONSTRAINT FK_HANG_NHASX FOREIGN KEY(MANSX) REFERENCES NHASX(MANSX)
ALTER TABLE HANG 
ADD CONSTRAINT FK_HANG_NHACC FOREIGN KEY(MANCC) REFERENCES NHACC(MANCC)
ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CHITIETHD_HOADON FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD) 
ALTER TABLE CHITIETHD
ADD CONSTRAINT FK_CHITIETHD_HANG FOREIGN KEY(MADT) REFERENCES HANG(MADT)



INSERT INTO KHACHHANG (TENKH,TENDN,MATKHAU,NGAYSINH,DCHI,DIENTHOAI) VALUES 
	(N'Phan Văn A','va100','handsome','1999/01/02',N'30/Cộng Hòa/Q.Tân Phú',0943334162),
	(N'Nguyễn B','bbb','olala','1999/02/03',N'31/Lê Trọng Tấn/Q.Tân Phú',0943334183),
	(N'Đào Thị C','cc34','blue75','1999/03/04',N'35/Lý Thường Kiệt/Q.Tân Bình',0943336453),
	(N'Đinh Nguyễn D','elu90','avatar','1999/04/05',N'50/Tân Sơn Nhì/Q.Tân Phú',0943330076),
	(N'Bá Văn E','yahoo','hmmmm','1999/05/06',N'66/Nguyễn Duy Cung/Q.Gò Vấp',0943335942),
	(N'Cao Văn F','thee','thanos','1999/11/10',N'105/Nguyễn Trọng Tuyển/Q.Phú Nhuận',0943333189),
	(N'Đặng H','balanced','inevitable','1999/10/11',N'02/Mã Lò/Q.Bình Tân',0943337415),
	(N'Trương Nguyễn K','thy','KH@307','1999/01/12',N'26/Hoa Phượng/Q.Phú Nhuận',0943332222),
	(N'Lại Thị S','oval','gazzz8!','1999/03/11',N'80/Tân Sơn Nhì/Q.Tân Phú',0943333333)


SELECT * FROM KHACHHANG


INSERT INTO NHACC (MANCC,TENNHACC,DCHI,DIENTHOAI) VALUES
	 ('PV01',N'PHONG VŨ',N'301/NGUYỄN THỊ MINH KHAI/Q.3',0943616432),
     ('PV02',N'THẾ GIỚI DI ĐỘNG',N'218/LÝ THƯỜNG KIỆT/Q.10',0984616532),
	 ('PV03',N'ĐIỆN MÁY XANH',N'490/LÊ TRỌNG TẤN/Q.TÂN PHÚ',0913616488)

INSERT INTO NHASX (MANSX,TENNHASX,DCHI,DIENTHOAI) VALUES
	 ('SSUM',N'SAMSUNG',N'USA',1003616432),
     ('XIAO',N'XIAOMI',N'CHINA',1004716438),
	 ('APPE',N'APPLE',N'USA',1006316452),
	 ('HUAW',N'HUAWEI',N'CHINA',1006316739),
	 ('LENV',N'LENOVO',N'CHINA',1006316139),
	 ('SONY',N'SONY',N'JAPAN',1006316567),
	 ('OPPO',N'OPPO',N'CHINA',1006316222)

SET DATEFORMAT DMY
INSERT INTO HANG(TENDT,HINHANH,SOLUONG,MANSX,MANCC,NGAYAD,GIA) VALUES
	('SAMSUNG GALAXY J7','0001.jpg',50,'SSUM','PV01','2018/04/09',4000000),
    ('SAMSUNG GALAXY S10','0002.jpg',90,'SSUM','PV02','2018/05/10',5000000),
    ('XIAOMI REDMI NOTE 7','0003.jpg',60,'XIAO','PV03','2018/09/12',4500000),
	('XIAOMI REDMI NOTE 5','0004.jpg',80,'XIAO','PV02','2018/07/11',6000000),
	('IPHONE X','0005.jpg',70,'APPE','PV01','2018/08/01',4300000),
	('IPHONE XS MAX','0006.jpg',75,'APPE','PV03','2018/04/02',4200000),
	('HUAWEI P30 PRO','0007.jpg',100,'HUAW','PV03','2018/10/07',5000000),
	('HUAWEI MATE 30 PRO','0008.jpg',85,'HUAW','PV02','2018/12/05',6200000),
	('LENOVO Z5 PRO','0009.jpg',70,'LENV','PV03','2018/10/07',8000000),
	('LENOVO S5','0010.jpg',120,'LENV','PV03','2018/11/02',7500000),
	('SONY XPERIA XZ3','0011.jpg',60,'SONY','PV01','2018/02/09',11000000),
	('SONY XPERIA Z5','0012.jpg',65,'SONY','PV02','2018/03/08',10000000),
	('OPPO A9 2020','0013.jpg',150,'OPPO','PV02','2018/07/12',7000000),
	('OPPO F11 PRO','0014.jpg',140,'OPPO','PV01','2018/05/08',9000000),
	('SAMSUNG GALAXY S10+','0015.jpg',80,'SSUM','PV01','2018/07/15',21000000),
	('LENOVO K5','0016.jpg',60,'LENV','PV03','2018/06/03',5000000),
	('SAMSUNG GALAXY S9 Plus','0017.jpg',70,'SSUM','PV02','2019/04/11',3200000),
	('OPPO Reno2 F','0018.jpg',85,'OPPO','PV03','2019/07/12',8990000),
	('IPHONE 11','0019.jpg',75,'APPE','PV01','2019/08/10',18600000),
	('SAMSUNG GALAXY NOTE 9','0020.jpg',60,'SSUM','PV03','2019/07/05',3500000),
	('SAMSUNG GALAXY S7','0021.jpg',80,'SSUM','PV02','2019/05/11',6160000),
	('OPPO FIND X','0022.jpg',50,'OPPO','PV02','2019/03/02',12990000),
	('OPPO RENO','0023.jpg',55,'OPPO','PV03','2019/01/12',9490000),
	('GLOBAL VERSION LENOVO Z6 PRO','0024.jpg',50,'LENV','PV01','2019/08/09',15323000)
	

SELECT * FROM HANG


INSERT INTO ADMINISTRATOR (TENDN_ADMIN,PASSWORD_ADMIN) VALUES
	('admin','ZCxOP1999')


--Kiểm tra số lượng khi nhập vào bảng 'CHITIETHD'
alter table CHITIETHD
add constraint chk_sl1 check(Soluong>0)



													   