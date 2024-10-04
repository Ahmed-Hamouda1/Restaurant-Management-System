create database restaurant
use restaurant
CREATE TABLE Customer (
  customer_id varchar(10) PRIMARY KEY ,
  Fname VARCHAR(10) not null,
  Lname VARCHAR(10) not null,
  phone_number VARCHAR(20) not null
)
--====================================================
CREATE TABLE Tablee (
  table_id varchar(10) PRIMARY KEY ,
  Locationn varchar(50),
  capacity INT,
  is_reserved BIT not null,
  Order_id int,
  customer_id varchar(10)
)
--====================================================
CREATE TABLE Orderr (
  order_id int IDENTITY(1,1) PRIMARY KEY ,
  order_date DATE not null,
  Prepared TINYINT not null,
  total_Bill DECIMAL(10,3) not  null,
  customer_id varchar(10),
  meal_id varchar(10)
)
--====================================================
CREATE TABLE Delivery (
  delivery_id varchar(10) PRIMARY KEY ,
  Fname VARCHAR(10) not null,
  Lname VARCHAR(10),
  Delivery_area varchar(30) not null,
  ready BIT not null,
  order_id int
)
--====================================================

CREATE TABLE Delivery_Phone_num (
  phone_number varchar(20)  not null,
  delivery_id varchar(10) foreign key references Delivery(delivery_id) not null
)

--====================================================

CREATE TABLE Chef (
  Chef_id varchar(10) PRIMARY KEY ,
  Fname VARCHAR(10) not null,
  Lname VARCHAR(10),
  salary DECIMAL(10,3) not null,
  phone_number varchar(20)
)

--====================================================

CREATE TABLE meal (
  meal_id varchar(10) PRIMARY KEY ,
  meal_name varchar(30) unique not null,
  price INT not null,
  Chef_id varchar(10)
)

--====================================================

CREATE TABLE Waiter (
  Waiter_id varchar(10) PRIMARY KEY ,
  Fname VARCHAR(10) not null,
  Lname VARCHAR(10),
  salary DECIMAL(10,3) not null,
  phone_number varchar(20) ,
  table_id varchar(10),
  order_id int
)

--====================================================
--created this table just to remove it 
CREATE TABLE employee (
  emp_id varchar(10) PRIMARY KEY not null,
  Namee VARCHAR(10) not null,
  salary DECIMAL(10,3) not null,
)
drop table employee
--====================================================
alter table orderr alter column Prepared BIT;--modify data type for this column (nested alter)
alter table Tablee add constraint is_reserved DEFAULT '0' FOR is_reserved;--ADD CONSTRAINT (DEFAULT) for this column
alter table orderr add constraint Prepared DEFAULT '0' FOR Prepared;--ADD CONSTRAINT (DEFAULT) for this column
alter table Delivery add constraint ready DEFAULT '0' FOR ready;--ADD CONSTRAINT (DEFAULT) for this column
 --=========================================================
alter table tablee   add foreign key (customer_id) references customer(customer_id); 
alter table tablee   add foreign key (order_id)    references orderr(order_id); 
alter table Orderr   add foreign key (customer_id) references customer(customer_id)
alter table Orderr   add foreign key (meal_id)     references meal(meal_id)
alter table Delivery add foreign key (order_id)    references orderr(order_id)
alter table meal     add foreign key (chef_id)     references chef(chef_id)
alter table waiter   add foreign key (table_id)    references tablee(table_id)
alter table waiter   add foreign key (order_id)    references orderr(order_id)
--===========================================================
 
 insert into Customer
 values('1','ahmed','hamouda','01158202830'),('2','hosam','hamouda','01058509830'),('3','habiba','mostafa','01525688792')
 --===========================================================

 insert into Chef
 values('101','mohamed','kareem','4500.50','01258973050'),('102','mahmoud','hazem','4000','01587935015'),('103','ali','atef','6000.100','01123698750')
--===========================================================

 insert into meal
 values('1','pizza',150,'101'),('2','Hamburger',100,'102'),('3','ric',220,'103')
--===========================================================

 insert into Orderr
 values('1-12-2023','1',250,'1','1'),('2-12-2023','1',550,'2','2')
 --===========================================================

 insert into Delivery
 values('1','yousef','tarek','maadi_st9','1','4'),('2','Khiry','eslam','Giza','1','9')
--===========================================================

 insert into Delivery_Phone_num
 values('01254879012','1'),('01556982250','2')
--===========================================================

 insert into Tablee
 values('2','floor_2',4,1,'4','1'),('1','floor_1',5,0,null,null)
 --===========================================================

 insert into Waiter
 values('1','khalid','said',3000,'01254845701','1','13'),('2','hassan','gamal',2900,'01112589632','2',4)
--===========================================================


update Delivery
set Delivery_area='madenty'
where Delivery_area='Giza';

UPDATE Chef
SET salary = 5600
WHERE Chef_id = 102;

delete from meal
where meal_name='Sushi'
























--TRUNCATE TABLE Customer

