-- JOIN
-- ���� �ٸ� ���̺��� �����鼭 �����͸� ������ ���� ����
-- �������� : PK�� FK�� ������ �Ǿ��ִ� ����.
-- INNER JOIN, (INNER ���� ����) 
-- OUTER JOIN : LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN

-- DEPARTMENTS ���̺�� LOCATIONS ���̺��� JOIN�ϱ�

SELECT D.DEPARTMENT_NAME,L.CITY
FROM DEPARTMENTS D
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

-- ���, �μ� ���̺�κ��� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�غ�����
SELECT FIRST_NAME,E.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ����(LOCATIONS)�� ����(CONTRIES) ���̺��� ��ȸ�Ͽ� ���ø�� �������� ��ȸ
SELECT L.CITY, C.COUNTRY_NAME
FROM LOCATIONS L JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;

-- ���, �μ�, ���� ���̺�κ���, �̸� , �̸���, �μ���ȣ, �μ��̸�, ������ȣ, ���ø��� ����ϵ�,
-- CITY�� 'Seattle'�� ��츸 ����ϼ���.

SELECT E.FIRST_NAME, E.EMAIL, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
AND L.CITY = 'Seattle'

--LEFT OUTER JOIN
--FROM A LEFT OUTER-JOIN B

--SELECT �÷���1, �÷���
--FROM TABEL A LEFT OUTER JOIN TABLE B
--ON TABLE A.�����÷� ,TABLE B.�����÷�

--SELECT �÷���1, �÷���
--FROM TABEL A RIGHT OUTER JOIN TABLE B
--ON TABLE A.�����÷� ,TABLE B.�����÷�

--SELECT �÷���1, �÷���
--FROM TABEL A FULL OUTER JOIN TABLE B
--ON TABLE A.�����÷� ,TABLE B.�����÷�

SELECT *
FROM DEPARTMENTS D FULL OUTER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;
-- ���� ������ NULL�� �����.

/*
SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID; 
*/

-- VIEW
-- ������ ���̺��� �״�� ����ä
-- �ʿ��� �÷��� �� ���ο� �÷��� ���� ������ ���̺�
-- ���� �����Ͱ� ����Ǵ°��� �ƴ�����
-- VIEW�� ���ؼ� �����͸� ������ �� �ִ�.

-- VIEW�� Ư¡
-- ������ : �ٸ������� ������ �� ����
-- ���� : �� �������� ª��
-- ���ȼ� : ª�� ����� ������ ������ ������ ������ �ʴ´�.

/**
 * CREATE VIEW ���̸� AS
 * (
 * 		������
 * );
 */

CREATE VIEW MY_EMPL AS
(
	SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY*COMMISSION_PCT) COMM
	FROM EMPLOYEES
);

SELECT * FROM MY_EMPL;

--�̹� �ִ� ��Ī�� �����ϰ� ��������, ""�� ���θ� �ȴ�.
-- RANK() OVER(ORDER BY SALARY DESC) : ���� �޴� ��� �������� ����
CREATE VIEW DATA_PLUS AS
(
	SELECT E.SALARY, RANK() OVER(ORDER BY SALARY DESC) "RANK"
	FROM EMPLOYEES E
);

SELECT * FROM DATA_PLUS;

-------------------------------------------------------------------------
-- DB�� �ڷ���
-- ���� : NUMBER(�ڸ���)
--		NUMBER : 22Byte���� �Է°���(38�ڸ�)

-- ���� : VARCHAR2(����)
-- 		VARCHAR2 : ������

-- ��¥ : DATE : FORMAT�� ���缭 ��¥�� �����ϴ� Ÿ��


-- ���̺� ����� ��
/**
 * CREATE TABLE ���̺��(
 * 		�÷���1 �ڷ���(����),
 		�÷���2 �ڷ���(����),
 		�÷���3 �ڷ���(����),
 		�÷���4 �ڷ���(����)
 		);
 */


CREATE TABLE TT(
	ID VARCHAR2(30) PRIMARY KEY, --�⺻Ű
	PWD VARCHAR2(30) NOT NULL, -- NULL �����
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL UNIQUE, --NULL �����, �ߺ� �����
	PHONE VARCHAR2(20) UNIQUE,
	REG_DATE DATE
);

SELECT * FROM TT;
-- �� ��ȣ, �ۼ���, ����, ��� ����....�Խ����� ���� �� ����ؾ��� �÷��� ����...

-- ���̺��� �̹� ���� �� �÷� �߰��ϱ�
--ALTER TABLE TT ADD AGE NUMBER(3);

SELECT * FROM TT;

-- �÷� �����ϱ� (��ġ�� NAME ������)
--ALTER TABLE TT MODIFY AGE NUMBER(3);

SELECT * FROM TT;

-- �÷� �����ϱ�
ALTER TABLE TT DROP COLUMN AGE;

-- ���̺� �����
-- DROP TABLE ���̺��;
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

-- INSERT��
-- INSERT INTO ���̺�� VALUES(1,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(1,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(2,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(3,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(4,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);
INSERT INTO MEMO VALUES(5,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);


SELECT * FROM MEMO;

-- UPDATE��(�����ϱ�)
-- WHERE�� �����ϰ� �Ǹ�, ��� �����͸� �ٲٰ� �ȴ�! ����...
/**
 * UPDATE ���̺�� SET
 * �÷��� = ������,
 * �÷��� = ������
 * WHERE ���ǽ�
 */

--UPDATE EMP SET
--FIRST_NAME = 'ȫ�浿'
--WHERE EMPNO = ?;

-- DELECT�� (����)
/**
 * DELECT FROM ���̺��
 * WHERE ����
 * 
 * ��) WHERE IDX = 1;
 */

-- SEQUENCE : ���̺� ���� �߰��� �� �ڵ����� �������� �������� ������
-- �������ִ� ��ü

CREATE SEQUENCE MEMO_SEQ;
INSERT INTO MEMO VALUES(MEMO_SEQ.NEXTVAL,'����1','����1','1111','ȫ�浿','127.0.0.1',SYSDATE);

SELECT * FROM MEMO;




