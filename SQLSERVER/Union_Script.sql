CREATE TABLE TableA
(
  ID INT,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)


INSERT INTO TableA VALUES(1, 'Pranaya', 'Male','IT')
INSERT INTO TableA VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO TableA VALUES(3, 'Preety', 'Female','HR')
INSERT INTO TableA VALUES(3, 'Preety', 'Female','HR')


CREATE TABLE TableB
(
  ID INT,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)

INSERT INTO TableB VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO TableB VALUES(3, 'Preety', 'Female','HR')
INSERT INTO TableB VALUES(4, 'Anurag', 'Male','IT')

--UNION
SELECT ID, Name, Gender, Department FROM TableA
UNION
SELECT ID, Name, Gender, Department FROM TableB

--UNION ALL
SELECT ID, Name, Gender, Department FROM TableA
UNION ALL
SELECT ID, Name, Gender, Department FROM TableB

--INTERSECT
SELECT ID, Name, Gender, Department FROM TableA
INTERSECT
SELECT ID, Name, Gender, Department FROM TableB

--DIFFERENCE / EXCEPT
SELECT ID, Name, Gender, Department FROM TableA
EXCEPT
SELECT ID, Name, Gender, Department FROM TableB

SELECT ID, Name, Gender, Department FROM TableB
EXCEPT
SELECT ID, Name, Gender, Department FROM TableA