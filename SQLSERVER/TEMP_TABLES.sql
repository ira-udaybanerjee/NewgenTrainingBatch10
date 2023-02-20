--MASTER DATABASE
--Master Database is the master of SQL Server 
--If master database file is corrupted, the SQL Server fails 

--MODEL DATABASE
--Model dtabase acts as a model for other databases
--Any property set within the model database is applied on every upcoming database

--MSDB DATABASE
--To schedule tasks in SQL Server, we use the SQL Server Agent Service
--MSDB database is used to store all such scheduled tasks

--TEMPDB
--is used to store temporary tables meant to perform some intermediate / temporary tasks