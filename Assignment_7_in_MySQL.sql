create database Assignment7;
use Assignment7;

create table library(rollnum int,name varchar(100),issuedate date,bookname varchar(100));

create table library_audit(rollnum int,name varchar(100),issuedate date,bookname varchar(100),operationTime timestamp);

delimiter //
create procedure insert_student(r int,n varchar(100),id date,b varchar(100))
begin
insert into library values(r,n,id,b);
end //

call insert_student(1,'Aditi','2021-08-15','JAVA');
call insert_student(2,'Aditya','2021-08-01','DBMS');
call insert_student(3,'Anurag','2021-08-31','TOC');
call insert_student(4,'Asim','2021-09-10','CNS');
call insert_student(5,'Aryan','2021-09-04','DS');
call insert_student(6,'Aneesh','2021-08-20','HCI');
call insert_student(7,'Abhishek','2021-08-13','PYTHON');

select* from library;
+---------+----------+------------+----------+
| rollnum | name     | issuedate  | bookname |
+---------+----------+------------+----------+
|       1 | Aditi    | 2021-08-15 | JAVA     |
|       2 | Aditya   | 2021-08-01 | DBMS     |
|       3 | Anurag   | 2021-08-31 | TOC      |
|       4 | Asim     | 2021-09-10 | CNS      |
|       5 | Aryan    | 2021-09-04 | DS       |
|       6 | Aneesh   | 2021-08-20 | HCI      |
|       7 | Abhishek | 2021-08-13 | PYTHON   |
+---------+----------+------------+----------+


--Update Trigger
delimiter //
create trigger after_update
after update
on library for each row
begin
insert into library_audit values(old.rollnum,old.name,old.issuedate,old.bookname,now());
end //

delimiter //
create trigger before_update
before update
on library for each row
begin
insert into library_audit values(old.rollnum,old.name,old.issuedate,old.bookname,now());
end //

update library set issuedate=current_date(),bookname='C++' where rollnum=1;
select * from library;
+---------+----------+------------+----------+
| rollnum | name     | issuedate  | bookname |
+---------+----------+------------+----------+
|       1 | Aditi    | 2021-09-30 | C++      |
|       2 | Aditya   | 2021-08-01 | DBMS     |
|       3 | Anurag   | 2021-08-31 | TOC      |
|       4 | Asim     | 2021-09-10 | CNS      |
|       5 | Aryan    | 2021-09-04 | DS       |
|       6 | Aneesh   | 2021-08-20 | HCI      |
|       7 | Abhishek | 2021-08-13 | PYTHON   |
+---------+----------+------------+----------+
select * from library_audit;
+---------+-------+------------+----------+---------------------+
| rollnum | name  | issuedate  | bookname | operationTime       |
+---------+-------+------------+----------+---------------------+
|       1 | Aditi | 2021-08-15 | JAVA     | 2021-09-30 13:14:36 |
+---------+-------+------------+----------+---------------------+

--Delete Trigger
delimiter //
create trigger after_delete
after delete
on library for each row
begin
insert into library_audit values(old.rollnum,old.name,old.issuedate,old.bookname,now());
end //

delimiter //
create trigger before_delete
before delete
on library for each row
begin
insert into library_audit values(old.rollnum,old.name,old.issuedate,old.bookname,now());
end //

delete from library where rollnum=7;
select * from library;
+---------+--------+------------+----------+
| rollnum | name   | issuedate  | bookname |
+---------+--------+------------+----------+
|       1 | Aditi  | 2021-09-30 | C++      |
|       2 | Aditya | 2021-08-01 | DBMS     |
|       3 | Anurag | 2021-08-31 | TOC      |
|       4 | Asim   | 2021-09-10 | CNS      |
|       5 | Aryan  | 2021-09-04 | DS       |
|       6 | Aneesh | 2021-08-20 | HCI      |
+---------+--------+------------+----------+

select * from library_audit;
+---------+----------+------------+----------+---------------------+
| rollnum | name     | issuedate  | bookname | operationTime       |
+---------+----------+------------+----------+---------------------+
|       1 | Aditi    | 2021-08-15 | JAVA     | 2021-09-30 13:14:36 |
|       7 | Abhishek | 2021-08-13 | PYTHON   | 2021-09-30 13:18:28 |
+---------+----------+------------+----------+---------------------+
