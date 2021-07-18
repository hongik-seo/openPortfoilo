--프로시져 생성하기 
CREATE OR REPLACE PROCEDURE pro_noparam

IS 
    V_EMPNO NUMBER(4) :=7788;
    V_ENAME VARCHAR2(10);
    
   BEGIN 
	   V_ENAME := 'SCOTT';
	   DBMS_OUTPUT.PUT_LINE('V_EMPNO: ' || V_EMPNO);
	   DBMS_OUTPUT.PUT_LINE('V_ENAME: ' || V_ENAME);
   END;

  
  
  --프로시져 생성하기
  -- EXEC pro_noparam; sqlplus 에서 가능
  
  BEGIN
	  pro_noparam;
  END;
 
  --프로시져 내용 확인하기
 
  SELECT * 
    FROM USER_SOURCE
   WHERE NAME = 'PRO_NOPARAM'
  ;
 --프로시저 삭제하기
 DROP PROCEDURE PRO_NOPARAM
 ;
  
 /*파라미터를 사용하는 프로시져*/

 CREATE OR REPLACE PROCEDURE PRO_PARAM_IN(
 	PARAM1 IN NUMBER,
 	PARAM2 NUMBER ,
 	PARAM3 NUMBER :=3,
 	PARAM4 NUMBER DEFAULT 4
 	
 )
 
 IS 
 
 BEGIN 
	
	 DBMS_OUTPUT.PUT_LINE('PARAM1: ' || PARAM1);
	 DBMS_OUTPUT.PUT_LINE('PARAM2: ' || PARAM2);
	 DBMS_OUTPUT.PUT_LINE('PARAM3: ' || PARAM3);
	 DBMS_OUTPUT.PUT_LINE('PARAM4: ' || PARAM4);
	 
 END
 ;
 
 BEGIN 
	 PRO_PARAM_IN(1,2,9,8);
 END
 ;
 
 -- PARAM3 , PARAM4 는 디폴트값이 생성되어있어서 1,2번 파라미터에 값이 순서대로 출력되고 3,4는 디폴트 값으로 출력됨
 BEGIN 
	 PRO_PARAM_IN(1,2);
 END
 ;
 
-- 오류 발생
 BEGIN 
	 PRO_PARAM_IN(1,2);
 END
 ;

-- 참고사항
-- 순서가 섞여있으면 기본값이 지정되지 않은 파라미터까지 값을 입력해 주어야 한다 . 최소 3개의 값을 입력해야함
/*
(
 	PARAM1 IN NUMBER,
 	PARAM3 NUMBER :=3,
 	PARAM2 NUMBER ,
 	PARAM4 NUMBER DEFAULT 4
 	
 )
*/

--파라미터 이름을 활용하여 프로시저에 값 입력하기 

BEGIN 
  PRO_PARAM_IN (PARAM1=>10 , PARAM2=> 20);
END
;

--OUT 모드 파라미터
--값을 대입받아 OUT 파라미터의 값은 반환

CREATE OR REPLACE PROCEDURE PRO_PARAM_OUT 
(

 IN_EMPNO IN EMP.EMPNO%TYPE,
 OUT_ENAME OUT EMP.ENAME%TYPE,
 OUT_SAL OUT EMP.SAL%TYPE

)
IS 

BEGIN 
	SELECT ENAME
	     , SAL
	     INTO OUT_ENAME, OUT_SAL
	  FROM EMP 
	 WHERE EMPNO= IN_EMPNO;
END PRO_PARAM_OUT
;

DECLARE
 V_ENAME EMP.ENAME%TYPE;
 V_SAL   EMP.SAL%TYPE;
 
BEGIN 
	PRO_PARAM_OUT(7788, V_ENAME, V_SAL);
	DBMS_OUTPUT.PUT_LINE('ENAME: ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL: ' || V_SAL);
END
;

--IN OUT 모드 파라미터
--값을 입력받을 때와 프로시저를 수행 후 결과 값을 반환할 때 사용

CREATE OR REPLACE PROCEDURE PRO_PARAM_INOUT
(

 INOUT_NO IN OUT NUMBER 

)

IS 

BEGIN 
	
	INOUT_NO := INOUT_NO *2;

END PRO_PARAM_INOUT
;


DECLARE 
 NO_NUM NUMBER;
 
BEGIN 
	NO_NUM := 5;
    PRO_PARAM_INOUT(NO_NUM);
    DBMS_OUTPUT.PUT_LINE('NO_NUM: ' || NO_NUM);
END
;
