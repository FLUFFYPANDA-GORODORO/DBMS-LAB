CREATE table stud_marks(name varchar(20), total_marks int);
CREATE table result(RollNo int, name varchar(20), class varchar(30));


 delimiter //
  create procedure grade( IN roll_new int, IN name varchar(20), IN marks int)
   begin
    if(marks<=1500  and marks>=990) then
     insert into result values(roll_new, name, 'Distinction');
    elseif( marks <=989 and marks>=900) then
    insert into result values (roll_new, name, 'First-Class');
    elseif(marks<=899 and marks>825) then
    insert into result values(roll_new, name, 'Higher Second Class');
    elseif(marks<=825) then
    insert into result values(roll_new, name, 'Fail');
    end if;
    insert into stud_marks values(name, marks);
     end;
     //


--Create a function to input and call the grade procedure--

--Run the Function--
