-- 4).Unnamed PL/SQL code block: Use of Control structure and Exception handling is mandatory.
-- Suggested Problem statement:
-- Consider Tables: 
-- 1. Borrower(Roll_no, Name, DateofIssue, NameofBook, Status) 
-- 2. Fine(Roll_no,Date,Amt)
-- Accept Roll_no and NameofBook from user. 
-- Check the number of days (from date of issue).
-- If days are between 15 to 30 then fine amount will be Rs 5per day.
-- If no. of days>30, per day fine will be Rs 50 per day and for days less than 30, Rs. 5 per day. 
-- After submitting the book, status will change from I to R.
-- If condition of fine is true, then details will be stored into fine table.
-- Also handles the exception by named exception handler or user define exception handler.

CREATE TABLE  Borrower(Rollno NUMBER , Name VARCHAR2(50), DateOfIssue DATE,NameOfBook VARCHAR2(50), Status VARCHAR2(50));
CREATE TABLE Fine(Rollno NUMBER,DateOfReturn DATE,Amount NUMBER);

INSERT INTO Borrower VALUES(32,'Gaurav',TO_DATE('01-07-2024','DD-MM-YYYY'),'Data Structure','Isseud');
INSERT INTO Borrower VALUES(31,'Sumedh',TO_DATE('08-07-2024','DD-MM-YYYY'),'DBMS','Isseud');
INSERT INTO Borrower VALUES(30,'Karan',TO_DATE('21-07-2024','DD-MM-YYYY'),'Operating System','Isseud');
INSERT INTO Borrower VALUES(29,'Anadhu',TO_DATE('15-07-2024','DD-MM-YYYY'),'Computer Networks','Isseud');
INSERT INTO Borrower VALUES(27,'YeduKrishana',TO_DATE('12-07-2024','DD-MM-YYYY'),'Computer Networks','Isseud');

 SELECT * FROM Borrower;

    -- ROLLNO NAME                           DATEOFISS NAMEOFBOOK                     STATUS
      ------- ------------------------------ --------- ------------------------------ ------------------------------
        -- 32 Gaurav                         01-JUL-24 Data Structure                 Isseud
        -- 31 Sumedh                         08-JUL-24 DBMS                           Isseud
        -- 30 Karan                          21-JUL-24 Operating System               Isseud
        -- 29 Anadhu                         15-JUL-24 Computer Networks              Isseud
        -- 27 YeduKrishana                   12-JUL-24 Computer Networks              Isseud



SET SERVEROUT ON
SET VERIFY OFF

DECLARE 
	Roll_no NUMBER;
	Name_Of_Book VARCHAR2(25);
	No_Of_Days NUMBER;
	Return_Date DATE := TO_DATE(SYSDATE,'DD-MM-YYYY');
	Temp NUMBER;
	Doi DATE;
	Fine NUMBER;

BEGIN
	Roll_no := &Roll_no;
	Name_of_Book := '&nameofbook';

	SELECT to_date(Borrower.DateOfIssue,'DD-MM-YYYY') INTO Doi FROM Borrower WHERE Borrower.Rollno = Roll_no AND Borrower.NameOfBook = Name_Of_Book;
	No_Of_Days := Return_Date-Doi;
	

	IF(No_Of_Days >15 AND No_Of_Days <=30) THEN
		Fine := 5*No_Of_Days;	
	ELSIF (No_Of_Days>30 ) THEN
		Temp := No_Of_Days-30;
		Fine := 150 + Temp*50;
	END IF;
	

	INSERT INTO fine VALUES(Roll_no,Return_Date,Fine);
	UPDATE borrower SET status = 'RETURNED' WHERE Borrower.Rollno = Roll_no;
	
	
END;
/

-- Output

-- Enter value for i_roll_no: 32
-- Enter value for nameofbook: Data Structure

-- Enter value for roll_no: 31
-- Enter value for nameofbook: DBMS

SELECT * FROM Borrower;

--     ROLLNO NAME                           DATEOFISS NAMEOFBOOK                     STATUS
-- ---------- ------------------------------ --------- ------------------------------ ------------------------------
--         32 Gaurav                         01-JUL-24 Data Structure                 RETURNED
--         31 Sumedh                         08-JUL-24 DBMS                           RETURNED
--         30 Karan                          21-JUL-24 Operating System               Isseud
--         29 Anadhu                         15-JUL-24 Computer Networks              Isseud
--         27 YeduKrishana                   12-JUL-24 Computer Networks              Isseud

 SELECT * FROM Fine;

--     ROLLNO DATEOFRET     AMOUNT
-- ---------- --------- ----------
--         32 26-AUG-24       1450
--         31 26-AUG-24       1100
