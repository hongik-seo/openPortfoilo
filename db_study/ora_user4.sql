
/*
�����Լ�
*/
SELECT COUNT(*) FROM employees;

SELECT COUNT(employee_id) FROM employees;

--ī��Ʈ ������ null ����  �����Ѵ�.

SELECT COUNT(department_id) FROM employees;

--DISTINCT�� �ķ��� �ִ� ������ ���� ��ȸ
SELECT COUNT(DISTINCT department_id) FROM employees;

SELECT DISTINCT department_id FROM employees ORDER BY 1;

--SUM(expr) ��ü �հ踦 ��ȯ�ϴ� �Լ� expr�� �������� �� �� ���� 
SELECT SUM(salary) FROM employees;

--DISTINCT�� �ٿ��� ������ �ߺ��� �޿��� �� ���� ����
SELECT SUM(salary), SUM(DISTINCT salary) FROM employees;

--AVG(expr) ��հ� ��ȯ
SELECT AVG(salary), AVG(DISTINCT salary) FROM employees;

--MIN(expr) MAX(expr) ���� �ּҰ� �ִ밪 ��ȯ
SELECT MIN(salary), MAX(DISTINCT salary) FROM employees;

--VARIANCE(expr) �л�, STDDEV(expr) ǥ������
SELECT VARIANCE(salary) as �л�, STDDEV(salary) as ǥ������ FROM employees;

/*
GROUP BY HAVVING ��
*/

--GROUP BY�� WHERE�� ODER BY�� ���̿� ��ġ
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT * FROM kor_loan_status;

--�����Լ��� ���� �̱۷θ� ����ϴµ� GROUP BY�� ���̸� ����� �� ����
SELECT period, region, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region
ORDER BY period, region;

--GROUP BY ǥ������ �ƴմϴ�.
--GROUP BY ���� SELECT���� �ִ� �����ռ��� �����ϰ� �÷����̳� ǥ������ ��� ����ؾ�����
SELECT period, region, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period = '201311'
GROUP BY  region
ORDER BY  region;

--HAVING ���� GROUP BY�� ����� �ٽ� ���͸� �Ŵ� ���� 

SELECT period, region, SUM(loan_jan_amt) tot_jan 
FROM kor_loan_status
WHERE period = '201311'
GROUP BY  period, region
HAVING SUM(loan_jan_amt)>100000
ORDER BY  period, region;


--ROLLUP(expr1,expr2,...) expr�� ����� ǥ������ �������� ������ ����� ������ 
--�߰����� ���������� �����ش�
--ǥ������ ����(�����ʿ��� ���ʼ����� )�� ����
--n���̸� n+1�������� �������� �������������� ������ ����

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
--ROLLUP�� �������� ���� ���踦 �ߴٸ� CUBEsms 2��(expr��)���� ��ŭ �������� ����
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
���� ������
*/

CREATE TABLE exq_goods_asia(
        
        contry  VARCHAR2(10),
        seq     NUMBER,
        goods   VARCHAR2(80)

);

ALTER table exq_goods_asia rename to exp_goods_asia ;

DESC exp_goods_asia;


           
SELECT goods FROM exp_goods_asia where contry='�ѱ�' ORDER BY seq;

SELECT goods FROM exp_goods_asia where contry='�Ϻ�' ORDER BY seq;


--UNION �������� �ǹ� 
--�ڵ��� ������ ���ļ� �ѹ��� ��ȸ
SELECT goods FROM exp_goods_asia where contry='�ѱ�' 
UNION
SELECT goods FROM exp_goods_asia where contry='�Ϻ�' ;

--UNION ALL �ߺ��� �׸� ��� ��ȸ

SELECT goods FROM exp_goods_asia where contry='�ѱ�' 
UNION ALL
SELECT goods FROM exp_goods_asia where contry='�Ϻ�';

--INTERSECT �������� �ǹ�
SELECT goods FROM exp_goods_asia where contry='�ѱ�' 
INTERSECT
SELECT goods FROM exp_goods_asia where contry='�Ϻ�';

--MINUS �������� �ǹ� �� ������ ������ �������� �ٸ� ������ ���հ� ����� �׸����� 
--�ѱ����� ������ �Ϻ����� ���°�
--���� ��ġ�� select�� ����
SELECT goods FROM exp_goods_asia where contry='�ѱ�' 
MINUS
SELECT goods FROM exp_goods_asia where contry='�Ϻ�';


SELECT goods FROM exp_goods_asia where contry='�Ϻ�' 
MINUS
SELECT goods FROM exp_goods_asia where contry='�ѱ�';

--���� ����

--1 ���� �����ڿ� ����Ǵ� �� select ���� select ����Ʈ�� ������ ������ Ÿ���� ��ġ�ؾ���
--ORA-01789: ���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�.
--01789. 00000 -  "query block has incorrect number of result columns"
SELECT goods FROM exp_goods_asia where contry='�ѱ�' 
UNION
SELECT seq,goods FROM exp_goods_asia where contry='�Ϻ�';

--���� seq�� �߰��ϸ� 
--seq�� goods ���ļ� �������
--�ߺ����� �����Ҷ� goods�� �ƴ϶� seq�� �ݿ��Ǽ� �� 18���� ��ȸ
SELECT seq,goods FROM exp_goods_asia where contry='�ѱ�' 
UNION
SELECT seq,goods FROM exp_goods_asia where contry='�Ϻ�';

SELECT seq,goods FROM exp_goods_asia where contry='�ѱ�' 
INTERSECT
SELECT seq,goods FROM exp_goods_asia where contry='�Ϻ�';

--ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ�
--01790. 00000 -  "expression must have same datatype as corresponding expression"
SELECT seq FROM exp_goods_asia where contry='�ѱ�' 
UNION
SELECT goods FROM exp_goods_asia where contry='�Ϻ�';


--2 ORDER BY ���� �� ������ ���忡���� ����� �� ����


--ORA-00933: SQL ��ɾ �ùٸ��� ������� �ʾҽ��ϴ�
--00933. 00000 -  "SQL command not properly ended"
SELECT goods FROM exp_goods_asia where contry='�ѱ�'
ORDER BY goods
UNION
SELECT goods FROM exp_goods_asia where contry='�Ϻ�';

SELECT goods FROM exp_goods_asia where contry='�ѱ�'
UNION
SELECT goods FROM exp_goods_asia where contry='�Ϻ�'
ORDER BY goods;

--3 blob clob bfile Ÿ���� �÷������� ���տ����� ��� �Ұ� 

--4 union intersect ninus �����ڴ� long�� �÷����� ����� �� ����


/*
GROUPING SETs 
*/
--�׷� ������ �ϳ� UNUON ALL �� ��������
--���� ����� GROUP BY expr1 UNION ALL (GROUP BY expr2) UNION ALL (GROUP BY expr3)

SELECT
period,gubun,SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
where period like '2013%'
group by GROUPING SETS(period,gubun);

SELECT
period,gubun,region,SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
where period like '2013%'
AND region IN('����','���')
group by GROUPING SETS(period,(gubun,region));
