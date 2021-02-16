
/*
--��������
*/

/*
��������
*/

--���� ������ where ���� ��ȣ�� ����� 2���̻��� ���̺��̳� �並 �����Ѱ�
--�μ� ���̺��� Ű�� �ش��ϴ� �ʼ� �������� ������̺����� �ʼ� ���� �ƴϹǷ� ��� ���̺� �μ���ȣ �÷����� �ִ� �Ǹ� ����
SELECT a.employee_id , a.emp_name, a.department_id, b.department_name
FROM employees a ,departments b
where a.department_id =b.department_id;

/*
��������
*/

--���������� ���� ������ ����� ���������� �����ϴ� �����͸� ���� �������� �����ϴ� ��� in �� exists�����ڸ� �̿��� ���� 
--���� A ���� B B���̺� �����ϴ� A���̺��� �����͸� �����ϴ� ����

/*--���������� �����ϴ� ���� ���� �����Ͱ� ������ �����ϴ��� ���� ��ȯ�Ǵ� ���� �����Ϳ��� �ߺ��Ǵ� ���� ���ٴ� ���� �Ϲ����ΰ��� ������*/

--�Ϲ� ������ �ϸ� SELECT ���� B���̺� �÷��� ���� ������� �ʴ��� �ߺ��Ǵ� ���� �߻�

--11��
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

--80��
SELECT a.department_id, a.department_name
FROM departments a, employees b
where a.department_id=b.department_id
AND b.salary>3000
ORDER BY a.department_name;

/*
��Ƽ����
*/
--���������� B���̺��� ���� ���������� A���̺��� �����͸� �����ϴ� ����
--���� ���ΰ��� �ݴ� ����

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

--106 �����ʹ� �� 107 106�� ������  employees manager_id�� ���� �� �� �ֱ⶧�� 
SELECT COUNT(*) count
FROM employees a
WHERE NOT EXISTS(
    SELECT 1 
    FROM departments c
    WHERE a.department_id =c.department_id
    AND manager_id IS NULL
);


/*
��������
*/

--���������� ���� �ٸ� �� ���̺��� �ƴ� ������ ���̺��� ����� �����ϴ� ���

SELECT a.employee_id, a.emp_name , b.employee_id ,b.emp_name , a.department_id
FROM employees a, employees b
WHERE a.employee_id<b.employee_id
AND a.department_id =b.department_id
AND a.department_id=20;

/*
--�ܺ�����
*/

--�ܺ������� �Ϲ� ������ Ȯ���� ����
--���� ���ǿ� �����ϴ� ������ �� �ƴ϶� ��� �� �� ���̺� ���� ������ ��õ� �÷��� ���� ���ų� null�̴��� �ش� �ο찡 �ƿ� ������ �����͸� ��� ����

--�Ϲ� ����
SELECT a.department_id , a.department_name , b.job_id, b.department_id
FROM departments a, job_history b
where a.department_id=b.department_id;

--���� ���ǿ� �����Ͱ� ���� �÷��� (+)�� ���̴°� �ܺ�����
SELECT a.department_id , a.department_name , b.job_id, b.department_id
FROM departments a, job_history b
where a.department_id=b.department_id(+);


--���� ���� ��ο�(+)�� �ٿ����Ѵ�
SELECT a.employee_id , a.emp_name , b.job_id, b.department_id
FROM employees a, job_history b
where a.employee_id = b.employee_id(+)
AND a.department_id=b.department_id;

SELECT a.employee_id , a.emp_name , b.job_id, b.department_id
FROM employees a, job_history b
where a.employee_id = b.employee_id(+)
AND a.department_id=b.department_id(+);

/*
�ܺ����� ���� ����
*/

--1. ���� ��� ���̺� �� �����Ͱ� ���� ���̺� �������� (+)�� ���δ�. 
--2. �ܺ� ������ ���� ������ ���� ���� �� ���� ���ǿ� (+)�� ���δ� 
--3. �ѹ��� �����̺��� �ܺ� ������ �� �� �ִ�. ���� ��� ���� ��� ���̺��� A,B,C 3���� A�� ������� B���̺��� �ܺ��������� ���������� ���ÿ� C�� �������� B���̺� �ܺ������� �� �� ����. 
--4.(+)�����ڰ� ���� ���ǰ� OR�� ���� ����� �� ���� 
--5.(+)�����ڰ� ���� ���ǿ��� IN �����ڸ� ���� ����� �� ����(in���� ���ԵǴ� ���� 1���� ����)



/*
ī���� ����
*/

--ī���� ������ WHERE ���� ���� ������ ���� ������ ���� 
--FROM ���� ���̺��� ��������� �� ���̺� �� ���� ������ ���� ���� 
--����� �� ���̺��� �Ǽ��� ��

SELECT a.employee_id , a.emp_name, b.department_id, b.department_name
FROM employees a, departments b;

/*
ANSI����
*/

-- ANSI ������ ����� ����
--���� ������ FROM ���� ��� ���ٴ� ���̴�. 


--���� ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a, departments b
where a.department_id = b.department_id
AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


--ANSI ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a INNER JOIN departments b
on (a.department_id = b.department_id)
WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


--USING �̿�

--�߸��� ���
--ORA-25154: USING ���� �� �κ��� �ĺ��ڸ� ���� �� ����
--25154. 00000 -  "column part of USING clause cannot have qualifier"
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a INNER JOIN departments b
USING(department_id)
WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

--�ùٸ� ���

SELECT a.employee_id, a.emp_name, department_id, b.department_name
FROM employees a INNER JOIN departments b
USING(department_id)
WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');


/*
ANSI �ܺ� ����
*/

--���� ����
SELECT a.employee_id , a.emp_name, b.job_id, b.department_id
FROM employees a, job_history b
WHERE a.employee_id = b.employee_id(+)
AND a.department_id=b.department_id(+);


--ANSI ����
--���ʱ������� �������� ���� ���� ����
SELECT a.employee_id , a.emp_name, b.job_id, b.department_id
FROM employees a LEFT OUTER JOIN job_history b
ON a.department_id = b.department_id
and b.employee_id = a.employee_id;


/*
CROSS����
*/
--���� ����
SELECT a.employee_id , a.emp_name, b.department_id, b.department_name
FROM employees a, departments b;

--ANSI����
SELECT a.employee_id , a.emp_name, b.department_id, b.department_name
FROM employees a CROSS join departments b;

/*
FULL OUTTER���� 
*/
--ANSI���� �ִ� ���α��
--�� ���̺��� �ΰ��� ��ȸ

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
���� ���� 
*/

--������ ��� �Ǵ� �� �ٸ� SELECT���� �ǹ� 

/*
������ ���� �������� 
*/
--���� ������ ������ ���� ��������
--���� ���̺�� ���������� �ɸ��� ���� ��������
      
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

--in �տ� �ִ� �÷� ������ ������������ ��ȯ�ϴ� �÷� ���� ������ ���ƾ��Ѵ�.
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id) IN(SELECT employee_id , job_id FROM job_history);

UPDATE employees SET salary =(SELECT AVG(salary) FROM employees);

DELETE FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

rollback;

/*
�������� �ִ� ���� ���� 
*/
--���� ������ �������� �ִ� �������� 
--���� ���̺�� �� ������ �ɸ� �������� 

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
�ζ��� ��
*/

--FROM ���� ����ϴ� ���� ������ �ζ��� ���� �Ѵ� 


--��� ���̺�� �μ����̺��� ��ȸ�ϴµ� ��ȹ�ο��� ��� �޿��� �μ����̺�� ������̺��� ä���� ���� ������̺��� ��ձ޿��� ��ȹ���� ��� �޿����� ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a , departments b, (
    SELECT AVG(c.salary) AS avg_salary
    FROM departments b, employees c
    WHERE b.parent_id =90 --��ȹ��
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


--�������� ��Ż���� ���� �����͸� ���� ���� ������ ���� ���� ����� ��ϰ� ������� ���ϴ� ����
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