create database quanlybanhang;
use quanlybanhang;

create table khachhang (
                           MaKH nvarchar(4) not null primary key,
                           tenKH nvarchar(30) not null,
                           Diachi nvarchar(50),
                           Ngaysinh datetime,
                           soDT nvarchar(15) unique
);

create table nhanvien (
                          MaNV nvarchar(4) primary key,
                          HoTen nvarchar(30),
                          GioiTinh bit,
                          DiaChi nvarchar(50),
                          NgaySinh datetime,
                          Dienthoai nvarchar(15),
                          Email text,
                          Noisinh varchar(20),
                          NgayVaoLam datetime,
                          MaNQL nvarchar(4)
);

create table nhacungcap (
                            MaNCC nvarchar(5) primary key,
                            TenNCC nvarchar(50),
                            Diachi nvarchar(50),
                            Dienthoai nvarchar(15),
                            Email nvarchar(30),
                            Website nvarchar(30)
);

create table loaisp (
                        MaloaiSP nvarchar(4) primary key,
                        TenloaiSP nvarchar(30),
                        Ghichu nvarchar(100)
);

create table sanpham (
                         MaSP nvarchar(4) primary key,
                         MaloaiSP nvarchar(4),
                         TenSP nvarchar(50),
                         Donvitinh nvarchar(10),
                         Ghichu nvarchar(100),
                         foreign key (MaloaiSP) references loaisp(MaloaiSP)
);

create table phieunhap (
                           soPN nvarchar(5) primary key,
                           MaNV nvarchar(4),
                           MaNCC nvarchar(5),
                           Ngaynhap datetime,
                           Ghichu varchar(100),
                           foreign key (MaNV) references nhanvien(MaNV),
                           foreign key (MaNCC) references nhacungcap(MaNCC)
);

create table ctphieunhap (
                             MaSP nvarchar(4),
                             SoPN nvarchar(5),
                             soluong smallint,
                             Gianhap real,
                             primary key (MaSP,SoPN),
                             foreign key (MaSP) references sanpham(MaSP),
                             foreign key (SoPN) references phieunhap(soPN)
);

create table phieuxuat (
                           SoPX nvarchar(5) primary key ,
                           MaNV nvarchar(4),
                           MaKH nvarchar(4),
                           NgayBan datetime,
                           Ghichu text,
                           foreign key (MaNV) references nhanvien(MaNV),
                           foreign key (MaKH) references khachhang(MaKH)
);

create table ctphieuxuat (
                             SoPX nvarchar(5),
                             MaSP nvarchar(4),
                             SoLuong smallint,
                             GiaBan real,
                             primary key (SoPX,MaSP),
                             foreign key (SoPX) references phieuxuat(SoPX),
                             foreign key (MaSP) references sanpham(MaSP)
);

INSERT INTO khachhang (MaKH, tenKH, Diachi, Ngaysinh, soDT)
VALUES ('KH01', 'Nguyen Van A', '123 ABC Street, XYZ City', '1990-05-15', '0123456789'),
       ('KH02', 'Tran Thi B', '456 XYZ Street, ABC City', '1985-08-20', '0987654321'),
       ('KH03', 'Pham Van C', '789 PQR Street, XYZ City', '1992-12-05', '0909090909'),
       ('KH04', 'Le Thi D', '101 LMN Street, ABC City', '1987-02-18', '0912345678'),
       ('KH05', 'Hoang Van E', '999 XYZ Street, ABC City', '1995-09-25', '0987654320');

INSERT INTO nhanvien (MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, Dienthoai, Email, Noisinh, NgayVaoLam, MaNQL)
VALUES ('NV01', 'Tran Van X', 1, '789 XYZ Street, ABC City', '1990-10-15', '0123456789', 'tranvanx@example.com', 'XYZ City', '2010-02-25', NULL),
       ('NV02', 'Nguyen Thi Y', 0, '456 ABC Street, XYZ City', '1988-05-20', '0987654321', 'nguyenthiy@example.com', 'XYZ City', '2015-07-10', 'NV01'),
       ('NV03', 'Le Van Z', 1, '101 PQR Street, ABC City', '1993-12-05', '0909090909', 'levanz@example.com', 'PQR City', '2013-08-20', 'NV01'),
       ('NV04', 'Pham Thi T', 0, '555 XYZ Street, ABC City', '1995-03-18', '0912345678', 'phamthit@example.com', 'ABC City', '2017-09-12', 'NV02'),
       ('NV05', 'Hoang Van M', 1, '777 PQR Street, XYZ City', '1991-11-30', '0987654321', 'hoangvanm@example.com', 'PQR City', '2019-05-05', 'NV02');

INSERT INTO nhacungcap (MaNCC, TenNCC, Diachi, Dienthoai, Email, Website)
VALUES ('NCC01', 'Công ty A', '123 XYZ Street, ABC City', '0123456789', 'info@companya.com', 'www.companya.com'),
       ('NCC02', 'Công ty B', '456 ABC Street, XYZ City', '0987654321', 'contact@companyb.com', 'www.companyb.com'),
       ('NCC03', 'Công ty C', '789 PQR Street, ABC City', '0909090909', 'info@companyc.com', 'www.companyc.com'),
       ('NCC04', 'Công ty D', '101 XYZ Street, ABC City', '0912345678', 'contact@companyd.com', 'www.companyd.com'),
       ('NCC05', 'Công ty E', '999 ABC Street, XYZ City', '0987654320', 'info@companye.com', 'www.companye.com');

INSERT INTO loaisp (MaloaiSP, TenloaiSP, Ghichu)
VALUES ('LSP1', 'Điện thoại', 'Các sản phẩm điện thoại di động'),
       ('LSP2', 'Laptop', 'Các sản phẩm máy tính xách tay'),
       ('LSP3', 'Máy tính bảng', 'Các sản phẩm máy tính bảng'),
       ('LSP4', 'Tai nghe', 'Các sản phẩm tai nghe'),
       ('LSP5', 'Phụ kiện di động', 'Các sản phẩm phụ kiện cho thiết bị di động');

INSERT INTO sanpham (MaSP, MaloaiSP, TenSP, Donvitinh, Ghichu)
VALUES ('SP01', 'LSP1', 'Điện thoại A', 'Cái', 'Điện thoại di động cao cấp'),
       ('SP02', 'LSP2', 'Laptop B', 'Cái', 'Laptop mỏng nhẹ, hiệu năng cao'),
       ('SP03', 'LSP3', 'Máy tính bảng C', 'Cái', 'Máy tính bảng chất lượng'),
       ('SP04', 'LSP4', 'Tai nghe X', 'Cái', 'Tai nghe chất lượng cao'),
       ('SP05', 'LSP5', 'Ốp lưng điện thoại', 'Cái', 'Ốp lưng chống sốc');

INSERT INTO phieunhap (soPN, MaNV, MaNCC, Ngaynhap, Ghichu)
VALUES ('PN01', 'NV01', 'NCC01', '2023-07-15', 'Phiếu nhập số 1'),
       ('PN02', 'NV02', 'NCC02', '2023-07-20', 'Phiếu nhập số 2'),
       ('PN03', 'NV03', 'NCC03', '2023-07-18', 'Phiếu nhập số 3'),
       ('PN04', 'NV04', 'NCC04', '2023-07-19', 'Phiếu nhập số 4'),
       ('PN05', 'NV05', 'NCC05', '2023-07-21', 'Phiếu nhập số 5');

INSERT INTO ctphieunhap (MaSP, SoPN, soluong, Gianhap)
VALUES ('SP01', 'PN01', 50, 2000000),
       ('SP02', 'PN02', 30, 15000000),
       ('SP03', 'PN03', 25, 5000000),
       ('SP04', 'PN04', 40, 700000),
       ('SP05', 'PN05', 60, 300000);

INSERT INTO phieuxuat (SoPX, MaNV, MaKH, NgayBan, Ghichu)
VALUES ('PX01', 'NV01', 'KH01', '2023-07-16', 'Phiếu xuất số 1'),
       ('PX02', 'NV02', 'KH02', '2023-07-21', 'Phiếu xuất số 2'),
       ('PX03', 'NV03', 'KH03', '2023-07-18', 'Phiếu xuất số 3'),
       ('PX04', 'NV04', 'KH04', '2023-07-19', 'Phiếu xuất số 4'),
       ('PX05', 'NV05', 'KH05', '2023-07-20', 'Phiếu xuất số 5');

INSERT INTO ctphieuxuat (SoPX, MaSP, SoLuong, GiaBan)
VALUES ('PX01', 'SP01', 20, 2500000),
       ('PX02', 'SP02', 15, 18000000),
       ('PX03', 'SP03', 10, 4000000),
       ('PX04', 'SP04', 35, 900000),
       ('PX05', 'SP05', 50, 500000);
