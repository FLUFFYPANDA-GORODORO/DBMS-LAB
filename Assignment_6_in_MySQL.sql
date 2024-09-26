
 create database Assignment6;
 use Assignment6;
 
create table oldEmp(rollNum int Primary Key,name varchar(100),salary int);

create procedure insertInOld(in r int,n varchar(100),s int)
begin
insert into oldEmp values(r,n,s);
end//

call insertInOld(1,'Aditi',50000);
call insertInOld(2,'Aditya',49000);
call insertInOld(3,'Anurag',55000);
call insertInOld(4,'Asim',60000);
call insertInOld(5,'Aryan',57000);
call insertInOld(6,'Aneesh',54000);
call insertInOld(7,'Abhishek',52000);
call insertInOld(8,'Amit',51000);
call insertInOld(9,'Anay',58000);

select * from oldEmp;
/*
+---------+----------+--------+
| rollNum | name     | salary |
+---------+----------+--------+
|       1 | Aditi    |  50000 |
|       2 | Aditya   |  49000 |
|       3 | Anurag   |  55000 |
|       4 | Asim     |  60000 |
|       5 | Aryan    |  57000 |
|       6 | Aneesh   |  54000 |
|       7 | Abhishek |  52000 |
|       8 | Amit     |  51000 |
|       9 | Anay     |  58000 |
+---------+----------+--------+
*/


create table newEmp(rollNum int Primary Key,name varchar(100),salary int);

create procedure insertInNew(in r int,n varchar(100),s int)
begin
insert into newEmp values(r,n,s);
end//


call insertInNew(2,'Aditya',49000);
call insertInNew(5,'Aryan',57000);
call insertInNew(6,'Aneesh',54000);
call insertInNew(9,'Anay',58000);

select * from newEmp;
/*
+---------+--------+--------+
| rollNum | name   | salary |
+---------+--------+--------+
|       2 | Aditya |  49000 |
|       5 | Aryan  |  57000 |
|       6 | Aneesh |  54000 |
|       9 | Anay   |  58000 |
+---------+--------+--------+
*/
create procedure compareTables()
begin
declare r int;
declare n varchar(100);
declare s int;
declare c int;
declare exit_loop int(1);
declare cur cursor for select rollNum,name,salary from oldEmp;
declare continue handler for not found set exit_loop=1;
open cur;
simple_loop:LOOP
fetch cur into r,n,s;
select count(rollNum) into c from newEmp where rollNum=r;
if c=0 then
insert into newEmp values(r,n,s);
end if;
if exit_loop=1 then
close cur;
leave simple_loop;
end if;
end LOOP simple_loop;
end//


call compareTables();

select * from newEmp;
/*
+---------+----------+--------+
| rollNum | name     | salary |
+---------+----------+--------+
|       1 | Aditi    |  50000 |
|       2 | Aditya   |  49000 |
|       3 | Anurag   |  55000 |
|       4 | Asim     |  60000 |
|       5 | Aryan    |  57000 |
|       6 | Aneesh   |  54000 |
|       7 | Abhishek |  52000 |
|       8 | Amit     |  51000 |
|       9 | Anay     |  58000 |
+---------+----------+--------+
*/
