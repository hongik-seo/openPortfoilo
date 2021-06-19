--데카르트, 카사디안 , 크로스 조인
--모든 경우의 수를 보여줌
--그래서 사원데이터와 부서데이터가 정확히 맞아 떨어지지 않은 데이터도 함께 출력됨
SELECT * 
  FROM EMP,DEPT
 ORDER BY EMPNO 
 ;

-- �����̺��� DEPTMO ���� ��ġ�� �����͸� ����ϵ��� WHERE ���� �����ؼ� ���� ��Ȯ�� ���� ����
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
  
 --����� ���̺��� ������ �� �� ������� �� �������� Ư�� ���� ��ġ�� �����͸� �������� ����
 -- ���� ���� �Ǵ� �ܼ������̶�� �θ�
 -- ���� ���� ����ϴ� ���
 
 SELECT E.EMPNO 
      , E.ENAME 
      , D.DEPTNO 
      , D.LOC 
   FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO 
  ORDER BY D.DEPTNO, E.EMPNO 
  ;
  
 --WHERE ���ǽ��� ����� ���̺��� ������ �� �ݵ�� �� ���̺��� ��Ȯ�ϰ� �����ϴ� ���ǽ��� �ּ��� ��ü ���̺� �� ���� �ϳ� ���� ����ŭ�� �־�� ��
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
   
   -- �� ���� 
   -- � ���� ��� ���� ����� �ǹ� 
   
   SELECT *
     FROM EMP E, SALGRADE S 
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 
    ;
    
   SELECT *
     FROM EMP E, SALGRADE S 
    ;
    
   --��ü���� 
  SELECT E1.EMPNO 
       , E1.ENAME 
       , E1.MGR 
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 , EMP E2
   WHERE E1.MGR = E2.EMPNO 
   ;
   -- ���� �ܺ����� ����ϱ�
   -- ���� �� ����
   -- ������ (+)������ �� ������		
  SELECT E1.EMPNO 
       , E1.ENAME 
       , E1.MGR 
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 , EMP E2
   WHERE E1.MGR = E2.EMPNO(+) 
   ORDER BY E1.EMPNO
   ;
   -- ������ �ܺ����� ����ϱ�
   -- ������ ���� 
   -- ���ʿ� (+)�ٰ��� ��
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
  -- ������� ����� ����� �� �ִ� ���� ���
  -- ���� ����� �Ǵ� �� ���̺��� �̸��� �ڷ����� ���� ���� ã�� �� �� ���� �������� ������� ���ִ� ���
  -- �ڷ����� ������� ���̺� �̸��� ���̸� �ȵ�
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
   -- ���� � ������ ����ϴ� ���� ���
   -- NATURAL JOIN�� �ڵ����� ���� ���ؿ��� �����ϴ� �żҰ� �޸� USING Ű���忡 ���� �������� ����� ���� �����Ͽ� ����ؾ���
   -- NATURAL JOIN�� ���������� ���� ���߿��� ���õ� ���� SELECT ���� ���̺��� �̸��� ������ �ʰ� �ۼ�
  
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
      