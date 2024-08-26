SET SERVEROUT ON
SET VERIFY OFF
  
DECLARE
num1 integer;
num2 integer;
num3 integer;

BEGIN
num1 := &num1;
num2 := &num2;
num3 := &num3;

IF (num1 > num2 AND num1 > num3) THEN
dbms_output.put_line(num1 ||' is greator');

ELSEIF (num2 > num1 AND num2 > num3) THEN
dbms_output.put_line(num2 ||' is greator');

ELSE
dbms_output.put_line(num3 ||' is greater');

END IF;

dbms_output.put_line('after end if');
END;
/
