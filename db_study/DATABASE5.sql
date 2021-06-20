-- 서브쿼리 
SELECT *
  FROM EMP 
  WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='JONES')
  ;
  

 -- 단일행 서브쿼리 
 SELECT *
  FROM EMP 
  WHERE HIREDATE <(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT')
  ;
  
  SELECT E.EMPNO 
       , E.ENAME 
       , E.JOB 
       , E.SAL 
       , DEPTNO 
       , D.DNAME 
       , D.LOC 
    FROM DEPT D 
    JOIN EMP E USING(DEPTNO)  
   WHERE DEPTNO =20
     AND E.SAL > (SELECT AVG(SAL) FROM EMP);  
     
   SELECT *
     FROM EMP 
    WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO )
    ;
    
   SELECT *
     FROM EMP 
    WHERE SAL = ANY(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO )
    ;
   
   SELECT *
     FROM EMP 
    WHERE SAL = SOME(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO )
    ;
    
   
   -- ANY 조건식이 최소한 하나만 만족시키면 메인쿼리의 조건식이 TRUE
    SELECT SAL FROM EMP WHERE DEPTNO =30
    
    -- 그래서 2850 하나의 값보다 작으면 TRUE
     SELECT *
       FROM EMP 
      WHERE  SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO =30)
      ORDER BY SAL, EMPNO 
      ;
      
    --ALL 연산 자는 모두를 만족시켜야 하기 때문에 950( 서브쿼리 결과 값중 가장 작은값)보다 작은값을 가진 데이터만 출력 
    SELECT *
      FROM EMP 
     WHERE  SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO =30)
     ORDER BY SAL, EMPNO 
   
     -- EXISTS 하나 이상 조건식이 만족하면 TRUE 
     SELECT *
       FROM EMP 
      WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO= 10)
      ;
     
     SELECT *
       FROM EMP 
      WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO= 50)
      ;
     
     SELECT *
       FROM EMP 
      WHERE HIREDATE < ALL(SELECT HIREDATE FROM EMP WHERE DEPTNO='10')
      ;
     
    -- 다중열 서브쿼리 (복수열 서브쿼리)
     
     SELECT *
       FROM EMP 
      WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO )
      ;
     
	 --인라인 뷰 
   
   SELECT E10.EMPNO 
        , E10.ENAME
        , E10.DEPTNO
        , D.DNAME 
        , D.LOC 
     FROM 
       (SELECT * FROM EMP WHERE DEPTNO =10) E10,
       (SELECT * FROM DEPT) D
   
    WHERE E10.DEPTNO =D.DEPTNO    
    ;
    --WITH 절
    
    WITH 
     E10 AS (SELECT * FROM EMP WHERE DEPTNO =10),
      D AS (SELECT * FROM DEPT) 
  SELECT E10.EMPNO 
    , E10.ENAME
    , E10.DEPTNO
    , D.DNAME 
    , D.LOC
    FROM E10,D
   WHERE E10.DEPTNO = D.DEPTNO
   ;
   
  -- 스칼라 서브쿼리 SELECT 절에 사용하는 서브쿼리 
  SELECT E.EMPNO 
       , E.ENAME 
       , E.JOB 
       , E.SAL 
       , (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE
       , E.DEPTNO 
       , (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPTNO) AS DNAME
    FROM EMP E 
    ;
    
    SELECT E.JOB 
         , E.EMPNO 
         , E.ENAME 
         , E.SAL 
         , E.EMPNO 
         , D.DNAME
      FROM EMP E  
     INNER JOIN DEPT D 
        ON E.DEPTNO = D.DEPTNO 
      WHERE E.JOB = (SELECT JOB FROM EMP WHERE ENAME='ALLEN')
      ;
      
     
     
    SELECT E.EMPNO 
         , E.ENAME 
         , D.DNAME
         , E.HIREDATE 
         , D.LOC
         , E.SAL 
         , S.GRADE 
      FROM EMP E , DEPT D, SALGRADE S
     WHERE E.DEPTNO =D.DEPTNO
       AND SAL  > (SELECT AVG(SAL) FROM EMP E1 )   
       AND E.SAL BETWEEN S.LOSAL AND S.HISAL 
     ORDER BY E.SAL DESC , E.EMPNO 
     
     SELECT E.EMPNO 
         , E.ENAME 
         , E.JOB 
         , E.DEPTNO 
         , D.DNAME 
         , D.LOC 
       FROM EMP E
      INNER JOIN DEPT D
         ON E.DEPTNO = D.DEPTNO
      WHERE E.DEPTNO = (SELECT D1.DEPTNO FROM DEPT D1 WHERE D1.DEPTNO =10 ) 
       AND E.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO =30)
       ;
       
      SELECT E.EMPNO 
           , E.ENAME 
           , E.SAL 
           , S.GRADE 
        FROM EMP E
  LEFT OUTER JOIN SALGRADE S
          ON E.SAL BETWEEN S.LOSAL AND S.HISAL
       WHERE E.SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
       ORDER BY EMPNO   
       ;
       
      SELECT E.EMPNO 
           , E.ENAME 
           , E.SAL 
           , S.GRADE 
        FROM EMP E
  LEFT OUTER JOIN SALGRADE S
          ON E.SAL BETWEEN S.LOSAL AND S.HISAL
       WHERE E.SAL > ANY(SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN')
       ORDER BY EMPNO   
       ;