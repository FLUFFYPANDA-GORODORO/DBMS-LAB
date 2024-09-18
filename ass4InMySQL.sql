CREATE DATABASE IF NOT EXISTS Library;
use Library;
CREATE TABLE IF NOT EXISTS Borrower(RollNo int(20), Name varchar(20), DOI date, NOB varchar(20), Status varchar(20));

DESC Borrower;

 /*+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| RollNo | int         | YES  |     | NULL    |       |
| Name   | varchar(20) | YES  |     | NULL    |       |
| DOI    | date        | YES  |     | NULL    |       |
| NOB    | varchar(20) | YES  |     | NULL    |       |
| Status | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+*/

INSERT INTO Borrower VALUES(101, 'Ram', '2022-09-20', 'DBMS', 'Issued');

INSERT INTO Borrower VALUES(102, 'Varun', '2022-08-25', 'CN', 'Issued');

INSERT INTO Borrower VALUES(103, 'Rani', '2022-08-01', 'SPOS', 'Issued');

SELECT * FROM Borrower;

/*
+--------+-------+------------+------+--------+
| RollNo | Name  | DOI        | NOB  | Status |
+--------+-------+------------+------+--------+
|    101 | Ram   | 2022-09-10 | DBMS | Issued |
|    102 | Varun | 2022-08-25 | CN   | Issued |
|    103 | Rani  | 2022-08-01 | SPOS | Issued |
+--------+-------+------------+------+--------+
*/

CREATE TABLE IF NOT EXISTS Fine(RollNo int(20), Date date, Amount int(50));

DESC Fine;

/*
+--------+------+------+-----+---------+-------+
| Field  | Type | Null | Key | Default | Extra |
+--------+------+------+-----+---------+-------+
| RollNo | int  | YES  |     | NULL    |       |
| Date   | date | YES  |     | NULL    |       |
| Amount | int  | YES  |     | NULL    |       |
+--------+------+------+-----+---------+-------+
*/

delimiter //
CREATE PROCEDURE B(roll_new int, book_name varchar(20))
BEGIN
DECLARE x integer;
DECLARE continue handler for NOT FOUND
BEGIN
SELECT 'NOT FOUND';
END;
SELECT datediff(curdate(), DOI) into x from Borrower where RollNo=roll_new;
if(x>15 && x<30)
then
INSERT INTO Fine VALUES(roll_new, curdate(),(x*5));
end if;
if(x>30)
then 
INSERT INTO Fine VALUES(roll_new, curdate(), (x*50));
end if;
UPDATE Borrower SET Status='returned' where RollNo=roll_new;
END;
//

CALL B(101, 'Ram');
//

CALL B(102, 'Varun');
//

CALL B(103, 'Rani');
//

SELECT * FROM Fine;
//

/*
+--------+------------+--------+
| RollNo | Date       | Amount |
+--------+------------+--------+
|    101 | 2024-09-18 |  36950 |
|    102 | 2024-09-18 |  37750 |
|    103 | 2024-09-18 |  38950 |
+--------+------------+--------+
*/

SELECT * FROM Borrower;
//
/*
+--------+-------+------------+------+----------+
| RollNo | Name  | DOI        | NOB  | Status   |
+--------+-------+------------+------+----------+
|    101 | Ram   | 2022-09-10 | DBMS | returned |
|    102 | Varun | 2022-08-25 | CN   | returned |
|    103 | Rani  | 2022-08-01 | SPOS | returned |
+--------+-------+------------+------+----------+
*/

/*HelloWorld*/
