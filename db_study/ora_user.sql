create table ex2_1(
    column1 char(10),
    column2 VARCHAR2(10),
    column3 NVARCHAR2(10),
    column4 Number
);


insert into ex2_1(column1,column2) values('abc','abc');

SELECT  column1, LENGTH(column1) as len1, --10 varcha는 고정길이
        column2, LENGTH(column2) as len2  --3  varchar2는 가변길이
        from ex2_1;
        
create table ex2_2(
    column1 VARCHAR2(3), --디폴트 값 byte 적용
    column2 VARCHAR2(3 BYTE),
    column3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 values ('abc','abc','abc');


--영문자는 모두 3바이트
SELECT  column1, LENGTH(column1) as len1, --3
        column2, LENGTH(column2) as len2, --3 
        column3, LENGTH(column3) as len3  --3
        from ex2_2;


-- ORA-12899: value too large for column "ORA_USER"."EX2_2"."COLUMN1" (actual: 9, maximum: 3) 
-- 한글은 한글자가 2바이트이므로 오류가 발생
INSERT INTO ex2_2 values ('홍길동','홍길동','홍길동');    

--colums3에서는 byte가 아닌 char를 명시했기 때문에 입력가능
INSERT INTO ex2_2(column3) values('홍길동');


--LENGTHB 해당컬럼의 byte수를 반환하는 함수 한글은 한글자당 2바이트 원래는 6바이트가 나와야하나 디비 설정으로 인해 난 3바이트
SELECT column3 , LENGTH(column3) AS len3, LENGTHB(column3) as bytelen FROM ex2_2;




--모두 NUMBER 형으로 생성되고 길이는 22바이트

/*
    NUMBER[(p,[s])] p 정밀도 s 유효숫자 자릿수
    P는 소수점 기준 모든 유효숫자 자릿수를 의미한다 만약 P에 명시한 것보다 큰 숫자값을 입력하면 오류가 발생
    S가 양수면 소수점 이하, 음수면 소수점 이상 유효숫자 자리수를 나타낸다
    S에 명시한 숫자 이상의 숫자를 입력하면, s에 명시한 숫자로 반올림 처리한다
    S가 음수면 소숫점 기준 왼쪽 자리수 만큼 반올림
    S가 P보다 크면 소수점 이하 유효숫자 자릿수를 의미한다 

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

--FLOAT(p) p는 이진수 기준
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

--테이블 네임을 소문자로 하면 값이 안나옴 

select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_6';

CREATE table ex2_7(

    COL_UNIQUE_NULL VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NOT_NULL VARCHAR2(10) UNIQUE NOT NULL,
    COL_UNIQUE VARCHAR2(10),
    CONSTRAINT unique_nam1 UNIQUE (COL_UNIQUE)
);

--제약조건 3개
select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_7';

INSERT INTO ex2_7 values('AA','AA','AA');

--ORA-00001: unique constraint (ORA_USER.SYS_C008441) violated
INSERT INTO ex2_7 values('AA','AA','AA');

--입력가능 
INSERT INTO ex2_7 values('','BB','BB');

--null은 값이 없음을 의미 UNIQUE 비교대상에서 널은 제외
INSERT INTO ex2_7 values('','CC','CC');

CREATE table ex2_8(

    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10) 
);


select constraint_name, constraint_type, table_name, search_condition
    from user_constraints
where table_name='EX2_8';

--기본키는 NOTNULL 속성이므로 NULL 입력이 불가능
INSERT INTO ex2_8 VALUES('','AA');

--입력가능
INSERT INTO ex2_8 VALUES('AA','AA');

--기본키는 UNIQUE 속성을 가지고 있으므로 중복 데이터 입력 불가능
INSERT INTO ex2_8 VALUES('AA','AA');


--기본키를 묶어서 잡을 수도 있음
CREATE table ex2_9(

    COL1 VARCHAR2(10),
    COL2 VARCHAR2(10),
    COL3 TIMESTAMP,
    
    CONSTRAINT ex2_9_pk PRIMARY KEY(COL1,COL2)
    
);

--CHECK 컬럼에 입력되는 데이터를 CHECK해 맞는 데이터만 입력 받고 그렇지 않으면 오류를 뱉어 냄
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

--가능
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

--테이블 복사
--백업용으로 많이씀
CREATE TABLE ex2_9_1 as select * from ex2_9;




--뷰**

/*
SELECT a.employee_id, a.emp_name , a.department_id, b.department_name

from employees a, departments b

where a.department_id = b.department_id;
*/

/*
뷰
보안성 측면에서 유리
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
빠른 검색을 위해 사용하지만 인덱스가 많아지면 과부화 걸림
*/


--B-tree 인덱스 
desc ex2_11;

--제약 조건 확인창
select constraint_name, constraint_type, table_name , search_condition
from user_constraints
where table_name='EX2_11';


CREATE UNIQUE INDEX ex2_11_ix01 on ex2_11 (col11);

--인덱스 확인창
select index_name, index_type, table_name , uniqueness
from user_indexes
where table_name='EX2_11';


SELECT constraint_name, constraint_type, table_name, index_name
    FROM user_constraints
WHERE table_name='JOB_HISTORY';

SELECT index_name, index_type ,table_name , uniqueness
from user_indexes
where table_name='JOB_HISTORY';


--결합 인덱스 

CREATE index ex2_11_ix02
on ex2_11 (col11,col2);

SELECT index_name, index_type, table_name, uniqueness
from user_indexes
where table_name ='EX2_11';

DROP INDEX ex2_11_ix02;

/*
시노님 (동의어 라는 뜻 , private , public)
보안성과 
원객체가 바뀌어도 원객체를 참조할 수 있기때문에 많이 씀
*/

--시노님 생성 기본값 private
CREATE OR REPLACE SYNONYM syn_channel
FOR channels;

SELECT COUNT(*) FROM syn_channel;

--HR 계정은 DEFUALT로 계정이 잠겨 있으므로 먼저 UNLOCK 시키고 HR 비밀번호 설정
ALTER USER HR IDENTIFIED by HR ACCOUNT UNLOCK;

CREATE OR REPLACE PUBLIC SYNONYM syn_channel2
for channels;

DROP SYNONYM syn_channel;

/*
시퀀스 

CREATE SEQUNCE 시퀀스명  
INCREMENT BY 증감숫자 --0이아닌 정수 양수면 증가 음수면 감소 디폴트 1
START WITH 시작숫자 --시작숫자의 디폴트 값은 증가일때는 MINVALUE 감소일 땐 MAXVALUE
NOMINVALUE | MINVALUE 최솟값  --NOMINVALUE 디폴트 값으로 증가일 때 1 감소일경우 -(1027-1) | MINVALUE 최솟값 시작숫자와 작거나 같아야하고 MAXVALUE보다 작아야한다
NOMAXVALUE | MAXVALUE 최댓값  --NOMAXVALUE 디폴트 값으로 증가일 때 (1028-1) 감소일경우 -1 | MAXVALUE 최댓값 시작숫자와 크거나 같아야하고 MINVALUE보다 커야한다
NOCYCLE | CYCLE  --NOCYCLE 디폴트 값으로 최대나 최솟값에 도달하면 생성 중지 | CYCLE 증가는 최댓값에 도달하면 다시 최솟값 시작 감소는 최솟값에 도달하면 다시 최대값에서 시작
NOCACHE | CACHE --NOCACHE 디폴트로 메모리에 시퀀스 값을 미리 할당해 놓지 않으며 디폴트 값은 20| CACHE 메모리에 시퀀스 값을 미리 할당해 놓음

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

--nextval 해당 시퀀스에서 다음 순번 값을 자동으로 가져옴 만약 select문에서 사용하더라도 값이 증가 
INSERT INTO EX2_8 (col1) values(my_seq1.nextval);

--CURRVAL 해당시퀀스의 현재값을 알수 있다
SELECT my_seq1.CURRVAL
from dual;

/*
파티션 테이블 
--테이블에 있는 특정 컬럼값을 기준으로 데이ㅓ를 분할해 저장해 놓는 것 논리적인 테이블은 1개 물리적으로는 불할 한 만큼 파티션이 만들어져 입력되는 컬럼 값에 따라 분할된 파티션 별로 데이터가 저장된다 
--파티션 테ㅣ블을 만드는 목적은 대용량 테이블의 경우 테이터 조회시 효율성과 성능을 높이기 위한것 
*/

--파티셔닝 밸류가 false 면 불가능
select * from v$option where parameter ='Partitioning';

--파티셔닝이 가능하게끔 하는 방법
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