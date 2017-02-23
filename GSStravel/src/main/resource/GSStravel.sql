use  GSSTravel
GO
drop table TotalAmount
drop table Detail
drop table Fines
drop table Item
drop table Family
drop table Travel
drop table Employee
drop table Department
drop table Year
drop table Announcement


create table Year
(
  year	int primary key,  
);

create table Announcement
(
  anno_Time		datetime primary key,
  anno_Title	nvarchar(50) not null,
  anno_Content	nvarchar(1000) not null
);

create table Department
(
  dept_No			varchar(10) primary key,
  dept_Name			varchar(10) not null,
);

CREATE TABLE Employee(
	emp_No			int primary key,
	emp_Name		varchar(100) NOT NULL,
	emp_Phone		char(10) NOT NULL,
	emp_ID			char(10) NOT NULL,
	emp_Sex			char(2) NOT NULL,
	emp_Bdate		date NOT NULL,
	emp_Eat			varchar(6) NOT NULL,
	emp_Emg			varchar(100) NOT NULL,
	emp_EmgPhone	char(10) NOT NULL,
	emp_EmgRel		nvarchar(10) NOT NULL,
	emp_HireDate	date NOT NULL,
	emp_Sub			bit	NOT NULL,
	emp_PW			varchar(15) NOT NULL,
	emp_Ben			varchar(100) NOT NULL,
	emp_BenRel		nvarchar(10) NOT NULL,
	dept_NO			varchar(10)  NOT NULL foreign key references Department(dept_No) ,
	emp_Note		nvarchar(500) ,
	emp_Mail		nvarchar(500) NOT NULL,
	emp_Role		bit	not null,
	emp_SubTra      varchar(20)
);

create table Travel(
	tra_No 			varchar(20) PRIMARY KEY,
	tra_Name 		varchar(50) not null,
	tra_Loc 		varchar(10) not null,
	tra_On			date not null,
	tra_Off 		date not null,
	tra_Beg 		datetime not null,
	tra_End 		datetime not null,
	tra_Total 		int not null,
	tra_Max 		int not null,
	tra_Intr 		nvarchar(200) not null,
	tra_Con 		nvarchar(500) not null,
	tra_Atter 		nvarchar(200) not null,
	tra_File 		nvarchar(500)   
);

create table Family(
  emp_No   			int foreign key references Employee(emp_No) not null,      
  fam_No   			int identity(1,1) primary key not null,
  fam_Name  		varchar(100) not null,
  fam_Rel   		char(4) not null,
  fam_Bdate 		date not null,
  fam_Sex   		char(2) not null,
  fam_Eat   		varchar(6) not null, 
  fam_Id   			char(10) not null,
  fam_Phone   		char(10) not null,
  fam_Note  		nvarchar(100),--原本是String,親屬備註
  fam_Ben  			varchar(100)not null,
  fam_BenRel  		nvarchar(10)not null,--原本是String,親屬保險受益人關係
  fam_Car  			bit not null,
  fam_Emg  			varchar(100) not null,
  fam_EmgPhone  	char(10) not null,
  fam_EmgRel  		nvarchar(10) not null,--原本是String,親屬緊急聯絡人關係
  fam_Bady 			bit not null,
  fam_kid 			bit not null,
  fam_Dis 			bit not null,
  fam_Mom 			bit not null
);

create table Item(
  item_No 			int not null,
  tra_No 			varchar(20) not null foreign key references Travel(tra_No),
  item_Name 		varchar(50) not null,
  item_Money 		float 	not null,
  primary key(item_No,tra_No)
);

create table Fines
(
  fine_Dates 		int primary key not null,
  fine_Per 			float not null,
);

create table Detail
(
  det_No 			int identity(1,1) primary key,
  emp_No			int not null foreign key references Employee(emp_NO),
  fam_No 			int foreign key references Family(fam_No),
  tra_No			varchar(20) not null foreign key references Travel(tra_No),
  det_Date 			datetime not null,
  det_CanDate 		datetime,
  det_money			float not null ,
  det_note			varchar(20),
  det_noteMoney		float,
  det_canNote		nvarchar(50)
);

create table TotalAmount(
	tra_No			varchar(20) not null foreign key references Travel(tra_No),
	emp_No			int not null foreign key references Employee(emp_NO),
	TA_money		float not null,
	thisyear        int not null,
	yearsub         bit not null,
	primary key(tra_No,emp_No)		
);

insert into Year(year) values
('2017');
select * from Year;

insert into Announcement(anno_Time,anno_Title,anno_Content) values
('2017/01/01 09:00:00','新增澎湖行程','海上活動 夜釣小管 海上牧場'),
('2017/01/02 10:00:00','新增小琉球行程','浮潛 烏鬼洞 環島'),
('2017/01/03 11:00:00','罰則異動','旅遊19天前通知 罰款扣款比例19%')
select * from Announcement;

insert into Department(dept_No,dept_Name) values
('B01','business'),
('A01','account'),
('I01','informat'),
('K01','King');
select * from Department;

insert into Employee values
(100,'凱蒂貓' , '0912345678','A226874245','女','1974-11-01','葷','喬治','0922345678','父女','1994-01-03',1,'Kitty123','丹尼爾','夫妻','K01',null,'ast20035@gmail.com',1,null),
(101,'丹尼爾' , '0932345678','A169014947','男','1974-05-03','葷','凱蒂貓','0912345678','夫妻','1994-01-03',1,'Daniel123','凱蒂貓','夫妻','K01',null,'bala830712@gmail.com',1,null),
(102,'野原廣志' , '0942345678','B174217577','男','1982-04-11','葷','野原美芽','0952345678','夫妻','1994-01-03',1,'Hiroshi456','野原美芽','夫妻','I01',null,'william830724@gmail.com',0,null),
(103,'test1','0912345678','H231142351','男','1999-01-01','葷','test01','0239543853','母子','2016-10-31',1,'123','test01','母子','I01',null,'jack12777@gmail.com',0,null),
(104,'test2','0912345678','H231142351','男','1999-01-01','葷','test02','0239543853','母子','2017-02-10',1,'123','test02','母子','I01',null,'evacex@gmail.com',0,null);
select * from Employee;

insert into Family (emp_No ,fam_Name ,fam_Rel ,fam_Bdate ,fam_Sex ,fam_Eat ,fam_Id  ,fam_Phone ,fam_Note ,fam_Ben ,fam_BenRel ,fam_Car ,fam_Emg ,fam_EmgPhone ,fam_EmgRel ,fam_Bady ,fam_kid ,fam_Dis ,fam_Mom )values
(100,'喬治','眷屬','1954-06-03','男','素','A191101620','0962345678',null,'瑪莉','夫妻',1,'瑪莉','0903345678','夫妻',0,0,1,0),
(100,'湯瑪士','親友','1974-01-27','男','葷','F172726675','0972345678',null,'提比','父子',1,'提比','0913345678','父子',0,0,0,0),
/*(100,'丹尼爾','眷屬','1974/050','男','葷','A169014947','0932345678',null,'凱蒂貓','夫妻',1,'凱蒂貓','0912345678','夫妻',0,0,0,0),*/
(100,'咪咪','眷屬','1974-11-01','女','葷','A297602173','0982345678',null,'喬治','父女',1,'喬治','0962345678','父女',0,0,0,0),
(102,'野原美芽','眷屬','1988-10-10','女','葷','Q250939543','0992345678',null,'野原廣志','夫妻',1,'野原廣志','0992345678','夫妻',0,0,0,0),
(102,'野原新之助','眷屬','2012-05-05','男','葷','F199131438','0942345678',null,'野原廣志','父子',0,'野原廣志','0992345678','父子',0,1,0,0),
(102,'野原向日葵','眷屬','2016-10-10','女','葷','F218757856','0942345678',null,'野原廣志','父女',0,'野原廣志','0992345678','父女',1,0,0,0);
select * from Family

insert into Travel values
('201608020001','一日遊-新竹苗栗-按摩下午茶','北','2017/8/20','2017/8/20','2017/01/30 09:30:00','2017/05/30 23:59:59','80','5','報名截止後視報名人數補差額(至多補99元)',
'07:30-08:00 集合地點前集合出發,快樂出航 /贈送暖心早餐/
10:00-11:30 卓也小屋..植物染 DIY 來到三義卓也小屋，彷彿走進了古典書畫中的小 橋流水庭園。藍染的學習體驗活動，您可以親自染作獨一無二的個人風格作品。
PS.藍染製作完畢後會現煮染料上色，因此在此空檔會帶著大家到園區走走喔!!
12:30-13:30 午餐時間/客家風味餐/
14:30-16:30 新竹”六星集”台灣第一品牌 按摩界唯一通過 ISO、GSP 認證，將傳統 的按摩產業導入現代化管理，營造出低調奢華的按摩新風格不同於傳統按摩強調療效成 果，六星集則是提升心靈層面的放鬆','十六歲以下的小孩因骨骼仍在成長階段，為避免影響，恕不提供按摩活動','一日遊-新竹苗栗-按摩下午茶'),
('201608020002','一日遊-宜蘭-浮潛單車','東','2017/9/3','2017/9/3','2017/04/18 13:00:00','2017/07/27 15:00:00','60','3','無','07:30-08:00 集合地點前集合出發,快樂出航 /贈送暖心早餐/
10:00-11:30 卓也小屋..植物染 DIY 來到三義卓也小屋，彷彿走進了古典書畫中的小 橋流水庭園。藍染的學習體驗活動，您可以親自染作獨一無二的個人風格作品。 PS.藍染製作完畢後會現煮染料上色，因此在此空檔會帶著大家到園區走走喔!!
12:30-13:30 午餐時間/客家風味餐/
14:30-16:30 新竹”六星集”台灣第一品牌 按摩界唯一通過 ISO、GSP 認證，將傳統 的按摩產業導入現代化管理，營造出低調奢華的按摩新風格不同於傳統按摩強調療效成 果，六星集則是提升心靈層面的放鬆','無','一日遊-宜蘭-浮潛單車'),
('201608020003','二日遊-台南','南','2017/10/29','2017/10/30','2016/12/31 13:00:00','2017/05/30 00:00:00','120','8','報名截止後視報名人數補差額(至多補99元)',
'07:30-08:00 集合地點前集合出發,快樂出航 /贈送暖心早餐/
10:00-11:30 卓也小屋..植物染 DIY 來到三義卓也小屋，彷彿走進了古典書畫中的小 橋流水庭園。藍染的學習體驗活動，您可以親自染作獨一無二的個人風格作品。 PS.藍染製作完畢後會現煮染料上色，因此在此空檔會帶著大家到園區走走喔!!
12:30-13:30 午餐時間/客家風味餐/','無','二日遊-台南'),
('201608020004','一日遊-台南','南','2017/10/29','2017/10/29','2017/08/31 13:00:00','2017/09/30 00:00:00','5','2','報名截止後視報名人數補差額(至多補99元)',
'07:30-08:00 集合地點前集合出發,快樂出航 /贈送暖心早餐/
10:00-11:30 卓也小屋..植物染 DIY 來到三義卓也小屋，彷彿走進了古典書畫中的小 橋流水庭園。藍染的學習體驗活動，您可以親自染作獨一無二的個人風格作品。 PS.藍染製作完畢後會現煮染料上色，因此在此空檔會帶著大家到園區走走喔!!
12:30-13:30 午餐時間/客家風味餐/','無','一日遊-台南'),
('201608020005','二日遊-台北','北','2016/10/29','2016/10/30','2016/08/31 13:00:00','2016/09/30 00:00:00','120','8','報名截止後視報名人數補差額(至多補99元)',
'07:30-08:00 集合地點前集合出發,快樂出航 /贈送暖心早餐/
10:00-11:30 卓也小屋..植物染 DIY 來到三義卓也小屋，彷彿走進了古典書畫中的小 橋流水庭園。藍染的學習體驗活動，您可以親自染作獨一無二的個人風格作品。 PS.藍染製作完畢後會現煮染料上色，因此在此空檔會帶著大家到園區走走喔!!
12:30-13:30 午餐時間/客家風味餐/','無','二日遊-台北');
select * from Travel
 
insert into Item  values
('1','201608020001','團費',2000),
('2','201608020001','保險費',200),
('1','201608020002','團費',3600),
('2','201608020002','保險費',2000),
('1','201608020003','團費',3000),
('2','201608020003','保險費',1000),
('3','201608020003','住宿費(兩人房)',1000),
('4','201608020003','住宿費(四人房)',950),
('5','201608020003','住宿費(通鋪8人)',525),
('6','201608020003','住宿費(加床)',200),
('1','201608020004','團費',500),
('2','201608020004','保險費',200),
('1','201608020005','團費',3000),
('2','201608020005','保險費',1000),
('3','201608020005','住宿費(兩人房)',1000);
select * from Item order by tra_No,item_No

/*insert into Detail (emp_No,fam_No,tra_No,det_Date,det_CanDate,det_money,det_note,det_noteMoney) values
(100,null,'201608020001','2017-02-01 12:30:45','',2200,null,null),
(100,1,'201608020001','2017-02-01 12:30:45','',2200,null,null),
(101,null,'201608020001','2017-02-01 12:31:45','',2200,null,null),
(100,null,'201608020002','2017/04/30 19:50:38','',5600,null,null),
(100,2,'201608020002','2017/04/30 19:50:38','',5600,null,null),
(100,3,'201608020002','2017/04/30 19:50:38','',5600,null,null),
(102,null,'201608020003','2017/01/31 13:00:48','',5500,null,null),
(102,4,'201608020003','2017/01/31 13:00:48','',5000,null,null),
(102,5,'201608020003','2017/01/31 13:00:48','',4100,null,null),
(102,6,'201608020003','2017/01/31 13:00:48','',1000,null,null);
select * from Detail*/

insert into Fines values
(31,10),
(21,20),
(11,30),
(5,40),
(1,50);
select * from Fines 

/*insert into TotalAmount values 
('201608020001',100,4400),
('201608020001',101,2200),
('201608020002',100,18000),
('201608020003',102,15200);
select * from TotalAmount*/