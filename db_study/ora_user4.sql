
/*
집계함수
*/
SELECT COUNT(*) FROM employees;

SELECT COUNT(employee_id) FROM employees;

--카운트 수에서 null 값은  제외한다.

SELECT COUNT(department_id) FROM employees;

--DISTINCT은 컴럼에 있는 유일한 값만 조회
SELECT COUNT(DISTINCT department_id) FROM employees;

SELECT DISTINCT department_id FROM employees ORDER BY 1;

--SUM(expr) 전체 합계를 반환하는 함수 expr은 숫자형만 올 수 있음 
SELECT SUM(salary) FROM employees;

--DISTINCT을 붙여기 때문에 중복된 급여는 한 번만 셈함
SELECT SUM(salary), SUM(DISTINCT salary) FROM employees;

--AVG(expr) 평균값 반환
SELECT AVG(salary), AVG(DISTINCT salary) FROM employees;

--MIN(expr) MAX(expr) 각각 최소값 최대값 반환
SELECT MIN(salary), MAX(DISTINCT salary) FROM employees;

--VARIANCE(expr) 분산, STDDEV(expr) 표준편차
SELECT VARIANCE(salary) as 분산, STDDEV(salary) as 표준편차 FROM employees;

/*
GROUP BY HAVVING 절
*/

--GROUP BY는 WHERE과 ODER BY절 사이에 위치
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT * FROM kor_loan_status;

--집계함수는 원래 싱글로만 써야하는데 GROUP BY를 붙이면 사용할 수 있음
SELECT period, region, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region
ORDER BY period, region;

--GROUP BY 표현식이 아닙니다.
--GROUP BY 절에 SELECT절에 있는 집계합수를 제외하고 컬럼명이나 표현식을 모두 기술해야하함
SELECT period, region, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period = '201311'
GROUP BY  region
ORDER BY  region;

--HAVING 절은 GROUP BY한 결과를 다시 필터를 거는 역할 

SELECT period, region, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period = '201311'
GROUP BY  period, region
HAVING SUM(loan_jan_amt)>100000
ORDER BY  period, region;


--ROLLUP(expr1,expr2,...) expr로 명시한 표현식을 기준으로 집계한 결과를 보여줌 
--추가적인 집계정보를 보여준다
--표현식의 순서(오른쪽에서 왼쪽순으로 )로 집계
--n개이면 n+1레벨까지 하위에서 상위레벨순으로 데이터 집계

SELECT period, gubun, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, gubun
ORDER BY period;

SELECT period, gubun, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY ROLLUP(period, gubun)
ORDER BY period;

SELECT period, gubun, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period,ROLLUP(gubun)
ORDER BY period;

--CUBE(expr1,expr2,....)
--ROLLUP이 레벨별로 순차 집계를 했다면 CUBEsms 2의(expr수)젭곡 만큼 종류별로 집계
SELECT period, gubun, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY CUBE(period, gubun);


SELECT period, gubun, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period Like '2013%'
GROUP BY period, CUBE(gubun);

SELECT TYPE, SUM(CNT)
FROM (SELECT '01' AS TYPE, 1 AS CNT FROM DUAL
UNION ALL 
SELECT '02' AS TYPE, 3 AS CNT FROM DUAL
UNION ALL
SELECT '02' AS TYPE, 5 AS CNT FROM DUAL
UNION ALL 
SELECT '03' AS TYPE, 2 AS CNT FROM DUAL
UNION ALL
SELECT '03' AS TYPE, 7 AS CNT FROM DUAL)
GROUP BY ROLLUP(TYPE);

/*
집합 연산자
*/

CREATE TABLE exq_goods_asia(
        
        contry  VARCHAR2(10),
        seq     NUMBER,
        goods   VARCHAR2(80)

);

ALTER table exq_goods_asia rename to exp_goods_asia ;

DESC exp_goods_asia;


           
SELECT goods FROM exp_goods_asia where contry='한국' ORDER BY seq;

SELECT goods FROM exp_goods_asia where contry='일본' ORDER BY seq;


--UNION 합집합을 의미 
--자동차 선박은 곂쳐서 한번만 조회
SELECT goods FROM exp_goods_asia where contry='한국' 
UNION
SELECT goods FROM exp_goods_asia where contry='일본' ;

--UNION ALL 중복된 항목도 모두 조회

SELECT goods FROM exp_goods_asia where contry='한국' 
UNION ALL
SELECT goods FROM exp_goods_asia where contry='일본';

--INTERSECT 교집합을 의미
SELECT goods FROM exp_goods_asia where contry='한국' 
INTERSECT
SELECT goods FROM exp_goods_asia where contry='일본';

--MINUS 차집합을 의미 한 데이터 집합을 기준으로 다른 데이터 집합과 공통된 항목제외 
--한국에는 있지만 일본에는 없는것
--먼저 위치한 select문 기준
SELECT goods FROM exp_goods_asia where contry='한국' 
MINUS
SELECT goods FROM exp_goods_asia where contry='일본';


SELECT goods FROM exp_goods_asia where contry='일본' 
MINUS
SELECT goods FROM exp_goods_asia where contry='한국';

--주의 사항

--1 집합 연산자와 연결되는 각 select 문의 select 리스트의 개수와 데이터 타입은 일치해야함
--ORA-01789: 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
--01789. 00000 -  "query block has incorrect number of result columns"
SELECT goods FROM exp_goods_asia where contry='한국' 
UNION
SELECT seq,goods FROM exp_goods_asia where contry='일본';

--만약 seq를 추가하면 
--seq와 goods 합쳐서 연산수행
--중복건을 제외할때 goods뿐 아니라 seq도 반영되서 총 18건이 조회
SELECT seq,goods FROM exp_goods_asia where contry='한국' 
UNION
SELECT seq,goods FROM exp_goods_asia where contry='일본';

SELECT seq,goods FROM exp_goods_asia where contry='한국' 
INTERSECT
SELECT seq,goods FROM exp_goods_asia where contry='일본';

--ORA-01790: 대응하는 식과 같은 데이터 유형이어야 합니다
--01790. 00000 -  "expression must have same datatype as corresponding expression"
SELECT seq FROM exp_goods_asia where contry='한국' 
UNION
SELECT goods FROM exp_goods_asia where contry='일본';


--2 ORDER BY 절은 맨 마지막 문장에서만 사용할 수 있음


--ORA-00933: SQL 명령어가 올바르게 종료되지 않았습니다
--00933. 00000 -  "SQL command not properly ended"
SELECT goods FROM exp_goods_asia where contry='한국'
ORDER BY goods
UNION
SELECT goods FROM exp_goods_asia where contry='일본';

SELECT goods FROM exp_goods_asia where contry='한국'
UNION
SELECT goods FROM exp_goods_asia where contry='일본'
ORDER BY goods;

--3 blob clob bfile 타입의 컬럼에서는 집합연산자 사용 불과 

--4 union intersect ninus 연산자는 long형 컬럼에는 사용할 수 없음


/*
GROUPING SETs 
*/
--그룹 쿼리긴 하나 UNUON ALL 이 섞여있음
--쿼리 결과는 GROUP BY expr1 UNION ALL (GROUP BY expr2) UNION ALL (GROUP BY expr3)

SELECT
period,gubun,SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
where period like '2013%'
group by GROUPING SETS(period,gubun);

SELECT
period,gubun,region,SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
where period like '2013%'
AND region IN('서울','경기')
group by GROUPING SETS(period,(gubun,region));
