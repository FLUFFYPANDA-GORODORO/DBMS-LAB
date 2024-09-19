-- Named PL/SQL Block: PL/SQL Stored Procedure and Stored Function.
-- Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scoredby students in examination is <=1500 and marks>=990 then  student 
-- will be placed in distinction category if marks scored are between 989 and 900 category is first class, if marks 899 and 825 category is Higher Second Class.

-- Write a PL/SQL block to use procedure created with above requirement.
-- Stud_Marks(name, total_marks) Result(Roll,Name, Class)


-- STEP 1------------------------------------------------------------------------------------------------------------

CREATE TABLE Stud_Marks(name VARCHAR2(25),total_marks NUMBER);
CREATE TABLE Result(roll_number NUMBER , name VARCHAR2(25), class VARCHAR2(30));

-- STEP 2------------------------------------------------------------------------------------------------------------

SET SERVEROUT ON
SET VERIFY OFF

CREATE OR REPLACE PROCEDURE Grade (Rollno IN NUMBER, Name IN VARCHAR2 ,Marks IN NUMBER) AS
	BEGIN
		IF (Marks<=1500 and Marks>=990) THEN
			DBMS_OUTPUT.PUT_LINE ('DISTINCTION');
			INSERT INTO Result VALUES (Rollno,Name,'DISTINCTION');

	  ELSIF (Marks<=989 and Marks>=900) THEN
			DBMS_OUTPUT.PUT_LINE ('FIRST CLASS');
			INSERT INTO Result VALUES (Rollno,Name,'FIRST CLASS');

		ELSIF (Marks<=899 and Marks>825) THEN
			DBMS_OUTPUT.PUT_LINE('HIGHER SECOND CLASS');
			INSERT INTO Result VALUES (Rollno,Name,'HIGHER SECOND CLASS');

		ELSE
			DBMS_OUTPUT.PUT_LINE ('FAIL');
			INSERT INTO Result VALUES (Rollno,Name,'FAIL');

	  END IF;

	  INSERT INTO Stud_Marks VALUES (Name,Marks);
    END Grade;
    /

    -- Procedure created.

-- STEP 3---------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION Add_Values(roll IN NUMBER, name IN VARCHAR2,marks IN NUMBER) RETURN VARCHAR2 AS
  BEGIN
  		Grade(roll,name,marks);
  		return 'SUCCESSFULL';
  END;
  /

  -- Function created.
  

-- STEP 4----------------------------------------------------------------------------------------------------------------

DECLARE
	Name VARCHAR2(25);
	Roll_no NUMBER;
	Marks NUMBER;
	class VARCHAR2(25);

BEGIN
	Roll_no:=&Roll_no;
	Name:='&Name';
	Marks:=&Marks;
	class := Add_Values(Roll_no,Name,Marks);
	dbms_output.put_line(class);
END;
/

-- OUTPUT----------------------------------------------------------------------------------------------------------------

-- Enter value for roll_no: 30
-- Enter value for name: Karan
-- Enter value for marks: 952


-- Enter value for roll_no: 32
-- Enter value for name: Gaurav
-- Enter value for marks: 1208


-- Enter value for roll_no: 31
-- Enter value for name: Sumedh
-- Enter value for marks: 948


SELECT * FROM Stud_Marks;  

-- NAME                      TOTAL_MARKS
-- ------------------------- -----------
-- Karan                             952
-- Gaurav                           1208
-- Sumedh                            948

SELECT * FROM Result;

-- ROLL_NUMBER NAME                      CLASS
-- ----------- ------------------------- ------------------------------
--          30 Karan                     FIRST CLASS
--          32 Gaurav                    DISTINCTION
--          31 Sumedh                    FIRST CLASS

/*
create procedure proc_grade(IN ROLL int)

-> begin

-> declare marks int default 0;

-> declare grade varchar(50);

-> select s.total_marks into marks from stud_marks s where s.roll_no=Roll;

-> if marks<=1500 AND marks>=990 then

-> set grade="Distinction";

-> elseif marks<990 AND marks>=899 then

-> set grade="First Class";

-> elseif marks<899 AND marks>=825

-> then set grade="Second Class";

-> END if;

-> update result set class = grade where roll_no=Roll;

-> END

-> //*/
