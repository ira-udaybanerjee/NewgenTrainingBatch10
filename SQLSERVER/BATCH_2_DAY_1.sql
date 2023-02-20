--Employee
CREATE TABLE Employee
(
EmployeeId int primary key,
EmployeeName varchar(50),
Department varchar(50),
Category char(1),
DateOfJoining date,
MobileNo varchar(10)
)

INSERT INTO Employee
VALUES(1, 'Uday Banerjee', 'IT', 'A', '2021-11-22', '9634262077')

INSERT INTO Employee
VALUES(2, 'Aditi Banerjee', 'Training', 'A', '2021-11-22', '9837998379')


SELECT * FROM Employee 

UPDATE Employee
SET MobileNo = '9837998379'
WHERE EmployeeId = 2


UPDATE Employee
SET DateOfJoining = '2021-11-29'
WHERE EmployeeId = 2

DELETE Employee
WHERE EmployeeId = 2


INSERT INTO Employee
VALUES( 2, 'Aditi Banerjee', 'TRAINING', 'A', '2021-11-29', '9837998379')


--PROJECTION

SELECT EmployeeId, EmployeeName, Department
FROM Employee 


UPDATE Employee
SET Category = 'B'
WHERE EmployeeId = 2 



--SELECTION

SELECT * FROM Employee
WHERE Category = 'A'

SELECT EmployeeId, EmployeeName, Department FROM Employee
WHERE Category = 'A'


--
INSERT INTO Employee
VALUES (3, 'Aman', 'IT', 'B', '2021-11-21','9897998979')


SELECT * FROM Employee 

SELECT * FROM Employee 
WHERE Department = 'IT' and Category='B'


SELECT * FROM Employee 
WHERE Department = 'IT' or Category='B'


SELECT EmployeeId, EmployeeName, Department
FROM Employee 
WHERE MobileNo = '9634262077'


--Sorting the data
SELECT * FROM Employee
ORDER BY EmployeeName DESC

SELECT * FROM Employee
ORDER BY DateOfJoining

--Sorting on multiple columns

SELECT * FROM Employee
ORDER BY Department, Category


INSERT INTO Employee
VALUES (4, 'Varun', 'MKT','C','2021-11-01','7417806113')

SELECT * FROM Employee 

SELECT * FROM Employee
WHERE Category = 'A' OR Category = 'B'

--Alternate Employee

SELECT * FROM Employee
WHERE Category IN ('A', 'B')


INSERT INTO Employee
VALUES (5, 'Yogesh', 'HR', 'B', '2021-11-11', NULL)

--TREATMENT OF NULL VALUES
SELECT * FROM Employee 
WHERE MobileNo IS NULL 

SELECT * FROM Employee 
WHERE MobileNo IS NOT NULL 

--NOT EQUAL TO
SELECT * FROM Employee
WHERE Category <> 'B'


SELECT * FROM Employee
WHERE DateOfJoining > '2021-11-20' AND Department = 'IT' 