-- 주석
/*
	여러줄 주석
*/

-- DML (Data Manipulation Language)
-- SELECT(조회), INSERT(추가), UPDATE(수정), DELETE(삭제)
-- SELECT 컬럼명1, 컬럼명2, 컬럼명3 FROM 테이블명;

-- 사원 테이블의 모든 정보 조회하기
SELECT * FROM EMPLOYEES;

-- 부서 테이블의 모든 정보 조회하기
SELECT * FROM DEPARTMENTS;

-- 사원 테이블에서 이름, 직종, 급여만 조회하기
SELECT FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES;

-- 사원 테이블에서 사번, 이름, 입사일, 급여를 조회하세요.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES;

-- 컬럼에 없는 정보를 출력하고 싶을 때
-- 사원 테이블에서 사번, 이름, 직종, 급여, 보너스 금액을 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, SALARY*COMMISSION_PCT FROM EMPLOYEES;

-- WHERE절 (조건을 부여) 무조건 FROM 뒤에서 사용
-- 사용자가 원하는 데이터를 검색할때 조건을 통해 결과를 간추릴 수 있다.

-- WHERE절의 구성
-- 컬럼명(조건식의 좌측에 위치)
-- 비교연산자 (=, >, <...)
-- 문자, 숫자(조건식의 오른쪽에 위치)

-- 사원테이블에서 급여가 10000 이상인 사원들의 정보를 사번, 이름, 급여순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >= 10000;

