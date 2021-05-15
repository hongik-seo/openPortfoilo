
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
  
  

  
  
   
