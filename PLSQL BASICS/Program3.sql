SET SERVEROUT ON
SET VERIFY OFF
  
DECLARE
    a number;
    b number;
    c number;

BEGIN
    a := &a;
    b := &b;
    c := &c;
    
    IF a > b and a > c then
        DBMS_OUTPUT.PUT_LINE(a ||' is greator');
        
    ELSE IF b > c and b > c then
        DBMS_OUTPUT.PUT_LINE(b ||' is greator');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE(c ||' is greater');
        
    END IF;

  DBMS_OUTPUT.PUT_LINE('Thnak You');

END;
/
