-- ���� ������ : SELECT�� ��ȸ�� �÷� ���̿� Ư���� ���ڸ� ���� �� ���
SELECT ENAME || 'S JOB IS' || JOB AS "EMPLOYEE"
FROM emp;

-- �ǽ����� 1 : EMP ���̺��� ����Ͽ� ����̸��� S�� ������ ��� ������ ��� ���
SELECT ename FROM emp
WHERE ename LIKE '%S';

-- �ǽ����� 2 : EMP ���̺��� ����Ͽ� 30�� �μ����� �ٹ��ϰ� �ִ� ��� �߿� ��å��
-- SALESMAN �� ����� �����ȣ, �̸�, ��å, �޿�, �μ� ��ȣ ���
SELECT empno, ename, job, sal, deptno FROM EMP
WHERE deptno = 30
AND job = 'SALESMAN';

-- �ǽ����� 3 : 20�� 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000�ʰ��� �����
-- �����ȣ, �̸�, �޿�, �μ� ��ȣ ���
SELECT empno, ename, sal, deptno FROM EMP
WHERE deptno IN(20, 30)
AND sal > 2000;


-- �ǽ����� 4 : NOT BETWEEN A AND B �����ڸ� ���� �ʰ� �޿��� 2000�̻�, 3000����
-- ���� �̿��� ���� ���� �����͸� ���
SELECT * FROM EMP
WHERE sal < 2000 OR sal > 3000;


-- �ǽ����� 5 : ����̸��� E�� ���ԵǾ� �ִ� 30�� �μ��� ��� �� �޿��� 1000~2000
-- ���̰� �ƴ� ����̸�, �����ȣ, �޿�, �μ���ȣ ���
SELECT ename, empno, sal, deptno
FROM EMP
WHERE deptno = 30
And ename LIKE '%E%"
AND sal NOT BETWEEN 1000 AND 2000;



-- �ǽ����� 6 : �߰� ������ �������� �ʰ� ����ڰ� �ְ�, ��å�� MANAGER, CLERK��
-- ����߿� ��� �̸��� �� ��° ���ڰ� L�� �ƴ� ����� ���� ���
SELECT * FROM emp
WHERE comm is NULL
AND mgr IS NOT NULL
AND job IN('MANAGER', 'CLERK')
AND ename NOT LIKE '_L%';


-- ���� �Լ� : ������ ������ ó���ϱ� ���� �Լ��� �ǹ�
-- DUAL ���̺� : SYS �������� �����ϴ� ���̺�, �Լ��� ������ ���̺� �������� ������ �� 
--�ֵ��� ����
-- ABS : ���밪�� ����
SELECT -10, ABS(-10) FROM dual;
-- ROUND : �ݿø��� ����� ��ȯ, �ݿø��� ��ġ�� ������ �� ������ �������� ������, 
-- 0���� ������ ��ġ���� �ݿø�
SELECT ROUND(1234.5678) AS round, -- ��ġ�� �������� ������ 0�� ��ġ(�Ҽ��� ù��° 
--�ڸ��� �ݿø�)
    ROUND(1234.5678, 0) AS round_0,
    ROUND(1234.5678, 1) AS round_1,
    ROUND(1234.5678, 2) AS round_2,
    ROUND(1234.5678, -1) AS round_minus1,
    ROUND(1234.5678, -2) AS round_minus2
FROM dual;

-- TRUNC : ������ �� ����� ��ȯ�ϴ� �Լ�
SELECT TRUNC(1234.5678) AS TRUNC,
     TRUNC(1234.5678, 0) AS TRUNC_0,
     TRUNC(1234.5678, 1) AS TRUNC_1,
     TRUNC(1234.5678, 2) AS TRUNC_2,
     TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
     TRUNC(1234.5678, -2) AS TRUNC_MINUS2
 FROM DUAL;
 
-- MOD : �������� �� �������� ����ϴ� �Լ�
SELECT MOD(21, 5) FROM dual;
-- CEIL : �Ҽ��� ���ϰ� ������ ������ �ø�
SELECT CEIL(12.345) FROM dual;
-- FLOOR : �Ҽ��� ���ϸ� ������ ����
SELECT FLOOR(12.345) FROM dual;
-- POWER : ����A�� ����B��ŭ �����ϴ� �Լ�
SELECT POWER(3,4) FROM dual;

-- ���� �Լ� : ���� �����͸� �����ϰų� ���� �����ͷκ��� Ư�� ����� ����� �� �� ���
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

-- ���ڿ� ���̸� ���ϴ� LENGTH �Լ�
SELECT ename, LENGTH(ename) FROM emp;
-- LENGTH(���ڿ�����)�� LENGTHB(���ڿ��� ����Ʈ��) �Լ� ��
SELECT LENGTH('�ѱ�'), LENGTH('ENG'), LENGTHB('�ѱ�'), LENGTHB('ENG')
FROM dual;

-- SUBSTR(���, ������ġ, ����) / SUBSTRB
-- ��� ���ڿ��� ������ġ���� ������ ������ŭ ���ڸ� ��ȯ
-- �����ͺ��̽��� ���α׷��� ���� �޸� 0���� �����ϴ� �ε����� �ƴ�
SELECT job, SUBSTR(job, 1, 2), SUBSTR(job, 3, 2), SUBSTR(job, 5)
FROM emp;

SELECT job, SUBSTR(JOB, -LENGTH(job)),
    SUBSTR(job, -LENGTH(job), 2),
    SUBSTR(job, -3)
FROM emp;

-- INSTR : ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ� �ִ����� �˾� �� �� ���
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR1, -- ó������ �˻�
    INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR2, -- 5��°���� �˻� ����
    INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR3 -- 2��°���� �˻�, �ش繮�� 2��° ��Ÿ�� �� ��ġ
FROM DUAL;

-- Ư�� ���ڰ� ���Ե� �� ã��
SELECT * FROM EMP
WHERE INSTR(ename,'S') > 0;

SELECT * FROM EMP
WHERE ename LIKE '%S%';

-- REPLACE : Ư�� ���ڿ� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü �� �� ���
SELECT '010-1234-5678' AS replace_before,
    REPLACE('010-1234-5678', '-', ' ') AS replace1,
    REPLACE('010-1234-5678', '-') AS replace2
FROM dual;


-- LPAD / RPAD : ���� ���� ĭ���� �����ϰ� ��ĭ��ŭ Ư�� ���ڷ� ä��� �Լ�
SELECT LPAD('ORACLE', 10, '+') FROM dual;
SELECT RPAD('ORACLE', 10, '+') FROM dual;
SELECT LPAD('ORACLE', 10) FROM dual;

-- �������� ���ڸ��� *�� ǥ���ϱ�
SELECT RPAD('971215-', 14, '*') AS rpad_jumin,
    RPAD('010-1234-', 13, '*') AS rpad_phone
FROM dual;

-- �� ���ڿ��� ��ġ�� CONCAT �Լ�
SELECT CONCAT(empno, ename), CONCAT(empno, CONCAT(' : ', ename))
FROM EMP
WHERE ename = 'JAMES';

-- TRIM / LTRIM / RTRIM : ���ڿ� ������ ������ Ư�� ���ڸ� ����� ���� ���
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

-- ��¥ �����͸� �ٷ�� ��¥ �Լ�
-- SYSDATE : �ü���κ��� �ð��� �о� ��
SELECT SYSDATE FROM dual;
SELECT SYSDATE AS "���� �ð�",
    SYSDATE - 1 AS "����",
    SYSDATE + 1 AS "����"
FROM dual;

-- �� ���� ���� ��¥�� ���ϴ� ADD_MONTHS �Լ�
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3) 
FROM dual;



-- �Ի� 10�ֳ��� �Ǵ� ����� ������ ����ϱ�
SELECT empno, ename, hiredate,
    ADD_MONTHS(hiredate, 120) AS "�Ի�10�ֳ�"
FROM emp;

-- �������� : SYSDATE�� ADD_MONTHS �Լ��� ����Ͽ� ���� ��¥�� 6���� ���� ��¥�� ���
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 6)
from dual;

-- ���ƿ��� ���� NEXT_DAY, ���� ������ ��¥�� ���ϴ� LAST_DAY
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '������'),
    LAST_DAY(SYSDATE)
FROM dual;

-- ��¥ ���� ���� �Լ�
SELECT EXTRACT(YEAR FROM DATE '2024-03-26')
FROM dual;
SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM hiredate) = 12;


-- �ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ�, NUMBER�� ���� �ڷ��� ����� �ڵ����� NUMBER Ÿ������ ��ȯ
SELECT empno, ename, empno + '500'
FROM EMP
WHERE ename = 'FORD';


-- ��¥, ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR �Լ�
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "���糯¥�ð�"
FROM dual;

SELECT SYSDATE FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS ����,
    TO_CHAR(SYSDATE, 'YY') AS ����,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') AS ����,
    TO_CHAR(SYSDATE, 'DD') AS ��,
    TO_CHAR(SYSDATE, 'DDD') AS �����,
    TO_CHAR(SYSDATE, 'HH') AS "12�ð���",
    TO_CHAR(SYSDATE, 'HH12') AS "12�ð���",
    TO_CHAR(SYSDATE, 'HH24') AS "24�ð���",
    TO_CHAR(SYSDATE, 'W') AS ������
FROM DUAL;


SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;


-- ���� ������ ������ �����Ͽ� ����ϱ�
SELECT SAL,
     TO_CHAR(SAL, '$999,999') AS SAL_$,
     TO_CHAR(SAL, 'L999,999') AS SAL_L,
     TO_CHAR(SAL, '999,999.00') AS SAL_1,
     TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
     TO_CHAR(SAL, '000999999.99') AS SAL_3,
     TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;


SELECT '1300' - '1200' FROM DUAL;
SELECT TO_NUMBER('1300') - '1000' FROM DUAL;


-- TO_DATE : ���ڿ��� ��õ� ��¥�� ��ȯ�ϴ� �Լ�
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
FROM DUAL;

-- NULL ó�� �Լ� : NULL�̶� Ư������ �࿡ �����Ͱ��� �������� ������ ������ ���� NULL�� ��
-- NULL�� 0�̳� ������� �ٸ� �ǹ�, ���굵 �ȵǰ� �񱳵� �ȵ�
SELECT empno, ename, sAL, comm, sal+comm,
    NVL(comm, 0),
    sal + NVL(comm, 0)
FROM EMP;


-- NVL2 : �Էµ����Ͱ� NULL�� �ƴϸ� �ι�° �Ű����� ������ ��ȯ, NULL�̸� 3��° �Ű����� ������ ��ȯ
SELECT empno, ename, comm,
    NVL2(comm, 'O', 'X'),
    NVL2(comm, sal*12+comm, sal*12) AS "����"
FROM EMP;
    
    
SELECT NULLIF(10, 10), NULLIF('A', 'B') FROM DUAL;


-- 1. EMP���̺��� COMM�� ���� NULL�� �ƴ� ���� ��ȸ
SELECT *FROM EMP
WHERE COMM IS NOT NULL;

-- 2. EMP���̺��� Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT ename FROM emp
WHERE comm = 0 or comm is null;

-- 3. EMP���̺��� �����ڰ� ���� ���� ���� ��ȸ
select ename from emp
where mgr is null;

desc emp;

-- 4. EMP���̺��� �޿��� ���� �޴� ���������� ��ȸ
select ename, sal from emp
order by sal desc;

-- 5. EMP���̺��� �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
select sal, comm from emp
order by sal desc, comm desc;

-- 6. EMP���̺��� �����ȣ, �����, ����, �Ի��� ��ȸ(�Ի��� ��������)
select empno, ename, job, hiredate from emp
order by hiredate;

-- 7. EMP���̺��� �����ȣ, ����� ��ȸ(�����ȣ ��������)
select empno, ename from emp
order by empno desc;

-- 8. EMP���̺��� ���, �Ի���, �����, �޿���ȸ
select empno, hiredate, ename, sal, deptno from emp
order by deptno, hiredate desc;


-- 9. ���� ��¥�� ���� ������ȸ
select SYSDATE from dual;

-- 10. EMP���̺��� ���, �����, �޿���ȸ(�޿��� 100���� ���� ���, �޿� ��������)
select empno, ename, ROUND(sal, -2) from emp
order by sal desc;

--11. **EMP���̺��� �����ȣ�� Ȧ���� ������� ��ȸ**
select empno, ename from emp
where mod(empno, 2) = 1;

--12. **EMP���̺��� �����, �Ի��� ��ȸ (��, �Ի����� �⵵�� ���� �и� �����ؼ� ���)**
select ename, extract(year from hiredate), extract(month from hiredate) from emp


--13. **EMP���̺��� 9���� �Ի��� ������ ���� ��ȸ**
select * from emp
where extract(month from hiredate) = 9;

--14. **EMP���̺��� 81�⵵�� �Ի��� ���� ��ȸ**
select * from emp
where extract(year from hiredate) = 1981;


--15. **EMP���̺��� �̸��� 'E'�� ������ ���� ��ȸ**
select ename from emp
where ename like '%E';

--16. **EMP���̺��� �̸��� �� ��° ���ڰ� 'R'�� ������ ���� ��ȸ**
select ename from emp
where ename like '__R%';
select ename from emp
where substr(ename, 3, 1) = 'R';

--**EMP���̺��� ���, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ**
select empno, ename, hiredate, ADD_MONTHS(hiredate, 12*40) from emp;

-- **EMP���̺��� �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ**
select * from emp
where months_between(sysdate, hiredate) / 12 >= 38;

-- **���� ��¥���� �⵵�� ����**
select extract(year from sysdate) from dual;
