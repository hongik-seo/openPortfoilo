/* 자료형이 다른 여러 데이터를 저장하는 레코드 */

--레코드는 자료형이 다른 테이터를 하나의 변수에 저장하는데 사용
-- TYPE 레코드 이름 IS RECODE( 변수이름 자료형 NOT NULL := ( 또는 DEFAULT ) 값 또는 값이 도출되는 여러 표현식 )
-- 클래스의 개념과 비슷
DECLARE 
  TYPE REC_DEPT IS RECORD (
	  deptno 	NUMBER(2) NOT NULL :=99
    , dname 	DEPT.DNAME%TYPE
    , loc   	DEPT.LOC%TYPE
 
  );
  dept_rec REC_DEPT;
 
 BEGIN 
	 dept_rec.deptno := 99;
	 dept_rec.dname := 'DATABASE';
	 dept_rec.loc := 'SEOUL';
	 DBMS_OUTPUT.PUT_LINE('DEPTNO :' ||  dept_rec.deptno);
	 DBMS_OUTPUT.PUT_LINE('DNAME :' ||  dept_rec.dname);
	 DBMS_OUTPUT.PUT_LINE('LOC :' ||  dept_rec.loc);
 END
 ;

 --레코드를 사용한 INSERT 
CREATE TABLE DEPT_RECORD
          AS SELECT * FROM DEPT;
    
DECLARE 
  TYPE REC_DEPT IS RECORD(
  
  		deptno 	NUMBER(2) := 99
  	  , dname 	DEPT.DNAME%TYPE
  	  , loc   	DEPT.LOC%TYPE
 
  );
  
  dept_rec REC_DEPT;
  
 BEGIN 
	 dept_rec.deptno :=99;
	 dept_rec.dname := 'DATABASE';
	 dept_rec.loc := 'SEOUL';
	
	INSERT INTO DEPT_RECORD 
	VALUES dept_rec;
 END;
 

SELECT * FROM DEPT_RECORD;

-- 레코드를 사용한 업데이트 
DECLARE 
    TYPE REC_DEPT IS RECORD(
		deptno NUMBER(2) NOT NULL :=99
	  , dname  DEPT.DNAME%TYPE
	  , loc    DEPT.LOC%TYPE
   );
  
   dept_rec REC_DEPT;
 
 BEGIN 
	 dept_rec.deptno :=50;
	 dept_rec.dname := 'DB';
	 dept_rec.loc  := 'SEOUL';
	 
	UPDATE DEPT_RECORD 
	SET ROW = dept_rec
	WHERE DEPTNO = 99
	;
 END
 ;
 
SELECT * FROM DEPT_RECORD;

--레코드를 포함한 레코드(중첩레코드) 
DECLARE 
  TYPE REC_DEPT IS RECORD( 
     deptno DEPT.DEPTNO%TYPE
   , dname  DEPT.DNAME%TYPE
   , loc    DEPT.LOC%TYPE
  );

  TYPE REC_EMP IS RECORD(
  	empno EMP.EMPNO%TYPE
  , ename EMP.ENAME%TYPE
  , dinfo REC_DEPT
  
  );
  
  emp_rec REC_EMP;
 
 BEGIN 
	SELECT E.EMPNO
	     , E.ENAME
	     , E.DEPTNO
	     , D.DNAME
	     , D.LOC
	     
	     INTO emp_rec.empno 
	         ,emp_rec.ename
	         ,emp_rec.dinfo.deptno
	         ,emp_rec.dinfo.dname
	         ,emp_rec.dinfo.loc
	     FROM EMP E, DEPT D
	    WHERE E.DEPTNO = D.DEPTNO
	      AND E.EMPNO =7788;
	    
	    DBMS_OUTPUT.PUT_LINE('EMPNO :' ||  emp_rec.empno);
	 	DBMS_OUTPUT.PUT_LINE('ENAME :' ||  emp_rec.ename);
	 	
	 	DBMS_OUTPUT.PUT_LINE('DEPTNO :' || emp_rec.dinfo.deptno);
		DBMS_OUTPUT.PUT_LINE('DNAME :'  ||  emp_rec.dinfo.dname);	
	    DBMS_OUTPUT.PUT_LINE('LOC :'  ||  emp_rec.dinfo.loc);	
 END
 ;

/* 자료형이 같은 여러 데이터를 저장하는 컬렉션 */
-- 컬렉션은 특정 자료형의 데이터를 여러 개 저장하는 복합 자료형
-- 여러종류의 데이터를 하나로 묶어 사용하는 레코드를 테이블의 한 행처럼 사용(ROW)
-- 컬랙션을 열 또는 테이블과 같은 형태로 사용(COL)
-- 연관 배열
-- 중첩 테이블
-- VARRAY

/*연관 배열*/
-- 잍덱스로 불리는 키 벨류로 구성
-- TYPE 연관배열 이름 IS TABLE OF 자료형 [NOT NULL] INDEX BY 인덱스형;

DECLARE 
  TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
  
  arr ITAB_EX;
 
BEGIN	
	arr(1) :='1st';
   	arr(2) :='2st';
    arr(3) :='3st';
    arr(4) :='4st';
	
   	DBMS_OUTPUT.PUT_LINE('arr(1)' || arr(1));
  	DBMS_OUTPUT.PUT_LINE('arr(2)' || arr(2));
    DBMS_OUTPUT.PUT_LINE('arr(3)' || arr(3));
    DBMS_OUTPUT.PUT_LINE('arr(4)' || arr(4));
END
;


/*테스트 for 문
DECLARE 
  TYPE ITAB_EX IS TABLE OF VARCHAR2(10) INDEX BY PLS_INTEGER;
  
  arr ITAB_EX;
  idx number(2) :=0;
 
BEGIN	
	
	FOR i IN 1 .. 4 LOOP
	
	arr(idx) := idx+i; 
	
	DBMS_OUTPUT.PUT_LINE(arr(idx) ||'st');
  	
	END LOOP;  
	  
END
;
*/

--레코드를 활용한 연관 배열 (%ROWTYPE 사용안하고 )
DECLARE 
  TYPE REC_DEPT IS RECORD (
  
  	deptno DEPT.DEPTNO%TYPE
  , dname  DEPT.DNAME%TYPE

  );
  
  TYPE ITAB_DEPT IS TABLE OF REC_DEPT INDEX BY PLS_INTEGER;
  
  dept_arr ITAB_DEPT;
  idx PLS_INTEGER :=0;
  
 BEGIN 
	 FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP 
	 
	 idx := idx+1;
	
	 dept_arr(idx).deptno :=i.DEPTNO;
	 dept_arr(idx).dname := i.DNAME;
	
	 DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ':' || dept_arr(idx).dname  );

	 END LOOP;
 END
 ;
 


--레코드를 활용한 연관 배열 (%ROWTYPE 사용하고 )
DECLARE 
  
  TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE INDEX BY PLS_INTEGER;
  
  dept_arr ITAB_DEPT;
  idx PLS_INTEGER :=0;
  
 BEGIN 
	 FOR i IN (SELECT * FROM DEPT) LOOP 
	 
	 idx := idx+1;
	
	 dept_arr(idx).deptno :=i.DEPTNO;
	 dept_arr(idx).dname := i.DNAME;
	 dept_arr(idx).loc := i.LOC;
	
	 DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ':' || dept_arr(idx).dname || ':' || dept_arr(idx).loc );

	 END LOOP;
 END
 ;

--컬렉션 메서드 
DECLARE
  TYPE ITAB_EX IS TABLE OF VARCHAR(20) INDEX BY PLS_INTEGER;
 	text_arr ITAB_EX;
 BEGIN 
	 text_arr(1) :='1st data';
	 text_arr(2) :='2nd data';
	 text_arr(3) :='3rd data';
	 text_arr(50) :='50th data';
	
	 DBMS_OUTPUT.PUT_LINE( 'text_arr.COUNT ::' || text_arr.COUNT  );
	 DBMS_OUTPUT.PUT_LINE( 'text_arr.FIRST ::' || text_arr.FIRST  );
	 DBMS_OUTPUT.PUT_LINE( 'text_arr.LAST ::' || text_arr.LAST  );
	 DBMS_OUTPUT.PUT_LINE( 'text_arr.PRIOR(50) ::' || text_arr.PRIOR(50));
	 DBMS_OUTPUT.PUT_LINE( 'text_arr.NEXT(50) ::' || text_arr.NEXT(50));
 END
 ;

CREATE TABLE EMP_RECORD
          AS SELECT * FROM EMP;

SELECT * FROM EMP_RECORD;
         
DECLARE
  TYPE EMP_REC IS RECORD(
 
  	empno  NUMBER(4) NOT NULL := 1111
  , ename 		EMP.ENAME%TYPE
  , job   		EMP.JOB%TYPE
  , mgr   		EMP.MGR%TYPE
  , hiredate    EMP.HIREDATE%TYPE
  , sal         EMP.SAL%TYPE
  , comm   	    EMP.COMM%TYPE
  , deptno      EMP.DEPTNO%TYPE
  );
	
 rec_emp EMP_REC;

BEGIN 
	
	rec_emp.empno :=1111;
    rec_emp.ename :='TEST_USER';
    rec_emp.job :='TEST_JOB';
    rec_emp.mgr :=NULL;
    rec_emp.hiredate := TO_DATE('18/03/01','YY/MM/DD')  ;
    rec_emp.sal := NULL;
	rec_emp.comm :=3000;
	rec_emp.deptno :=40;
	
	INSERT INTO  EMP_RECORD ( empno
	                        , ename
	                        , job
	                        , mgr
	                        , hiredate
	                        , sal
	                        , comm
	                        , deptno
	                        )
	       			VALUES (  rec_emp.empno
	       					, rec_emp.ename
	       					, rec_emp.job
	       					, rec_emp.mgr
	       					, rec_emp.hiredate
	       					, rec_emp.sal
	       					, rec_emp.comm
	       					, rec_emp.deptno
	       			       );
	
END
;
 
SELECT * FROM EMP_RECORD;
 
DECLARE 
  TYPE EMP_REC IS RECORD (
 
   	empno       EMP.EMPNO%TYPE
  , ename 		EMP.ENAME%TYPE
  , job   		EMP.JOB%TYPE
  , mgr   		EMP.MGR%TYPE
  , hiredate    EMP.HIREDATE%TYPE
  , sal         EMP.SAL%TYPE
  , comm   	    EMP.COMM%TYPE
  , deptno      EMP.DEPTNO%TYPE
  );
  TYPE EMP_COLLECTION IS TABLE OF EMP_REC INDEX BY PLS_INTEGER;
 
  emp_arr EMP_COLLECTION;
  idx  NUMBER(7) :=0;
  

  BEGIN
	 
	 FOR i IN (SELECT * FROM EMP) LOOP
		idx :=idx+1;
	  emp_arr(idx).empno    := i.EMPNO;
      emp_arr(idx).ename    := i.ENAME;
      emp_arr(idx).job      := i.JOB;
      emp_arr(idx).mgr      := i.MGR;
      emp_arr(idx).hiredate := i.HIREDATE;
      emp_arr(idx).sal      := i.SAL;
      emp_arr(idx).comm     := i.COMM;
      emp_arr(idx).deptno   := i.DEPTNO;

      DBMS_OUTPUT.PUT_LINE(
         emp_arr(idx).empno     || ' : ' ||
         emp_arr(idx).ename     || ' : ' ||
         emp_arr(idx).job       || ' : ' ||
         emp_arr(idx).mgr       || ' : ' ||
         emp_arr(idx).hiredate  || ' : ' ||
         emp_arr(idx).sal       || ' : ' ||
         emp_arr(idx).comm      || ' : ' ||
         emp_arr(idx).deptno);
	 
	 END LOOP;	 
 END
 ;

