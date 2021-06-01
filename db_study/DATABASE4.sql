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
   ;
   
  