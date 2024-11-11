create table library(rollNo int,name varchar(25),issueDate date,bookName varchar(25));

create table library_audit(rollNo int, name varchar(25),issueDate date , bookName varchar(25),operationTime timestamp);

insert into library values(201,"Gaurav",'2024-10-15',"CNS");
insert into library values(202,"Sumedh",'2024-10-20',"OS");
insert into library values(203,"Karan",'2024-10-12',"CNS");

delimiter //
-- Use either after/before 
create trigger after_update
after update
on library for each row
begin
insert into library_audit values(old.rollnum,old.name,old.issuedate,old.bookname,now());
End
//

update library set issueDate = Current_date(),bookName = "Java" where rollNo=201;
//

-- Use either after/before  
create trigger after_delete
after delete
on library for each row
begin
insert into library_audit values(old.rollnum,old.name,old.issuedate,old.bookname,now());
End
//

delete from library where rollNo=203;
//

select * from library_audit
//
  
-- | rollNo | name   | issueDate  | bookName | operationTime       |
-- +--------+--------+------------+----------+---------------------+
-- |    201 | Gaurav | 2024-10-15 | CNS      | 2024-11-11 18:56:46 |
-- |    203 | Karan  | 2024-10-12 | CNS      | 2024-11-11 18:59:11 |
-- +--------+--------+------------+----------+---------------------+


select * from library;
//

-- | rollNo | name   | issueDate  | bookName |
-- +--------+--------+------------+----------+
-- |    201 | Gaurav | 2024-11-11 | Java     |
-- |    202 | Sumedh | 2024-10-20 | OS       |
