--커서 SQL문을 처리하는 정보를 저장한 메모리공간
--메모리 공간은 Private SQL Area라고 부르며 정확히 표현하면 커서는 이 메모리의 포인터를 말함
-- 커서를 사용하면 실행된 SQL문의 결과값을 사용할 수 있다.
--SELECT 문의 결과 값이 여러행으로 나왔을 때 각 행별로 특정작업을 수행하도록 기능을 구현하는것이 가능

/*SELECT INTO 방식*/

-- 조회되는 데이터가 단 하나의 행일 때 사용가능한 방식 
-- 커서는 결과 행이 하나이든 여러개이든 상관없이 사용 가능 
-- SELECT 절과 INTO 절의 개수와 자료형이 일치해야함
-- WHERE GROUP BY 절도 사용가능

DECLARE 
  V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
	SELECT DEPTNO, DNAME , LOC INTO V_DEPT_ROW 
	FROM DEPT 
	WHERE DEPTNO=40;
    DBMS_OUTPUT.PUT_LINE('DEPTROW :' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME :' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC :' || V_DEPT_ROW.LOC);
END
;

--명시적 커서
--사용자가 직접 커서를 선언하고 사용하는 커서

--단일행
DECLARE
--커서 데이터를 입력할 변수 선언
V_DEPT_ROW DEPT%ROWTYPE;
--명시적 커서 선언 
CURSOR C1 IS 
SELECT DEPTNO
     , DNAME
     , LOC
  FROM DEPT 
 WHERE DEPTNO =40
;

BEGIN 
	--커서열기(OPEN)
	OPEN C1;
	--커서로부터 읽어온 데이터 사용(FETCH)
	FETCH C1 INTO V_DEPT_ROW;
    DBMS_OUTPUT.PUT_LINE('DEPTROW :' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME :' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC :' || V_DEPT_ROW.LOC);
   
   --커서 닫기(CLOSE)
   CLOSE C1;
END
;

--다중행 LOOP
DECLARE
--커서 데이터를 입력할 변수 선언
V_DEPT_ROW DEPT%ROWTYPE;
--명시적 커서 선언 
CURSOR C1 IS 
SELECT DEPTNO
     , DNAME
     , LOC
  FROM DEPT;

BEGIN 
	--커서열기(OPEN)
	OPEN C1;

	LOOP 
	--커서로부터 읽어온 데이터 사용(FETCH)
	FETCH C1 INTO V_DEPT_ROW;

	EXIT WHEN C1%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('DEPTROW :' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME :' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC :' || V_DEPT_ROW.LOC);
   
   END LOOP;
   --커서 닫기(CLOSE)
   CLOSE C1;
END
;

--FOR LOOP문을 활용하여 커서 사용
DECLARE
-- 명시적 커서 선언

CURSOR C1 IS
SELECT DEPTNO
     , DNAME
     , LOC
  FROM DEPT;
  
BEGIN 
	-- 커서 FOR LOOP 시작  (자동 OPEN, FETCH, CLOSE)
	-- C1_REC = 루프 인덱스
	FOR C1_REC IN C1 LOOP
	DBMS_OUTPUT.PUT_LINE('DEPTROW :' || C1_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME :' || C1_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC :' || C1_REC.LOC);
    END LOOP;
    
END
;

--커서에 파라미터 사용하기 

DECLARE
 -- 커서 데이터를 입력할 변수 선언
V_DEPT_ROW DEPT%ROWTYPE;
--명시적 커서 선언
CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS 
    SELECT DEPTNO 
        ,  DNAME
        ,  LOC
      FROM DEPT 
     WHERE DEPTNO = P_DEPTNO;
    
    --10번 수서 처리를 위해 커서 사용
  BEGIN 
    OPEN  C1 (10);
	    LOOP 
	      
		    FETCH C1 INTO V_DEPT_ROW ;
			    EXIT WHEN C1%NOTFOUND;
			   
			   	DBMS_OUTPUT.PUT_LINE('DEPTROW :' || V_DEPT_ROW.DEPTNO);
			    DBMS_OUTPUT.PUT_LINE('DNAME :' || V_DEPT_ROW.DNAME);
			    DBMS_OUTPUT.PUT_LINE('LOC :' || V_DEPT_ROW.LOC);
	   
	    END LOOP;
  CLOSE C1;
 
  	OPEN  C1(20);
	   	LOOP
		  	FETCH C1 INTO V_DEPT_ROW ;
		    EXIT WHEN C1%NOTFOUND;	
	   
		   	DBMS_OUTPUT.PUT_LINE('DEPTROW :' || V_DEPT_ROW.DEPTNO);
		    DBMS_OUTPUT.PUT_LINE('DNAME :' || V_DEPT_ROW.DNAME);
		    DBMS_OUTPUT.PUT_LINE('LOC :' || V_DEPT_ROW.LOC);
	   
	    END LOOP;
  
   CLOSE C1;
  END
  ;
  
 --커서에 사용할 파라미터 입력받기 
DECLARE
 -- 사용자가 입력한 부서 번호를 저장하는 변수 선언
 v_deptno DEPT.DEPTNO%TYPE;

 CURSOR C1(p_deptno DEPT.DEPTNO%TYPE) IS 
   SELECT DEPTNO 
       ,  DNAME
       ,  LOC
     FROM DEPT 
    WHERE DEPTNO = p_deptno;
   
   BEGIN 
	  --INPUT_DEPTNO에 부서 번호 입력 받고 V_DEPTNO에 대입
	  v_deptno := 10; --SQLPLUS = &INPUT_DEPTNO;
	  --커서 FOR LOOP 시작 C1 커서에 V_DEPTNO  대입
     FOR c1_rec IN C1(v_deptno) 
        LOOP
            DBMS_OUTPUT.PUT_LINE('DEPTROW :' || c1_rec.DEPTNO);
		    DBMS_OUTPUT.PUT_LINE('DNAME :' || c1_rec.DNAME);
		    DBMS_OUTPUT.PUT_LINE('LOC :' || c1_rec.LOC);
	END LOOP;
   END
  ;
  
 -- 묵시적 커서 
 -- 오라클에서 자동으로 선언되는 커서 
 -- OPEN, FETCH, CLOSE를 지정하지 않는다 
 /*
  * SQL%NOTFOUND
  * SQL%FOUND
  * SQL%ROWCOUNT
  * SQL%ISOPEN
  * */
 
 --묵시적 커서의 속성 사용하기 
 BEGIN 
	UPDATE DEPT SET DNAME='DATABASE'
	WHERE DEPTNO =50;

	DBMS_OUTPUT.PUT_LINE ('갱신된 행의 수' || SQL%ROWCOUNT);

	IF(SQL%FOUND) THEN 
	  	DBMS_OUTPUT.PUT_LINE ('갱신된 행의 수 : true');
	ELSE 
	 	DBMS_OUTPUT.PUT_LINE ('갱신된 행의 수 :false');
	END IF;
	
	IF(SQL%ISOPEN) THEN 
	  	DBMS_OUTPUT.PUT_LINE ('커서 OPEN 여부 : true');
	ELSE 
	 	DBMS_OUTPUT.PUT_LINE ('커서 OPEN 여부 :false');
	END IF;
 END
 ;

 /*예외처리*/
--오류란 SQL 또는 PL/SQL이 정상 수행되지 못하는 상황을 오류라고 함
-- 문법이 잘못되었거나 오타로 인한 오류 (컴파일 오류, 문법 오류)
-- 명령문 실행중 발생한 오류 (런타임 오류, 실행 오류)

--예외 후자 즉 명령문 실행줄 발생한 오류

--예외가 발생하는 PL/SQL
DECLARE
    v_wrong NUMBER;
BEGIN 
	SELECT DNAME INTO v_wrong
	  FROM DEPT 
	 WHERE DEPTNO = 10;
END
;
  	
DECLARE
    v_wrong NUMBER;
BEGIN 
	SELECT DNAME INTO v_wrong
	  FROM DEPT 
	 WHERE DEPTNO = 10;
	EXCEPTION
	  WHEN VALUE_ERROR THEN 
	   DBMS_OUTPUT.PUT_LINE ('예외처리 : 수치 또는 값 오류 발생');
END
;     
     

DECLARE
    v_wrong NUMBER;
BEGIN 
	SELECT DNAME INTO v_wrong
	  FROM DEPT 
	 WHERE DEPTNO = 10;
	
	DBMS_OUTPUT.PUT_LINE ('예외가 발생하면 다음 문장은 실행되지 않습니다');
	EXCEPTION
	  WHEN VALUE_ERROR THEN 
	   DBMS_OUTPUT.PUT_LINE ('예외처리 : 수치 또는 값 오류 발생');
END
;

 /*EXCEPTION WHEN 예외 이름1[OR 예외이름2 ] THEN 예외 처리에 사용할 명령어; 
  WHEN 예외이름3 [OR 예외이름4] THEN  예외 처리에 사용할 명령어;
  WHEN OTHERS THEN 예외 처리에 사용할 명령어;
  */

-- 사전 정의된 예외 사용

DECLARE
    v_wrong NUMBER;
BEGIN 
	SELECT DNAME INTO v_wrong
	  FROM DEPT 
	 WHERE DEPTNO = 10;
	
	DBMS_OUTPUT.PUT_LINE ('예외가 발생하면 다음 문장은 실행되지 않습니다');
	EXCEPTION
		WHEN TOO_MANY_ROWS THEN 
		  	DBMS_OUTPUT.PUT_LINE ('예외처리 : 요구보다 많은 행 추출 오류 발생');
		WHEN VALUE_ERROR THEN 
	   		DBMS_OUTPUT.PUT_LINE ('예외처리 : 수치 또는 값 오류 발생');
	   	WHEN OTHERS THEN 
	   	   	DBMS_OUTPUT.PUT_LINE ('예외처리 : 사전 정의 외 오류 발생');
END
; 

--이름 없이 예외 사용
--만약 이름이 없는 내부 예외를 사용해야 한다면 이름을 직접 지정해야함
-- 선언부에서 오라클 예외 번호와 함께 이름을 붙임
-- 이름이 정해진 예외는 사전 정의된 예외를 사용할 때와 마찬가지로 예외 처리부에서 지정한 이름으로 
-- 예외 핸들어에 작성

/* --이름이 없는 예외 사용
DECLARE
  예외이름1 EXCEPTION;
   PRAGMA EXCEPTION_INIT(예외이름1, 예외번호);
.
.
.
 WHEN 예외이름1 TEHN 
     예외 처리에 사용할 명령어;

END;
**/


/* --사용자 정의 예외 사용
DECLARE
  사용자 예외 이름 EXCEPTION;
   ...
  
  BEGIN 
    IF 사용자 예외를 발생시킬 조건 THEN 
    	RAISE 사용자 예외 이름;
    END IF;
   ...
   EXCEPTION 
   		WHEN 사용사 예외 이름 THEN 
   			예외 처리에 사용할 명령어;
END;
**/

/* --오직 PL/SQL에서만 사용가능 일반 SQL에서는 사용불가
 * 오류 코드와 오류 메시지 사용
 * 함수 SQLCODE : 오류 번호를 반환하는 함수
 * 함수 SQLERRM : 오류  메시지를 반환하는 함수
 * */

--오류코드와 오류 메시지 사용하기
DECLARE
    v_wrong NUMBER;
BEGIN 
	SELECT DNAME INTO v_wrong
	  FROM DEPT 
	 WHERE DEPTNO = 10;
	
	DBMS_OUTPUT.PUT_LINE ('예외가 발생하면 다음 문장은 실행되지 않습니다');
	EXCEPTION 
	 WHEN OTHERS THEN 
	 	DBMS_OUTPUT.PUT_LINE ('예외처리 : 사전 정의 외 오류 발생');
		DBMS_OUTPUT.PUT_LINE ('SQLCODE ::' || TO_CHAR(SQLCODE));
		DBMS_OUTPUT.PUT_LINE ('SQLERRM ::' || SQLERRM);
END
;

--LOOP를 사용한 방식(없는 컬럼이 있어서 동작안됨-- 컬럼 하나라도 빠지면 안됨 ROWTYPE))
DECLARE 
  V_EMP_ROW EMP%ROWTYPE;
  CURSOR C1 IS 
   SELECT *
     FROM EMP;
 BEGIN 
	 OPEN C1;
	 LOOP
	 FETCH C1 INTO V_EMP_ROW;
	 	EXIT WHEN C1%NOTFOUND;
	 
	 DBMS_OUTPUT.PUT_LINE ('EMPNO ::' || V_EMP_ROW.EMPNO );
	 DBMS_OUTPUT.PUT_LINE ('ENAME ::' || V_EMP_ROW.ENAME );
	 DBMS_OUTPUT.PUT_LINE ('JOB ::' || V_EMP_ROW.JOB );
	 DBMS_OUTPUT.PUT_LINE ('SAL ::' || V_EMP_ROW.SAL );
	 DBMS_OUTPUT.PUT_LINE ('DEPTNO ::' || V_EMP_ROW.DEPTNO );
		
	 END LOOP;
	
	 CLOSE C1;
 END
 ;
 

DECLARE 
   V_EMP EMP%ROWTYPE;
  
   CURSOR C1 IS 
   SELECT *
     FROM EMP
     ;

    BEGIN 
	   
	   FOR i IN C1 LOOP
	   
	   EXIT WHEN C1%NOTFOUND;
	  
	  	 DBMS_OUTPUT.PUT_LINE ('EMPNO ::' || i.EMPNO );
		 DBMS_OUTPUT.PUT_LINE ('ENAME ::' || i.ENAME );
		 DBMS_OUTPUT.PUT_LINE ('JOB ::' || i.JOB );
		 DBMS_OUTPUT.PUT_LINE ('SAL ::' || i.SAL );
	 	 DBMS_OUTPUT.PUT_LINE ('DEPTNO ::' || i.DEPTNO );
	   
	   END LOOP;
	  
    END 
    ;
    
   
   DECLARE 
     V_WRONG DATE;
     

    BEGIN 
	    SELECT ENAME INTO V_WRONG FROM EMP WHERE EMPNO = 7369;
	   	DBMS_OUTPUT.PUT_LINE ('예외가 발생하면 다음 문장은 실행되지 않습니다');
		EXCEPTION 
	 	WHEN  OTHERS THEN
	 	DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다.' || TO_CHAR(SYSDATE, '[YYYY"년"MM"월"DD"일" HH24"시"mm"분"SS"초"]'));
		DBMS_OUTPUT.PUT_LINE ('SQLCODE ::' || TO_CHAR(SQLCODE));
		DBMS_OUTPUT.PUT_LINE ('SQLERRM ::' || SQLERRM);   
    END
    ;
    