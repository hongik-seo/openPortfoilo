create table ex2_1(
    column1 char(10),
    column2 VARCHAR2(10),
    column3 NVARCHAR2(10),
    column4 Number
);


insert into ex2_1(column1,column2) values('abc','abc');

SELECT  column1, LENGTH(column1) as len1, --10 varcha�� ��������
        column2, LENGTH(column2) as len2  --3  varchar2�� ��������
        from ex2_1;
        
create table ex2_2(
    column1 VARCHAR2(3), --����Ʈ �� byte ����
    column2 VARCHAR2(3 BYTE),
    column3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 values ('abc','abc','abc');


--�����ڴ� ��� 3����Ʈ
SELECT  column1, LENGTH(column1) as len1, --3
        column2, LENGTH(column2) as len2, --3 
        column3, LENGTH(column3) as len3  --3
        from ex2_2;


-- ORA-12899: value too large for column "ORA_USER"."EX2_2"."COLUMN1" (actual: 9, maximum: 3) 
-- �ѱ��� �ѱ��ڰ� 2����Ʈ�̹Ƿ� ������ �߻�
INSERT INTO ex2_2 values ('ȫ�浿','ȫ�浿','ȫ�浿');    

--colums3������ byte�� �ƴ� char�� ����߱� ������ �Է°���
INSERT INTO ex2_2(column3) values('ȫ�浿');


--LENGTHB �ش��÷��� byte���� ��ȯ�ϴ� �Լ� �ѱ��� �ѱ��ڴ� 2����Ʈ ������ 6����Ʈ�� ���;��ϳ� ��� �������� ���� �� 3����Ʈ
SELECT column3 , LENGTH(column3) AS len3, LENGTHB(column3) as bytelen FROM ex2_2;




--��� NUMBER ������ �����ǰ� ���̴� 22����Ʈ

/*
    NUMBER[(p,[s])] p ���е� s ��ȿ���� �ڸ���
    P�� �Ҽ��� ���� ��� ��ȿ���� �ڸ����� �ǹ��Ѵ� ���� P�� ����� �ͺ��� ū ���ڰ��� �Է��ϸ� ������ �߻�
    S�� ����� �Ҽ��� ����, ������ �Ҽ��� �̻� ��ȿ���� �ڸ����� ��Ÿ����
    S�� ����� ���� �̻��� ���ڸ� �Է��ϸ�, s�� ����� ���ڷ� �ݿø� ó���Ѵ�
    S�� ������ �Ҽ��� ���� ���� �ڸ��� ��ŭ �ݿø�
    S�� P���� ũ�� �Ҽ��� ���� ��ȿ���� �ڸ����� �ǹ��Ѵ� 

*/
CREATE TABLE ex2_3(

    COL_INT INTEGER,
    COL_DEC DECIMAL,
    COL_NUM NUMBER

);

SELECT column_id , column_name, data_type, data_length
    FROM SYS.user_tab_cols
    WHERE table_name ='EX2_3'
    ORDER BY column_id;


CREATE table ex2_4(

    COL_FLOT1 FLOAT(32),
    COL_FLOT2 FLOAT

);    

--FLOAT(p) p�� ������ ����
INSERT INTO ex2_4 (col_flot1,col_flot2) values (1234567891234,1234567891234);

--col_flot1 1234567891000
--col_flot2 1234567891234
SELECT
    col_flot1,col_flot2
FROM ex2_4;
    
CREATE table ex2_5(

    COL_DATE DATE,
    COL_TIMESTAMP TIMESTAMP

);    


INSERT INTO ex2_5(COL_DATE,COL_TIMESTAMP) values (SYSDATE,SYSTIMESTAMP);

SELECT * from ex2_5;

CREATE table ex2_6(

    COL_NULL VARCHAR2(10),
    COL_NOT_NULL VARCHAR2(10) not null

);
--ORA-01400: cannot insert NULL into ("ORA_USER"."EX2_6"."COL_NOT_NULL")
insert into ex2_6 VALUES ('AA','');

--success
insert into ex2_6 VALUES ('AA','BB');

--���̺� ������ �ҹ��ڷ� �ϸ� ���� �ȳ��� 

select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_6';

CREATE table ex2_7(

    COL_UNIQUE_NULL VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NOT_NULL VARCHAR2(10) UNIQUE NOT NULL,
    COL_UNIQUE VARCHAR2(10),
    CONSTRAINT unique_nam1 UNIQUE (COL_UNIQUE)
);

--�������� 3��
select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_7';

INSERT INTO ex2_7 values('AA','AA','AA');

--ORA-00001: unique constraint (ORA_USER.SYS_C008441) violated
INSERT INTO ex2_7 values('AA','AA','AA');

--�Է°��� 
INSERT INTO ex2_7 values('','BB','BB');

--null�� ���� ������ �ǹ� UNIQUE �񱳴�󿡼� ���� ����
INSERT INTO ex2_7 values('','CC','CC');

CREATE table ex2_8(

    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10) 
);


select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_8';

--�⺻Ű�� NOTNULL �Ӽ��̹Ƿ� NULL �Է��� �Ұ���
INSERT INTO ex2_8 VALUES('','AA');

--�Է°���
INSERT INTO ex2_8 VALUES('AA','AA');

--�⺻Ű�� UNIQUE �Ӽ��� ������ �����Ƿ� �ߺ� ������ �Է� �Ұ���
INSERT INTO ex2_8 VALUES('AA','AA');


--�⺻Ű�� ��� ���� ���� ����
CREATE table ex2_9(

    COL1 VARCHAR2(10),
    COL2 VARCHAR2(10),
    COL3 TIMESTAMP,
    
    CONSTRAINT ex2_9_pk PRIMARY KEY(COL1,COL2)
    
);

--CHECK �÷��� �ԷµǴ� �����͸� CHECK�� �´� �����͸� �Է� �ް� �׷��� ������ ������ ��� ��
CREATE table ex2_10(

    num1 NUMBER,
    CONSTRAINT check1 CHECK(num1 BETWEEN 1 AND 9),
    gender VARCHAR2(10),
    CONSTRAINT check2 CHECK(gender IN ('MALE','FEMALE'))
    
);

select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_10';

--ORA-02290: check constraint (ORA_USER.CHECK2) violated
INSERT INTO ex2_10 VALUES (10,'MAN');

--����
INSERT INTO ex2_10 VALUES (9,'FEMALE');

CREATE table ex2_11(

    COl1 VARCHAR2(10) not null,
    COl2 VARCHAR2(10) null,
    Create_date DATE DEFAULT sysdate
);

INSERT INTO ex2_11 (col1, col2) values('AA','BB');


SELECT
    *
FROM ex2_11;

DROP table ex2_11;

ALTER TABLE ex2_11 RENAME COLUMN col1 TO col11;



DESC ex2_11;



ALTER TABLE ex2_11 MODIFY col2 VARCHAR2(30);



DESC ex2_11;



ALTER TABLE ex2_11 add col3 Number;

DESC ex2_11;

ALTER TABLE ex2_11 drop COLUMN col3;

DESC ex2_11;


ALTER TABLE ex2_11 ADD CONSTRAINT pk_ex2_11 PRIMARY KEY (col11);

select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_11';

ALTER TABLE ex2_11 DROP CONSTRAINT pk_ex2_11;

select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_11';

--���̺� ����
--��������� ���̾�
CREATE TABLE ex2_9_1 as select * from ex2_9;




--��**

/*
SELECT a.employee_id, a.emp_name , a.department_id, b.department_name

from employees a, departments b

where a.department_id = b.department_id;
*/

/*
��
���ȼ� ���鿡�� ����
*/ 
CREATE OR REPLACE VIEW emp_dept_v1 

AS

SELECT a.employee_id, a.emp_name , a.department_id, b.department_name

from employees a, departments b

where a.department_id = b.department_id;

SELECT * FROM emp_dept_v1;

--drop view emp_dept_v1

/*
index
���� �˻��� ���� ��������� �ε����� �������� ����ȭ �ɸ�
*/


--B-tree �ε��� 
desc ex2_11;

--���� ���� Ȯ��â
select constraint_name, constraint_type, table_name , search_condition
from user_constraints
where table_name='EX2_11';


CREATE UNIQUE INDEX ex2_11_ix01 on ex2_11 (col11);

--�ε��� Ȯ��â
select index_name, index_type, table_name , uniqueness
from user_indexes
where table_name='EX2_11';


SELECT constraint_name, constraint_type, table_name, index_name
    FROM user_constraints
WHERE table_name='JOB_HISTORY';

SELECT index_name, index_type ,table_name , uniqueness
from user_indexes
where table_name='JOB_HISTORY';


--���� �ε��� 

CREATE index ex2_11_ix02
on ex2_11 (col11,col2);

SELECT index_name, index_type, table_name, uniqueness
from user_indexes
where table_name ='EX2_11';

DROP INDEX ex2_11_ix02;

/*
�ó�� (���Ǿ� ��� �� , private , public)
���ȼ��� 
����ü�� �ٲ� ����ü�� ������ �� �ֱ⶧���� ���� ��
*/

--�ó�� ���� �⺻�� private
CREATE OR REPLACE SYNONYM syn_channel
FOR channels;

SELECT COUNT(*) FROM syn_channel;

--HR ������ DEFUALT�� ������ ��� �����Ƿ� ���� UNLOCK ��Ű�� HR ��й�ȣ ����
ALTER USER HR IDENTIFIED by HR ACCOUNT UNLOCK;

CREATE OR REPLACE PUBLIC SYNONYM syn_channel2
for channels;

DROP SYNONYM syn_channel;

/*
������ 

CREATE SEQUNCE ��������  
INCREMENT BY �������� --0�̾ƴ� ���� ����� ���� ������ ���� ����Ʈ 1
START WITH ���ۼ��� --���ۼ����� ����Ʈ ���� �����϶��� MINVALUE ������ �� MAXVALUE
NOMINVALUE | MINVALUE �ּڰ�  --NOMINVALUE ����Ʈ ������ ������ �� 1 �����ϰ�� -(1027-1) | MINVALUE �ּڰ� ���ۼ��ڿ� �۰ų� ���ƾ��ϰ� MAXVALUE���� �۾ƾ��Ѵ�
NOMAXVALUE | MAXVALUE �ִ�  --NOMAXVALUE ����Ʈ ������ ������ �� (1028-1) �����ϰ�� -1 | MAXVALUE �ִ� ���ۼ��ڿ� ũ�ų� ���ƾ��ϰ� MINVALUE���� Ŀ���Ѵ�
NOCYCLE | CYCLE  --NOCYCLE ����Ʈ ������ �ִ볪 �ּڰ��� �����ϸ� ���� ���� | CYCLE ������ �ִ񰪿� �����ϸ� �ٽ� �ּڰ� ���� ���Ҵ� �ּڰ��� �����ϸ� �ٽ� �ִ밪���� ����
NOCACHE | CACHE --NOCACHE ����Ʈ�� �޸𸮿� ������ ���� �̸� �Ҵ��� ���� ������ ����Ʈ ���� 20| CACHE �޸𸮿� ������ ���� �̸� �Ҵ��� ����

*/

CREATE SEQUENCE my_seq1
INCREMENT by 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCACHE
NOCYCLE;


select * from EX2_8;

DELETE EX2_8;

--nextval �ش� ���������� ���� ���� ���� �ڵ����� ������ ���� select������ ����ϴ��� ���� ���� 
INSERT INTO EX2_8 (col1) values(my_seq1.nextval);

--CURRVAL �ش�������� ���簪�� �˼� �ִ�
SELECT my_seq1.CURRVAL
from dual;

/*
��Ƽ�� ���̺� 
--���̺� �ִ� Ư�� �÷����� �������� ���̤ø� ������ ������ ���� �� ������ ���̺��� 1�� ���������δ� ���� �� ��ŭ ��Ƽ���� ������� �ԷµǴ� �÷� ���� ���� ���ҵ� ��Ƽ�� ���� �����Ͱ� ����ȴ� 
--��Ƽ�� �פӺ��� ����� ������ ��뷮 ���̺��� ��� ������ ��ȸ�� ȿ������ ������ ���̱� ���Ѱ� 
*/

--��Ƽ�Ŵ� ����� false �� �Ұ���
select * from v$option where parameter ='Partitioning';

--��Ƽ�Ŵ��� �����ϰԲ� �ϴ� ���
/*
https://linuxforge.tistory.com/74
*/

/*
CREATE TABLE SALES(
    PROD_ID         NUMBER(6,0) NOT NULL,
    CUST_ID         NUMBER(6,0) NOT NULL,
    CHANNEL_ID      NUMBER(6,0) NOT NULL,
    EMPLOYEE_ID     NUMBER(6,0) NOT NULL,
    SALES_DATE      DATE DEFAULT SYSDATE NOT NULL,
    SALES_MONTH     VARCHAR2(6),
    QUANITY_SOLD    NUMBER(10,2),
    AMOUNT_SOLD     NUMBER(10,2),
    CREATE_DATE     DATE DEFAULT SYSDATE,
    UPDATE_DATE     DATE DEFAULT SYSDATE

)

PARTITION BY RANGE(SALES_MONTH)
( 
 PARTITION SALES_Q1_1998 values LESS THAN ('199804') TABLESPACE ora_user,
 
 PARTITION SALES_Q2_1998 values LESS THAN ('199807') TABLESPACE ora_user,

 PARTITION SALES_Q3_1998 values LESS THAN ('199810') TABLESPACE ora_user,
 
 PARTITION SALES_Q4_1998 values LESS THAN ('199901') TABLESPACE ora_user
 
 );
 
 */