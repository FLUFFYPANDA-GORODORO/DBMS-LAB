DECLARE 
   a integer; 
   b integer;
   c integer; 
   d integer; 
   e integer; 
   f integer; 
    
   
BEGIN 
   a := &a;
   b := &b;

   c := a + b; 
   d := a - b; 
   e := a * b; 
   f := a / b; 

   DBMS_OUTPUT.PUT_LINE('Addition: ' || c); 
   DBMS_OUTPUT.PUT_LINE('Subtraction: ' || d); 
   DBMS_OUTPUT.PUT_LINE('Multiplication: ' || e); 
   DBMS_OUTPUT.PUT_LINE('Division: ' || f); 
    
END; 
/ 

-- OUTPUT

-- Enter value for a:5
-- Enter value for b:4

-- Addition: 9
-- Subtraction: 1
-- Multiplication: 20
-- Division: 1


