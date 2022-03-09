create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(100)Null, 
Password nvarchar(100)Null,
Email nvarchar(100)Null,
Name nvarchar(100)Null,
Usertype nvarchar(50) default 'User'
)

CREATE TABLE tblCitys(
	[CityID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](500) NULL,
)

create table tblHalls
(
HID int identity(1,1) primary key ,
HName   nvarchar(MAX),
HPrice money,
HCityID int,
Number int,
Place nvarchar(MAX),
NumberPhone varchar(20),

Constraint [FK_tblHalls_ToTable] FOREIGN KEY ([HCityID]) REFERENCES [tblCitys] ([CityID]),

)

CREATE TABLE tblHallImages(
	[HIMGID] [int] IDENTITY(1,1) NOT NULL,
	[HID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL,
	Constraint [FK_tblHallImages_ToTable] FOREIGN KEY ([HID]) REFERENCES [tblHalls] ([HID])
	)



	create table tblDate
(
DateID int identity(1,1) primary key,
UserID int,

DateBook date,

CONSTRAINT [FK_tblDate_ToUser] FOREIGN KEY ([UserID]) REFERENCES [tblUsers]([UID])

)

CREATE TABLE tblOrder(
	[OrderID] [int] IDENTITY(1,1) NOT NULL primary key,
	[UserID] [int] NULL,
	[HID] [int] NULL,
	[Hall] [nvarchar](max) NULL,
	[EMail] [nvarchar](max) NULL,
	[DateBooking] [date] NULL,
	Constraint [FK_tblOrder_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([uid])

)


create table tblDateBook
(
DateBookID int identity(1,1) primary key,
UserID int NULL,
HallID int NULL,
UserName nvarchar(max) NULL,
HallName nvarchar(max) NULL,
EMail nvarchar(max) NULL,
DateBook datetime,

CONSTRAINT [FK_tblDateBook_ToUser] FOREIGN KEY ([UserID]) REFERENCES [tblUsers]([UID]),
CONSTRAINT [FK_tblDateBook_ToHall] FOREIGN KEY ([HallID]) REFERENCES [tblHalls]([HID])

)













CREATE PROCEDURE sp_InsertHalls(
@HName nvarchar(MAX),
@HPrice money,
@HCityID int,
@Number int,
@Place nvarchar(MAX),
@NumberPhone varchar(20)
)
AS

insert into tblHalls values(@HName,@HPrice,@HCityID,@Number,@Place,@NumberPhone) 
select SCOPE_IDENTITY()
Return 0



create procedure procBindAllHalls
AS
select A.*,B.*,A.HPrice,B.Name as ImageName from tblHalls A

cross apply(
select top 1 * from tblHallImages B where B.HID= A.HID order by B.HID desc
)B
order by A.HID desc

Return 0


CREATE PROCEDURE SP_BindHallDetails
(
@HID int
)
AS
SELECT * FROM tblHalls where HID = @HID


create PROCEDURE SP_BindHallImages
(
@HID int
)
AS
SELECT * FROM tblHallImages where HID = @HID





create procedure [dbo].[procBindAllHallsEbb]
AS
select A.*,B.*,A.HPrice,B.Name as ImageName from tblHalls A

inner join tblCitys as t2 on t2.CityID=A.HCityID
cross apply(
select top 1 * from tblHallImages B where B.HID= A.HID order by B.HID desc
)B where t2.Name='Ибб' 
order by A.HID desc

Return 0

create procedure [dbo].[procBindAllHallsTaz]
AS
select A.*,B.*,A.HPrice,B.Name as ImageName from tblHalls A

inner join tblCitys as t2 on t2.CityID=A.HCityID
cross apply(
select top 1 * from tblHallImages B where B.HID= A.HID order by B.HID desc
)B where t2.Name='Таиз' 
order by A.HID desc

Return 0

create procedure [dbo].[procBindAllHallsSana]
AS
select A.*,B.*,A.HPrice,B.Name as ImageName from tblHalls A

inner join tblCitys as t2 on t2.CityID=A.HCityID
cross apply(
select top 1 * from tblHallImages B where B.HID= A.HID order by B.HID desc
)B where t2.Name='Сана' 
order by A.HID desc

Return 0








CREATE PROCEDURE SP_InsertOrder
(
@UserID int,
@HID [int] NULL,
@Hall [nvarchar](max) NULL,
@Email nvarchar(MAX),
@DateBooking datetime
)
AS
INSERT INTO tblOrder VALUES(@UserID,@HID ,@Hall,@Email,@DateBooking)
SELECT SCOPE_IDENTITY()



CREATE PROCEDURE SP_getUserOrderItems
(
@HID int,
@UserID int
)
AS
SELECT * FROM tblDateBook WHERE HallID = @HID AND UserID = @UserID


create PROCEDURE SP_BindUserOrders
(
@UserID int
)
AS
SELECT * FROM tblDateBook D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblHallImages E WHERE E.HID = D.HallID) Name WHERE D.UserID = @UserID

