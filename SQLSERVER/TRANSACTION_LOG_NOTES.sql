/*
  For every database, minimum two files are created:
   1. Data File
   2. Log File

   These files are stored on the Disk

   All the tables and their data and the other database objects get stored in the Data File. 
   (.mdf is the extension for the data file)

   All the transactions such as DML, DDL and DCL are logged or recorded on the 
   Log File, also known as Transaction Ldf File.
   (.ldf is the extension for the log file)

   Example:
   You execute a command that inserts certain rows in the table called product
   as below:
     INSERT INTO Product
	 VALUES ('------','-----','-----','-----')

   As soon as this command is executed without any error, this transaction gets logged into
   the transaction log file.

   Transaction Log Files help in maintaining the durability of the databases.



   Transaction Properties:

   1. Atomicity (A): Either each and every part of the transaction takes place successfully or
                      everything is cancelled.

   2. Consitency (C): After the transaction takes place everything should be in a consistent
                      state ot the data integrity must be maintained.

   3. Isolation (I): Every transaction must be kept separate from other transaction and one 
                     transaction should not be allowed to intervene with the other. 
					 Isolation is maintained through different types of locks.

   4. Durability (D): Every transaction that is taking place must have a durable effect i.e.
                      No data should be affected till the next changes are made. Secondly, the 
					  changes that are made by a particular transaction in the data must
					  be recoverable if any disaster happens.
					  Trasaction logs play a very important role in maintaining the durability.

/*