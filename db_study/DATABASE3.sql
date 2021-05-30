--다중행 함수 : 여러행이 입력되어 하느이 행으로 겨로가가 출력되는 함수

 -- 단일 그룹의 함수가 아닙니다 오류
SELECT ENAME
      ,SUM(SAL)
  FROM EMP
  ;
  
 --합계를 구하는 SUM 함수

 --널 값을 제외하고 계산
 SELECT SUM(COMM)
   FROM EMP
   ;
 
  --DISTINCT은 중복을 제외하고 계산
 SELECT  SUM(DISTINCT SAL)
        ,SUM(ALL SAL)
        ,SUM(SAL)
   FROM EMP
   ;
 
 SELECT SUM(SAL)
       ,SUM(COMM)
   FROM EMP 
   ;
   
  -- 데이터의 개수를 구해주는 COUNT 함수
  
 SELECT COUNT(*)
   FROM EMP 
   ;
   
  SELECT COUNT(*)
    FROM EMP
   WHERE DEPTNO=30
   ;
   
  SELECT COUNT(DISTINCT SAL)
        ,COUNT(ALL SAL)
        ,COUNT(SAL)
   FROM EMP
   ;
  
  SELECT MAX(SAL)
    FROM emp 
   WHERE DEPTNO = 10
   ;
 
  SELECT MIN(SAL)
    FROM emp 
   WHERE DEPTNO = 10
   ;
  
  SELECT MAX(HIREDATE)
    FROM EMP 
   WHERE DEPTNO = 20
   ;
   
  
  SELECT MIN(HIREDATE)
    FROM EMP 
   WHERE DEPTNO = 20
   ;
   
   -- 평균 값을 구하는 AVG함수
  
  SELECT AVG(SAL)
    FROM EMP 
   WHERE DEPTNO = 30
   ;
   
  
  SELECT AVG(DISTINCT SAL)
    FROM EMP 
   WHERE DEPTNO = 30
   ;
   
  SELECT AVG(COMM)
    FROM EMP 
   WHERE DEPTNO =30
   ;
   
  
   SELECT AVG(SAL) 
        , DEPTNO
     FROM EMP
    GROUP BY DEPTNO
    ;
    
	SELECT DEPTNO
	     , JOB
	     , AVG(SAL)
	  FROM EMP 
	 GROUP BY DEPTNO ,JOB 
	 ORDER BY DEPTNO ,JOB
	 ;

	SELECT AVG(COMM)
	     , DEPTNO
	  FROM EMP
   	 GROUP BY DEPTNO 
   	 ;
   	 
   	-- GROUP BY 절을 사용하여 출력 데이터를 그룹화 할경우 유의정
   	-- 일반열을 GRROUP BY 절에 명시하지 않으면 SELECT 절에 사용할 수 없음 
   	
   	-- DEPTNO 열과 AVG(SAL) 열은 한 행으로 출력되지만, ENAME 열을 여러행으로 구성되어 각 열별 데이터수가 달라서 출력이 불가능
   	SELECT ENAME
   	     , DEPTNO 
   	     , AVG(SAL)
   	  FROM EMP
   	 GROUP BY DEPTNO
   	 ;
   	 
   	-- GROUP BY 절에 조건을 줄 때 사용하는 HAVEING 절
   	
   	SELECT DEPTNO 
   	     , JOB
   	     , AVG(SAL)
   	  FROM EMP 
   	 GROUP BY DEPTNO ,JOB 
   	HAVING AVG(SAL) >=2000
   	 ORDER BY DEPTNO ,JOB 
   	 ;
   	
   	-- WHERE 절이 GROUP BY 절 HAVING 절 보다 먼저 실행됨
    SELECT DEPTNO 
   	     , JOB
   	     , AVG(SAL)
   	  FROM EMP 
   	 WHERE SAL <=3000
   	 GROUP BY DEPTNO ,JOB 
   	   HAVING AVG(SAL) >=2000
   	 ORDER BY DEPTNO ,JOB 
   	 ;
   	 
   	 SELECT DEPTNO 
   	      , JOB 
   	      , AVG(SAL) 
   	   FROM EMP
   	  GROUP BY DEPTNO , JOB
   	 HAVING AVG(SAL) >=500
   	  ORDER BY DEPTNO ,JOB
   	  ;
   	 
   	 
   	 --DEPTNO 먼저 큰 그룹으로 만들고 직책으로 소그룹을 나누어 각 그룹에 해당하는 데이터 즉 각부서의 직책별 사원수 가장높은 급여 합 평균 급여를 출력
   	 -- From -> group by -> select -> ORDER by
   	 SELECT DEPTNO
   	      , JOB
   	      , COUNT(*)
   	      , MAX(SAL)
   	      , SUM(SAL)
   	      , AVG(SAL)
   	   FROM EMP 
   	  GROUP BY DEPTNO , JOB 
   	  ORDER BY DEPTNO , JOB
   	  ;
   	 
   	 
   	
   	 --명시한 열을 소그룹 부터 대그룹의 순서로 그룹별 결과를 출력하고 마지막에 총데이터의 결과를 출력
   	 -- from -> select -> ROLLUP 
   	 -- roll up 함수에 명시한 열에 한하여 결과가 출력
   	 -- ROLLUP 함수에는 그룹 함수를 지정못함
   	 --정리 소계의 결과를 한번 더 출력해줌
   	 SELECT DEPTNO
   	      , JOB
   	      , COUNT(*)
   	      , MAX(SAL)
   	      , SUM(SAL)
   	      , AVG(SAL)
   	   FROM EMP 
   	  GROUP BY ROLLUP (DEPTNO,JOB)
   	  ;
   	  
  
   	-- 결과 한개의 로우 
   	SELECT SUM(COL_1) AS SUM
   	     , COUNT(COL_1) 
   	FROM(SELECT 10 AS COL_1
         , 30 AS COL_2
         , 40 AS COL_3
         , 50 AS COL_4 
      FROM dual
     UNION ALL
    SELECT 10 AS COL_1
         , 30 AS COL_2
         , 40 AS COL_3
         , 50 AS COL_4 
      FROM dual) 
      GROUP BY COL_1
      ;
      
   
    -- 결과 두개의 로우 rollup절에서 한번 총개를 다시 구함
   	SELECT SUM(COL_1) AS SUM
   	     , COUNT(COL_1) 
   	FROM(SELECT 10 AS COL_1
         , 30 AS COL_2
         , 40 AS COL_3
         , 50 AS COL_4 
      FROM dual
     UNION ALL
    SELECT 10 AS COL_1
         , 30 AS COL_2
         , 40 AS COL_3
         , 50 AS COL_4 
      FROM dual) 
      GROUP BY ROLLUP (COL_1)
      ;
     
     SELECT DEPTNO
          , JOB
          , COUNT(*)
          , MAX(SAL)
          , SUM(SAL)
          , AVG(SAL)
       FROM EMP 
      GROUP BY CUBE (DEPTNO, JOB)
      ORDER BY DEPTNO ,JOB 
      ;
     
      --DEPTNO 를 먼저그룹하고 ROLLUP 함수를 통해 JOB 지정
      SELECT DEPTNO 
           , JOB 
           , COUNT(*)
        FROM EMP 
       GROUP BY DEPTNO ,ROLLUP(JOB)
       ;
 
      --DEPTNO 를 먼저그룹하고 ROLLUP 함수를 통해 JOB 지정
      SELECT DEPTNO 
           , JOB 
           , COUNT(*)
        FROM EMP 
       GROUP BY JOB ,ROLLUP(DEPTNO)
       ;
      
      -- GROPING SETS == 대그룹으로 처리
      -- ROLLUP == 소그룹으로 처리 한번만 처리
      -- CUBE == 소그룹으로 처리 가능한 모든 경우의 수 처리
      
      
      --따로 그룹핑하고 후 연산을 수행
      SELECT DEPTNO 
           ,  JOB
           , COUNT(*)
        FROM EMP 
       GROUP BY GROUPING SETS(DEPTNO, JOB)
       ORDER BY DEPTNO , JOB
       ;     
      
      -- 10 in(MANAGER, PRESIDENT, CLERK)
      SELECT DEPTNO 
           , JOB
           , COUNT(JOB)
        FROM EMP 
       WHERE DEPTNO =10
       GROUP BY DEPTNO , JOB 
       ;
       
       --GROUPIING 함수 ROULLUP 또는 CUBE 함수를 사용한 GRRUOP BY 절에 그룹화 대상으로 지정한 열이 
       --그룹화된 상태로 결과에 집계되어있는지 확인하는데 사용됨
       -- SELECT 절에 쓰임
     
      --결과 0은 그룹화되었음을 의미 
      --결과 1은 그룹화되지 않은 데이터를 의미
      --특정열의 그룹화 여부를 출력할 수 있음
     SELECT DEPTNO
          , JOB 
          , COUNT(*)
          , MAX(SAL)
          , SUM(SAL)
          , AVG(SAL)
          , GROUPING(DEPTNO)
          , GROUPING(JOB)
      FROM EMP
    GROUP BY CUBE (DEPTNO, JOB)
    ORDER BY DEPTNO, JOB 
    ;
      
  SELECT DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT',DEPTNO ) AS DEPTNO
       , DECODE(GROUPING(JOB), 1, 'ALL_JOB',JOB ) AS JOB
       , COUNT(*)
       , MAX(SAL)
       , SUM(SAL)
       , AVG(SAL)
     FROM EMP
    GROUP BY CUBE (DEPTNO, JOB)
    ORDER BY DEPTNO, JOB
    ;
    
   --이 진수 기준으로 0과 1, 10진수로 바꿔서 출력
  SELECT DEPTNO
        , JOB 
        , COUNT(*)
        , SUM(SAL)
        , GROUPING(DEPTNO)
        , GROUPING(JOB)
        , GROUPING_ID(DEPTNO,JOB)
    FROM EMP 
   GROUP BY CUBE(DEPTNO, JOB)
   ORDER BY DEPTNO, JOB 
   ;
  
  -- 10 부서 외에 다른 부서에도 사원이름 데이터는 여러개가 존재 
  -- 하지만 GROUP BY절을 통해 DEPTNO 열을 그룹화해 버리면 ENAME 데이터는 GROUP BY 절에 명시하지 않은 이상 SELECT 절에 명시할 수 없음
   SELECT ENAME 
     FROM EMP
    WHERE DEPTNO = 10
    ;
   
   SELECT DEPTNO 
        , ENAME 
     FROM EMP 
    GROUP BY DEPTNO , ENAME 
    ;
    
   -- LISTAGG 가로로 나열한 열을 지정하고 필요하면 각 테이터 사이에 넣을 구분자를 지정할 수 있다 
   -- 그리고 가로로 출력할 데이터를 정렬할 수 도 있다 
   /* 출력결과 10 = KING , CLARJK , MILLER
             20 = FORD,SCOTT, JONES, ADAMS, SMITH
             30 = BLAKE, TURNER, MARTIN , WARD, JAMES
    */
    SELECT DEPTNO
         , LISTAGG(ENAME, ',') WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES
      FROM EMP 
     GROUP BY DEPTNO 
     ;
     
    --PIVOT, UNPIVOT 
    --PIVOT 함수는 기존 테이블 행을 열로 바꿔서 출력
    --UNPIVOT 함수는 기존 테이블 열을 행으로 바꿔서 출력
    
    SELECT DEPTNO 
         , jOB
         , MAX(SAL)
      FROM EMP 
     GROUP BY DEPTNO , JOB 
     ORDER BY DEPTNO , JOB 
     ;
    
    SELECT *
     FROM (SELECT DEPTNO 
                , JOB 
                , SAL
             FROM EMP
          )
     PIVOT( MAX(SAL) FOR DEPTNO IN(10, 20, 30) )
     ORDER BY JOB
     ;
    
     SELECT * 
       FROM (SELECT JOB
                  , DEPTNO
                  , SAL 
               FROM EMP )
       PIVOT(MAX(SAL) 
          FOR JOB IN ('CLERK' AS CLERK
                     ,'SALESMAN' AS SALESMAN
                     ,'PRESIDENT' AS PRESIDENT
                     , 'ANALYST' AS ANALYST)
          
       )   
       ORDER BY DEPTNO
     ; 
      
    -- DECODE 문을 활용하여 PIVOT  함수와 같은 출력구현하기 
    SELECT DEPTNO
         , MAX(DECODE(JOB, 'CLERK', SAL)  ) AS CLERK
         , MAX(DECODE(JOB, 'SALESMAN', SAL)  ) AS SALESMAN
         , MAX(DECODE(JOB, 'PRESIDENT', SAL)  ) AS PRESIDENT
         , MAX(DECODE(JOB, 'ANALYST', SAL)  ) AS ANALYST
      FROM EMP 
     GROUP BY DEPTNO 
     ORDER BY DEPTNO 
     ;
         
    SELECT * 
      FROM (SELECT DEPTNO
                 , MAX(DECODE(JOB, 'CLERK', SAL)  ) AS CLERK
                 , MAX(DECODE(JOB, 'SALESMAN', SAL)  ) AS SALESMAN
                 , MAX(DECODE(JOB, 'PRESIDENT', SAL)  ) AS PRESIDENT
                 , MAX(DECODE(JOB, 'ANALYST', SAL)  ) AS ANALYST
			 FROM EMP 
			GROUP BY DEPTNO 
			ORDER BY DEPTNO 
			)
			
    UNPIVOT (
        SAL FOR JOB IN (CLERK, SALESMAN ,PRESIDENT , ANALYST)
     )
     ORDER BY DEPTNO , JOB
     ;
    
    
     
     
         
         
      
      