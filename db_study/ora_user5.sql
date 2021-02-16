
/*
--내부조인
*/

/*
동등조인
*/

--동등 조인은 where 절에 등호를 사용해 2개이상의 테이블이나 뷰를 연결한것
--부서 테이블에서 키에 해당하는 필수 값이지만 사원테이블에서는 필수 값이 아니므로 사원 테이블에 부서번호 컬럽값이 있는 건만 추출
SELECT a.employee_id , a.emp_name, a.department_id, b.department_name
FROM employees a ,departments b
where a.department_id =b.department_id;

/*
세미조인
*/

--세이조인은 서브 쿼리를 사용해 서브쿼리에 존제하는 데이터만 메인 쿼리에서 추출하는 방법 in 과 exists연산자를 이용한 조인 
--메인 A 서브 B B테이블에 존재하는 A테이블의 데이터를 추출하는 조인

/*--서브쿼리에 존재하는 메일 쿼리 데이터가 여러건 존재하더라도 최종 반환되는 쿼리 데이터에는 중복되는 건이 없다는 점이 일반조인과의 차이점*/

--일반 조인을 하면 SELECT 절에 B테이블 컬럼을 전혀 명시하지 않더라도 중복되는 건이 발생

--11건
SELECT department_id , department_name
FROM departments a
WHERE EXISTS(
    SELECT * FROM employees b
    WHERE a.department_id = b.department_id
    AND b.salary>3000
)
ORDER BY a.department_name;

SELECT department_id , department_name
FROM departments a
WHERE a.department_id IN(
    SELECT b.department_id FROM employees b
    WHERE a.department_id = b.department_id
    AND b.salary>3000
)
ORDER BY a.department_name;

--80건
SELECT a.department_id, a.department_name
FROM departments a, employees b
where a.department_id=b.department_id
AND b.salary>3000
ORDER BY a.department_name;

/*
안티조인
*/
--서브쿼리의 B테이블에는 없는 메인쿼리의 A테이블의 데이터만 추출하는 조인
--세미 조인과는 반대 개념

SELECT a.employee_id, a.employee_id , a.department_id, b.department_id
FROM employees a, departments b
WHERE a.department_id=b.department_id
AND a.department_id NOT IN(
    SELECT department_id 
    FROM departments
    WHERE manager_id IS NULL
);

SELECT e.manager_id, d.manager_id
FROM employees e ,departments d
where e.department_id =d.department_id
AND d.manager_id is NOT null
ORDER BY e.manager_id;

--106 데이터는 총 107 106인 이유는  employees manager_id에 널이 한 건 있기때문 
SELECT COUNT(*) count
FROM employees a
WHERE NOT EXISTS(
    SELECT 1 
    FROM departments c
    WHERE a.department_id =c.department_id
    AND manager_id IS NULL
);


/*
셀프조인
*/

--셀프조인은 서로 다른 두 테이블이 아닌 동일한 테이블을 사용해 조인하는 방법

SELECT a.employee_id, a.emp_name , b.employee_id ,b.emp_name , a.department_id
FROM employees a, employees b
WHERE a.employee_id<b.employee_id
AND a.department_id =b.department_id
AND a.department_id=20;

/*
--외부조인
*/

--외부조인은 일반 조인을 확상한 개념
--조인 조건에 만족하는 데이터 뿐 아니라 어느 한 쪽 테이블에 조인 조건을 명시된 컬럼에 값이 없거나 null이더라도 해당 로우가 아예 없더라도 데이터를 모두 추출

--일반 조인
SELECT a.department_id , a.department_name , b.job_id, b.department_id
FROM departments a, job_history b
where a.department_id=b.department_id;

--조인 조건에 데이터가 없는 컬럼에 (+)를 붙이는게 외부조인
SELECT a.department_id , a.department_name , b.job_id, b.department_id
FROM departments a, job_history b
where a.department_id=b.department_id(+);


--조인 조건 모두에(+)를 붙여야한다
SELECT a.employee_id , a.emp_name , b.job_id, b.department_id
FROM employees a, job_history b
where a.employee_id = b.employee_id(+)
AND a.department_id=b.department_id;

SELECT a.employee_id , a.emp_name , b.job_id, b.department_id
FROM employees a, job_history b
where a.employee_id = b.employee_id(+)
AND a.department_id=b.department_id(+);

/*
외부조인 주의 사항
*/

--1. 조인 대상 테이블 중 데이터가 없는 테이블에 조인조건 (+)를 붙인다. 
--2. 외부 조인의 조인 조건이 여러 개일 때 모은 조건에 (+)를 븥인다 
--3. 한번에 한테이블에만 외부 조인을 할 수 있다. 예를 들어 조인 대상 테이블이 A,B,C 3개고 A를 기분으로 B테이블을 외부조인으로 연결했으면 동시에 C를 기준으로 B테이블에 외부조인을 걸 수 없다. 
--4.(+)연산자가 붙은 조건과 OR를 같이 사용한 수 없다 
--5.(+)연산자가 붙은 조건에는 IN 연산자를 같이 사용할 수 없다(in절에 포함되는 값이 1개면 가능)



/*
카사디안 조인
*/

--카사디안 조인은 WHERE 절에 조인 조건이 없는 조인을 말함 
--FROM 절에 테이블을 명시했으나 두 테이블 간 조인 조건이 없는 조인 
--결과는 두 테이블의 건수의 곱

SELECT a.employee_id , a.emp_name, b.department_id, b.department_name
FROM employees a, departments b;

/*
ANSI조인
*/

-- ANSI 문법을 사용한 조인
--조인 조건이 FROM 절에 들어 간다는 점이다. 


--기존 문법
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a, departments b
where a.department_id = b.department_id
AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


--ANSI 문법
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a INNER JOIN departments b
on (a.department_id = b.department_id)
WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


--USING 이용

--잘못된 경우
--ORA-25154: USING 절의 열 부분은 식별자를 가질 수 없음
--25154. 00000 -  "column part of USING clause cannot have qualifier"
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a INNER JOIN departments b
USING(department_id)
WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

--올바른 경우

SELECT a.employee_id, a.emp_name, department_id, b.department_name
FROM employees a INNER JOIN departments b
USING(department_id)
WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


/*
ANSI 외부 조인
*/

--기존 문법
SELECT a.employee_id , a.emp_name, b.job_id, b.department_id
FROM employees a, job_history b
WHERE a.employee_id = b.employee_id(+)
AND a.department_id=b.department_id(+);


--ANSI 문법
--왼쪽기준으로 오른쪽이 널인 값도 포함
SELECT a.employee_id , a.emp_name, b.job_id, b.department_id
FROM employees a LEFT OUTER JOIN job_history b
ON a.department_id = b.department_id
and b.employee_id = a.employee_id;


/*
CROSS조인
*/
--기존 문법
SELECT a.employee_id , a.emp_name, b.department_id, b.department_name
FROM employees a, departments b;

--ANSI문법
SELECT a.employee_id , a.emp_name, b.department_id, b.department_name
FROM employees a CROSS join departments b;

/*
FULL OUTTER조인 
*/
--ANSI에만 있는 조인기능
--두 테이블의 널값도 조회

CREATE TABLE HONG_A (EMP_ID INT);


CREATE TABLE HONG_B (EMP_ID INT);

INSERT ALL 
    INTO HONG_A VALUES(10) 
    INTO HONG_A VALUES(20)
    INTO HONG_A VALUES(40)
    SELECT * FROM DUAL;
    
INSERT ALL 
    INTO HONG_B VALUES(10) 
    INTO HONG_B VALUES(20)
    INTO HONG_B VALUES(30)
    SELECT * FROM DUAL;  

commit;

SELECT
    *
FROM hong_a a full OUTER join hong_b b
On a.emp_id = b.emp_id;


/*
서브 쿼리 
*/

--보조로 사용 되는 또 다른 SELECT문을 의미 

/*
연관성 없는 서브쿼리 
*/
--메인 쿼리와 연관성 없는 서브쿼리
--메인 테이블과 조인조건이 걸리지 않은 서브쿼리
      
SELECT COUNT(*)
FROM employees
where salary >= (SELECT AVG(salary)
FROM employees
);
  
SELECT COUNT(*)
FROM employees
where department_id IN (
    SELECT department_id FROM departments where parent_id IS NULL
);    

--in 앞에 있는 컬럼 개수와 서브쿼리에서 반환하는 컬럼 개수 유형은 같아야한다.
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id) IN(SELECT employee_id , job_id FROM job_history);

UPDATE employees SET salary =(SELECT AVG(salary) FROM employees);

DELETE FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

rollback;

/*
연관성이 있는 서브 쿼리 
*/
--메인 쿼리와 연관성이 있는 서브쿼리 
--메인 테이블과 죈 조건이 걸린 서브쿼리 

SELECT a.department_id, a.department_name
FROM departments a
WHERE EXISTS (SELECT 1 FROM job_history b where a.department_id=b.department_id);

DESC departments;


SELECT a.employee_id,
    (SELECT b.emp_name
        FROM employees b
        where a.employee_id = b.employee_id
    )  emp_name,
    a.department_id,
    (SELECT b.department_name
        FROM departments b
        where a.department_id = b.department_id
    )  dep_name
    FROM job_history a;

SELECT a.department_id, a.department_name
FROM departments a
WHERE EXISTS (SELECT 1 
                FROM employees b 
                WHERE a.department_id=b.department_id 
                AND b.salary>(SELECT AVG(salary)
                FROM employees
                )
            );
            

SELECT department_id, AVG(salary)
FROM employees a
WHERE department_id IN (SELECT department_id FROM departments where parent_id=90)
GROUP BY department_id;
    
    
UPDATE employees a SET a.salary = (SELECT sal 
                                    FROM (SELECT b.department_id, AVG(salary) as sal
                                            FROM departments b, employees c
                                            WHERE  b.parent_id =90
                                            AND b.department_id=c.department_id
                                            GROUP BY b.department_id) d
                                    WHERE a.department_id=d.department_id                                          
                                    ) WHERE a.department_id IN( SELECT department_id FROM departments WHERE parent_id =90 );


SELECT department_id, MIN(salary), MAX(salary)
FROM employees a
WHERE department_id IN (SELECT department_id FROM departments where parent_id =90)
GROUP BY department_id;

MERGE INTO employees a
USING(SELECT b.department_id , AVG(salary) as sal
    FROM departments b, employees c
    WHERE b.parent_id =90
    AND b.department_id = c.department_id
    GROUP BY b.department_id
)d

ON (a.department_id = d.department_id)

WHEN MATCHED THEN UPDATE set a.salary=d.sal;


ROLLBACK;

/*
인라인 뷰
*/

--FROM 절에 사용하는 서브 쿼리를 인라인 뷰라고 한다 


--사원 테이블과 부서테이블을 조회하는데 기획부에서 평균 급여가 부서테이블과 사원테이블의 채번이 같고 사원테이블의 평균급여가 기획부의 평균 급여보다 많은
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a , departments b, (
    SELECT AVG(c.salary) AS avg_salary
    FROM departments b, employees c
    WHERE b.parent_id =90 --기획부
    AND b.department_id = c.department_id
    ) d
WHERE a.department_id = b.department_id
AND a.salary > d.avg_salary;


SELECT a.* FROM (
    SELECT a.sales_month, ROUND(AVG(a.amount_sold)) AS month_avg
    FROM sales a, customers b, countries c
    WHERE a.sales_month BETWEEN '200001' AND '200012'
    AND a.cust_id =b.cust_id
    AND b.country_id=c.country_id
    AND c.country_name= 'Italy' 
    GROUP BY a.sales_month ) a,
    
    (SELECT ROUND(AVG(a.amount_sold)) AS year_avg
    FROM sales a, customers b, countries c
    WHERE a.sales_month BETWEEN '200001' AND '200012'
    AND a.cust_id =b.cust_id
    AND b.country_id=c.country_id
    AND c.country_name= 'Italy' 
    )b
WHERE a.month_avg>b.year_avg;


--연도별로 이탈리아 매출 데이터를 보고 매출 실적이 가장 많은 사원의 목록과 매출액을 구하는 쿼리
SELECT SUBSTR(a.sales_month,1,4) as years,
        a.employee_id,
        SUM(a.amount_sold) as amount_sold
FROM sales a, customers b, countries c
    WHERE a.cust_id =b.cust_id
    AND b.country_id=c.country_id
    AND c.country_name= 'Italy'
GROUP BY SUBSTR(a.sales_month,1,4),a.employee_id;    



SELECT years, max(amount_sold) as max_sold
FROM (SELECT SUBSTR(a.sales_month,1,4) as years,
        a.employee_id,
        SUM(a.amount_sold) as amount_sold
FROM sales a, customers b, countries c
    WHERE a.cust_id =b.cust_id
    AND b.country_id=c.country_id
    AND c.country_name= 'Italy'
GROUP BY SUBSTR(a.sales_month,1,4),a.employee_id

)k 
GROUP by years
ORDER BY years
;    

SELECT years, max(amount_sold) as max_sold
FROM (SELECT SUBSTR(a.sales_month,1,4) as years,
        a.employee_id,
        SUM(a.amount_sold) as amount_sold
FROM sales a, customers b, countries c
    WHERE a.cust_id =b.cust_id
    AND b.country_id=c.country_id
    AND c.country_name= 'Italy'
GROUP BY SUBSTR(a.sales_month,1,4),a.employee_id

)k 
GROUP by years
ORDER BY years
;

SELECT  emp.years,
        emp.employee_id,
        emp2.emp_name,
        emp.amount_sold
    FROM (
        SELECT SUBSTR(a.sales_month,1,4) as years,
                a.employee_id,
                SUM(a.amount_sold) as amount_sold
        FROM sales a, customers b, countries c
            WHERE a.cust_id =b.cust_id
            AND b.country_id=c.country_id
            AND c.country_name= 'Italy'
        GROUP BY SUBSTR(a.sales_month,1,4),a.employee_id
    )emp,

    (SELECT years, max(amount_sold) as max_sold
        FROM (SELECT SUBSTR(a.sales_month,1,4) as years,
            a.employee_id,
            SUM(a.amount_sold) as amount_sold
    FROM sales a, customers b, countries c
        WHERE a.cust_id =b.cust_id
        AND b.country_id=c.country_id
        AND c.country_name= 'Italy'
    GROUP BY SUBSTR(a.sales_month,1,4),a.employee_id) k 
        GROUP by years
    ) sale,
    employees emp2
WHERE emp.years=sale.years
AND emp.amount_sold=sale.max_sold
AND emp.employee_id=emp2.employee_id
ORDER BY years;