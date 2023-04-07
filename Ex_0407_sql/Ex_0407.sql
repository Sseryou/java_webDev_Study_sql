--열(column) : 1가지에 대한 정보(전체 사원번호 등...)
--행(row) : 1명에 대한 정보(14,홍길동,구월동...)


--사원테이블에서 이름이 'Michael'인 사원의 사번, 이름을 조회
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME = 'Michael';

--사원테이블에서 직종이 IT_PROG인 사원들의 정보를 사번, 이름, 직종, 급여 순으로 출력
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';

--사원테이블에서 급여가 10000이상이면서 13000이하인 사원의 정보를 이름, 급여순으로 조회
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <= 13000;

--사원테이블에서 06년도에 입사한 사원들의 정보를 사번, 이름, 직종, 입사일순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >= '2006-01-01' AND HIRE_DATE <= '2006-12-31';

--사원테이블에서 급여가 2200, 3200, 5000, 6800을 받는 사원들의 정보를 사번, 이름, 직종, 급여순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES 
WHERE SALARY = 2200 OR SALARY = 3200 OR SALARY = 5000 OR SALARY = 6800;

-- SQL연산자
-- 1. BETWEEN : A와 B사이의 값을 조회할 때 사용(이상, 이하값 일때만 사용가능)
-- 2. IN : OR을 대신해서 사용하는 연산자
-- 3. LIKE : 유사검색

--사원테이블에서 급여가 5000이상이고 6000이하인 사원의 정보를 사번, 이름, 급여순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 6000;

-- IN연산자
-- 직종이 SA_MAN, IT_PROG인 사원들의 정보를 이름, 직종순으로 출력
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN','IT_PROG');

-- LIKE연산자(유사검색)
-- % : 모든 값
-- _ : 하나의 값

-- EX) 'M%' : M으로 시작하는 모든 데이터
-- EX) '%M' : M으로 끝나는 모든 데이터
-- EX) '%A%' : 값의 어디든 A를 포함하고 있는 모든 값 
-- EX) 'A_' : A로 시작하는 두글자 데이터
-- EX) '_ _A' : A로 끝나는 3글자 데이터

-- 사원테이블에서 사원들의 이름 중 M으로 시작하는 사원의 정보를 사번, 이름, 직종순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M%';

-- 사원테이블에서 이름이 d로 끝나는 사원의 사번, 이름, 직종을 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d';

-- 사원테이블에서 이름의 어디든지 a가 포함되어있는 사원의 정보를 이름, 직종순으로 출력
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%';

-- 사원테이블에서 이름의 세번째 글자에 a가 들어가는 사원들의 정보를 사번, 이름순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__a%';

-- 이름이 H로 시작하면서 6글자 이상인 사원들의 정보를 사번, 이름순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'H_____%';

-- 사원테이블에서 이름에 s가 포함되어있지 않은 사원들의 정보를 사번, 이름순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE '%s%';

-- ORDER BY (정렬)
-- 질의 결과에 반환되는 행동을 특정 기준으로 정렬하고자 할때
-- ORDER BY 절은 항상 맨뒤에 작성이 된다.
-- ASC(오름차순, 기본값, 생략가능), DESC(내림차순, 생략불가)

-- 사원테이블에서 급여를 많이받는 사원순으로 사번,이름,급여,입사일 출력
-- 급여가 같을경우 입사일이 빠른순으로 정렬
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
ORDER BY SALARY DESC, HIRE_DATE ASC;

-- 테이블 전체 조회시 컬럼의 순서를 가지고 정렬이 가능
SELECT * FROM EMPLOYEES
ORDER BY 8 DESC, 6 ASC;

-- 급여가 15000 이상인 사원들의 사번, 이름, 급여, 입사일을
-- 입사일이 빠른순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE SALARY >= 15000
ORDER BY HIRE_DATE DESC;

-- SQL함수
-- 오라클에서 자체적으로 제공하는 함수
-- 상황에 맞는 적절한 함수를 사용하기 위해서는 어떤 기능을 하는 함수들이 존재하는지 파악해야 한다.

-- 내장함수의 종류
-- 단일행 함수 : 1개의 행의 값이 함수에 적용되어 1개의 행을 반환한다.
-- 집계 함수 : 1개이상의 행의 값이 함수에 적용되어 1개이상의 행을 반환한다.

-- 문자함수
-- 지정된 문자를 ASCII 값으로 반환하는 함수
-- DUAL : 가상의 테이블
SELECT ASCII('A') FROM DUAL;

-- 지정된 정수와 ASCII 코드를 반환한다.
SELECT CHR(65) FROM DUAL;

-- 왼쪽 정렬후, 오른쪽에 생긴 빈 공백에 특정 문자를 채워 반환한다.
-- 10 = 길이, '*' = *을 채워서 반환
SELECT RPAD(DNAME, 10, '*') FROM DEPT;

-- 오른쪽 정렬후, 왼쪽에 생긴 빈 공백에 특정 문자를 채워 반환한다.
-- 10 = 길이, '*' = *을 채워서 반환
SELECT LPAD(DNAME, 10, '*') FROM DEPT;

-- 문자열의 공백 문자들을 삭제한다.
SELECT TRIM('       HELLO     ') FROM DUAL;

-- 특정 문자만 제거하는것도 가능하다.
SELECT TRIM('z' FROM 'zzzHELLOzzz') FROM DUAL;

-- RTRIM, LTRIM : 오른쪽 공백만 제거, 왼쪽 공백만 제거.


-- 특정 문자의 위치를 반환한다.
-- INDEX 번호가 아니다.
SELECT INSTR('HELLOW', 'O') FROM DUAL;

-- 항상 왼쪽에서 오른쪽으로 위치를 찾는다.
-- (문자열, 찾을 문자, 탐색시작 위치, 몇번째 나오는 글자를 반환할것인지)
-- 두번째 L의 위치인 4가 반환이 된다.
SELECT INSTR('HELLOW', 'L', 1,2) FROM DUAL;

-- 찾는 문자열이 없으면 0을 반환한다.
SELECT INSTR('HELLOW', 'A') FROM DUAL;

-- 첫 문자를 대문자로 변환하는 함수, 공백이나 /를 구분자로 인식
SELECT INITCAP('good morning') FROM DUAL;

-- 문자열의 길이를 반환하는 함수(띄어쓰기 포함)
SELECT LENGTH('GOOD MORNING') FROM DUAL;

-- 첫번째 지정한 문자를 두번째 지정한 문자로 치환하는 함수
SELECT REPLACE (FIRST_NAME, 'el', '**') FROM EMPLOYEES;

-- 데이터를 대문자로 바꿔주는 함수
SELECT UPPER('good morning') FROM DUAL;

-- 데이터를 소문자로 바꿔주는 함수
SELECT LOWER('GOOD MORNING') FROM DUAL;

-- 숫자함수

-- 절대값을 반환하는 함수
SELECT -10,ABS(-10) FROM DUAL;

-- 반올림 해주는 함수
SELECT ROUND(3.141592),ROUND(3.141592 ,2) FROM DUAL;

-- 주어진 데이터보다 작거나 같은 정수중 최대값을 반환한다.
SELECT FLOOR(2), FLOOR(2.1) FROM DUAL;

-- 버림 함수
SELECT TRUNC(3.141592),TRUNC(3.141592, 2) FROM DUAL;

-- 주어진 값의 음수, 양수, 0의 여부를 판단하는 함수
-- 음수면 -1, 양수면 1, 0이면 0을 반환한다.
SELECT SIGN(-100),SIGN(100),SIGN(0) FROM DUAL;

-- 주어진 숫자보다 크거나 같은 정수 중 최소값을 반환하는 함수
SELECT CEIL(2), CEIL(2.1) FROM DUAL;

-- 나누기 후 나머지를 반환하는 함수
SELECT MOD(1,3), MOD(2,3), MOD(3,3), MOD(4,3), MOD(0,3) FROM DUAL;

-- 제곱을 해주는 함수
SELECT POWER(2,1),POWER(2,2),POWER(2,3) FROM DUAL;


-- 날짜함수

-- SYSDATE : 현재날짜를 구해준다.
SELECT SYSDATE FROM DUAL;

-- 특정 날짜에 개월수를 더해주는 함수
SELECT SYSDATE ,ADD_MONTHS(SYSDATE, 2) FROM DUAL;


-- 사원테이블에서 모든 사원의 입사일로부터 6개월 뒤의 날짜를
-- 이름, 입사일, 6개월 뒤의 날짜 순으로 출력해 보세요.
SELECT FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) FROM EMPLOYEES;

-- 두 날짜 사이의 개월수
-- 기간이 가까울수록 앞에 놓고, 기간이 멀수록 뒤에 놓는다.
SELECT MONTHS_BETWEEN(SYSDATE, HIRE_DATE) FROM EMPLOYEES;

-- 사원들의 이름, 입사일, 입사후 오늘까지의 개월수를 조회하되,
-- 입사기간이 200개월 이상인 사람만 출력을 하고, 소수점은 한자리까지만 버림으로 출력
SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 1) FROM EMPLOYEES;
WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= 200;

-- 사원이 120인 사원이 입사후 3년 6개월이 되는날 퇴사했다.
-- 이 사원의 사번, 이름, 입사일, 퇴사일을 출력하세요
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 42) FROM EMPLOYEES
WHERE EMPLOYEE_ID = 120;



















