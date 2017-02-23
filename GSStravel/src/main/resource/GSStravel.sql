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
  fam_Note  		nvarchar(100),--�쥻�OString,���ݳƵ�
  fam_Ben  			varchar(100)not null,
  fam_BenRel  		nvarchar(10)not null,--�쥻�OString,���ݫO�I���q�H���Y
  fam_Car  			bit not null,
  fam_Emg  			varchar(100) not null,
  fam_EmgPhone  	char(10) not null,
  fam_EmgRel  		nvarchar(10) not null,--�쥻�OString,���ݺ���p���H���Y
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
('2017/01/01 09:00:00','�s�W����{','���W���� �]���p�� ���W����'),
('2017/01/02 10:00:00','�s�W�p�[�y��{','�B�� �Q���} ���q'),
('2017/01/03 11:00:00','�@�h����','�ȹC19�ѫe�q�� �@�ڦ��ڤ��19%')
select * from Announcement;

insert into Department(dept_No,dept_Name) values
('B01','business'),
('A01','account'),
('I01','informat'),
('K01','King');
select * from Department;

insert into Employee values
(100,'�͸���' , '0912345678','A226874245','�k','1974-11-01','��','��v','0922345678','���k','1994-01-03',1,'Kitty123','������','�ҩd','K01',null,'ast20035@gmail.com',1,null),
(101,'������' , '0932345678','A169014947','�k','1974-05-03','��','�͸���','0912345678','�ҩd','1994-01-03',1,'Daniel123','�͸���','�ҩd','K01',null,'bala830712@gmail.com',1,null),
(102,'����s��' , '0942345678','B174217577','�k','1982-04-11','��','�������','0952345678','�ҩd','1994-01-03',1,'Hiroshi456','�������','�ҩd','I01',null,'william830724@gmail.com',0,null),
(103,'test1','0912345678','H231142351','�k','1999-01-01','��','test01','0239543853','���l','2016-10-31',1,'123','test01','���l','I01',null,'jack12777@gmail.com',0,null),
(104,'test2','0912345678','H231142351','�k','1999-01-01','��','test02','0239543853','���l','2017-02-10',1,'123','test02','���l','I01',null,'evacex@gmail.com',0,null);
select * from Employee;

insert into Family (emp_No ,fam_Name ,fam_Rel ,fam_Bdate ,fam_Sex ,fam_Eat ,fam_Id  ,fam_Phone ,fam_Note ,fam_Ben ,fam_BenRel ,fam_Car ,fam_Emg ,fam_EmgPhone ,fam_EmgRel ,fam_Bady ,fam_kid ,fam_Dis ,fam_Mom )values
(100,'��v','����','1954-06-03','�k','��','A191101620','0962345678',null,'����','�ҩd',1,'����','0903345678','�ҩd',0,0,1,0),
(100,'�����h','�ˤ�','1974-01-27','�k','��','F172726675','0972345678',null,'����','���l',1,'����','0913345678','���l',0,0,0,0),
/*(100,'������','����','1974/050','�k','��','A169014947','0932345678',null,'�͸���','�ҩd',1,'�͸���','0912345678','�ҩd',0,0,0,0),*/
(100,'�}�}','����','1974-11-01','�k','��','A297602173','0982345678',null,'��v','���k',1,'��v','0962345678','���k',0,0,0,0),
(102,'�������','����','1988-10-10','�k','��','Q250939543','0992345678',null,'����s��','�ҩd',1,'����s��','0992345678','�ҩd',0,0,0,0),
(102,'����s���U','����','2012-05-05','�k','��','F199131438','0942345678',null,'����s��','���l',0,'����s��','0992345678','���l',0,1,0,0),
(102,'����V�鸪','����','2016-10-10','�k','��','F218757856','0942345678',null,'����s��','���k',0,'����s��','0992345678','���k',1,0,0,0);
select * from Family

insert into Travel values
('201608020001','�@��C-�s�˭]��-�����U�ȯ�','�_','2017/8/20','2017/8/20','2017/01/30 09:30:00','2017/05/30 23:59:59','80','5','���W�I�������W�H�Ƹɮt�B(�ܦh��99��)',
'07:30-08:00 ���X�a�I�e���X�X�o,�ּ֥X�� /�ذe�x�ߦ��\/
10:00-11:30 ���]�p��..�Ӫ��V DIY �Ө�T�q���]�p�ΡA�ϩ����i�F�j��ѵe�����p ���y���x��C�ŬV���ǲ����笡�ʡA�z�i�H�˦۬V�@�W�@�L�G���ӤH����@�~�C
PS.�ŬV�s�@������|�{�N�V�ƤW��A�]���b�����ɷ|�a�ۤj�a���Ϩ�����!!
12:30-13:30 ���\�ɶ�/�Ȯa�����\/
14:30-16:30 �s�ˡ����P�����x�W�Ĥ@�~�P �����ɰߤ@�q�L ISO�BGSP �{�ҡA�N�ǲ� ���������~�ɤJ�{�N�ƺ޲z�A��y�X�C�հ��ت������s���椣�P��ǲΫ����j�����Ħ� �G�A���P���h�O���ɤ��F�h�������P','�Q�����H�U���p�Ħ]���f���b�������q�A���קK�v�T�A�������ѫ�������','�@��C-�s�˭]��-�����U�ȯ�'),
('201608020002','�@��C-�y��-�B��樮','�F','2017/9/3','2017/9/3','2017/04/18 13:00:00','2017/07/27 15:00:00','60','3','�L','07:30-08:00 ���X�a�I�e���X�X�o,�ּ֥X�� /�ذe�x�ߦ��\/
10:00-11:30 ���]�p��..�Ӫ��V DIY �Ө�T�q���]�p�ΡA�ϩ����i�F�j��ѵe�����p ���y���x��C�ŬV���ǲ����笡�ʡA�z�i�H�˦۬V�@�W�@�L�G���ӤH����@�~�C PS.�ŬV�s�@������|�{�N�V�ƤW��A�]���b�����ɷ|�a�ۤj�a���Ϩ�����!!
12:30-13:30 ���\�ɶ�/�Ȯa�����\/
14:30-16:30 �s�ˡ����P�����x�W�Ĥ@�~�P �����ɰߤ@�q�L ISO�BGSP �{�ҡA�N�ǲ� ���������~�ɤJ�{�N�ƺ޲z�A��y�X�C�հ��ت������s���椣�P��ǲΫ����j�����Ħ� �G�A���P���h�O���ɤ��F�h�������P','�L','�@��C-�y��-�B��樮'),
('201608020003','�G��C-�x�n','�n','2017/10/29','2017/10/30','2016/12/31 13:00:00','2017/05/30 00:00:00','120','8','���W�I�������W�H�Ƹɮt�B(�ܦh��99��)',
'07:30-08:00 ���X�a�I�e���X�X�o,�ּ֥X�� /�ذe�x�ߦ��\/
10:00-11:30 ���]�p��..�Ӫ��V DIY �Ө�T�q���]�p�ΡA�ϩ����i�F�j��ѵe�����p ���y���x��C�ŬV���ǲ����笡�ʡA�z�i�H�˦۬V�@�W�@�L�G���ӤH����@�~�C PS.�ŬV�s�@������|�{�N�V�ƤW��A�]���b�����ɷ|�a�ۤj�a���Ϩ�����!!
12:30-13:30 ���\�ɶ�/�Ȯa�����\/','�L','�G��C-�x�n'),
('201608020004','�@��C-�x�n','�n','2017/10/29','2017/10/29','2017/08/31 13:00:00','2017/09/30 00:00:00','5','2','���W�I�������W�H�Ƹɮt�B(�ܦh��99��)',
'07:30-08:00 ���X�a�I�e���X�X�o,�ּ֥X�� /�ذe�x�ߦ��\/
10:00-11:30 ���]�p��..�Ӫ��V DIY �Ө�T�q���]�p�ΡA�ϩ����i�F�j��ѵe�����p ���y���x��C�ŬV���ǲ����笡�ʡA�z�i�H�˦۬V�@�W�@�L�G���ӤH����@�~�C PS.�ŬV�s�@������|�{�N�V�ƤW��A�]���b�����ɷ|�a�ۤj�a���Ϩ�����!!
12:30-13:30 ���\�ɶ�/�Ȯa�����\/','�L','�@��C-�x�n'),
('201608020005','�G��C-�x�_','�_','2016/10/29','2016/10/30','2016/08/31 13:00:00','2016/09/30 00:00:00','120','8','���W�I�������W�H�Ƹɮt�B(�ܦh��99��)',
'07:30-08:00 ���X�a�I�e���X�X�o,�ּ֥X�� /�ذe�x�ߦ��\/
10:00-11:30 ���]�p��..�Ӫ��V DIY �Ө�T�q���]�p�ΡA�ϩ����i�F�j��ѵe�����p ���y���x��C�ŬV���ǲ����笡�ʡA�z�i�H�˦۬V�@�W�@�L�G���ӤH����@�~�C PS.�ŬV�s�@������|�{�N�V�ƤW��A�]���b�����ɷ|�a�ۤj�a���Ϩ�����!!
12:30-13:30 ���\�ɶ�/�Ȯa�����\/','�L','�G��C-�x�_');
select * from Travel
 
insert into Item  values
('1','201608020001','�ζO',2000),
('2','201608020001','�O�I�O',200),
('1','201608020002','�ζO',3600),
('2','201608020002','�O�I�O',2000),
('1','201608020003','�ζO',3000),
('2','201608020003','�O�I�O',1000),
('3','201608020003','��J�O(��H��)',1000),
('4','201608020003','��J�O(�|�H��)',950),
('5','201608020003','��J�O(�q�Q8�H)',525),
('6','201608020003','��J�O(�[��)',200),
('1','201608020004','�ζO',500),
('2','201608020004','�O�I�O',200),
('1','201608020005','�ζO',3000),
('2','201608020005','�O�I�O',1000),
('3','201608020005','��J�O(��H��)',1000);
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