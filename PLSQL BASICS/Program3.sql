SET SERVEROUT ON
SET VERIFY OFF
  
DECLARE
    a number;
    b number;
BEGIN
    a := &a;
    b := &b;

    IF a>b then
        DBMS_OUTPUT.PUT_LINE(a ||' is greator');
    ELSE
        DBMS_OUTPUT.PUT_LINE(b ||' is greater');   
    END IF;

END;
/

-- OUTPUT

-- Enter value for a:3 
-- Enter value for b:5
-- 5 is greater
