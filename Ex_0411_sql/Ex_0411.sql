-- JOIN
-- 서로 다른 테이블을 오가면서 데이터를 가지고 오는 형태
-- 전제조건 : PK와 FK로 연결이 되어있는 상태.
-- INNER JOIN, (INNER 생략 가능) 
-- OUTER JOIN : LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN

-- DEPARTMENTS 테이블과 LOCATIONS 테이블을 JOIN하기

SELECT D.DEPARTMENT_NAME,L.CITY
FROM DEPARTMENTS D
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

-- 사원, 부서 테이블로부터 이름, 부서번호, 부서이름을 조회해보세요
SELECT FIRST_NAME,E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 지역(LOCATIONS)와 나라(CONTRIES) 테이블을 조회하여 도시명과 국가명을 조회
SELECT L.CITY, C.COUNTRY_NAME
FROM LOCATIONS L JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;

-- 사원, 부서, 지역 테이블로부터, 이름 , 이메일, 부서번호, 부서이름, 지역번호, 도시명을 출력하되,
-- CITY가 'Seattle'인 경우만 출력하세요.

SELECT E.FIRST_NAME, E.EMAIL, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
AND L.CITY = 'Seattle'

--LEFT OUTER JOIN
--FROM A LEFT OUTER-JOIN B

--SELECT 컬럼명1, 컬럼명
--FROM TABEL A LEFT OUTER JOIN TABLE B
--ON TABLE A.조인컬럼 ,TABLE B.조인컬럼

--SELECT 컬럼명1, 컬럼명
--FROM TABEL A RIGHT OUTER JOIN TABLE B
--ON TABLE A.조인컬럼 ,TABLE B.조인컬럼

--SELECT 컬럼명1, 컬럼명
--FROM TABEL A FULL OUTER JOIN TABLE B
--ON TABLE A.조인컬럼 ,TABLE B.조인컬럼

SELECT *
FROM DEPARTMENTS D FULL OUTER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;
-- 없는 내용은 NULL로 때운다.

/*
SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID; 
*/

-- VIEW
-- 기존의 테이블은 그대로 놔둔채
-- 필요한 컬럼들 및 새로운 컬럼을 만든 가상의 테이블
-- 실제 데이터가 저장되는것은 아니지만
-- VIEW를 통해서 데이터를 관리할 수 있다.

-- VIEW의 특징
-- 독립성 : 다른곳에서 변경할 수 없음
-- 편리성 : 긴 쿼리문을 짧게
-- 보안성 : 짧게 만들기 때문에 기존의 쿼리는 보이지 않는다.

/**
 * CREATE VIEW 뷰이름 AS
 * (
 * 		쿼리문
 * );
 */

CREATE VIEW MY_EMPL AS
(
	SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY*COMMISSION_PCT) COMM
	FROM EMPLOYEES
);

SELECT * FROM MY_EMPL;

--이미 있는 별칭을 재사용하고 싶을때는, ""로 감싸면 된다.
-- RANK() OVER(ORDER BY SALARY DESC) : 많이 받는 사람 기준으로 정렬
CREATE VIEW DATA_PLUS AS
(
	SELECT E.SALARY, RANK() OVER(ORDER BY SALARY DESC) "RANK"
	FROM EMPLOYEES E
);

SELECT * FROM DATA_PLUS;

-------------------------------------------------------------------------
-- DB의 자료형
-- 숫자 : NUMBER(자리수)
--		NUMBER : 22Byte까지 입력가능(38자리)

-- 문자 : VARCHAR2(길이)
-- 		VARCHAR2 : 가변형

-- 날짜 : DATE : FORMAT에 맞춰서 날짜를 저장하는 타입


-- 테이블 만드는 법
/**
 * CREATE TABLE 테이블명(
 * 		컬럼명1 자료형(길이),
 		컬럼명2 자료형(길이),
 		컬럼명3 자료형(길이),
 		컬럼명4 자료형(길이)
 		);
 */


CREATE TABLE TT(
	ID VARCHAR2(30) PRIMARY KEY, --기본키
	PWD VARCHAR2(30) NOT NULL, -- NULL 비허용
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL UNIQUE, --NULL 비허용, 중복 비허용
	PHONE VARCHAR2(20) UNIQUE,
	REG_DATE DATE
);

SELECT * FROM TT;
-- 글 번호, 작성자, 내용, 댓글 갯수....게시판을 만들 때 사용해야할 컬럼은 많다...

-- 테이블을 이미 만든 후 컬럼 추가하기
--ALTER TABLE TT ADD AGE NUMBER(3);

SELECT * FROM TT;

-- 컬럼 수정하기 (위치를 NAME 앞으로)
--ALTER TABLE TT MODIFY AGE NUMBER(3);

SELECT * FROM TT;

-- 컬럼 삭제하기
ALTER TABLE TT DROP COLUMN AGE;

-- 테이블 지우기
-- DROP TABLE 테이블명;
--DROP TABLE TT;

CREATE TABLE MEMO(
	IDX NUMBER(3) PRIMARY KEY,
	TITLE VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(4000),
	PWD VARCHAR2(20) NOT NULL,
	WRITER VARCHAR2(100) NOT NULL,
	IP VARCHAR2(30),
	WRITE_DATE DATE
);

-- INSERT문
-- INSERT INTO 테이블명 VALUES(1,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(1,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(2,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(3,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(4,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(5,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);


SELECT * FROM MEMO;

-- UPDATE문(수정하기)
-- WHERE를 누락하게 되면, 모든 데이터를 바꾸게 된다! 주의...
/**
 * UPDATE 테이블명 SET
 * 컬럼명 = 데이터,
 * 컬럼명 = 데이터
 * WHERE 조건식
 */

--UPDATE EMP SET
--FIRST_NAME = '홍길동'
--WHERE EMPNO = ?;

-- DELECT문 (삭제)
/**
 * DELECT FROM 테이블명
 * WHERE 조건
 * 
 * 예) WHERE IDX = 1;
 */

-- SEQUENCE : 테이블에 값을 추가할 때 자동으로 순차적인 정수값이 들어가도록
-- 설정해주는 객체

CREATE SEQUENCE MEMO_SEQ;
INSERT INTO MEMO VALUES(MEMO_SEQ.NEXTVAL,'제목1','내용1','1111','홍길동','127.0.0.1',SYSDATE);

SELECT * FROM MEMO;




