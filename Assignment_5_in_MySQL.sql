create table studentMarks(rollNo int , name varchar(25),marks int);

create table result(rollNo int,name varchar(25),grade varchar(25));

delimiter //
create function insertstudent(r int,n varchar(25),m int)
returns varchar(25)
deterministic
Begin
  insert into studentMarks values(r,n,m);
  return "Successful";
End;
//

select insertstudent(201,"Gauarv",1450);
select insertstudent(202,"Sumedh",1350);
select insertstudent(203,"Karan",1280);
//


--  | insertstudent(201,"Gauarv",1450) |
-- +----------------------------------+
-- | Successful                       |
-- +----------------------------------+
-- 1 row in set (0.02 sec)

-- +----------------------------------+
-- | insertstudent(202,"Sumedh",1350) |
-- +----------------------------------+
-- | Successful                       |
-- +----------------------------------+
-- 1 row in set (0.02 sec)

-- +---------------------------------+
-- | insertstudent(203,"Karan",1280) |
-- +---------------------------------+
-- | Successful                      |

create procedure calculateGrade(IN roll INT,OUT class VARCHAR(25))
Begin 
  declare c varchar(25);
  declare m int;
  declare n varchar(100);
  select marks into m from studentMarks where rollNo = roll;
  select name into n from studentMarks where rollNo = roll;
  
  if m>=990 and m<=1500 then
  set c='Distinction';
  elseif m>=900 and m<=989 then
  set c='First Class';
  elseif m>=825 and m<=899 then
  set c='Higher Second Class';
  else
  set c='Fail';
  end if;

  insert into result values(roll,n,c);
  set class=c;
End;
//

call calculateGrade(201,@class)
//


select * from studentMarks;
//

-- | rollNo | name   | marks |
-- +--------+--------+-------+
-- |    201 | Gauarv |  1450 |
-- |    202 | Sumedh |  1350 |
-- |    203 | Karan  |  1280 |


select * from result;

-- | rollNo | name   | grade       |
-- +--------+--------+-------------+
-- |    201 | Gauarv | Distinction |
-- +--------+--------+-------------+
