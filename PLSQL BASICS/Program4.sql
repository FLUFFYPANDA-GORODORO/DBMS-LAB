-- FOR LOOP EXECUTION--------------------------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
i NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('PL/SQL FOR LOOP EXECUTION');
FOR i IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Value: '|| i);
END LOOP;
END;
/

-- OUTPUT

-- PL/SQL FOR LOOP EXECUTION
-- Value: 1
-- Value: 2
-- Value: 3
-- Value: 4
-- Value: 5

-- REVERSE FOR LOOP EXECUTION-------------------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
i NUMBER;
BEGIN
DBMS_OUTPUT.PUT_LINE('PL/SQL FOR LOOP EXECUTION');
FOR i IN REVERSE 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('Value: '|| i);
END LOOP;
END;
/

-- OUTPUT

-- PL/SQL FOR LOOP EXECUTION
-- Value: 5
-- Value: 4
-- Value: 3
-- Value: 2
-- Value: 1

  


-- NESTED FOR LOOP-------------------------------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
i NUMBER;
j NUMBER;

BEGIN
DBMS_OUTPUT.PUT_LINE('PL/SQL NESTED FOR LOOP EXECUTION');
FOR i IN 1..5 LOOP
    FOR j IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE('Value: '|| i*j);
      END LOOP;
      DBMS_OUTPUT.PUT_LINE('END OF '|| i ||' INCREMEANT of i ');
END LOOP;

END;
/


-- OUTPUT

-- PL/SQL NESTED FOR LOOP EXECUTION
-- Value: 1
-- Value: 2
-- Value: 3
-- Value: 4
-- Value: 5
-- Value: 6
-- Value: 7
-- Value: 8
-- Value: 9
-- Value: 10
-- END OF 1 INCREMEANT of i
-- Value: 2
-- Value: 4
-- Value: 6
-- Value: 8
-- Value: 10
-- Value: 12
-- Value: 14
-- Value: 16
-- Value: 18
-- Value: 20
-- END OF 2 INCREMEANT of i
-- Value: 3
-- Value: 6
-- Value: 9
-- Value: 12
-- Value: 15
-- Value: 18
-- Value: 21
-- Value: 24
-- Value: 27
-- Value: 30
-- END OF 3 INCREMEANT of i
-- Value: 4
-- Value: 8
-- Value: 12
-- Value: 16
-- Value: 20
-- Value: 24
-- Value: 28
-- Value: 32
-- Value: 36
-- Value: 40
-- END OF 4 INCREMEANT of i
-- Value: 5
-- Value: 10
-- Value: 15
-- Value: 20
-- Value: 25
-- Value: 30
-- Value: 35
-- Value: 40
-- Value: 45
-- Value: 50
-- END OF 5 INCREMEANT of i
