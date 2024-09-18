-- Write a database trigger on Library table. The System should keep track of the records that are 
-- being updated or deleted. The old value of updated or deleted records should be added in
-- Library_Audit table.

-- STEP 1-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Library_table(Book_Name VARCHAR2(25),Status VARCHAR2(15));
CREATE TABLE Library_Audit(Modified_Date DATE, Book_Name VARCHAR2(25),Old_Status VARCHAR(15),New_Status VARCHAR2(15), action VARCHAR2(25));


INSERT INTO Library_Table VALUES('DATA STRUCTURE','AVAILABLE');
INSERT INTO Library_Table VALUES('DATA SCIENCE','UNAVAILABLE');
INSERT INTO Library_Table VALUES('DBMS','AVAILABLE');
INSERT INTO Library_Table VALUES('SPIDER MAN','AVAILABLE');
INSERT INTO Library_Table VALUES('COMPUTER NETWORKS','UNAVAILABLE');
INSERT INTO Library_Table VALUES('HARRY POTTER','UNAVAILABLE');
INSERT INTO Library_Table VALUES('LORD OF THE RINGS','UNAVAILABLE');

-- STEP 2-----------------------------------------------------------------------------------------------------------------------------------------------------

SETSERVEROUTPUT ON
SET VERIFY OFF
  
CREATE OR REPLACE TRIGGER Library_Trigger 
AFTER UPDATE OR DELETE OR INSERT ON Library_Table FOR EACH ROW
ENABLE
	BEGIN
		IF UPDATING THEN
  		dbms_output.put_line(:OLD.Status);
  		INSERT INTO library_audit VALUES (SYSDATE,:OLD.Book_Name,:OLD.Status,:NEW.Status,'UPDATE');

    ELSIF INSERTING THEN
      dbms_output.put_line(:NEW.Status);
      INSERT INTO library_audit VALUES (SYSDATE,:NEW.Book_Name,:OLD.Status,:NEW.Status,'INSERT');

		ELSE
			dbms_output.put_line(:OLD.Book_Name||'deleting');
			INSERT INTO Library_Audit VALUES(SYSDATE,:OLD.Book_Name,:OLD.Status,:NEW.Status,'DELETE');
		END IF;
	END;
/


SELECT * FROM Library_Table;
  
-- BOOK_NAME                 STATUS
-- ------------------------- ---------------
-- DATA STRUCTURE            AVAILABLE
-- DATA SCIENCE              UNAVAILABLE
-- DBMS                      AVAILABLE
-- SPIDER MAN                AVAILABLE
-- COMPUTER NETWORKS         UNAVAILABLE
-- HARRY POTTER              UNAVAILABLE
-- LORD OF THE RINGS         UNAVAILABLE



-- STEP 3--------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Library_Table VALUES('DISTRIBUTED SYSTEM','UNAVAILABLE');
INSERT INTO Library_Table VALUES('WILL OF TIME','AVAILABLE');

UPDATE Library_table SET Status = 'PRE-ORDER' WHERE Book_Name = 'HARRY POTTER';
UPDATE Library_table SET Status = 'PRE-ORDER' WHERE Book_Name = 'LORD OF THE RINGS';

UPDATE Library_table SET Status = 'UNAVAILABLE' WHERE Book_Name = 'SPIDER MAN';
UPDATE Library_table SET Status = 'UNAVAILABLE' WHERE Book_Name =  'DATA STRUCTURE';
UPDATE Library_table SET Status = 'AVAILABLE' WHERE Book_Name =  'COMPUTER NETWORKS';


DELETE FROM Library_Table WHERE Book_Name = 'DATA SCIENCE';

-- STEP 4--------------------------------------------------------------------------------------------------------------------------------------------------

-- OUTPUT

SELECT * FROM Library_Table;
  
-- BOOK_NAME                 STATUS
-- ------------------------- ---------------                   
-- DATA STRUCTURE            UNAVAILABLE
-- DBMS                      AVAILABLE
-- SPIDER MAN                UNAVAILABLE
-- COMPUTER NETWORKS         AVAILABLE
-- HARRY POTTER              PRE-ORDER
-- LORD OF THE RINGS         PRE-ORDER
-- DISTRIBUTED SYSTEM        UNAVAILABLE
-- WILL OF TIME              AVAILABLE


SELECT * FROM Library_Audit;

-- MODIFIED_ BOOK_NAME                 OLD_STATUS      NEW_STATUS      ACTION
-- --------- ------------------------- --------------- --------------- -------------------------
-- 18-SEP-24 DISTRIBUTED SYSTEM             -          UNAVAILABLE     INSERT
-- 18-SEP-24 WILL OF TIME                   -          AVAILABLE       INSERT
-- 18-SEP-24 HARRY POTTER              UNAVAILABLE     PRE-ORDER       UPDATE
-- 18-SEP-24 SPIDER MAN                AVAILABLE       UNAVAILABLE     UPDATE
-- 18-SEP-24 DATA STRUCTURE            AVAILABLE       UNAVAILABLE     UPDATE
-- 18-SEP-24 COMPUTER NETWORKS         UNAVAILABLE     AVAILABLE       UPDATE
-- 18-SEP-24 DATA SCIENCE              UNAVAILABLE        -            DELETE
-- 18-SEP-24 LORD OF THE RINGS         UNAVAILABLE     PRE-ORDER       UPDATE



