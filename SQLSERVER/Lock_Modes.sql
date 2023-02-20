--Lock Modes in SQL Server

/*SHARED LOCKS
Shared locks are acquired automatically by SQL Server when data is read.
Shared locks can be held on a table, a page, an index key, or an individual row.
*/

/*EXCLUSIVE LOCKS
SQL Server automatically acquires exclusive locks on data when the data is modified by an INSERT, UPDATE, or DELETE operation. 
*/

/*UPDATE LOCKS
SQL Server uses update locks for any data modification operation that requires a search for the data prior to
the actual modification. Such operations include qualified updates and deletes, as well as inserts into a 
table with a clustered index. 
*/

/*INTENT LOCKS
Intent locks are not really a separate mode of locking; they are a qualifier to the modes previously discussed.
In other words, you can have intent shared locks, intent exclusive locks, and even intent update locks.

Intent Shared, Intent Exclusive, Intent Update

Locking Levels

RID - Row in a table / heap
Key - Row in an index
Page - 8 KB
Extent - 8 Pages
Table - Full Table
Database - Full Database
*/



select * from vw_fullorderdetails 


update customer
set city = 'Delhi'
where CustomerId IN (6, 9, 12, 16)



select * from Customer 
where CustomerId = 1

select * from Customer
where City = 'Saharanpur'


select * from Customer 