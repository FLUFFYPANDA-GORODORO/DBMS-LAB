create table borrower(rollNo int,name varchar(20),issueDate date,bookName varchar(20),status varchar(20));

create table fine(rollNo int , returnDate date,Amount int);

 insert into borrower values(201,"Gaurav",'2024-10-21',"CNS","Issued");
 insert into borrower values(202,"Sumedh",'2024-10-10',"DBMS","Issued");
 insert into borrower values(203,"Karan",'2024-10-14',"OS","Issued");

Delimiter //

create procedure CalculateFine(In Roll_No int , Name varchar(20))

Begin
    
     declare Issue_Date date;
     declare Day_Difference int;
     declare Fine_Amount int;
     declare Exit Handler for 1062 select "Fine already paid";
    
     select issueDate into Issue_Date from borrower where rollNO = Roll_No and name = Name;
     select DateDiff(Curdate(),Issue_Date) into Day_Difference;
    
     if(Day_Difference >=15 and Day_Difference <= 30 ) then
     set Fine_amount = Day_Difference*5;
     insert into fine values(Roll_No,Curdate(),Fine_amount);
    
     elseif(Day_Difference>30) then
     set Fine_Amount = Day_Difference*50;
     insert into fine values(Roll_No,Curdate(),Fine_Amount);
    
     End if;

     update borrower set status = "Returned" where rollNO = Roll_No and name = Name;

End;
//

call CalculateFine(201,"Gaurav");
call CalculateFine(202,"Sumedh");
call CalculateFine(203,"Karan");
//

select * from fine;

-- | rollNo | returnDate | Amount |
-- +--------+------------+--------+
-- |    201 | 2024-11-11 |    105 |
-- |    203 | 2024-11-11 |    140 |
-- |    202 | 2024-11-11 |   1600 |
