SET SERVEROUTPUT ON
SET VERIFY OFF
   
CREATE OR REPLACE PROCEDURE SquareNum(x IN OUT number) IS 
BEGIN 
  x := x * x; 
END;
/

DECLARE 
   a number; 
   b number; 
BEGIN 
   a:= &a; 
   b := a ;
   SquareNum(b); 
   dbms_output.put_line(' Square of '|| a || ' = ' || b); 
END; 
/

-- OUTPUT

-- Enter value for a: 5
-- Square of 5 = 25
