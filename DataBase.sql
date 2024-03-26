-- 연결 연산자 : SELECT문 조회시 컬럼 사이에 특정한 문자를 넣을 때 사용
SELECT ENAME || 'S JOB IS' || JOB AS "EMPLOYEE"
FROM emp;

-- 실습문제 1 : EMP 테이블을 사용하여 사원이름이 S로 끝나는 사원 데이터 모두 출력
SELECT ename FROM emp
WHERE ename LIKE '%S';

-- 실습문제 2 : EMP 테이블을 사용하여 30번 부서에서 근무하고 있는 사원 중에 직책이
-- SALESMAN 인 사원의 사원번호, 이름, 직책, 급여, 부서 번호 출력
SELECT empno, ename, job, sal, deptno FROM EMP
WHERE deptno = 30
AND job = 'SALESMAN';

-- 실습문제 3 : 20번 30번 부서에 근무하고 있는 사원 중 급여가 2000초과인 사원의
-- 사원번호, 이름, 급여, 부서 번호 출력
SELECT empno, ename, sal, deptno FROM EMP
WHERE deptno IN(20, 30)
AND sal > 2000;


-- 실습문제 4 : NOT BETWEEN A AND B 연산자를 쓰지 않고 급여가 2000이상, 3000이하
-- 범위 이외의 값을 가진 데이터만 출력
SELECT * FROM EMP
WHERE sal < 2000 OR sal > 3000;


-- 실습문제 5 : 사원이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000
-- 사이가 아닌 사원이름, 사원번호, 급여, 부서번호 출력
SELECT ename, empno, sal, deptno
FROM EMP
WHERE deptno = 30
And ename LIKE '%E%"
AND sal NOT BETWEEN 1000 AND 2000;



-- 실습문제 6 : 추가 수당이 존재하지 않고 상급자가 있고, 직책이 MANAGER, CLERK인
-- 사원중에 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보 출력
SELECT * FROM emp
WHERE comm is NULL
AND mgr IS NOT NULL
AND job IN('MANAGER', 'CLERK')
AND ename NOT LIKE '_L%';


-- 숫자 함수 : 수학적 계산식을 처리하기 위한 함수를 의미
-- DUAL 테이블 : SYS 계정에서 제공하는 테이블, 함수나 계산식을 테이블 참조없이 실핼할 수 
--있도록 제공
-- ABS : 절대값을 구함
SELECT -10, ABS(-10) FROM dual;
-- ROUND : 반올림한 결과를 반환, 반올림할 위치를 지정할 수 있으며 지정하지 않으면, 
-- 0으로 지정한 위치에서 반올림
SELECT ROUND(1234.5678) AS round, -- 위치를 지정하지 않으면 0의 위치(소수점 첫번째 
--자리를 반올림)
    ROUND(1234.5678, 0) AS round_0,
    ROUND(1234.5678, 1) AS round_1,
    ROUND(1234.5678, 2) AS round_2,
    ROUND(1234.5678, -1) AS round_minus1,
    ROUND(1234.5678, -2) AS round_minus2
FROM dual;

-- TRUNC : 버림을 한 결과를 반환하는 함수
SELECT TRUNC(1234.5678) AS TRUNC,
     TRUNC(1234.5678, 0) AS TRUNC_0,
     TRUNC(1234.5678, 1) AS TRUNC_1,
     TRUNC(1234.5678, 2) AS TRUNC_2,
     TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
     TRUNC(1234.5678, -2) AS TRUNC_MINUS2
 FROM DUAL;
 
-- MOD : 나누기한 후 나머지를 출력하는 함수
SELECT MOD(21, 5) FROM dual;
-- CEIL : 소수점 이하가 있으면 무조건 올림
SELECT CEIL(12.345) FROM dual;
-- FLOOR : 소수점 이하를 무조건 버림
SELECT FLOOR(12.345) FROM dual;
-- POWER : 정수A를 정수B만큼 제곱하는 함수
SELECT POWER(3,4) FROM dual;

-- 문자 함수 : 문자 데이터를 가공하거나 문자 데이터로부터 특정 결과를 얻고자 할 때 사용
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

-- 문자열 길이를 구하는 LENGTH 함수
SELECT ename, LENGTH(ename) FROM emp;
-- LENGTH(문자열길이)와 LENGTHB(문자열의 바이트수) 함수 비교
SELECT LENGTH('한글'), LENGTH('ENG'), LENGTHB('한글'), LENGTHB('ENG')
FROM dual;

-- SUBSTR(대상, 시작위치, 길이) / SUBSTRB
-- 대상 문자열의 시작위치부터 선택한 개수만큼 문자를 반환
-- 데이터베이스는 프로그래밍 언어와 달리 0부터 시작하는 인덱스가 아님
SELECT job, SUBSTR(job, 1, 2), SUBSTR(job, 3, 2), SUBSTR(job, 5)
FROM emp;

SELECT job, SUBSTR(JOB, -LENGTH(job)),
    SUBSTR(job, -LENGTH(job), 2),
    SUBSTR(job, -3)
FROM emp;

-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지를 알아 낼 때 사용
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR1, -- 처음부터 검색
    INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR2, -- 5번째부터 검색 시작
    INSTR('HELLO, ORACLE!', 'L',2,2) AS INSTR3 -- 2번째부터 검색, 해당문자 2번째 나타날 때 위치
FROM DUAL;

-- 특정 문자가 포함된 행 찾기
SELECT * FROM EMP
WHERE INSTR(ename,'S') > 0;

SELECT * FROM EMP
WHERE ename LIKE '%S%';

-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 때 사용
SELECT '010-1234-5678' AS replace_before,
    REPLACE('010-1234-5678', '-', ' ') AS replace1,
    REPLACE('010-1234-5678', '-') AS replace2
FROM dual;


-- LPAD / RPAD : 기준 공간 칸수를 지정하고 빈칸만큼 특정 문자로 채우는 함수
SELECT LPAD('ORACLE', 10, '+') FROM dual;
SELECT RPAD('ORACLE', 10, '+') FROM dual;
SELECT LPAD('ORACLE', 10) FROM dual;

-- 개인정보 뒷자리를 *로 표시하기
SELECT RPAD('971215-', 14, '*') AS rpad_jumin,
    RPAD('010-1234-', 13, '*') AS rpad_phone
FROM dual;

-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(empno, ename), CONCAT(empno, CONCAT(' : ', ename))
FROM EMP
WHERE ename = 'JAMES';

-- TRIM / LTRIM / RTRIM : 문자열 데이터 내에서 특정 문자를 지우기 위해 사용
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

-- 날짜 데이터를 다루는 날짜 함수
-- SYSDATE : 운영체제로부터 시간을 읽어 옴
SELECT SYSDATE FROM dual;
SELECT SYSDATE AS "현재 시간",
    SYSDATE - 1 AS "어제",
    SYSDATE + 1 AS "내일"
FROM dual;

-- 몇 개월 이후 날짜를 구하는 ADD_MONTHS 함수
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3) 
FROM dual;



-- 입사 10주년이 되는 사원들 데이터 출력하기
SELECT empno, ename, hiredate,
    ADD_MONTHS(hiredate, 120) AS "입사10주년"
FROM emp;

-- 연습문제 : SYSDATE와 ADD_MONTHS 함수를 사용하여 현재 날짜와 6개월 이후 날짜가 출력
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 6)
from dual;

-- 돌아오는 요일 NEXT_DAY, 달의 마지막 날짜를 구하는 LAST_DAY
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '월요일'),
    LAST_DAY(SYSDATE)
FROM dual;

-- 날짜 정보 추출 함수
SELECT EXTRACT(YEAR FROM DATE '2024-03-26')
FROM dual;
SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM hiredate) = 12;


-- 자료형을 변환하는 형 변환 함수, NUMBER와 문자 자료형 연산시 자동으로 NUMBER 타입으로 변환
SELECT empno, ename, empno + '500'
FROM EMP
WHERE ename = 'FORD';


-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재날짜시간"
FROM dual;

SELECT SYSDATE FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS 몇주차
FROM DUAL;


SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;


-- 숫자 데이터 형식을 지정하여 출력하기
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


-- TO_DATE : 문자열로 명시된 날짜로 변환하는 함수
SELECT TO_DATE('22/08/20', 'YY/MM/DD')
FROM DUAL;

-- NULL 처리 함수 : NULL이란 특정열의 행에 데이터값이 지정되지 않으면 데이터 값이 NULL이 됨
-- NULL은 0이나 공백과는 다른 의미, 연산도 안되고 비교도 안됨
SELECT empno, ename, sAL, comm, sal+comm,
    NVL(comm, 0),
    sal + NVL(comm, 0)
FROM EMP;


-- NVL2 : 입력데이터가 NULL이 아니면 두번째 매개변수 값으로 반환, NULL이면 3번째 매개변수 값으로 반환
SELECT empno, ename, comm,
    NVL2(comm, 'O', 'X'),
    NVL2(comm, sal*12+comm, sal*12) AS "연봉"
FROM EMP;
    
    
SELECT NULLIF(10, 10), NULLIF('A', 'B') FROM DUAL;


-- 1. EMP테이블에서 COMM의 값이 NULL이 아닌 정보 조회
SELECT *FROM EMP
WHERE COMM IS NOT NULL;

-- 2. EMP테이블에서 커미션을 받지 못하는 직원 조회
SELECT ename FROM emp
WHERE comm = 0 or comm is null;

-- 3. EMP테이블에서 관리자가 없는 직원 정보 조회
select ename from emp
where mgr is null;

desc emp;

-- 4. EMP테이블에서 급여를 많이 받는 직원순으로 조회
select ename, sal from emp
order by sal desc;

-- 5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
select sal, comm from emp
order by sal desc, comm desc;

-- 6. EMP테이블에서 사원번호, 사원명, 직급, 입사일 조회(입사일 오름차순)
select empno, ename, job, hiredate from emp
order by hiredate;

-- 7. EMP테이블에서 사원번호, 사원명 조회(사원번호 내림차순)
select empno, ename from emp
order by empno desc;

-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여조회
select empno, hiredate, ename, sal, deptno from emp
order by deptno, hiredate desc;


-- 9. 오늘 날짜에 대한 정보조회
select SYSDATE from dual;

-- 10. EMP테이블에서 사번, 사원명, 급여조회(급여는 100단위 값만 출력, 급여 내림차순)
select empno, ename, ROUND(sal, -2) from emp
order by sal desc;

--11. **EMP테이블에서 사원번호가 홀수인 사원들을 조회**
select empno, ename from emp
where mod(empno, 2) = 1;

--12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**
select ename, extract(year from hiredate), extract(month from hiredate) from emp


--13. **EMP테이블에서 9월에 입사한 직원의 정보 조회**
select * from emp
where extract(month from hiredate) = 9;

--14. **EMP테이블에서 81년도에 입사한 직원 조회**
select * from emp
where extract(year from hiredate) = 1981;


--15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**
select ename from emp
where ename like '%E';

--16. **EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회**
select ename from emp
where ename like '__R%';
select ename from emp
where substr(ename, 3, 1) = 'R';

--**EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회**
select empno, ename, hiredate, ADD_MONTHS(hiredate, 12*40) from emp;

-- **EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회**
select * from emp
where months_between(sysdate, hiredate) / 12 >= 38;

-- **오늘 날짜에서 년도만 추출**
select extract(year from sysdate) from dual;
