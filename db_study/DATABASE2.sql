
--ä����
--10�ڸ���
--���� ���ڿ��� �����ϰ� 
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
 
--CONCAT �� ����
SELECT EMPNO || ENAME
     , EMPNO || ':' || ENAME 
 FROM EMP
WHERE ENAME='SCOTT'
;  


--�������� 
--LEADING FROM ��
--TRAILING FROM ��
--BOTH FROM ����
SELECT '[' || TRIM('   _ _ORACLE_ _   ') || ']' AS TRIM
     , '[' || TRIM(LEADING FROM '   _ _ORACLE_ _   ') || ']' AS TRIM_LEADING
     , '[' || TRIM(TRAILING FROM '   _ _ORACLE_ _   ') || ']' AS TRIM_TRALING
     , '[' || TRIM(BOTH FROM '   _ _ORACLE_ _   ') || ']' AS TRIM_BOTH
  FROM DUAL
;   

-- _���� (_������ ������������ �۵�����)
--LEADING FROM ��
--TRAILING FROM ��
--BOTH FROM ����
SELECT '[' || TRIM('_ _ORACLE_ _') || ']' AS TRIM
     , '[' || TRIM(LEADING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_LEADING
     , '[' || TRIM(TRAILING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_TRALING
     , '[' || TRIM(BOTH '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_BOTH
  FROM DUAL
; 

--LTRIM, RTRIM�� ������ ���ڿ��� �������������� ��������
--LTRIM, RTRIM�� ������ ���ڿ��� ������ �����ϴ°� ����

SELECT '[' || TRIM(' _ORACLE_ ')     || ']' AS TRIM
     , '[' || LTRIM(' _ORACLE_ ')    || ']' AS LTRIM
     , '[' || LTRIM('<_ORACLE_>' , '_<' ) || ']' AS LTRIM_2
     , '[' || RTRIM(' _ORACLE_ ')    || ']' AS RTRIM
     , '[' || RTRIM('<_ORACLE_>' , '>_' ) || ']' AS RTRIM_2
  FROM DUAL
  ; 
  
  

  
  
   
