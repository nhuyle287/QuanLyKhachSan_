/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     5/14/2019 09:46:06 PM                        */
/*==============================================================*/


alter table DICHVU_HOADON
   drop constraint FK_DICHVU_H_DICHVU_HO_DICHVU;

alter table DICHVU_HOADON
   drop constraint FK_DICHVU_H_DICHVU_HO_HOADON;

alter table HOADON
   drop constraint FK_HOADON_HOADON_PH_PHONG;

alter table HOADON
   drop constraint FK_HOADON_LAP_NHANVIEN;

alter table HOADON
   drop constraint FK_HOADON_NHAN_KHACHHAN;

alter table PHIEUDATPHONG
   drop constraint FK_PHIEUDAT_DAT_NHANVIEN;

alter table PHIEUDATPHONG
   drop constraint FK_PHIEUDAT_DAT_TRUOC_KHACHHAN;

alter table PHIEUDATPHONG
   drop constraint FK_PHIEUDAT_PHONG_PHI_PHONG;

alter table PHONG
   drop constraint FK_PHONG_THUOCC_LOAIPHON;

alter table TAIKHOAN
   drop constraint FK_TAIKHOAN_CO_NHANVIEN;

alter table TAIKHOAN
   drop constraint FK_TAIKHOAN_THUOC_LOAITAIK;

drop table DICHVU cascade constraints;

drop index DICHVU_HOADON2_FK;

drop index DICHVU_HOADON_FK;

drop table DICHVU_HOADON cascade constraints;

drop index LAP_FK;

drop index HOADON_PHONG_FK;

drop index NHAN_FK;

drop table HOADON cascade constraints;

drop table KHACHHANG cascade constraints;

drop table LOAIPHONG cascade constraints;

drop table LOAITAIKHOAN cascade constraints;

drop table NHANVIEN cascade constraints;

drop index DAT_FK;

drop index DAT_TRUOC_FK;

drop index PHONG_PHIEUDATPHONG_FK;

drop table PHIEUDATPHONG cascade constraints;

drop index THUOCC_FK;

drop table PHONG cascade constraints;

drop index THUOC_FK;

drop index CO_FK;

drop table TAIKHOAN cascade constraints;

/*==============================================================*/
/* Table: DICHVU                                                */
/*==============================================================*/
create table DICHVU (
   MADICHVU             INTEGER               not null,
   TENDICHVU            NVARCHAR2(50)         not null,
   GIATIEN              NUMBER(15)            not null,
   constraint PK_DICHVU primary key (MADICHVU)
);

/*==============================================================*/
/* Table: DICHVU_HOADON                                         */
/*==============================================================*/
create table DICHVU_HOADON (
   MADICHVU             INTEGER               not null,
   MAHOADON             INTEGER               not null,
   SOLUONG              NUMBER(5),
   THANHTIEN            NUMBER(15),
   constraint PK_DICHVU_HOADON primary key (MADICHVU, MAHOADON)
);

/*==============================================================*/
/* Index: DICHVU_HOADON_FK                                      */
/*==============================================================*/
create index DICHVU_HOADON_FK on DICHVU_HOADON (
   MADICHVU ASC
);

/*==============================================================*/
/* Index: DICHVU_HOADON2_FK                                     */
/*==============================================================*/
create index DICHVU_HOADON2_FK on DICHVU_HOADON (
   MAHOADON ASC
);

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   MAHOADON             INTEGER               not null,
   MAPHONG              INTEGER               not null,
   MAKHACHHANG          INTEGER               not null,
   MANHANVIEN           INTEGER               not null,
   TIENPHONG            NUMBER(15)            not null,
   TIENDICHVU           NUMBER(15)            not null,
   TONGTIEN             NUMBER(15)            not null,
   NGAYDEN              DATE                  not null,
   NGAYDI               DATE                  not null,
   NGAYLAP              DATE                  not null,
   TRANGTHAI            NVARCHAR2(20)         not null,
   constraint PK_HOADON primary key (MAHOADON)
);

/*==============================================================*/
/* Index: NHAN_FK                                               */
/*==============================================================*/
create index NHAN_FK on HOADON (
   MAKHACHHANG ASC
);

/*==============================================================*/
/* Index: HOADON_PHONG_FK                                       */
/*==============================================================*/
create index HOADON_PHONG_FK on HOADON (
   MAPHONG ASC
);

/*==============================================================*/
/* Index: LAP_FK                                                */
/*==============================================================*/
create index LAP_FK on HOADON (
   MANHANVIEN ASC
);

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MAKHACHHANG          INTEGER               not null,
   HOTEN                NVARCHAR2(50)         not null,
   NGAYSINH             DATE                  not null,
   CMND                 NUMBER(20)            not null,
   GIOITINH             NVARCHAR2(5)          not null,
   DIACHI               NVARCHAR2(50)         not null,
   EMAIL                VARCHAR2(50),
   SDT                  CHAR(20)              not null,
   TRANGTHAI            NVARCHAR2(20)         not null,
   constraint PK_KHACHHANG primary key (MAKHACHHANG)
);

/*==============================================================*/
/* Table: LOAIPHONG                                             */
/*==============================================================*/
create table LOAIPHONG (
   MALOAIPHONG          INTEGER               not null,
   TENLOAIPHONG         NVARCHAR2(50)         not null,
   GIAPHONG             NUMBER(15)            not null,
   constraint PK_LOAIPHONG primary key (MALOAIPHONG)
);

/*==============================================================*/
/* Table: LOAITAIKHOAN                                          */
/*==============================================================*/
create table LOAITAIKHOAN (
   MALOAITAIKHOAN       INTEGER               not null,
   TENLOAITAIKHOAN      NVARCHAR2(50)         not null,
   MOTA                 NVARCHAR2(200),
   constraint PK_LOAITAIKHOAN primary key (MALOAITAIKHOAN)
);

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create table NHANVIEN (
   MANHANVIEN           INTEGER               not null,
   HOTEN                NVARCHAR2(50)         not null,
   NGAYSINH             DATE                  not null,
   NGAYVAOLAM           DATE                  not null,
   CMND                 NUMBER(20)            not null,
   SDT                 CHAR(20)              not null,
   MANGUOIQUANLY        INTEGER,
   GIOITINH             NVARCHAR2(5)          not null,
   EMAIL                VARCHAR2(50)          not null,
   DIACHI               NVARCHAR2(50)         not null,
   TRANGTHAI            NVARCHAR2(20)         not null,
   constraint PK_NHANVIEN primary key (MANHANVIEN)
);

/*==============================================================*/
/* Table: PHIEUDATPHONG                                         */
/*==============================================================*/
create table PHIEUDATPHONG (
   MAPHIEU              INTEGER               not null,
   MANHANVIEN           INTEGER               not null,
   MAKHACHHANG          INTEGER               not null,
   MAPHONG              INTEGER               not null,
   NGAYDAT              DATE                  not null,
   NGAYDEN              DATE                  not null,
   NGAYDI               DATE                  not null,
   constraint PK_PHIEUDATPHONG primary key (MAPHIEU)
);

/*==============================================================*/
/* Index: PHONG_PHIEUDATPHONG_FK                                */
/*==============================================================*/
create index PHONG_PHIEUDATPHONG_FK on PHIEUDATPHONG (
   MAPHONG ASC
);

/*==============================================================*/
/* Index: DAT_TRUOC_FK                                          */
/*==============================================================*/
create index DAT_TRUOC_FK on PHIEUDATPHONG (
   MAKHACHHANG ASC
);

/*==============================================================*/
/* Index: DAT_FK                                                */
/*==============================================================*/
create index DAT_FK on PHIEUDATPHONG (
   MANHANVIEN ASC
);

/*==============================================================*/
/* Table: PHONG                                                 */
/*==============================================================*/
create table PHONG (
   MAPHONG              INTEGER               not null,
   MALOAIPHONG          INTEGER               not null,
   TRANGTHAI            NVARCHAR2(20),
   constraint PK_PHONG primary key (MAPHONG)
);

/*==============================================================*/
/* Index: THUOCC_FK                                             */
/*==============================================================*/
create index THUOCC_FK on PHONG (
   MALOAIPHONG ASC
);

/*==============================================================*/
/* Table: TAIKHOAN                                              */
/*==============================================================*/
create table TAIKHOAN (
   MATAIKHOAN           INTEGER               not null,
   MANHANVIEN           INTEGER               not null,
   MALOAITAIKHOAN       INTEGER               not null,
   TENTAIKHOAN          CHAR(50)              not null,
   MATKHAU              CHAR(50)              not null,
   constraint PK_TAIKHOAN primary key (MATAIKHOAN)
);

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on TAIKHOAN (
   MANHANVIEN ASC
);

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on TAIKHOAN (
   MALOAITAIKHOAN ASC
);

alter table DICHVU_HOADON
   add constraint FK_DICHVU_H_DICHVU_HO_DICHVU foreign key (MADICHVU)
      references DICHVU (MADICHVU);

alter table DICHVU_HOADON
   add constraint FK_DICHVU_H_DICHVU_HO_HOADON foreign key (MAHOADON)
      references HOADON (MAHOADON);

alter table HOADON
   add constraint FK_HOADON_HOADON_PH_PHONG foreign key (MAPHONG)
      references PHONG (MAPHONG);

alter table HOADON
   add constraint FK_HOADON_LAP_NHANVIEN foreign key (MANHANVIEN)
      references NHANVIEN (MANHANVIEN);

alter table HOADON
   add constraint FK_HOADON_NHAN_KHACHHAN foreign key (MAKHACHHANG)
      references KHACHHANG (MAKHACHHANG);

alter table PHIEUDATPHONG
   add constraint FK_PHIEUDAT_DAT_NHANVIEN foreign key (MANHANVIEN)
      references NHANVIEN (MANHANVIEN);

alter table PHIEUDATPHONG
   add constraint FK_PHIEUDAT_DAT_TRUOC_KHACHHAN foreign key (MAKHACHHANG)
      references KHACHHANG (MAKHACHHANG);

alter table PHIEUDATPHONG
   add constraint FK_PHIEUDAT_PHONG_PHI_PHONG foreign key (MAPHONG)
      references PHONG (MAPHONG);

alter table PHONG
   add constraint FK_PHONG_THUOCC_LOAIPHON foreign key (MALOAIPHONG)
      references LOAIPHONG (MALOAIPHONG);

alter table TAIKHOAN
   add constraint FK_TAIKHOAN_CO_NHANVIEN foreign key (MANHANVIEN)
      references NHANVIEN (MANHANVIEN);

alter table TAIKHOAN
   add constraint FK_TAIKHOAN_THUOC_LOAITAIK foreign key (MALOAITAIKHOAN)
      references LOAITAIKHOAN (MALOAITAIKHOAN);

--Cac procedure

create or replace PROCEDURE PHONGTRONG_THUEPHONGA(
  NGAYDI1 HOADON.NGAYDI%TYPE,
  MALOAIPHONG1 LOAIPHONG.MALOAIPHONG%TYPE,
  CONTRO1 OUT SYS_REFCURSOR,
  CONTRO2 OUT SYS_REFCURSOR)
AS
                                                                   
BEGIN
  OPEN CONTRO1 FOR
  SELECT MAPHONG FROM PHONG WHERE TRANGTHAI='K' AND MALOAIPHONG=MALOAIPHONG1 AND MAPHONG NOT IN(SELECT MAPHONG
                                                                      FROM PHIEUDATPHONG);
  OPEN CONTRO2 FOR
  SELECT P.MAPHONG FROM PHONG P JOIN PHIEUDATPHONG PDP ON P.MAPHONG=PDP.MAPHONG
  WHERE TRANGTHAI='K' AND P.MALOAIPHONG=MALOAIPHONG1 AND NGAYDI1<ALL(SELECT NGAYDEN
                                                                      FROM PHIEUDATPHONG PDP1
                                                                      WHERE P.MAPHONG=PDP1.MAPHONG);
END;

--Sequence
CREATE SEQUENCE TANGDICHVU INCREMENT BY 1 START WITH 1;
CREATE OR REPLACE TRIGGER TRIG_DICHVU
BEFORE INSERT ON DICHVU
FOR EACH ROW
BEGIN
    :NEW.MADICHVU := TANGDICHVU.NEXTVAL;
END;

--Dich vu
CREATE OR REPLACE PROCEDURE PROC_THEMDICHVU(
  TENDICHVU1 DICHVU.TENDICHVU%TYPE,
  GIATIEN1 DICHVU.GIATIEN%TYPE)
AS
BEGIN
  INSERT INTO DICHVU(TENDICHVU,GIATIEN,TRANGTHAI) VALUES(TENDICHVU1,GIATIEN1,'Cรณ');
  COMMIT;
END;

CREATE OR REPLACE PROCEDURE PROC_XEMDICHVU(
  CONTRO OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN CONTRO FOR
  SELECT MADICHVU,TENDICHVU,GIATIEN,TRANGTHAI FROM DICHVU;
END;

CREATE OR REPLACE PROCEDURE PROC_SUADICHVU(
  TENDICHVU1 DICHVU.TENDICHVU%TYPE,
  GIATIEN1 DICHVU.GIATIEN%TYPE,
  TRANGTHAI1 DICHVU.TRANGTHAI%TYPE,
  MADICHVU1 DICHVU.MADICHVU%TYPE)
AS
BEGIN
  UPDATE DICHVU SET TENDICHVU=TENDICHVU1,GIATIEN=GIATIEN1,TRANGTHAI=TRANGTHAI1 WHERE MADICHVU=MADICHVU1;
  COMMIT;
END;

--Dat phong:
create or replace PROCEDURE THUEPHONG(HOTEN1 KHACHHANG.HOTEN%TYPE,NGAYSINH1 KHACHHANG.NGAYSINH%TYPE,CMND1 KHACHHANG.CMND%TYPE,GIOITINH1 KHACHHANG.GIOITINH%TYPE,DIACHI1 KHACHHANG.DIACHI%TYPE,EMAIL1 KHACHHANG.EMAIL%TYPE,SDT1 KHACHHANG.SDT%TYPE,MAPHONG1 PHONG.MAPHONG%TYPE,MANHANVIEN1 NHANVIEN.MANHANVIEN%TYPE,NGAYDEN1 HOADON.NGAYDEN%TYPE,NGAYDI1 HOADON.NGAYDI%TYPE,NGAYLAP1 HOADON.NGAYLAP%TYPE,MALOAIPHONG1 LOAIPHONG.MALOAIPHONG%TYPE)
AS
  COUNTT INT;
  MAKHACHHANG1 KHACHHANG.MAKHACHHANG%TYPE;
BEGIN
  SELECT COUNT(*) INTO COUNTT FROM KHACHHANG WHERE CMND=CMND1;
  IF(COUNTT=0) THEN
  INSERT INTO KHACHHANG(HOTEN,NGAYSINH,CMND,GIOITINH,TRANGTHAI,DIACHI,EMAIL,SDT) VALUES(HOTEN1,NGAYSINH1,CMND1,GIOITINH1,'T',DIACHI1,EMAIL1,SDT1);
  SELECT MAKHACHHANG INTO MAKHACHHANG1 FROM KHACHHANG WHERE CMND=CMND1;
  INSERT INTO HOADON(MAKHACHHANG,MAPHONG,MANHANVIEN,NGAYDEN,NGAYDI,NGAYLAP,TRANGTHAI) VALUES (MAKHACHHANG1,MAPHONG1,MANHANVIEN1,NGAYDEN1,NGAYDI1,NGAYLAP1,'C');
  END IF;
  IF(COUNTT>0) THEN
  UPDATE KHACHHANG SET TRANGTHAI='THUE' WHERE CMND=CMND1;
  SELECT MAKHACHHANG INTO MAKHACHHANG1 FROM KHACHHANG WHERE CMND=CMND1;
  INSERT INTO HOADON(MAKHACHHANG,MAPHONG,MANHANVIEN,NGAYDEN,NGAYDI,NGAYLAP,TRANGTHAI) VALUES (MAKHACHHANG1,MAPHONG1,MANHANVIEN1,NGAYDEN1,NGAYDI1,NGAYLAP1,'C');
  END IF;
  UPDATE PHONG SET TRANGTHAI='C' WHERE MAPHONG=MAPHONG1;
  COMMIT;
END;

--Tim kiem
CREATE OR REPLACE PROCEDURE PROC_XEMNHANVIENTIMKIEM
(
CMND1 NHANVIEN.CMND%TYPE,
SODT1 NHANVIEN.SODT%TYPE,
DIACHI1 NHANVIEN.DIACHI%TYPE,
EMAIL1 NHANVIEN.EMAIL%TYPE,
TRANGTHAI1 NHANVIEN.TRANGTHAI%TYPE,
GIOITINH1 NHANVIEN.GIOITINH%TYPE,
HOTEN1 NHANVIEN.HOTEN%TYPE,
CONTRO OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN CONTRO FOR
    SELECT * FROM NHANVIEN
        WHERE (CMND LIKE '%'+CMND1+'%') OR (SODT LIKE '%SODT1%') OR  (DIACHI LIKE '%DIACHI1%') OR (EMAIL LIKE '%EMAIL1%') 
                       OR (TRANGTHAI LIKE '%TRANGTHAI1%') OR (GIOITINH LIKE '%GIOITINH1%') OR (HOTEN LIKE '%HOTEN1%');
END;

select phong.maphong,tenloaiphong,phong.trangthai,loaiphong.giaphong,khachhang.hoten, khachhang.cmnd,nhanvien.hoten,nhanvien.cmnd,
dichvu.tendichvu,dichvu_hoadon.soluong,thanhtien
from ((((((phong left join loaiphong on phong.maloaiphong=loaiphong.maloaiphong)left join hoadon on phong.maphong=hoadon.maphong) left join khachhang on hoadon.makhachhang=khachhang.makhachhang) 
left join nhanvien on hoadon.manhanvien=nhanvien.manhanvien) left join dichvu_hoadon on hoadon.mahoadon=dichvu_hoadon.mahoadon)
left join dichvu on dichvu_hoadon.madichvu=dichvu.madichvu)
order by phong.maphong;

CREATE OR REPLACE PROCEDURE ThongTinLuuTru(
  CONTRO OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN CONTRO FOR
  select phong.maphong,tenloaiphong,phong.trangthai,loaiphong.giaphong,khachhang.hoten as TEN_KH, khachhang.cmnd as CMND_KH,hoadon.ngayden, hoadon.ngaydi,nhanvien.hoten as TEN_NV,nhanvien.cmnd as CMND_NV
from ((((((phong left join loaiphong on phong.maloaiphong=loaiphong.maloaiphong)left join hoadon on phong.maphong=hoadon.maphong) left join khachhang on hoadon.makhachhang=khachhang.makhachhang) 
left join nhanvien on hoadon.manhanvien=nhanvien.manhanvien)))
order by phong.maphong;
END;

---TIm kiem
CREATE OR REPLACE PROCEDURE PROC_XEMKHACHHANGTIMKIEM
(
MAKHACHHANG1 KHACHHANG.HOTEN%TYPE,
HOTEN1 KHACHHANG.HOTEN%TYPE,
NGAYSINH1 KHACHHANG.HOTEN%TYPE,
CMND1 KHACHHANG.HOTEN%TYPE,
GIOITINH1 KHACHHANG.GIOITINH%TYPE,
DIACHI1 KHACHHANG.DIACHI%TYPE,
EMAIL1 KHACHHANG.EMAIL%TYPE,
SDT1 KHACHHANG.HOTEN%TYPE,
TRANGTHAI1 KHACHHANG.TRANGTHAI%TYPE,
CONTRO OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN CONTRO FOR
    SELECT * FROM KHACHHANG
        WHERE MAKHACHHANG LIKE ('%'||(MAKHACHHANG1)||'%'), HOTEN LIKE ('%'||(HOTEN1)||'%'),
        NGAYSINH LIKE ('%'||(NGAYSINH1)||'%'),CMND LIKE ('%'||(CMND1)||'%'),GIOITINH LIKE ('%'||(GIOITINH1)||'%'),
            DIACHI LIKE ('%'||(DIACHI1)||'%'),EMAIL LIKE ('%'||(EMAIL1)||'%'),
            SDT LIKE ('%'||(SDT1)||'%'),TRANGTHAI LIKE('%'||(TRANGTHAI1)||'%');
END;


CREATE OR REPLACE PROCEDURE PROC_XEMDICHVUTIMKIEM
(
TENDICHVU1 DICHVU.TENDICHVU%TYPE,
GIATIEN1 DICHVU.TENDICHVU%TYPE,
TRANGTHAI1 DICHVU.TRANGTHAI%TYPE,
CONTRO OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN CONTRO FOR
    SELECT * FROM DICHVU
        WHERE TENDICHVU LIKE ('%'||(TENDICHVU1)||'%') OR GIATIEN LIKE ('%'||(GIATIEN1)||'%') OR TRANGTHAI LIKE ('%'||(TRANGTHAI1)||'%');
END;

---PRocedure Xuat dich vu
CREATE OR REPLACE PROCEDURE Pro_XuatDichVu(in_maphong phong.maphong%TYPE,CONTRO OUT SYS_REFCURSOR)
AS
BEGIN
OPEN CONTRO FOR
SELECT TENDICHVU, SOLUONG, THANHTIEN
FROM ((DICHVU_HOADON INNER JOIN DICHVU ON DICHVU_HOADON.MADICHVU=DICHVU.MADICHVU)
INNER JOIN HOADON ON DICHVU_HOADON.MAHOADON=HOADON.MAHOADON) 
WHERE in_maphong=maphong;
END;

--Procedure xem danh sach dat phong cua 1 phong cu the
--CREATE OR REPLACE PROCEDURE PRO_PRINT_THONGTINDATPHONG(