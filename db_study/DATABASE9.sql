--데이터 사전 
--USER_XXXX 현재 데이터베이스에 접속한 사용자가 소유한 객체 정보 
--ALL_XXXX 현재 데이터베이스에 접속한 사용자가 소유한 객체 또는 다른 사용자가 소유한 개체중 사용허가를 받은 객체 즉 사용가능한 모든 객체 정보
--DBA_XXXX 데이터베이스 관리는 위한 정보(데이터베이스 관리 권한을 가진 SYSTEM , SYS 사용자만 열람 가능)
--V$_XXXX 데이터베이스 성능 관력 전보 (X$_XXXX 테이블의 뷰)


--SCOTT 계정에 사용 가능한 데이터 사전 살펴보기(DICT)
SELECT * FROM DICT;

SELECT * FROM DICTIONARY;

SELECT TABLE_NAME FROM USER_TABLES ;

SELECT OWNER , TABLE_NAME FROM ALL_TABLES ;

/*인덱스*/

SELECT * FROM USER_INDEXES;

SELECT * FROM USER_IND_COLUMNS; 

--인덱스 생성

CREATE INDEX IDX_EMP_SAL
          ON EMP(SAL);
          
SELECT * FROM USER_INDEXES; 

--인덱스 삭제 

DROP INDEX IDX_EMP_SAL;

/* 뷰 */
CREATE VIEW VW_EMP20
         AS ( SELECT EMPNO
                   , ENAME
                   , JOB
                   , DEPTNO
                FROM EMP
               WHERE DEPTNO =20
               
            );
            
SELECT * FROM USER_VIEWS;

SELECT * FROM VW_EMP20;

CREATE OR REPLACE VIEW VW_EMP30ALL
                    AS ( SELECT *
                          FROM EMP
                         WHERE DEPTNO =30
                    
                    );
                   
DROP VIEW VW_EMP20;

-- ROWNUM은 데이터를 하나씩 추가할 때 매겨지는 번호이므로 ORDER BY 절을 총해 정렬되는 특성이 있다
SELECT ROWNUM , E.*
  FROM EMP E 
 ORDER BY SAL DESC;


/* 시퀀스 */
 
CREATE TABLE DEPT_SEQUENCE
          AS SELECT * FROM DEPT WHERE 1<>1;
          
SELECT * FROM DEPT_SEQUENCE ;       

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
       INCREMENT BY 10
       START WITH 10
       MAXVALUE 90
       MINVALUE 0
       NOCYCLE
       CACHE 2
       ;
       
SELECT * 
  FROM USER_SEQUENCES ;
  
 INSERT INTO DEPT_SEQUENCE (DEPTNO , DNAME , LOC)
        VALUES ( SEQ_DEPT_SEQUENCE.NEXTVAL , 'DATABASE' , 'SEOUL'  )
        ;
        
SELECT * 
  FROM DEPT_SEQUENCE 
 ORDER BY DEPTNO
 ;
 
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
  FROM DUAL
  ;
  
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
      INCREMENT BY 3
       MAXVALUE 99
       CYCLE 
       ;
       
SELECT * 
  FROM USER_SEQUENCES ;
  
 DROP SEQUENCE SEQ_DEPT_SEQUENCE
 ;
 
/* 동의어 */

CREATE SYNONYM E
   FOR EMP;
   
SELECT * FROM E
;

DROP SYNONYM E;

CREATE TABLE EMPIDX AS
       SELECT * FROM EMP; 
       
CREATE INDEX IDX_EMPIDX_EMP_NO
        ON EMPIDX(EMPNO);
        
SELECT INDEX_NAME 
  FROM USER_INDEXES
 WHERE INDEX_NAME = 'IDX_EMPIDX_EMP_NO'
  ;
  
 CREATE OR REPLACE VIEW EMPIDX_OVER15K
                   AS (SELECT EMPNO
                         , ENAME
                         , JOB
                         , DEPTNO
                         , SAL
                         , NVL2(COMM,'O', 'X') AS COMM
                      FROM EMPIDX 
                     WHERE SAL > 1500  
                         
                     );
                     
SELECT * 
    FROM EMPIDX_OVER15K        
    
CREATE TABLE DEPTSEQ
          AS SELECT * FROM DEPT
          ;
          
CREATE SEQUENCE SEQ_DEPTSEQ
         START WITH 1
         INCREMENT BY 1
         MAXVALUE 99
         MINVALUE 1
         NOCYCLE
         NOCACHE 
         ;
        
INSERT  INTO DEPTSEQ (DEPTNO , DNAME , LOC  ) 
       VALUES (SEQ_DEPTSEQ.nextval, 'MOBILE' , 'ILSAN')
    ;
   
   
SELECT * FROM DEPTSEQ;
          
 