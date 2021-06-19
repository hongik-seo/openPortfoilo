--데카르트, 카사디안 , 크로스 조인
--모든 경우의 수를 보여줌
--그래서 사원데이터와 부서데이터가 정확히 맞아 떨어지지 않은 데이터도 함께 출력됨
SELECT * 
  FROM EMP,DEPT
 ORDER BY EMPNO 
 ;

-- 두테이블의 DEPTMO 열이 일치한 데이터만 출력하도록 WHERE 절에 명시해서 비교적 정확한 값이 나옴
SELECT *
  FROM EMP, DEPT 
  WHERE EMP.DEPTNO =DEPT.DEPTNO 
  ORDER BY EMPNO 
  ;
 
 
-- 별칭 사용하기 
 SELECT * 
   FROM EMP E, DEPT D 
  WHERE E.DEPTNO =D.DEPTNO 
  ORDER BY EMPNO 
  ;
  
 SELECT E.EMPNO 
      , D.DNAME 
   FROM EMP E, DEPT D
  WHERE E.DEPTNO =D.DEPTNO 
  ORDER BY EMPNO 
  ;
  
 --등가조인 테이블을 연결한 후 에 출력행을 각 데이터의 특정 열에 일치한 데이터를 기준으로 선정
 -- 내부 조인 또는 단순조인이라고 부름
 -- 가장 많이 사용하는 방식
 
 SELECT E.EMPNO 
      , E.ENAME 
      , D.DEPTNO 
      , D.LOC 
   FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO 
  ORDER BY D.DEPTNO, E.EMPNO 
  ;
  
 --WHERE 조건식을 사용해 테이블을 조인할 때 반드시 각 테이블을 정확하게 연결하는 조건식이 최소한 전체 테이블 수 보다 하나 적은 수만큼은 있어야 함
 SELECT E.EMPNO 
      , E.ENAME 
      , D.DEPTNO 
      , D.LOC 
   FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO 
    AND SAL>=3000
  ORDER BY D.DEPTNO, E.EMPNO 
  ;
  
  SELECT E.EMPNO 
       , E.ENAME 
       , E.SAL 
       , D.DEPTNO 
       , D.LOC 
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO 
     AND E.SAL <=2500
     AND E.EMPNO <=9999
   ORDER BY E.EMPNO 
   ;
   
   -- 비등가 조인 
   -- 등가 조인 방식 외의 방식을 의미 
   
   SELECT *
     FROM EMP E, SALGRADE S 
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 
    ;
    
   SELECT *
     FROM EMP E, SALGRADE S 
    ;
    
   --자체조인 
  SELECT E1.EMPNO 
       , E1.ENAME 
       , E1.MGR 
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 , EMP E2
   WHERE E1.MGR = E2.EMPNO 
   ;
   -- 왼쪽 외부조인 사용하기
   -- 왼쪽 열 기준
   -- 오른쪽 (+)데이터 다 가져와		
  SELECT E1.EMPNO 
       , E1.ENAME 
       , E1.MGR 
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 , EMP E2
   WHERE E1.MGR = E2.EMPNO(+) 
   ORDER BY E1.EMPNO
   ;
   -- 오른쪽 외부조인 사용하기
   -- 오른쪽 기준 
   -- 왼쪽열 (+)다가져 와
  SELECT E1.EMPNO 
       , E1.ENAME 
       , E1.MGR 
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 , EMP E2
   WHERE E1.MGR(+) = E2.EMPNO 
   ORDER BY E1.EMPNO
   ;
  
  -- natural join
  -- 등가조인을 대신해 사용할 수 있는 조인 방식
  -- 조인 대상이 되는 두 테이블에 이름과 자료형이 같은 열을 찾은 후 그 열을 기준으로 등가조인을 해주는 방식
  -- 자료형이 같을경우 테이블 이름을 붙이면 안됨
  SELECT E.EMPNO
       , E.ENAME 
       , E.JOB 
       , E.MGR 
       , E.HIREDATE 
       , E.SAL 
       , E.COMM 
       , DEPTNO 
       , D.DNAME 
       , D.LOC 
    FROM EMP E 
 NATURAL JOIN DEPT D 
   ORDER BY DEPTNO , E.EMPNO 
   ;
   
   -- JOIN USING
   -- 기존 등가 조인을 대신하는 조인 방식
   -- NATURAL JOIN이 자동으로 조인 기준열을 지정하는 거소가 달리 USING 키워드에 조인 기준으로 사용할 열을 명시하여 사용해야함
   -- NATURAL JOIN과 마찬가지로 조인 기중열로 명시된 열은 SELECT 절에 테이블을 이름을 붙이지 않고 작성
  
  SELECT E.EMPNO
       , E.ENAME 
       , E.JOB 
       , E.MGR 
       , E.HIREDATE 
       , E.SAL 
       , E.COMM 
       , DEPTNO 
       , D.DNAME 
       , D.LOC 
    FROM EMP E 
    JOIN DEPT D 
   USING (DEPTNO)
   WHERE SAL>=3000
   ORDER BY DEPTNO , E.EMPNO 
   
   --JOIN ON 
   SELECT E.EMPNO
       , E.ENAME 
       , E.JOB 
       , E.MGR 
       , E.HIREDATE 
       , E.SAL 
       , E.COMM 
       , E.DEPTNO 
       , D.DNAME 
       , D.LOC 
    FROM EMP E 
    JOIN DEPT D 
      ON E.DEPTNO = D.DEPTNO 
   WHERE SAL<=3000
   ORDER BY DEPTNO , E.EMPNO 
    
   -- OUTER JOIN
   
     SELECT E1.EMPNO 
          , E1.ENAME 
          , E1.MGR 
          , E2.EMPNO AS MGR_EMPNO
          , E2.ENAME AS MGR_ENAME
       FROM EMP E1
 LEFT OUTER JOIN EMP E2
         ON E1.MGR = E2.EMPNO 
      ORDER BY E1 .EMPNO 
      ;
     
     SELECT E1.EMPNO 
          , E1.ENAME 
          , E1.MGR 
          , E2.EMPNO AS MGR_EMPNO
          , E2.ENAME AS MGR_ENAME
       FROM EMP E1
 RIGHT OUTER JOIN EMP E2
         ON E1.MGR = E2.EMPNO 
      ORDER BY E1 .EMPNO 
      ;
   
     SELECT E1.EMPNO 
          , E1.ENAME 
          , E1.MGR 
          , E2.EMPNO AS MGR_EMPNO
          , E2.ENAME AS MGR_ENAME
       FROM EMP E1
 FULL OUTER JOIN EMP E2
         ON E1.MGR = E2.EMPNO 
      ORDER BY E1 .EMPNO 
      ;
      
     SELECT E.EMPNO
          , E.JOB 
          , E.MGR 
          , E.HIREDATE 
          , E.SAL 
          , E.COMM 
          , DEPTNO 
          , D.LOC 
       FROM EMP E 
       JOIN DEPT D USING (DEPTNO) 
      WHERE SAL >=3000
        AND E.MGR IS NOT NULL 
      ORDER BY DEPTNO , E.EMPNO 
      ;
      
     SELECT DEPTNO 
          , D.DNAME 
          , FLOOR( AVG(E.SAL)) AS AVG_SAL
          , MAX(E.SAL) AS MAX_SAL
          , MIN(E.SAL) AS MIN_SAL
          , COUNT(DEPTNO) AS CNT
       FROM DEPT D
       JOIN  EMP E
      USING (DEPTNO) 
      GROUP BY DEPTNO , D.DNAME 
      ;
      
      SELECT D.DEPTNO 
          , D.DNAME 
          , E.EMPNO 
          , E.ENAME 
          , E.JOB 
          , E.SAL 
       FROM DEPT D
 LEFT OUTER JOIN EMP E
         ON D.DEPTNO = E.DEPTNO 
      ORDER BY D.DEPTNO , E.ENAME 
      ;
      
    SELECT  D.DEPTNO 
          , D.DNAME 
          , E.EMPNO 
          , E.ENAME
          , E.MGR 
          , E.SAL 
          , E.DEPTNO 
          , S.LOSAL 
          , S.HISAL 
          , S.GRADE
          , MGR.EMPNO 
          , MGR.ENAME 
       FROM EMP E 
RIGHT OUTER JOIN DEPT D 
         ON E.DEPTNO = D.DEPTNO 
LEFT OUTER JOIN SALGRADE S 
         ON E.SAL BETWEEN S.LOSAL AND S.HISAL 
LEFT OUTER JOIN EMP MGR  
         ON E.MGR = MGR.EMPNO 
      ORDER BY D.DEPTNO , E.EMPNO 
     ;
    
    
      