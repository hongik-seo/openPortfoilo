/*
SELECT
*/

SELECT employee_id, emp_name
    FROM employees
WHERE salary >5000 AND job_id ='IT_PROG'
ORDER BY employee_id;


SELECT employee_id, emp_name
    FROM employees
WHERE salary >5000 OR job_id ='IT_PROG'
ORDER BY employee_id;

SELECT a.employee_id, a.emp_name , a.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id =b.department_id;

SELECT a.employee_id, a.emp_name , a.department_id, b.department_name AS dep_name
FROM employees a, departments b
WHERE a.department_id =b.department_id;

/*
INSERT
*/

CREATE TABLE ex3_1(
    col1 VARCHAR2(10),
    col2 NUMBER,
    col3 DATE
    
);


INSERT INTO ex3_1(col1,col2,col3) VALUES('abc',10,sysdate);

--컬럼의 순서를 바꿔도 바뀐 순서와 맞추기만 하면됨
INSERT INTO ex3_1(col3,col1,col2) VALUES(sysdate,'DEF',10);


--"inconsistent datatypes: expected %s got %s"
--데이터 타입을 맞추지 않으면 오류가 발생
INSERT INTO ex3_1(col1,col2,col3) VALUES('abc',10,30);

--컬럼명 기술 생략 모든 데이터를 입력하는 의미
INSERT INTO ex3_1 VALUES('GHI',10,SYSDATE);

--success
INSERT INTO ex3_1(col1,col2) VALUES('abc',10);

--fail
--SQL 오류: ORA-00947: not enough values
INSERT INTO ex3_1 VALUES('abc',10);

--insert~select 형태

CREATE table ex3_2(
    emp_id      number,
    emp_name    VARCHAR2(100)

);
--58개 행 이(가) 삽입되었습니다. 컬럼 순서와 데이터 타입을 맞추어야 한다.
INSERT INTO ex3_2(emp_id, emp_name) SELECT employee_id, emp_name FROM employees where salary >5000;

--데이터 타입을 맞추지 않아도 성공하는 경우
--묵시적 형변환
INSERT INTO ex3_1 (col1,col2,col3) VALUES (10,'10','2014-01-01');

/*
UPDATE
*/

SELECT * FROM ex3_1;

UPDATE ex3_1 SET col2 =50;

SELECT * FROM ex3_1;

--0개 행 이(가) 업데이트되었습니다.
--오라클에서 null 값을 찾으려면 IS NULL IS NOT NULL로 찾아야한다.
UPDATE ex3_1 SET col3 =sysdate WHERE col3 ='';

--1 행 이(가) 업데이트되었습니다.
UPDATE ex3_1 SET col3 =sysdate WHERE col3 is NULL;

/*
MERGE 
*/

--조건을 비교해서 테이블에 해당 조건이 맞는 데이터가 없으면 INSERT 있으면 UPDATE를 수행하는 문장

CREATE TABLE ex3_3(

    employee_id     NUMBER,
    bonus_amt       NUMBER DEFAULT 0

);

INSERT INTO ex3_3 (employee_id)

SELECT e.employee_id
    FROM employees e ,sales s
where e.employee_id =s.employee_id
AND s.sales_month between '200010' AND '200012'
GROUP by e.employee_id;

SELECT
    *
FROM ex3_3
ORDER BY employee_id;

SELECT employee_id, manager_id, salary, salary*0.01
From employees
where employee_id IN (SELECT
    employee_id
FROM ex3_3
);

SELECT employee_id, manager_id, salary,salary*0.001
FROM employees
where employee_id NOT IN (SELECT
    employee_id
FROM ex3_3
) AND manager_id =146; 

MERGE INTO ex3_3 d
    USING (SELECT employee_id, salary, manager_id
            FROM employees
            where Manager_id=146
            ) b
        ON (d.employee_id = b.employee_id)
    WHEN MATCHED THEN 
        UPDATE SET d.bonus_amt =d.bonus_amt +b.salary*0.01
    WHEN NOT MATCHED THEN
        INSERT (d.employee_id, d.bonus_amt) values (b.employee_id, b.salary*0.001)
        WHERE (b.salary<8000);
        
SELECT * from ex3_3 ORDER BY employee_id;

/*
DELETE
*/

DELETE ex3_3;

--파티션 조회
SELECT partition_name 
FROM user_tab_partitions
where table_name='SALES';

/*
의사컬럼
*/

-- CONNECT_BY_ISCYCLE , CONNECT_BY_ISLEAF,LEVEL 
--NEXTVAL ,CURVAL
--ROWNUM,ROWID

SELECT ROWNUM, employee_Id,ROWID
FROM employees
WHERE ROWNUM<5;

/*
연산자
*/

--수식 연산자 +-*/

--문자 연산자 || 두 문자를 붙이는 연상을 수행 

SELECT employee_id ||'-'|| emp_name AS employee_info
FROM employees
WHERE ROWNUM<5;

--논리연산자 >,<,>=,<=,=,<>,!=,^=

--집합연산자 UNTION,UNITON ALL, INTERSECT, MINUS

--계층형 쿼리 연산자 :PRIOR,CONNECT_BY_ROOT

/*
표현식 case when then, decode
*/
SELECT employee_id, salary,
    CASE    WHEN salary <=5000 THEN 'C등급'
            WHEN salary>5000 AND salary<=15000 THEN 'B등급'
            ELSE 'A등급'
        END AS SALARY_GRADE
        FROM employees;


/*
조건식
*/        
-- any some all 조건식

--any 하나만 만족해도 나옴
SELECT employee_id,salary
FROM employees
WHERE salary=ANY(2000,3000,4000)
ORDER BY employee_id;

--위와 같다
SELECT employee_id ,salary
FROM employees
WHERE salary=2000 OR salary=3000 OR salary=4000
ORDER BY employee_id;

--all 모든 조건을 만족해야 나옴
SELECT employee_id,salary
FROM employees
WHERE salary=all(2000,3000,4000)
ORDER BY employee_id;

--위와 같음
SELECT employee_id ,salary
FROM employees
WHERE salary=2000 AND salary=3000 AND salary=4000
ORDER BY employee_id;

--some any와 같음
SELECT employee_id,salary
FROM employees
WHERE salary=some(2000,3000,4000)
ORDER BY employee_id;

/*
논리조건식 AND OR NOT
*/

SELECT employee_id, salary
FROM employees
WHERE NOT (salary>=2500)
ORDER BY employee_id;

--NULL 조건식 a=null a=NOT null 이건 안된 null값 비교는 is null is not null로만 

--BETWEEN AND 조건식

SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;

--IN 조건식

SELECT employee_id, salary
FROM employees
WHERE salary IN( 2000 , 3000 , 4000)
ORDER BY employee_id;


SELECT employee_id, salary
FROM employees
WHERE salary NOT IN( 2000 , 3000 , 4000)
ORDER BY employee_id;

--EXISTS 조건식 in하고 비슷하지만 ()안에는 서브쿼리만 

SELECT department_id, department_name
FROM departments a 
WHERE EXISTS (SELECT * FROM employees b where a.department_id=b.department_id AND b.salary>3000)
ORDER BY a.department_name;

--LIKE 문자열의 패턴ㅇ르 검색할때 사용하는 조건식
SELECT emp_name 
FROM employees 
where emp_name LIKE 'A%' --'%A' '%A%'
ORDER BY emp_name;

CREATE TABLE ex3_5(
    names VARCHAR2(30)
);

INSERT INTO ex3_5 values('홍길동');

INSERT INTO ex3_5 values('홍길용');

INSERT INTO ex3_5 values('홍길상');

INSERT INTO ex3_5 values('홍길상동');

SELECT * 
from ex3_5
where names LIKE '홍길%';

SELECT * 
from ex3_5
where names LIKE '홍길_';

commit;