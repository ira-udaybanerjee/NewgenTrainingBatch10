CREATE DATABASE NEWDB

--RECOVERY MODEL IS SET TO FULL SO THAT WE CAN TAKE BOTH FULL AND LOG BACKUPS
ALTER DATABASE NEWDB SET RECOVERY FULL

--FULL BACKUP IS TAKEN
backup database NewDb
to disk = 'C:\databases\backup\NewDb.bak'
with init

USE NEWDB 

--A TRANSACTION IS MADE
CREATE TABLE MyTable
(
MyId int identity primary key,
MyName varchar(100),
Specialization varchar(100)
)


--MORE TRANSACTIONS ARE MADE
INSERT MyTable
VALUES ('Uday Banerjee', 'MS SQL Server')



--LOG BACKUP IS TAKEN
backup log NewDb
to disk = 'C:\databases\backup\NewDb.trn'



--MORE TRANSACTIONS ARE MADE
INSERT MyTable
VALUES ('Mohd Shadab', 'MS SQL BI')



--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--THE DATABASE CRASHES HERE
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--WE NEED TO TAKE A LOG BACKUP, ALSO KNOWN AS TAIL LOG BACKUP

backup log NewDb
to disk = 'C:\databases\backup\NewDbtail.trn'
with continue_after_error



--WE START RESTORING DATABASE FROM THE FULL BACKUP AND WILL
--CONTINUE RESTORING WITH NORECOVERY CLAUSE TILL OUR DATABASE IS FULLY RECEOVERED
restore database NewDb
from disk = 'C:\databases\backup\NewDb.bak'
with norecovery


--RESTORE FROM PREVIOUS LOG BACKUP(S)
restore log NewDb
from disk = 'C:\databases\backup\newdb.trn'
with norecovery


--RESTORE FROM TAIL LOG BACKUP
restore log NewDb
from disk = 'C:\databases\backup\newdbtail.trn'
with norecovery


--RESTORE ENTIRE DATABASE WITH RECOVERY CLAUSE
restore database NewDb
with recovery


use newdb
go 

select * from mytable 