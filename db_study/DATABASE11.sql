
/*PLSQL*/
SET SERVEROUTPUT ON; --실행 겨로가를 화면에 출력


--PL/SQL 블록을 구성하는 DECLARE,BEGIN, EXCIPTION 키워드에는 세미콜론을 사용하지 않는다
--PL/SQL 블록의 각 부분에서 실행해야하는 문장 끝네는 세이콜론을 사용 EX) DBMS_OUTPUT.PUT_LINE('HELLO,PL/SQL!');
--PL/SQL 문 내부에서 한줄 주석과 여러줄 주석을 사용할 수 있음 그리고 이들 주석은 SQL문에서도 사용 가능
--PL/SQL 문 작성을 마치고 실행하기위해 마지막에 슬래시/를 사용함(하지만 응요프로그램에서는 슬레시를 사용하지 않고 PL/SQL 을 사용가능함)
BEGIN 
 DBMS_OUTPUT.PUT_LINE('HELLO,PL/SQL!');
END;


DECLARE 
V_EMPNO NUMBER(4) :=7788;
V_ENAME VARCHAR2(10);
BEGIN 
	V_ENAME :='SCOTT';
-- DBMS_OUTPUT.PUT_LINE('V_EMPNO : '|| V_EMPNO);
   DBMS_OUTPUT.PUT_LINE('V_ENAME :' || V_ENAME);
END
;
-- 변수 변하는 값 
-- 상수 변하지 않는 값 CONSTANT

-- 변수
DECLARE 
V_EMPNO NUMBER(4) :=7788;
V_ENAME VARCHAR2(10);
BEGIN 
   V_ENAME :='SCOTT';
   DBMS_OUTPUT.PUT_LINE('V_EMPNO : '|| V_EMPNO);
   DBMS_OUTPUT.PUT_LINE('V_ENAME :' || V_ENAME);
END
;

-- 상수
DECLARE 
  V_TAX CONSTANT NUMBER(1) := 3;
BEGIN 
	DBMS_OUTPUT.PUT_LINE('V_TAX :' || V_TAX);
END
;

--변수의 기본값 지정하기
DECLARE
 V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_DEPNO :' || V_DEPTNO);
END
;

--변수의 NULL 값 저장 막기
DECLARE
 V_DEPTNO NUMBER(2) NOT NULL :=10;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_DEPNO :' || V_DEPTNO);
END
;

--변수의 NOT NULL 및 기본값을 설정하 후 출력하기 
DECLARE
 V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
	DBMS_OUTPUT.PUT_LINE('V_DEPNO :' || V_DEPTNO);
END
;

--변수 이름 정하기 
/*
 * 1.같은 블록알에서 식별자는 고유해야 하며 중복될 수 없다 
 * 2.대 소분자를 구별하지 않는다
 * 	이름은 문자로 시작해야된다 (한글도 가능하며 숫자로 시작할 수 없음)
 *  이름은 30BYTE 이하여야 함다 (영어는 30자 한근은 15자 까지 사용가능)
 *  이름은 영문자(한글 가능) 숫자 (0-9), 특주문자 ($,#,_)를 사용할수있다
 *  SQL 키워드는 테이블 이름으로 사용할 수 없다 (SELECT, FROM 등은 테이블 이름으로 사용 불가 )'
 *   
 * */

/*변수의 자료형*/
--변수에 저잘할 데이터가 어떤 종류인지를 특정 짓기 위해 사용하는 자료형은 
--크게 스칼라 복함 참조 LOB 형으로 구분 

/* 스칼라형 */
--숫자, 문자열 , 날짜등과 같이 오라클에서 기본으로 정의해 놓은 자료형으로 내부 구성요가 없는 단일 값을 의미
--자바의 원시 자료형과 유사

/*참조형*/
-- 오라클 데이터베이스에 존재하는 특정 테이블의 열의 자료형이나 하나의 행 구조를 참조하는 자료형 
-- 열을 참조할 때 %TYPE , 행을 참조할때 %ROWTYPE을 사용함

/*하나의 열 구조를 참조할 때 = 변수이름 테이블 이름.열이름%TYPE;*/
DECLARE
 V_DEPTNO DEPT.DEPTNO%TYPE :=50;
BEGIN 
	DBMS_OUTPUT.PUT_LINE('V_DEPTNO ::' || V_DEPTNO);
END
;

/*하나의 행 구조 전체를 참조할 때 = 변수이름 테이블 이름%ROWTYPE*/
DECLARE
  V_DEPT_ROW DEPT%ROWTYPE;
BEGIN 
 SELECT DEPTNO
      , DNAME
      , LOC 
   INTO V_DEPT_ROW
    FROM DEPT
   WHERE DEPTNO = 40
  ;
   
  DBMS_OUTPUT.PUT_LINE('DEPTNO ::' || V_DEPT_ROW.DEPTNO);
  DBMS_OUTPUT.PUT_LINE('DNAME ::'  || V_DEPT_ROW.DNAME);
  DBMS_OUTPUT.PUT_LINE('DNAME ::'  || V_DEPT_ROW.LOC);
END
;

/*IF 조건문 */

--IF 조건식 THEN 수행할 명령어; END IF;
DECLARE 
  V_NUMBER NUMBER :=13;
 BEGIN 
	 IF MOD(V_NUMBER,2) = 1 THEN 
	 DBMS_OUTPUT.PUT_LINE('V_NUMBER은 홀수 입니다.');
	 END IF;
 END
;

--IF 조건식 THEN 수행할 명령어; ELSE 수행할 명령서 ; END IF;
DECLARE 
  V_NUMBER NUMBER :=14;
 BEGIN 
	 IF MOD(V_NUMBER,2) = 1 THEN 
	 DBMS_OUTPUT.PUT_LINE('V_NUMBER은 홀수 입니다.');
	 ELSE 
	 DBMS_OUTPUT.PUT_LINE('V_NUMBER은 짝수 입니다.');
	 END IF;
 END
;

--IF 조건식 THEN 수행할 명령어; ELSIF 조건식 THEN 수행할 명령서 ; .... ELSE 수행할 명령서; END IF;

DECLARE 
  V_SCORE NUMBER :=87;
  BEGIN 
	  IF V_SCORE >=90 THEN DBMS_OUTPUT.PUT_LINE('A 학점');
	  ELSIF V_SCORE >=80 THEN DBMS_OUTPUT.PUT_LINE('B 학점');
	  ELSIF V_SCORE >=70 THEN DBMS_OUTPUT.PUT_LINE('C 학점');
	  ELSIF V_SCORE >=60 THEN DBMS_OUTPUT.PUT_LINE('D 학점');
	  ELSE  DBMS_OUTPUT.PUT_LINE('F 학점');
	  END IF;
  END
  ;
  
/*CASE 문*/ 

-- 단순 케이스 문 CASE 비교기준 WHEN 값1 THEN 수행할 명령어; WHEN 값2 THEN 수행할 명령어; ...ELSE 수행할 명령어; END CASE;
DECLARE 
  V_SCORE NUMBER :=87;
BEGIN 
  CASE TRUNC(V_SCORE/10)
    WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A학점');
    WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A학점');
    WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B학점');
    WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C학점');
    WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D학점');
    ELSE DBMS_OUTPUT.PUT_LINE('F학점');
    END CASE;
 END
 ;

-- 검색 케이스 문 CASE WHEN 조건식 THEN 수행할 명령어; WHEN 조건식 THEN 수행할 명령어; ...ELSE 수행할 명령어; END CASE;

DECLARE 
  V_SCORE NUMBER :=87;
BEGIN 
  CASE 
    WHEN V_SCORE>=90 THEN DBMS_OUTPUT.PUT_LINE('A학점');
    WHEN V_SCORE>=80 THEN DBMS_OUTPUT.PUT_LINE('B학점');
    WHEN V_SCORE>=70 THEN DBMS_OUTPUT.PUT_LINE('B학점');
    WHEN V_SCORE>=60 THEN DBMS_OUTPUT.PUT_LINE('C학점');
    ELSE DBMS_OUTPUT.PUT_LINE('F학점');
    END CASE;
 END
 ;
/*반복 제어문*/

--기본 LOOP 기본 반복문
--WHILE LOOP 특정 조건식의 결고를 통해 반복 수행
--FOR LOOP 반복 횟수를 정하여 반복 수행
--CUSOR FOR LOOP 커서를 활용한 반복 수행

-- EXIT 수행 중인 반복 종료
-- EXIT-WHEN 반복 종료를 위한 조건식을 지정하고 만족하면 반복 종료
-- CONTINUE 수행 중인 반복의 현재 주기를 건너뜀
-- CONTINUE - WHEN 특정 조건식을 지정하고 조건식을 만족하면 현재 반복주기를 건너뜀

--기본 LOOP문 LOOP 반복수행 작업; END LOOP;

DECLARE 
  V_NUM NUMBER :=0;
 BEGIN 
  	LOOP 
	   DBMS_OUTPUT.PUT_LINE('현재 V_NUM ::' || V_NUM);
	   V_NUM := V_NUM +1;
	   EXIT WHEN V_NUM > 4;
  	END LOOP;
 END
;

DECLARE 
  V_NUM NUMBER :=0;
 BEGIN 
  	LOOP 
	   DBMS_OUTPUT.PUT_LINE('현재 V_NUM ::' || V_NUM);
	   V_NUM := V_NUM +1;
	   IF V_NUM > 4 THEN
	      EXIT;
	   END IF;
  	END LOOP;
 END
;

--WHILE LOOP 문 WHILE 조건식 LOOP 반복 수행 작업; END LOOP;
DECLARE 
   V_NUM NUMBER :=0;
   BEGIN 
	  WHILE V_NUM < 4 LOOP
	      DBMS_OUTPUT.PUT_LINE('현재 V_NUM ::' || V_NUM);
	  V_NUM := V_NUM + 1;
	  END LOOP;
   END
 ;
 
-- FOR LOOP 문 FOR i IN 시작 값 .. 종료 값 LOOP 반복 수행 작업; END_LOOP;

BEGIN 
  FOR i IN 0 .. 4 LOOP
    DBMS_OUTPUT.PUT_LINE('현재 i의 값  :' || i);
  END LOOP;
END
;

-- 역순으로 반복하고 싶으면 

BEGIN 
  FOR i IN REVERSE 0 .. 4 LOOP
    DBMS_OUTPUT.PUT_LINE('현재 i의 값  :' || i);
  END LOOP;
END
;

-- CONTINUE, CONTINUE-WEHN 분기 처리 

BEGIN 
  FOR i IN 0 .. 4 LOOP
    CONTINUE WHEN MOD(i,2) = 1;
    DBMS_OUTPUT.PUT_LINE('현재 i의 값  :' || i);
  END LOOP;
END
;

BEGIN 
  FOR i IN 1 .. 10 LOOP
  	IF MOD(i,2)=1 THEN DBMS_OUTPUT.PUT_LINE('현재 i의 값  :' || i);
    END IF;
  END LOOP; 
END
;

DECLARE
   V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
   CASE V_DEPTNO
      WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ACCOUNTING');
      WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('DNAME : RESEARCH');
      WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('DNAME : SALES');
      WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('DNAME : OPERATIONS');
      ELSE         DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
   END CASE;
END
;
  