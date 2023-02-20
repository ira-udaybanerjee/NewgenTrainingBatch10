--create parent table
Create table Masters
(
MasterId int primary key,
MasterName varchar(100)
)

--create child table
Create table Transac
(
TransacId int primary key,
MasterId int references Masters(MasterId),
TransacAmount numeric(10,2)
)

--insert data to masters
insert into Masters
values(1, 'M1'),(2,'M2'),(3,'M3')

--insert data to transac
insert into Transac
values (1, 2, 1000), (2,2,1000), (3,1,3000)

--delete all rows from transac (use one of these methods)
truncate table transac

delete transac 


--try to truncate masters
truncate table Masters

--try to delete all rows from masters
delete Masters


--create another table masters2 (without any refering table)
create table Masters2
(
MasterId int identity primary key,
MasterName varchar(100)
)

--insert some data
insert into masters2
values ('M1'),('M2'),('M3'),('M4')

select * from Masters2 

--delete all rows
delete masters2

--insert some data again
insert into masters2
values ('M5'),('M6'),('M7'),('M8')

select * from masters2 

--delete masters2 all rows
delete masters2

--reset identity values
dbcc checkident('masters2',reseed, 0)

--insert some data again
insert into masters2
values ('M9'),('M10'),('M11'),('M12')

select * from Masters2 


--truncate masters2

truncate table masters2

--insert some data again
insert into masters2
values ('M13'),('M14'),('M15'),('M16')


select * from masters2 