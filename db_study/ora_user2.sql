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

--�÷��� ������ �ٲ㵵 �ٲ� ������ ���߱⸸ �ϸ��
INSERT INTO ex3_1(col3,col1,col2) VALUES(sysdate,'DEF',10);


--"inconsistent datatypes: expected %s got %s"
--������ Ÿ���� ������ ������ ������ �߻�
INSERT INTO ex3_1(col1,col2,col3) VALUES('abc',10,30);

--�÷��� ��� ���� ��� �����͸� �Է��ϴ� �ǹ�
INSERT INTO ex3_1 VALUES('GHI',10,SYSDATE);

--success
INSERT INTO ex3_1(col1,col2) VALUES('abc',10);

--fail
--SQL ����: ORA-00947: not enough values
INSERT INTO ex3_1 VALUES('abc',10);

--insert~select ����

CREATE table ex3_2(
    emp_id      number,
    emp_name    VARCHAR2(100)

);
--58�� �� ��(��) ���ԵǾ����ϴ�. �÷� ������ ������ Ÿ���� ���߾�� �Ѵ�.
INSERT INTO ex3_2(emp_id, emp_name) SELECT employee_id, emp_name FROM employees where salary >5000;

--������ Ÿ���� ������ �ʾƵ� �����ϴ� ���
--������ ����ȯ
INSERT INTO ex3_1 (col1,col2,col3) VALUES (10,'10','2014-01-01');

/*
UPDATE
*/

SELECT * FROM ex3_1;

UPDATE ex3_1 SET col2 =50;

SELECT * FROM ex3_1;

--0�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
--����Ŭ���� null ���� ã������ IS NULL IS NOT NULL�� ã�ƾ��Ѵ�.
UPDATE ex3_1 SET col3 =sysdate WHERE col3 ='';

--1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
UPDATE ex3_1 SET col3 =sysdate WHERE col3 is NULL;

/*
MERGE 
*/

--������ ���ؼ� ���̺� �ش� ������ �´� �����Ͱ� ������ INSERT ������ UPDATE�� �����ϴ� ����

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

--��Ƽ�� ��ȸ
SELECT partition_name 
FROM user_tab_partitions
where table_name='SALES';

/*
�ǻ��÷�
*/

-- CONNECT_BY_ISCYCLE , CONNECT_BY_ISLEAF,LEVEL 
--NEXTVAL ,CURVAL
--ROWNUM,ROWID

SELECT ROWNUM, employee_Id,ROWID
FROM employees
WHERE ROWNUM<5;

/*
������
*/

--���� ������ +-*/

--���� ������ || �� ���ڸ� ���̴� ������ ���� 

SELECT employee_id ||'-'|| emp_name AS employee_info
FROM employees
WHERE ROWNUM<5;

--�������� >,<,>=,<=,=,<>,!=,^=

--���տ����� UNTION,UNITON ALL, INTERSECT, MINUS

--������ ���� ������ :PRIOR,CONNECT_BY_ROOT

/*
ǥ���� case when then, decode
*/
SELECT employee_id, salary,
    CASE    WHEN salary <=5000 THEN 'C���'
            WHEN salary>5000 AND salary<=15000 THEN 'B���'
            ELSE 'A���'
        END AS SALARY_GRADE
        FROM employees;


/*
���ǽ�
*/        
-- any some all ���ǽ�

--any �ϳ��� �����ص� ����
SELECT employee_id,salary
FROM employees
WHERE salary=ANY(2000,3000,4000)
ORDER BY employee_id;

--���� ����
SELECT employee_id ,salary
FROM employees
WHERE salary=2000 OR salary=3000 OR salary=4000
ORDER BY employee_id;

--all ��� ������ �����ؾ� ����
SELECT employee_id,salary
FROM employees
WHERE salary=all(2000,3000,4000)
ORDER BY employee_id;

--���� ����
SELECT employee_id ,salary
FROM employees
WHERE salary=2000 AND salary=3000 AND salary=4000
ORDER BY employee_id;

--some any�� ����
SELECT employee_id,salary
FROM employees
WHERE salary=some(2000,3000,4000)
ORDER BY employee_id;

/*
�����ǽ� AND OR NOT
*/

SELECT employee_id, salary
FROM employees
WHERE NOT (salary>=2500)
ORDER BY employee_id;

--NULL ���ǽ� a=null a=NOT null �̰� �ȵ� null�� �񱳴� is null is not null�θ� 

--BETWEEN AND ���ǽ�

SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;

--IN ���ǽ�

SELECT employee_id, salary
FROM employees
WHERE salary IN( 2000 , 3000 , 4000)
ORDER BY employee_id;


SELECT employee_id, salary
FROM employees
WHERE salary NOT IN( 2000 , 3000 , 4000)
ORDER BY employee_id;

--EXISTS ���ǽ� in�ϰ� ��������� ()�ȿ��� ���������� 

SELECT department_id, department_name
FROM departments a 
WHERE EXISTS (SELECT * FROM employees b where a.department_id=b.department_id AND b.salary>3000)
ORDER BY a.department_name;

--LIKE ���ڿ��� ���Ϥ��� �˻��Ҷ� ����ϴ� ���ǽ�
SELECT emp_name 
FROM employees 
where emp_name LIKE 'A%' --'%A' '%A%'
ORDER BY emp_name;

CREATE TABLE ex3_5(
    names VARCHAR2(30)
);

INSERT INTO ex3_5 values('ȫ�浿');

INSERT INTO ex3_5 values('ȫ���');

INSERT INTO ex3_5 values('ȫ���');

INSERT INTO ex3_5 values('ȫ���');

SELECT * 
from ex3_5
where names LIKE 'ȫ��%';

SELECT * 
from ex3_5
where names LIKE 'ȫ��_';

commit;