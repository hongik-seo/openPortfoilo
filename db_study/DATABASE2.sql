/*
단일행 함수 
*/


--채워라
--10자리를
--원래 문자열을 제외하고 
SElECT 'Oracle'
     , LPAD('Oracle',10,'#') AS LPAD_1
     , RPAD('Oracle',10,'*') AS RPAD_1
     , LPAD('Oracle',10) AS LPAD_2
     , RPAD('Oracle',10) AS RPAD_2
  FROM DUAL
  ;
  
SELECT RPAD('917125-',14,'*') AS RPAD_JIMO
      ,RPAD ('010-1234-',13,'*') AS RPAD_PHONE
  FROM DUAL 
  ;


SELECT CONCAT(EMPNO, ENAME)
     , CONCAT(EMPNO, CONCAT(':',ENAME) )
  FROM EMP
 WHERE ENAME='SCOTT'
 ;
 
--CONCAT 과 같음
SELECT EMPNO || ENAME
     , EMPNO || ':' || ENAME 
 FROM EMP
WHERE ENAME='SCOTT'
;  


--공백제거 
--LEADING FROM 앞
--TRAILING FROM 뒤
--BOTH FROM 양쪽
SELECT '[' || TRIM('   _ _ORACLE_ _   ') || ']' AS TRIM
     , '[' || TRIM(LEADING FROM '   _ _ORACLE_ _   ') || ']' AS TRIM_LEADING
     , '[' || TRIM(TRAILING FROM '   _ _ORACLE_ _   ') || ']' AS TRIM_TRALING
     , '[' || TRIM(BOTH FROM '   _ _ORACLE_ _   ') || ']' AS TRIM_BOTH
  FROM DUAL
;   

-- _제거 (_이전에 공백이있으면 작동안함)
--LEADING FROM 앞
--TRAILING FROM 뒤
--BOTH FROM 양쪽
SELECT '[' || TRIM('_ _ORACLE_ _') || ']' AS TRIM
     , '[' || TRIM(LEADING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_LEADING
     , '[' || TRIM(TRAILING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_TRALING
     , '[' || TRIM(BOTH '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_BOTH
  FROM DUAL
; 

--LTRIM, RTRIM은 삭제한 문자열을 지적하지않으면 공백제거
--LTRIM, RTRIM은 삭제할 문자열을 여러개 지정하는게 가능

SELECT '[' || TRIM(' _ORACLE_ ')     || ']' AS TRIM
     , '[' || LTRIM(' _ORACLE_ ')    || ']' AS LTRIM
     , '[' || LTRIM('<_ORACLE_>' , '_<' ) || ']' AS LTRIM_2
     , '[' || RTRIM(' _ORACLE_ ')    || ']' AS RTRIM
     , '[' || RTRIM('<_ORACLE_>' , '>_' ) || ']' AS RTRIM_2
  FROM DUAL
  ; 


--소수점의 위치가 0  
SELECT  ROUND (1234.5678) AS ROUND 
      , ROUND (1234.5678,0) AS ROUND_0
      , ROUND (1234.5678,1) AS ROUND_1
      , ROUND (1234.5678,2) AS ROUND_2
      , ROUND (1234.5678,-1) AS ROUND_MINUS1
      , ROUND (1234.5678,-2) AS ROUND_MINUS2
  FROM DUAL
 ;    

--소수점의 위치가 0      
SELECT  TRUNC (1234.5678) AS TRUNC 
      , TRUNC (1234.5678,0) AS TRUNC_0
      , TRUNC (1234.5678,1) AS TRUNC_1
      , TRUNC (1234.5678,2) AS TRUNC_2
      , TRUNC (1234.5678,-1) AS TRUNC_MINUS1
      , TRUNC (1234.5678,-2) AS TRUNC_MINUS2
  FROM DUAL
 ;      
   
--CEIL 함수는 입력된 숫자에 가장 큰 정수를 반환 
--FLOOR 함수는 입력된 숫자에 가장 작은수를 반환   
SELECT CEIL(3.14) -- 4
     , FLOOR (3.14) -- 3
     , CEIL (-3.14) -- -3
     , FLOOR (-3.14) -- -4
  FROM DUAL
  ;

--나눈값의 나머지값을 반환
SELECT MOD(15,6) --3
     , MOD(10,2) --0
     , MOD(11,2) --1
  FROM DUAL
  ; 

SELECT SYSDATE AS NOW --오늘
     , SYSDATE -1 AS YESTERDAY --어제
     , SYSDATE +1 AS TOMORROW  --내일
  FROM DUAL  
  ; 

--ADD_MONTHS : 몇 개월 이후 날짜를 구함
SELECT SYSDATE --오늘 날짜
     , ADD_MONTHS(SYSDATE, 3) --오늘 날짜 MONTH+3  
  FROM DUAL 
  ;
   
SELECT EMPNO
     , ENAME 
     , HIREDATE
     , ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
  FROM EMP 
  ;

SELECT EMPNO
     , ENAME 
     , HIREDATE    
     , (SELECT 32*12 
                   FROM DUAL) 
  FROM EMP 
 WHERE ADD_MONTHS(HIREDATE, 384) >SYSDATE
  ;  
  
SELECT SYSDATE
     , ADD_MONTHS(SYSDATE,6)
  FROM DUAL 
 ;  
 
--MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이를 구함

SELECT EMPNO
     , ENAME
     , HIREDATE
     , SYSDATE
     , MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1
     , MONTHS_BETWEEN(SYSDATE,HIREDATE) AS MONTHS2
     , TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3
  FROM EMP
  ;   

--NEXT_DAY(날짜, 문자열 )
SELECT SYSDATE
     , NEXT_DAY(SYSDATE, '월요일')
     , LAST_DAY(SYSDATE)
  FROM DUAL
  ;


SELECT SYSDATE
     , ROUND(SYSDATE,'CC') AS FORMAT_CC
     , ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY
     , ROUND(SYSDATE,'Q') AS FORMAT_Q
     , ROUND(SYSDATE,'DDD') AS FORMAT_DDD
     , ROUND(SYSDATE,'HH') AS FORMAT_HH
  FROM DUAL
  ;   
     

SELECT SYSDATE
     , TRUNC(SYSDATE,'CC') AS FORMAT_CC
     , TRUNC(SYSDATE,'YYYY') AS FORMAT_YYYY
     , TRUNC(SYSDATE,'Q') AS FORMAT_Q
     , TRUNC(SYSDATE,'DDD') AS FORMAT_DDD
     , TRUNC(SYSDATE,'HH') AS FORMAT_HH
  FROM DUAL
  ;     
     
/*
형변환 함수
*/


DESC EMP;

SELECT EMPNO 
     , ENAME
     , EMPNO+'500' AS implicit_type_conversion
     , EMPNO + 500 
  FROM EMP 
 WHERE ENAME='SCOTT'
 ;
 
-- ERRO 수치가 부적적합니다  
-- 숫자데이터는 숫자로 바꿔 주지만 그외는 잘 동작하지 않음
SELECT 'ABCD' +EMPNO 
     , EMPNO
  FROM EMP
 WHERE ENAME ='SCOTT'
 ;
 
--해결법
SELECT TO_CHAR(EMPNO || 'ABCD')  
     , EMPNO
  FROM EMP
 WHERE ENAME ='SCOTT'
 ; 
 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
  FROM DUAL
  ;

--월과 요일을 다양한 형식으로 출력하기  
SELECT SYSDATE
     , TO_CHAR(SYSDATE,'MM') AS MM --05
     , TO_CHAR(SYSDATE,'MON') AS MON --5월
     , TO_CHAR(SYSDATE,'MONTH') AS MONTH_ --5월 
     , TO_CHAR(SYSDATE,'DD') AS DD --16
     , TO_CHAR(SYSDATE,'DY') AS DY --일
     , TO_CHAR(SYSDATE,'DAY') AS DAY_ --일요일
  FROM DUAL
  ; 
 
--특정 언어에 맞춰 날짜 출력하기 

--월 출력
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM') AS MM 
     , TO_CHAR(SYSDATE, 'MON' , 'NLS_DATE_LANGUAGE= KOREAN') AS MON_KOR
     , TO_CHAR(SYSDATE, 'MON','NLS_DATE_LANGUAGE= JAPANESE') AS MON_JPN
     , TO_CHAR(SYSDATE, 'MON','NLS_DATE_LANGUAGE= ENGLISH') AS MON_ENG
     , TO_CHAR(SYSDATE, 'MONTH','NLS_DATE_LANGUAGE= KOREAN') AS MONTH_KOR
     , TO_CHAR(SYSDATE, 'MONTH','NLS_DATE_LANGUAGE= JAPANESE') AS MONTH_JPN
     , TO_CHAR(SYSDATE, 'MONTH','NLS_DATE_LANGUAGE= ENGLISH') AS MONTH_ENG
  FROM DUAL
  ;
  
--일 출력
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM') AS MM 
     , TO_CHAR(SYSDATE, 'DD') AS DD
     , TO_CHAR(SYSDATE, 'DY' , 'NLS_DATE_LANGUAGE= KOREAN') AS DY_KOR
     , TO_CHAR(SYSDATE, 'DY','NLS_DATE_LANGUAGE= JAPANESE') AS DY_JPN
     , TO_CHAR(SYSDATE, 'DY','NLS_DATE_LANGUAGE= ENGLISH') AS DY_ENG
     , TO_CHAR(SYSDATE, 'DAY','NLS_DATE_LANGUAGE= KOREAN') AS DAY_KOR
     , TO_CHAR(SYSDATE, 'DAY','NLS_DATE_LANGUAGE= JAPANESE') AS DAY_JPN
     , TO_CHAR(SYSDATE, 'DAY','NLS_DATE_LANGUAGE= ENGLISH') AS DAY_ENG
  FROM DUAL
  ;  
  
SELECT SYSDATE
      ,TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS
      ,TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HH12MISS_AM
      ,TO_CHAR(SYSDATE, 'HH12:MI:SS P.M.') AS HHMISS_PM
      --,TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM --3번째와 같음
      --,TO_CHAR(SYSDATE, 'HH:MI:SS PM') AS HHMISS_PM --3번째와 같음
 FROM DUAL
 ;  
 
SELECT SAL
  FROM EMP
 WHERE ENAME='SCOTT'
 ; 

/*
9는 해당 자리의 숫자를 의미하고 값이 없을 경우 소수점 이상은 공백으로 소수점 이하는 0으로 표시한다. 
0은 해당 자리의 숫자를 의미하고 값이 없을 경우 0으로 표시하며 숫자의 길이를 고정적으로 표시 할 때 주로 사용한다.

*/
 
SELECT SAL 
     , TO_CHAR(SAL, '$999,999') AS SAL_$ --$3,000
     , TO_CHAR(SAL, 'L999,999') AS SAL_L --W3,000
     , TO_CHAR(SAL, '999,999.00') AS SAL_1 --3,000.00
     , TO_CHAR(SAL, '000,999,999.00') AS SAL_2 --000,003,000.00
     , TO_CHAR(SAL, '000999999.99') AS SAL_3   -- 000003000.00
     , TO_CHAR(SAL, '999,999,00') AS SAL_4   -- 30,00
   FROM EMP
  WHERE ENAME='SCOTT' 
    ;
     
     
SELECT SAL 
     , TO_CHAR(SAL, '$999,999') AS SAL_$ --$3,000
     , TO_CHAR(SAL, 'L999,999') AS SAL_L --W3,000
     , TO_CHAR(SAL, '999,999.00') AS SAL_1 --3,000.00
     , TO_CHAR(SAL, '000,999,999.00') AS SAL_2 --000,003,000.00
     , TO_CHAR(SAL, '000999999.99') AS SAL_3   -- 000003000.00
     , TO_CHAR(SAL, '999,999,00') AS SAL_4   -- 30,00
   FROM EMP
    ;     
    
SELECT TO_NUMBER('1,300','9,999')- TO_NUMBER('1,500','9,999') -- -200
     , TO_NUMBER('1,300','999,999')- TO_NUMBER('1,500','999,999') -- -200
  FROM DUAL
  ;

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1
     , TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2    
  FROM DUAL
  ;
  
SELECT * 
  FROM EMP 
 WHERE HIREDATE > TO_DATE('1981/06/01' , 'YYYY/MM/DD')
 ;  

--여러 가지 형식으로 날짜 데이터 출력하기 

--YY 어떤 두자리 수가 입력되어도 현시적의 연도와 동일한 년도인식
--RR 현 시점의 연도의 끝 두자리 수가 00~49 그리고 입력된 숫치가 00~49 , 50~99 인 경우를 계산하여 비교적 가까운 날짜 데이터를 출력 
--주소 YYYY를 쓰니 참고만 하는 정도 
SELECT TO_DATE('49/12/10','YY/MM/DD') AS YY_YEAR_49
     , TO_DATE('49/12/10','RR/MM/DD') AS RR_YEAR_49 
     , TO_DATE('50/12/10','YY/MM/DD') AS YY_YEAR_50
     , TO_DATE('50/12/10','RR/MM/DD') AS RR_YEAR_50
     , TO_DATE('51/12/10','YY/MM/DD') AS YY_YEAR_51
     , TO_DATE('51/12/10','RR/MM/DD') AS RR_YEAR_51
  FROM DUAL
  ;    
  
SELECT *
  FROM EMP 
  WHERE HIREDATE > TO_DATE('1980/10/15', 'YYYY/MM/DD')
  ;  
  
/*
NULL 처리 함수
*/  

SELECT  EMPNO 
      , ENAME
      , SAL 
      , COMM
      , SAL+COMM
      , NVL(COMM,0)
      , SAL+NVL(COMM,0)
 FROM  EMP    
 ;
 
 -- NVL2(검사할 열 또는 데이터  , 널이 아닐 경우 , 널일 경우 )
 -- == MSSSQL IIF(검사할 열 또는 데이터 IS NOT NULL, TRUE , FALSE )
SELECT EMPNO
     , ENAME
     , COMM
     , SAL
     , NVL2(COMM,'0','X')
     , NVL2(COMM, SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP 
 ;    

--DECODE == IIF'
SELECT EMPNO 
     , ENAME
     , JOB
     , SAL 
     , DECODE(JOB 
       ,'MANAGER' , SAL*1.1
       ,'SALESMAN', SAL*1.05
       ,'ANALYST' , SAL
       ,SAL * 1.03 -- 일치하지 않은 결과 EX JOB IS CLERK 
      ) AS UPSAL
  FROM EMP
  ; 
 
-- CASE==CASE

SELECT EMPNO
     , ENAME
     , JOB
     , SAL 
     , CASE JOB
         WHEN 'MANAGER' THEN SAL*1.1
         WHEN 'SALESMAN' THEN SAL* 1.05
         WHEN 'ANALYST' THEN SAL
         ELSE SAL*1.03
         END AS UPSAL
  FROM EMP 
  ;      

SELECT EMPNO
     , ENAME
     , COMM
     , CASE 
        WHEN COMM IS NULL THEN '해당사항없음'
        WHEN COMM=0 THEN '수당없음'
        WHEN COMM>0 THEN '수당 :' || COMM
       END AS COMM_TEXT
  FROM EMP 
  ;

SELECT EMPNO
     , RPAD(RTRIM(TRUNC(EMPNO,-2),0 ),4,'*' ) AS MASKING_EMPNO
     , ENAME
     , RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME) >=5 AND  LENGTH(ENAME)<6
 ;
 
 
 --월 평균 근무일수는 21.5
 --하루 근무시간 8
 --하루 급여 DAY_PAY
 --시급 TIME_PAY 
 SELECT EMPNO
      , ENAME
      , SAL
      , TRUNC((SAL/21.5/8)*8,2) AS DAY_PAY 
      , ROUND(SAL/21.5/8,1) AS TIME_PAY 
   FROM EMP
   ;
   
 -- 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원
 -- 정시원이 되는 날짜 (R_JOB)를 YYYY-MM-DD형식으로 출력
 -- 단, 추가 수당이 없는 사원의 추가 수당은 N/A로 출력
 
 SELECT EMPNO
      , ENAME
      , HIREDATE
      , TO_DATE(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS R_JOB
      , CASE WHEN COMM IS NULL THEN 'N/A'
             WHEN COMM >=0 THEN TO_CHAR(COMM)         
        END AS COMM 
   FROM EMP
   ;
   
   
 SELECT EMPNO
      , ENAME
      , MGR
      , CASE WHEN MGR IS NULL THEN '0000'
             WHEN SUBSTR(TO_CHAR(MGR), 1,2) ='75' THEN '5555'
             WHEN SUBSTR(TO_CHAR(MGR), 1,2) ='76' THEN '6666'
             WHEN SUBSTR(TO_CHAR(MGR), 1,2) ='77' THEN '7777'
             WHEN SUBSTR(TO_CHAR(MGR), 1,2) ='78' THEN '8888'
             ELSE TO_CHAR(MGR)
             END AS CHG_MGR
   FROM EMP 
   ;  