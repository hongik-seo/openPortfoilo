/*
집계함수
*/

--ABS(n) 절대값 반환

SELECT ABS(10) ,ABS(-10), ABS(-10.123)
FROM dual;

--CEIL(n) n과 같거나 가장큰 정수를 반환 (올림)

SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)
FROM dual;

--FLOOR(n) n보다 작거나 가장 큰 정수를 반환 (버림)
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)
FROM dual;

--ROUND(n,i) n을 소수점 기준 (i+1)번 째에서 반올림한 결과를 반환 i는 생략할 수 있고 디폴트 값은 0
SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)
FROM dual;

SELECT ROUND(10.154,1), ROUND(10.154,2), ROUND(10.154,3)
FROM dual;

--i가 음수면 소수점을 기준으로 왼쪽 i 번째서 반올림 일어남
SELECT ROUND(0,3), ROUND(115.115,-1), ROUND(115.115,-2)
FROM dual;

--TRUNC 함수는 반올림을 하지 않고 n1을 소수점 기준 n2자리에서 무조건 잘라낸 결과를 반환한다. n2는 생략가능 디폴트값 0 양수 소수점 기준 오른쪽 음수 소수점 기준 왼쪽
SELECT TRUNC(115.115), TRUNC(115.115,1), TRUNC(115.115,2), TRUNC(115.115,-2)
FROM dual;

--POWER(n2,n1)함수는 n2를 n1 (제곱한 결과)를 반환 n1은 정수와 실수 모두올 수 있는데 n2가 음수일 때 n1은 정수만 올수 있음

SELECT POWER(3,2), POWER(3,3), POWER(3,3.0001)
from dual;

--ORA-01428: '-3' 인수가 범위를 벗어났습니다 -- n1이 음수일때는 n2는 정수만
SELECT POWER(-3,3.0001)
FROM dual;

--SQRT (제곱근 반환)
SELECT SQRT(2), SQRT(5)
FROM dual;

--MOD(n2,n1) n2를 n1로 나눈 나머지 값을 반환
--n2-n1*FLOOR(n2/n1)
SELECT MOD(19,4) , MOD (19.123,4.2)
FROM dual;

--REMAINDER(n2,n1) n2를 n1로 나눈 나머지 값을 반환
--n2-n1*ROUND(n2/n1)
SELECT REMAINDER(19,4) , REMAINDER(19.123,4.2)
FROM dual;

--EXP(n) LN(n),LOG(n2,n1) EXP 지수함수 e의 n제곱 값을 반환 LN 자연 로그 함수 밑수가 e인 로그 함수, log n2를 밑수로 하는 n1을 반환

SELECT EXP(2), LN(2.713),LOG(10,100)
FROM DUAL;


/*
문자함수
*/

--INITCAP(char) 첫문자는 대분자 나머지는 소문자로 반환 하는 함수. 이때 첫 문자를 인식하는 기준은 공백과 알파벳(숫자 포함)을 제외한 문자
SELECT INITCAP('naversaygoodbye'), INITCAP('naver say good bye'), INITCAP('naver6say*good가bye')
FROM DUAL;

--LOWER 함수는 매개변수로 들어오는 문자를 모두 소문자로 반환 UPPER은 매개변수로 들어오는 문자를 모두 대문자로 반환
SELECT LOWER('NAVER SAY GOODBYE'), UPPER('naver say good bye')
FROM DUAL;

--CONCAT(char1,char2) '||' 연산자 처럼 ㅐ개변수로 들어오는 두 문자를 붙여 반환한다. 

SELECT CONCAT('I HAVE','A DREAM'), 'I HAVE ' || 'A DREAM'
FROM DUAL;

--SUBSTR(char,pos,len) 잘라올 대사 문자열인 char의 pos번째 문자로 부터 len 길이 만큼 잘라낸 결과를 반환 
--pos값이 0이 오면 디폴트 값인 1, 즉 첫번째 문자를 가리키,음수가 오면 char 문자열 맨 끝에서 시작한 상대적 위치를 의미 
--len이 생략되면 pos번째 문자부터 나머지 모든 문자를 반환

SELECT SUBSTR('ABCDEFG',1,4) , SUBSTR('ABCDEFG',-1,4)
FROM DUAL;

--SUBSTRB 문자의 개수가아닌 문자열의 바이트 수를 잘라낸 결과를 반환
--SELECT lengthb('가') FROM dual; 내 컴퓨터는 3바이트
SELECT SUBSTRB('ABCDEFG',1,4) , SUBSTRB('ABCDEFG',-1,4), SUBSTRB('가나다라마바사',1,4),SUBSTRB('가나다라마바사',-1,4)
FROM DUAL;

--LTRIM(char,set) RTRIM(char,set) char문자열에서 set으로 지정한 
--문자열을 왼쪽 끝(LTRIM) 
--오른쪽 끝(RTRIM)에서 제거한 후 나머지 문자열을 반환한다. 
--set에 지정한 문자열이 없으면(중간에 있으면) 전체를 반환
--보통 좌측 혹은 우측에 공백을 제거할 용도로 많이 사용
SELECT LTRIM('ABCDEFGABC','ABC'),LTRIM('가나다라마바사','가'),RTRIM('ABCDEFGABC','ABC'),RTRIM('가나다라','라')
FROM DUAL;

SELECT LTRIM('가나다라','나'),RTRIM('가나다라','나')
FROM DUAL;

--LPAD(expr1,n,expr2) RPAD(expr1,n,expr2)
--expr2 문자열(생략 할 경우 디폴트는 공백 한 문자)을 n자리만큼 왼쪽부터 채워 expr1를 반환하는 함수

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
--REPLACE char 문자열에서 search_str문자를 찾아 이를 replace_str 문자열로 대체한 결과를 반환하는 함수
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?','나','가')
FROM DUAL;
--문자열 전체의 공백을 모드 제거할 수 있다.

SELECT LTRIM(' ABC DEF '), RTRIM(' ABC DEF '),REPLACE(' ABC DEF ',' ','')
FROM DUAL;

--TRANSLATE(expr,from_str,to_str) expr 문자열에서 from_str에 해당하는 문자를 찾아 to_str로 바꾼 결과를 반환 
--REPLACE와 다른 점은 문자열 자체가 아닌 문자 한 글자씩 매핑해 바꾼 결과를 반환 
SELECT  REPLACE('나는 너를 모르는데 너는 나를 알겠는가?','나는','너를') rep,
        TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?','나는','너를') trn        
FROM DUAL;

/*
날짜 함수
*/

--SYSDETE,SYSTIMESTAMP
SELECT SYSDATE, SYSTIMESTAMP FROM dual;

--ADD MONTHS(date,integer) 매개변수로 들어온 date 에 integer만큼의 월을 더한 날짜를 반환한다. 
SELECT ADD_MONTHS (sysdate,1), ADD_MONTHS (sysdate,-1)
FROM DUAL;

--MONTHS_BETWEEN(date1,date2) 두 날짜 사이의 개월 수 를 반환하는데 date2가 date1보다 빠른 날짜가 온다 
SELECT MONTHS_BETWEEN(sysdate, ADD_MONTHS(sysdate,1)) mon1,
       MONTHS_BETWEEN(ADD_MONTHS(sysdate,1),sysdate) mon2
FROM DUAL;

--LAST_DAY(date) date 날짜를 기준으로 해당원의 마지막 일자를 반환한다. 
SELECT LAST_DAY(sysdate)
FROM DUAL;

--ROUND(date,format) ,TRUNC(date,format) 
--format에 따라 반올림(ROUND), format에 따라 잘라낸 날짜를 반환한다(TRUNC)
SELECT SYSDATE, ROUND(SYSDATE,'month'), TRUNC(SYSDATE,'month')
FROM DUAL;

--NEXT_DAY(date,char) date를 char에 명시한 날짜로 다음 주 주중 일자를 반환한다.
SELECT NEXT_DAY(SYSDATE,'금요일')
FROM DUAL;

/*
변환 함수
*/

--TO_CHAR(숫자 혹은 날짜 format)
--숫자나 날짜를 문자로 변환해 주는 함수 변환 결과를 특정 형식에 맞게 출력할 수 있다.

SELECT TO_CHAR(123456789,'999,999,999')
FROM DUAL;

SELECT TO_CHAR(sysdate,'YYYY-MM-DD')
from dual;

--TO_NUMBER(expr,format)
--문자나 다른 유형의 숫자를 NUMBER형으로 변화하는 함수 

SELECT TO_NUMBER('12345')
FROM DUAL;


--TO_DATE(char,format), TO_TIMESTAMP(char,format)

SELECT TO_DATE('20210102','YYYY/MM/DD')
FROM DUAL;

SELECT TO_DATE('20210102 13:44:50','YYYY-mm-dd HH24:MI:SS')
FROM DUAL;

/*
null 관련 함수
*/

--NVL(expr1,expr2) 
--NVL 함수는 expr1이 null일 때 expr2를 반환

SELECT NVL(manager_id,employee_id)
FROM employees
where manager_id IS NULL
;
--NAV2(expr1,expr2,expr3)
--NVL2 expr1이 null이 아니면 expr2, null이면 expr3반환
SELECT employee_id,
    NVL2(commission_pct, salary +(salary *commission_pct),salary) as salary2
FROM employees; 

--COALESCE(expr1,eppr2,...) 
--매개변수로 들어오는 표현식에서 null이 아닌 첫번째 표현식을 반환하는 함수
SELECT employee_id, salary,commission_pct,
COALESCE(salary*commission_pct,salary) as salary2
FROM employees;

--LNNVL(조건식)
--조건식의 결과가 false나 unknown이면 true를 반환 
--조건식의 결과가 true이면 false반환


--null인 사원은 검색이 안됨
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct<0.2;

--집계함수 써서 구해보려함
SELECT COUNT(*) 
FROM employees
where NVL(commission_pct,0)<0.2;

--LNNVL --false =>true , true=> false
SELECT COUNT(*) 
FROM employees
where LNNVL(commission_pct>=0.2);

--NULLIF(expr1,expr2)
-- expr1과 expr2를 비교해 같으면 null 같지 않으면 expr1을 반환
SELECT  employee_id,
        TO_CHAR(start_date,'YYYY') start_year,
        TO_CHAR(end_date,'YYYY') end_year,
        NULLIF(TO_CHAR(end_date,'YYYY'), TO_CHAR(start_date,'YYYY')) as nullif_year
FROM job_history;

/*
기타함수
*/

--GREATEST(expr1,expr2,...),LEAST(expr1,expr2,...)
--GREATEST 가장 큰값 ,LEAST 가장 작은값
SELECT  GREATEST(1,2,3,2),
        LEAST(1,2,3,2)
FROM DUAL;

SELECT  GREATEST('가','나','다','라'),
        LEAST('가','나','다','라')
FROM DUAL;

--DECODE(expr1,search1,result1,search2,result2,...,default)
SELECT prod_id,channel_id, DECODE(channel_id,3,'Direct',9,'Direct',5,'Indirect',4,'Indirect','Others') as decodes
FROM sales
;

