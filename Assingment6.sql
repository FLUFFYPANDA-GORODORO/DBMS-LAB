-- Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
-- Write a PL/SQL block of code using parameterized Cursor that will merge the data availablein 
-- the newly created table N_RollCall with the data available in the table O_RollCall. If the data in 
-- the first table already exist in the second table then that data should be skipped



CREATE TABLE O_RollCall(Roll_no NUMBER,  Name VARCHAR2(25), Div VARCHAR2(10));
CREATE TABLE N_RollCall(Roll_no NUMBER,  Name VARCHAR2(25), Div VARCHAR2(10));

INSERT INTO O_RollCall VALUES(31,'Gaurav','B');
INSERT INTO O_RollCall VALUES(30,'Karan','B'); 
INSERT INTO O_RollCall VALUES(32,'Sumedh','B');
INSERT INTO O_RollCall VALUES(21,'Pratik','A');
INSERT INTO O_RollCall VALUES(32,'Sumedh','B');
INSERT INTO O_RollCall VALUES(30,'Karan','B');
INSERT INTO O_RollCall VALUES(9,'Parth','A');
INSERT INTO O_RollCall VALUES(29,'Anadhu','B');
INSERT INTO O_RollCall VALUES(45,'Aditya','A');
INSERT INTO O_RollCall VALUES(21,'Pratik','A');


CREATE OR REPLACE PROCEDURE Cursor_Student AS
c_Roll NUMBER;
c_Name VARCHAR2(25);
c_Div VARCHAR2(5);


cursor c1 (Roll_no NUMBER , name VARCHAR2 , div VARCHAR2) IS SELECT Roll_no , COUNT (Roll_no), name ,COUNT (Name), div, COUNT (Div) FROM O_RollCall 
GROUP BY Roll_no , Name , Div HAVING (COUNT(Roll_no)>1) AND (COUNT(Name)>1) AND (COUNT(Div)>1) ;
temp  c1%rowtype;

BEGIN
	DELETE FROM N_RollCall;
	INSERT INTO N_RollCall SELECT * FROM O_RollCall;
	OPEN c1(c_Roll,c_Name,c_Div);
	
	LOOP
		FETCH c1 INTO temp;
		EXIT WHEN c1%NOTFOUND;
		DELETE FROM N_RollCall WHERE Roll_no = temp.Roll_no AND name = temp.name AND div = temp.div;
		INSERT INTO N_RollCall VALUES (temp.Roll_no,temp.name,temp.div);
		dbms_output.put_line(temp.Roll_no||temp.name||temp.div);
	END LOOP;
END;
/


BEGIN
	Cursor_Student;
END;
/

