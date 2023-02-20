select * from ProductCategory 
select * from product


delete ProductCategory 

truncate table ProductCategory 



create table DemoTable
(
  Id int identity primary key,
  Val varchar(200) not null,
  ValDate date
)


insert into DemoTable 
values ('Val1',getdate()+1), ('Val2',getdate()+7), ('Val3',getdate()-3)


create table RelDemoTable
(
  RelId int identity primary key,
  DemoId int references DemoTable(Id) not null,
  RelValue varchar(200) not null
)

insert into RelDemoTable 
values (5, 'Rel1'), (5, 'Rel2'), (6, 'Rel3'), (6, 'Rel4')

select * from RelDemoTable 


select * from DemoTable 
select * from RelDemoTable 

delete demotable 
