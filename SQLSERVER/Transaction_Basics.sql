--DQL (Data Query Language) - SELECT - NOT A TRANSACTION

--TRANSACTIONS
--------------

--DML - Data Manipulation Language (INSERT, UPDATE, DELETE, TRUNCATE)

--DDL - Data Definition Language (CREATE, ALTER, DROP)

--DCL - Data Control Language (GRANT, REVOKE, DENY)


-- A  C  I  D Properties
--------------------------

/* A (Atomicity) --Either every part of the transaction should be
    executed or nothing is executed at all */
-- C (Consistency) --All rules of related data should be maintained
-- I (Isolation) -- Maintained using LOCKS
-- D (Durability) -- Transaction LOGS Maintain Durability


--Run an INSERT/UPDATE/DELETE Statement

UPDATE Customer
SET City = 'Delhi'
WHERE CustomerId = 3

SELECT * FROM Customer 

--As soon as you execute a DML, DDL, DCL statement,
--The changes are registered in the log file 

--whatever changes you can see are made in the buffer
--this buffer gets cleared periodically that saves the data to the disk
--(Data File)



--Scenario

--Database Backup 
--To restore the data in case of a disaster
--Full backup (Example: Every Friday 9:00 PM)
--My database works as a backend to a very busy application 
--which works 24 x 7
--My database crashes on Monday, at 11:45 AM

--The transactions that took place between last full bakcup 
--and the crash time shall be recorded in a LOG FILE

--To recover the data, if log file is backed up and restored, all the data from
--Last Backup till Crash time can be restored
