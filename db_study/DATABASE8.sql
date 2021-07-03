CREATE TABLE EMP_DDL(
	
	ENPNO  		NUMBER(4),
	ENAME  		VARCHAR2(10),
	JOB    		VARCHAR2(9),
	MGR    		VARCHAR2(4),
    HIREDATE 	DATE,
    SAL 		NUMBER(7,2),
    COMM 		NUMBER(7,2),
    DEPTNO 		NUMBER(2)

);

DESC EMP_DDL;

CREATE TABLE DEPT_DDL
          AS SELECT * FROM DEPT ;
          
DESC DETP_DDL;   

CREATE TABLE EMP_DDL_30
          AS SELECT * 
               FROM EMP 
              WHERE DEPTNO = 30;
             
CREATE TABLE EMPDEPT_DDL
          AS SELECT E.EMPNO
                  , E.ENAME
                  , E.JOB
                  , E.MGR
                  , E.HIREDATE
                  , E.SAL
                  , E.COMM
                  , D.DEPTNO
                  , D.DNAME 
                  , D.LOC
               FROM EMP E, DEPT D 
              WHERE 1<>1;
             
CREATE TABLE EMP_ALTER
          AS SELECT * FROM EMP;

ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);

ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

ALTER TABLE EMP_ALTER DROP COLUMN TEL;

RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME ;
 
TRUNCATE TABLE EMP_RENAME; 

SELECT * FROM EMP_RENAME;

DROP TABLE EMP_RENAME;