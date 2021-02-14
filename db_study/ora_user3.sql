/*
�����Լ�
*/

--ABS(n) ���밪 ��ȯ

SELECT ABS(10) ,ABS(-10), ABS(-10.123)
FROM dual;

--CEIL(n) n�� ���ų� ����ū ������ ��ȯ (�ø�)

SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)
FROM dual;

--FLOOR(n) n���� �۰ų� ���� ū ������ ��ȯ (����)
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)
FROM dual;

--ROUND(n,i) n�� �Ҽ��� ���� (i+1)�� °���� �ݿø��� ����� ��ȯ i�� ������ �� �ְ� ����Ʈ ���� 0
SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)
FROM dual;

SELECT ROUND(10.154,1), ROUND(10.154,2), ROUND(10.154,3)
FROM dual;

--i�� ������ �Ҽ����� �������� ���� i ��°�� �ݿø� �Ͼ
SELECT ROUND(0,3), ROUND(115.115,-1), ROUND(115.115,-2)
FROM dual;

--TRUNC �Լ��� �ݿø��� ���� �ʰ� n1�� �Ҽ��� ���� n2�ڸ����� ������ �߶� ����� ��ȯ�Ѵ�. n2�� �������� ����Ʈ�� 0 ��� �Ҽ��� ���� ������ ���� �Ҽ��� ���� ����
SELECT TRUNC(115.115), TRUNC(115.115,1), TRUNC(115.115,2), TRUNC(115.115,-2)
FROM dual;

--POWER(n2,n1)�Լ��� n2�� n1 (������ ���)�� ��ȯ n1�� ������ �Ǽ� ��ο� �� �ִµ� n2�� ������ �� n1�� ������ �ü� ����

SELECT POWER(3,2), POWER(3,3), POWER(3,3.0001)
from dual;

--ORA-01428: '-3' �μ��� ������ ������ϴ� -- n1�� �����϶��� n2�� ������
SELECT POWER(-3,3.0001)
FROM dual;

--SQRT (������ ��ȯ)
SELECT SQRT(2), SQRT(5)
FROM dual;

--MOD(n2,n1) n2�� n1�� ���� ������ ���� ��ȯ
--n2-n1*FLOOR(n2/n1)
SELECT MOD(19,4) , MOD (19.123,4.2)
FROM dual;

--REMAINDER(n2,n1) n2�� n1�� ���� ������ ���� ��ȯ
--n2-n1*ROUND(n2/n1)
SELECT REMAINDER(19,4) , REMAINDER(19.123,4.2)
FROM dual;

--EXP(n) LN(n),LOG(n2,n1) EXP �����Լ� e�� n���� ���� ��ȯ LN �ڿ� �α� �Լ� �ؼ��� e�� �α� �Լ�, log n2�� �ؼ��� �ϴ� n1�� ��ȯ

SELECT EXP(2), LN(2.713),LOG(10,100)
FROM DUAL;


/*
�����Լ�
*/

--INITCAP(char) ù���ڴ� ����� �������� �ҹ��ڷ� ��ȯ �ϴ� �Լ�. �̶� ù ���ڸ� �ν��ϴ� ������ ����� ���ĺ�(���� ����)�� ������ ����
SELECT INITCAP('naversaygoodbye'), INITCAP('naver say good bye'), INITCAP('naver6say*good��bye')
FROM DUAL;

--LOWER �Լ��� �Ű������� ������ ���ڸ� ��� �ҹ��ڷ� ��ȯ UPPER�� �Ű������� ������ ���ڸ� ��� �빮�ڷ� ��ȯ
SELECT LOWER('NAVER SAY GOODBYE'), UPPER('naver say good bye')
FROM DUAL;

--CONCAT(char1,char2) '||' ������ ó�� ���������� ������ �� ���ڸ� �ٿ� ��ȯ�Ѵ�. 

SELECT CONCAT('I HAVE','A DREAM'), 'I HAVE ' || 'A DREAM'
FROM DUAL;

--SUBSTR(char,pos,len) �߶�� ��� ���ڿ��� char�� pos��° ���ڷ� ���� len ���� ��ŭ �߶� ����� ��ȯ 
--pos���� 0�� ���� ����Ʈ ���� 1, �� ù��° ���ڸ� ����Ű,������ ���� char ���ڿ� �� ������ ������ ����� ��ġ�� �ǹ� 
--len�� �����Ǹ� pos��° ���ں��� ������ ��� ���ڸ� ��ȯ

SELECT SUBSTR('ABCDEFG',1,4) , SUBSTR('ABCDEFG',-1,4)
FROM DUAL;

--SUBSTRB ������ �������ƴ� ���ڿ��� ����Ʈ ���� �߶� ����� ��ȯ
--SELECT lengthb('��') FROM dual; �� ��ǻ�ʹ� 3����Ʈ
SELECT SUBSTRB('ABCDEFG',1,4) , SUBSTRB('ABCDEFG',-1,4), SUBSTRB('�����ٶ󸶹ٻ�',1,4),SUBSTRB('�����ٶ󸶹ٻ�',-1,4)
FROM DUAL;

--LTRIM(char,set) RTRIM(char,set) char���ڿ����� set���� ������ 
--���ڿ��� ���� ��(LTRIM) 
--������ ��(RTRIM)���� ������ �� ������ ���ڿ��� ��ȯ�Ѵ�. 
--set�� ������ ���ڿ��� ������(�߰��� ������) ��ü�� ��ȯ
--���� ���� Ȥ�� ������ ������ ������ �뵵�� ���� ���
SELECT LTRIM('ABCDEFGABC','ABC'),LTRIM('�����ٶ󸶹ٻ�','��'),RTRIM('ABCDEFGABC','ABC'),RTRIM('�����ٶ�','��')
FROM DUAL;

SELECT LTRIM('�����ٶ�','��'),RTRIM('�����ٶ�','��')
FROM DUAL;

--LPAD(expr1,n,expr2) RPAD(expr1,n,expr2)
--expr2 ���ڿ�(���� �� ��� ����Ʈ�� ���� �� ����)�� n�ڸ���ŭ ���ʺ��� ä�� expr1�� ��ȯ�ϴ� �Լ�

CREATE TABLE ex4_1(

    phone_num VARCHAR2(30)
);

INSERT INTO EX4_1 values('111-1111');

INSERT INTO EX4_1 values('111-2222');

INSERT INTO EX4_1 values('111-3333');

rollback;

SELECT * FROM ex4_1;

SELECT LPAD(phone_num,12,'(02)')
FROM ex4_1;

SELECT RPAD(phone_num,12,'(02)')
FROM ex4_1;

--REPLACE (char,search_str,replace_str)
--REPLACE char ���ڿ����� search_str���ڸ� ã�� �̸� replace_str ���ڿ��� ��ü�� ����� ��ȯ�ϴ� �Լ�
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','��','��')
FROM DUAL;
--���ڿ� ��ü�� ������ ��� ������ �� �ִ�.

SELECT LTRIM(' ABC DEF '), RTRIM(' ABC DEF '),REPLACE(' ABC DEF ',' ','')
FROM DUAL;

--TRANSLATE(expr,from_str,to_str) expr ���ڿ����� from_str�� �ش��ϴ� ���ڸ� ã�� to_str�� �ٲ� ����� ��ȯ 
--REPLACE�� �ٸ� ���� ���ڿ� ��ü�� �ƴ� ���� �� ���ھ� ������ �ٲ� ����� ��ȯ 
SELECT  REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','����','�ʸ�') rep,
        TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','����','�ʸ�') trn        
FROM DUAL;

/*
��¥ �Լ�
*/

--SYSDETE,SYSTIMESTAMP
SELECT SYSDATE, SYSTIMESTAMP FROM dual;

--ADD MONTHS(date,integer) �Ű������� ���� date �� integer��ŭ�� ���� ���� ��¥�� ��ȯ�Ѵ�. 
SELECT ADD_MONTHS (sysdate,1), ADD_MONTHS (sysdate,-1)
FROM DUAL;

--MONTHS_BETWEEN(date1,date2) �� ��¥ ������ ���� �� �� ��ȯ�ϴµ� date2�� date1���� ���� ��¥�� �´� 
SELECT MONTHS_BETWEEN(sysdate, ADD_MONTHS(sysdate,1)) mon1,
       MONTHS_BETWEEN(ADD_MONTHS(sysdate,1),sysdate) mon2
FROM DUAL;

--LAST_DAY(date) date ��¥�� �������� �ش���� ������ ���ڸ� ��ȯ�Ѵ�. 
SELECT LAST_DAY(sysdate)
FROM DUAL;

--ROUND(date,format) ,TRUNC(date,format) 
--format�� ���� �ݿø�(ROUND), format�� ���� �߶� ��¥�� ��ȯ�Ѵ�(TRUNC)
SELECT SYSDATE, ROUND(SYSDATE,'month'), TRUNC(SYSDATE,'month')
FROM DUAL;

--NEXT_DAY(date,char) date�� char�� ����� ��¥�� ���� �� ���� ���ڸ� ��ȯ�Ѵ�.
SELECT NEXT_DAY(SYSDATE,'�ݿ���')
FROM DUAL;

/*
��ȯ �Լ�
*/

--TO_CHAR(���� Ȥ�� ��¥ format)
--���ڳ� ��¥�� ���ڷ� ��ȯ�� �ִ� �Լ� ��ȯ ����� Ư�� ���Ŀ� �°� ����� �� �ִ�.

SELECT TO_CHAR(123456789,'999,999,999')
FROM DUAL;

SELECT TO_CHAR(sysdate,'YYYY-MM-DD')
from dual;

--TO_NUMBER(expr,format)
--���ڳ� �ٸ� ������ ���ڸ� NUMBER������ ��ȭ�ϴ� �Լ� 

SELECT TO_NUMBER('12345')
FROM DUAL;


--TO_DATE(char,format), TO_TIMESTAMP(char,format)

SELECT TO_DATE('20210102','YYYY/MM/DD')
FROM DUAL;

SELECT TO_DATE('20210102 13:44:50','YYYY-mm-dd HH24:MI:SS')
FROM DUAL;

/*
null ���� �Լ�
*/

--NVL(expr1,expr2) 
--NVL �Լ��� expr1�� null�� �� expr2�� ��ȯ

SELECT NVL(manager_id,employee_id)
FROM employees
where manager_id IS NULL
;
--NAV2(expr1,expr2,expr3)
--NVL2 expr1�� null�� �ƴϸ� expr2, null�̸� expr3��ȯ
SELECT employee_id,
    NVL2(commission_pct, salary +(salary *commission_pct),salary) as salary2
FROM employees; 

--COALESCE(expr1,eppr2,...) 
--�Ű������� ������ ǥ���Ŀ��� null�� �ƴ� ù��° ǥ������ ��ȯ�ϴ� �Լ�
SELECT employee_id, salary,commission_pct,
COALESCE(salary*commission_pct,salary) as salary2
FROM employees;

--LNNVL(���ǽ�)
--���ǽ��� ����� false�� unknown�̸� true�� ��ȯ 
--���ǽ��� ����� true�̸� false��ȯ


--null�� ����� �˻��� �ȵ�
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct<0.2;

--�����Լ� �Ἥ ���غ�����
SELECT COUNT(*) 
FROM employees
where NVL(commission_pct,0)<0.2;

--LNNVL --false =>true , true=> false
SELECT COUNT(*) 
FROM employees
where LNNVL(commission_pct>=0.2);

--NULLIF(expr1,expr2)
-- expr1�� expr2�� ���� ������ null ���� ������ expr1�� ��ȯ
SELECT  employee_id,
        TO_CHAR(start_date,'YYYY') start_year,
        TO_CHAR(end_date,'YYYY') end_year,
        NULLIF(TO_CHAR(end_date,'YYYY'), TO_CHAR(start_date,'YYYY')) as nullif_year
FROM job_history;

/*
��Ÿ�Լ�
*/

--GREATEST(expr1,expr2,...),LEAST(expr1,expr2,...)
--GREATEST ���� ū�� ,LEAST ���� ������
SELECT  GREATEST(1,2,3,2),
        LEAST(1,2,3,2)
FROM DUAL;

SELECT  GREATEST('��','��','��','��'),
        LEAST('��','��','��','��')
FROM DUAL;

--DECODE(expr1,search1,result1,search2,result2,...,default)
SELECT prod_id,channel_id, DECODE(channel_id,3,'Direct',9,'Direct',5,'Indirect',4,'Indirect','Others') as decodes
FROM sales
;

