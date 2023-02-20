CREATE TABLE MyDemoTable
(
DemoId int identity,
DemoValue varchar(20),
DemoDate date
)

INSERT INTO MyDemoTable 
Values ('Hello', getdate())
GO 10000

SELECT * FROM MyDemoTable 
WHERE DemoId = 9654

CREATE TABLE MyDemoTable2
(
DemoId int,
DemoValue varchar(20),
DemoDate date
)

INSERT INTO MyDemoTable2 
VALUES (12, 'Hello 12', '2023-01-01')


INSERT INTO MyDemoTable2 
VALUES (1, 'Hello 1', '2023-01-08')

INSERT INTO MyDemoTable2 
VALUES (3, 'Hello 3', '2023-01-07')


INSERT INTO MyDemoTable2 
VALUES (2, 'Hello 2', '2023-01-11')


SELECT DemoId, DemoValue FROM MyDemoTable2 
WHERE DemoId = 3

CREATE CLUSTERED INDEX clidx_DemoId
ON MyDemoTable2 (DemoId)

SELECT * FROM MyDemoTable2 

INSERT INTO MyDemoTable2 
VALUES (8, 'Hello 8', '2023-01-14')

SELECT DemoId, DemoValue
FROM MyDemoTable2 
WHERE DemoValue = 'AMB'

CREATE NONCLUSTERED INDEX idx_DemoDate
ON MyDemoTable2(DemoDate)
INCLUDE (DemoValue)

CREATE NONCLUSTERED INDEX idx_DemoValue
ON MyDemoTable2(DemoValue)
INCLUDE (DemoDate)

DROP INDEX idx_DemoValue
ON MyDemoTable2