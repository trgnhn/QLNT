--USE master
--DROP DATABASE QuanLiPhongTro

CREATE DATABASE QuanLiPhongTro
GO

Use QuanLiPhongTro
DROP TABLE TaiKhoan
go

Create table KhachTro
(
	MaKT int IDENTITY(1,1) primary key, 
	TenKT nvarchar(50),
	CMND nvarchar(10),
	GioiTinh bit,
	NgheNghiep nvarchar(15),
	MaPT nvarchar(10)
)
go

CREATE TABLE TaiKhoan (
    Username varchar(50) primary key,
    Password varchar(50),
	MaKT int,
	foreign key (MaKT) references KhachTro(MaKT),
)
go

INSERT INTO TaiKhoan(Username, Password) VALUES ('admin','12345')

Create table PhongTro
(
	MaPT nvarchar(10) primary key,
	MaKV nvarchar(10),
	TenPT nvarchar(50),
	SoPhong int,
	TrangThai bit,
	GiaPhong int,
)
Go

Create table DangKy
(
	MaDK int IDENTITY(1,1) primary key,
	MaPT nvarchar(10),
	MaKT int,
	NgayDangKy datetime,
	SoLuongToiDa int,
	foreign key (MaPT) references PhongTro(MaPT),
	foreign key (MaKT) references KhachTro(MaKT),
)
Go

Create table KhachTro_PhongTro
(
	MaPhieuThue int IDENTITY(1,1) primary key,
	MaPT nvarchar(10),
	MaKT int,
	foreign key (MaPT) references PhongTro(MaPT),
	foreign key (MaKT) references KhachTro(MaKT),
	NgayThue datetime,
	SoLuongToiDa int,
)
go

Create table ThietBi
(
	MaTB nvarchar(10) primary key,
	TenTB nvarchar(50),
	MaPT nvarchar(10),
	SoLuong int,
	TrangThai bit,
	foreign key (MaPT) references PhongTro(MaPT),
)
go

Create table DichVu
(
	MaDV nvarchar(10) primary key,
	TenDV nvarchar(50),
	MaPT nvarchar(10),
	foreign key (MaPT) references PhongTro(MaPT),
)
go

Create table ChuTro
(
	TenChuTro nvarchar(50),
	MaThu nvarchar(10),
	MaPC nvarchar(10)
)
go

Create table PhieuChi
(
	MaPC int IDENTITY(1,1) primary key,
	MaPT nvarchar(10),
	MaKT int,
	TenKT nvarchar(10),
	NgayChi Datetime,
	SoTienChi int,
	LiDo nvarchar(1000)
)
go

Create table ThuTien
(
	MaThu int IDENTITY(1,1) primary key,
	MaPT nvarchar(10),
	MaKT int,
	NgayThangThu Datetime,
	SoTienThu int,
	TienNha int,
	TienDien int,
	TienNuoc int,
	TienInternet int,
	TienDichVu int,
	DaThu bit,
	TienThu int
)
go

select * from KhachTro_PhongTro
select * from DangKy

select * from KhachTro
select MaPT from KhachTro where MaKT = 1