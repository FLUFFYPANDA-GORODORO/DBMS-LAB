/*
SQL Queries:
a. Design and Develop SQL DDL statements which demonstrate the use of SQL objects such
as Table, View, Index, Sequence, Synonym, different constraints etc.
b. Write at least 10 SQL queries on the suitable database application using SQL DML
statements.
c.
d. Note: Instructor will design the queries which demonstrate the use of concepts like Insert, Select,
Update, Delete with operators, functions, and set operator etc.

*/

create DATABASE IF NOT EXISTS DB;

use DB;

CREATE TABLE IF NOT EXISTS student(Roll_no int, First_Name varchar(200), Last_Name VARCHAR(200), Dept VARCHAR(20));

INSERT INTO student VALUES(201, "Goro", "Doro", "CSE");
INSERT INTO student VALUES(202, "Sumedh", "Sangle", "CE");
INSERT INTO student VALUES(203, "Dom", "Karry", "CSE");
INSERT INTO student VALUES(204, "Nandhu", "Pillai", "CE");

SELECT * FROM student;

/*
+---------+------------+-----------+------+
| Roll_no | First_Name | Last_Name | Dept |
+---------+------------+-----------+------+
|     201 | Goro       | Doro      | CSE  |
|     202 | Sumedh     | Sangle    | CE   |
|     203 | Dom        | Karry     | CSE  |
|     204 | Nandhu     | Pillai    | CE   |
+---------+------------+-----------+------+
*/

UPDATE student SET First_Name="Sum"
WHERE Roll_no=202;

UPDATE SET Last_Name="Sang"
WHERE Roll_no=202;

/*
+---------+------------+-----------+------+
| Roll_no | First_Name | Last_Name | Dept |
+---------+------------+-----------+------+
|     201 | Goro       | Doro      | CSE  |
|     202 | Sum        | Sang      | CE   |
|     203 | Dom        | Karry     | CSE  |
|     204 | Nandhu     | Pillai    | CE   |
+---------+------------+-----------+------+
*/

CREATE TABLE testTable(testVal int, testVal2 varchar(20));

INSERT INTO testTable VALUES(1, "Hello"); 
INSERT INTO testTable VALUES(2, "World"); 

SELECT * FROM testTable;

/*
+---------+----------+
| testVal | testVal2 |
+---------+----------+
|       1 | Hello    |
|       2 | World    |
+---------+----------+
*/

DROP TABLE testTable;

ALTER TABLE student add Marks int;

update student set Marks=28 where Roll_no=201;
update student set Marks=29 where Roll_no=202;
update student set Marks=30 where Roll_no=203;
update student set Marks=28 where Roll_no=204;

select * from student;

/*
+---------+------------+-----------+------+-------+
| Roll_no | First_Name | Last_Name | Dept | Marks |
+---------+------------+-----------+------+-------+
|     201 | Goro       | Doro      | CSE  |    28 |
|     202 | Sum        | Sang      | CE   |    29 |
|     203 | Dom        | Karry     | CSE  |    30 |
|     204 | Nandhu     | Pillai    | CE   |    28 |
+---------+------------+-----------+------+-------+
*/

SELECT min(Marks) FROM student;

/*
+------------+
| min(Marks) |
+------------+
|         28 |
+------------+
*/

SELECT max(Marks) FROM student;

/*
+------------+
| max(Marks) |
+------------+
|         30 |
+------------+*/

SELECT count(Marks) FROM student;

/*
+--------------+
| count(Marks) |
+--------------+
|            4 |
+--------------+
*/

