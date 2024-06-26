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




-- 다중행 함수 : 여러 행에 대해 함수가 적용되어 하나의 결과를 나타내는 함수(집계 함수)
select sum(sal)
from emp;
-- GROUP BY : 그룹화
select deptno, sum(sal) -- 3. 부서와 부서의 급여합계를 출력
from emp  -- 1. 먼저 사원 테이블을 가져옴
group by deptno; -- 2. 사원 테이블을 부서 단위로 묶음

-- 모든 사원의 급여와 수당의 합계 구하기
select sum(sal), sum(comm)
from emp;

-- 테이블의 데이터 갯수 출력
select count(*)
from emp;

-- 30번 부서의 사원 수 출력
select count(*)
from emp
where deptno = 30;

select count(comm)
from emp
where comm is not null;

-- 10번 부서의 사원 중 최대 급여 출력하기
select max(sal)
from emp
where deptno = 10;

-- 30번 부서의 평균 급여 출력하기
select avg(sal)
from emp
where deptno = 30;

-- 부서별 평균 급여 출력하기
select avg(sal), deptno
from emp
group by deptno;

select avg(sal)
from emp
where deptno = 10;

-- 집합을 사용해서 출력하기
select avg(sal) from emp where deptno = 10
union all
select avg(sal) from emp where deptno = 20
union all
select avg(sal) from emp where deptno = 30;

-- 부서 번호 및 직책별 평균 급여 정렬하기
select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;

-- 부서코드, 급여합계, 부서평균, 부서코드 순 정렬로 출력하기
select deptno as "부서코드",
    sum(sal) as "급여합계",
    round(avg(sal)) as "급여평균",
    count(*) as "인원수"
from emp
group by deptno
order by deptno;


-- HAVING절 : GROUP BY 절이 존재 할 때만 사용
-- GROUP BY절을 통해 그룹화 된 결과 값의 범위를 제한하는데 사용
select deptno, job, avg(sal)
from emp
group by deptno, job
    having avg(sal) >= 2000
order by deptno, job;


-- 1. HAVING절을 사용하여 부서별 직책의 평균 급여가 500 이상인 사원들의
-- 부서번호, 직책, 부서별 직책의 평균 급여 출력
select deptno, job, avg(sal)
from emp
group by deptno, job
    having avg(sal) >= 500
order by deptno, job;


-- 2. 부서번호, 평균급여, 최고급여, 최저급여, 사원수 출력
-- 단, 평균 급여는 소수점 제외하고 부서 번호별 출력
select deptno, round(avg(sal)), max(sal), min(sal), count(*)
from emp
group by deptno
order by deptno;


-- 3. 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력
select job, count(*)
from emp
group by job
    having count(*) >= 3;


-- 4. 사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력(to_char(hiredate, 'yyyy') 사용 가능)
select extract(year from hiredate), deptno, count(*) from emp
group by extract(year from hiredate), deptno
order by extract(year from hiredate);


-- 5. 추가 수당을 받는 사원과 받지 않는 사원수 출력
-- 추가 수당 여부는 O, X로 표기
select NVL2(comm, 'O', 'X'), count(*) from emp
group by NVL2(comm, 'O', 'X');



-- 6. 각 부서의 입사 연도별 사원수, 최고급여, 급여합, 평균 급여를 출력
select extract(year from hiredate), deptno, count(*), max(sal), sum(sal), round(avg(sal)) from emp
group by extract(year from hiredate), deptno
order by extract(year from hiredate), deptno;



-- ROLLUP 함수 : 
select deptno, job, count(*), max(sal), sum(sal), avg(sal)
from emp
group by rollup(deptno, job);


-- 집합연산자 : 두 개 이상의 쿼리 결과를 하나로 결합하는 연산자(수직적 처리)
select empno, ename, job
from emp
where job = 'SALESMAN'
union
select empno, ename, job
from emp
where job = 'MANAGER';


-- 조인(JOIN) : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용되는 SQL기능
-- 테이블에 대한 식별 값인 PRIMARY KEY와 테이블 간의 공통 값인 FOREIGN KEY 값을 사용하여 조인
-- 내부 조인(동등 조인, inner join)이며 오라클 방식, 양쪽에 동일한 컬럼이 있는 경우(테이블 이름을 표시해야 함)

select empno, ename, mgr, sal, e.deptno
from emp e, dept d
where e.deptno = d.deptno
and sal >= 3000;

-- ANSI 방식
select empno, ename, mgr, sal, e.deptno
from emp e join dept d
on e.deptno = d.deptno
where sal >= 3000;

-- EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같이 등가 조인을 했을 때 
-- 급여가 2500 이하이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성
select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where sal >= 2500 and empno <= 9999
order by empno;

-- 비등가 조인 : 동일한 컬럼이 없을 때 사용하는 조인(일반적으로 많이 사용되지는 않음)
select * from emp;
select * from salgrade;
select e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;


-- 자체 조인 : 현재 테이블 조인해서 뭔가 결과를 찾아 낼 때 사용
select e1.empno, e1.ename, e1.mgr,
    e2.empno as "상관 사원번호",
    e2.ename as "상관 이름"
from emp e1 join emp e2
on e1.mgr = e2.empno;

-- 외부 조인(Left outer join) : 부족한 부분이 있는 행의 테이블에 (+)
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
order by e.deptno;

select e.ename, e.deptno, d.dname
from emp e right outer join dept d
on e.deptno = d.deptno
order by e.deptno;


-- NATURAL JOIN : 동등조인을 사용하는 다른 방법, 조건절 없이 사용, 두 테이블의 같은 열을 자동으로 연결
select e.empno, e.ename, d.dname, deptno
from emp e natural join dept d;

-- JOIN ~ USING : 동등조인(등가조인)을 대신하는 방식 중의 하나
select e.empno, e.ename, d.dname, deptno, e.sal
from emp e join dept d using(deptno)
where sal >= 3000
order by deptno, e.empno;


-- 연습문제 1 : 급여가 2000초과인 사원들의 부서 정보, 사원 정보 출력
select deptno, dname, empno, ename, sal
from emp natural join dept
where sal > 2000;
-- 연습문제 2 : 부서별 평균, 최대 급여, 최소 급여, 사원 수 출력(ANSI JOIN)
select d.deptno, dname, round(avg(sal)) as "평균 급여",
    MAX(sal) as "최대 급여",
    min(sal) as "최소 급여",
    count(*) as "사원 수"
from emp e join dept d
on e.deptno = d.deptno
group by d.deptno, dname;

-- 연습문제 3 : 모든 부서 정보와 사원 정보를 부서 번호, 사원 이름순으로 정렬해서 출력
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, d.dname;


-- scott 계정 연습문제(2)
-- 1.
select ename, hiredate, deptno from emp
where ename = 'ALLEN';
-- 2.
select * from emp
where ename = 'ALLEN';
-- 3. 
select * from emp
where ename > 'K';
-- 4.
select ename, sal, deptno, hiredate from emp
where hiredate > '81/04/02' and hiredate < '82/12/09';
-- 5.
select ename, job, sal from emp
where sal > 1600 and sal < 3000;
-- 6.
select * from emp
where extract(year from hiredate) != 1981;
-- 7.
select * from emp
where job = 'MANAGER' or job = 'SALESMAN';
-- 8.
select ename, empno, deptno from emp
where deptno not in (20, 30);
-- 9.
select empno, ename, deptno from emp
where ename like 'S%';
-- 10.
select * from emp
where ename like '_A%';
-- 11.
select * from emp
where comm is not null;
-- 12.
select * from emp
where ename like 'J%S';
-- 13.
select * from emp
where sal >= 1500 and
    deptno = 30 and
    job = 'MANAGER';
-- 14.
select ename, sal, nvl(comm,0), sal+nvl(comm,0) from emp
order by sal+nvl(comm,0) desc;
    
    

-- 서브쿼리 : 쿼리문 내에 포함되는 쿼리문을 의미, 일반적으로 SELECT문의 WHERE 절에서 사용
-- 단일행 서브쿼리와 다중행 서브쿼리가 있음
select dname from dept
where deptno = (select deptno 
                from emp
                where ename = 'KING');


select * from emp
where sal > (select sal from emp where ename = 'JONES');

-- 서브쿼리를 사용하여 EMP 테이블의 사원 정보 중에서 사원 이름이 ALLEN인 사원의 추가 수당
-- 보다 많은 추가 수당을 받는 사원 정보를 구하도록 코드 작성
SELECT * FROM EMP
WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');


select * from emp
where hiredate < (select hiredate from emp where ename = 'JAMES');


select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.deptno = 20
and e.sal > (select avg(sal) from emp);
    

-- 실행 결과가 여러개인 다중행 서브쿼리
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 true
-- ANY, SOME : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- ALL : 메인 쿼리의 조건식을 서브퀄의 결과 모두가 만족하면 true
-- EXISTS : 서브 쿼리의 결과가 존재하면 true
select * from emp
where sal in(select max(sal) from emp group by deptno)
order by deptno;

select empno, ename, sal
from emp
where sal > any(select sal from emp where job = 'SALESMAN');

select empno, ename, sal, job
from emp
where sal = any(select sal from emp where job = 'SALESMAN');

-- ALL : 다중행으로 반환되는 서브쿼리의 결과를 모두 만족해야 true
select * from emp
where sal < all(select sal from emp where deptno = 30);

select empno, ename, sal from emp
where sal > all(select sal from emp where job = 'MANAGER');

select * from emp
where exists (select dname from dept where deptno = 10);

-- 다중열 서브쿼리 : 서브쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달
select empno, ename, sal, deptno
from emp
where (deptno, sal) in (select deptno, sal from emp
                        where deptno = 30);

select * from emp
where (deptno, sal) in (select deptno, max(sal)
                        from emp
                        group by deptno);
                        
-- FROM 절에서 사용하는 서브쿼리 : 인라인뷰라고 부름
-- 테이블 내에 데이터 규모가 너무 크거나 특정 열만 제공해야 하는 경우 사용
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (select empno, ename, deptno from emp where deptno = 10) e10 join dept d
on e10.deptno = d.deptno;

-- select절에 사용하는 서브쿼리 : 스칼라 서브쿼리라고 부름
-- select절에 사용되는 서브쿼리는 반드시 하나의 결과만 반환되어야 함
select empno, ename, job, sal, 
             (select grade from salgrade
              where e.sal between losal and hisal) as salgrade, deptno,
              (select dname from dept d
              where e.deptno = d.deptno) as dname
from emp e;

select ename, deptno, sal, (select trunc(avg(sal)) from emp
                            where deptno = e.deptno) as "부서별 급여 평균"
from emp e;


select empno, ename, 
            case when deptno = (select deptno from dept where loc = 'NEW YORK')
                then '본사'
                else '분점'
            end as "소속"
from emp
order by 소속 desc;


-- DECODE : 주어진 데이터 값이 조건 값과 일치하는 값을 출력하고
-- 일치하지 않으면 기본값 출력
select empno, ename, job, sal, 
    decode(job,
        'MANAGER', sal * 1.1,
        'SALESMAN', sal * 1.05,
        'ANALYST', sal,
        sal * 1.03) as "급여인상"
from emp;
-- CASE문 : 
select empno, ename, job, sal,
    case job
        when 'MANAGER' then sal * 1.1
        when 'SALESMAN' then sal * 1.05
        when 'ANALYST' then sal
        else sal * 1.03
    end as "급여 인상"
from emp;


-- 1. 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원 정보, 부서 정보 출력
select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
and job = (select job from emp where ename = 'ALLEN');



-- 2. 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 
-- 사원 정보, 부서 정보, 급여 등급 정보를 출력하는 SQL문을 작성하세요
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).
select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
    and e.sal between s.losal and s.hisal
    and sal > (select avg(sal)
                from emp)
order by e.sal desc, e.empno;



-- 3. 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 
-- 사원 정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.deptno = 10
and job not in (select distinct job
                from emp
                where deptno = 30);


-- 4. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 
-- 사원 정보, 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요
-- (단 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).



-- DML(Data Manipulation Language) : 조회(select), 삭제(delete), 입력(insert), 변경(update)
create table dept_temp
as select * from dept;

select * from dept_temp;

insert into dept_temp(deptno, dname, loc) values(50, 'DATABASE', 'SEOUL');

insert into dept_temp values(60, 'NETWORK', 'BUSAN');

insert into dept_temp(deptno, loc) values(70, 'SUWON');

insert into dept_temp values(80, 'mobile', '');

create table emp_temp
as select * from emp
where 1 != 1;

select * from emp_temp;

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        VALUES (9002, '안유진', 'MANAGER', 9999, SYSDATE, 5000, 800, 20);
desc emp_temp;

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
            AND S.GRADE = 1;

-- 테이블에 있는 데이터 수정하기
select * from dept_temp2;

update dept_temp2
    set loc = 'SEOUL';


update dept_temp2
    set loc = '대전'
where deptno = 40;

delete from dept_temp2
where loc = '대전';




-- DDL(Data Definition Language) : 데이터베이스 데이터를 보관하고 관리하기 위해
-- 관리하기 위해 제공되는 여러 객체의 생성, 변경, 삭제 관련 기능을 수행
-- DDL은 commit, rollback이 없음
create table emp_ddl (
    empno number(4),
    ename varchar2(10),  -- varchar2는 10자리 이하의 가변 크기를 할당
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7, 2), -- 총 7자리의 숫자 중 소수점 이하가 2자리, 정수부 5자리
    comm number(7, 2),
    deptno number(2)
);

select * from emp_ddl;
desc emp_ddl;

-- 기존 테이블을 복사해서 새 테이블 만들기
create table dept_ddl
    as select * from dept;

select * from dept_ddl

create table emp_ddl_30
    as select * from emp
    where deptno = 30;

select * from emp_ddl_30;


-- 테이블을 변경하는 ALTER : 테이블에 새 열을 추가, 삭제하거나 열의 자료형 또는 길이 변경
create table emp_alter
    as select * from emp;
select * from emp_alter;

-- ALTER에 ADD : 컬럼을 추가
alter table emp_alter
    add hp varchar(20);

select * from emp_alter; 

-- ALTER에 RENAME : 열 이름을 변경
alter table emp_alter
    rename column hp to tel;

-- ALTER에 MODIFY : 열의 자료형을 변경
alter table emp_alter
    modify empno number(2); -- 크기를 크게 하는건 가능(5), 작게하는 건 불가능(2)
    
alter table emp_alter
    modify tel varchar(18); -- 데이터 값이 없었기 때문에 변경 가능, 데이터에 영향을 미치지 않을 경우

-- ALTER에 DROP : 특정 열을 삭제 할 때
alter table emp_alter
    drop column comm;

select * from emp_alter;

-- 테이블 이름 변경 : RENAME
rename emp_alter to emp_rename;

select * from emp_rename;

-- 테이블 데이터를 삭제하는 TRUNCATE
truncate table emp_rename; -- ROLLBACK 불가능
delete table emp_rename; -- ROLLBACK 가능

-- 테이블을 삭제하는 DROP
drop table emp_rename;


create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel varchar(20)
);

insert into table_notnull values('JKS2024', 'SPHB8250', NULL);
    
select * from table_notnull;

-- update는 DML이며 열의 데이터를 수정
update table_notnull
    set tel = '010-1234-1234'
    where login_id = 'JKS2024';

alter table table_notnull
modify tel not null;

desc table_notnull;

-- 중복 값을 허용하지 않는 UNIQUE
-- PRIMARY KEY : UNIQUE와 NOT NULL 제약조건 특성을 가짐
create table table_unique (
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);

insert into table_unique values('안유진', 'ayj1234', '010-1234-1234');
insert into table_unique values('장원영', 'jwy1234', '010-1234-5678');

select * from table_unique;

desc table_unique;

delete from table_unique;

drop table table_unique;


-- 다른 테이블과 관계를 맺는 FOREIGN KEY(외래키)
-- 외래키는 서로 다른 테이블과 관계를 정의하는데 사용하는 제약 조건
-- 참조하고 있는 기본키의 데이터 타입과 일치해야 하며, 외래키에 참조되고 있는 기본키는 삭제 할 수 없음
create table dept_fk(
    deptno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13)
);

drop table dept_fk;

create table emp_fk(
    empno number(4) primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) references dept_fk(deptno)
);
insert into dept_fk values(10, '걸그룹', 'SEOUL');
insert into dept_fk values(20, '걸그룹', 'SEOUL');
insert into emp_fk values(9000, '안유진', '아이브', 8000, sysdate, 5000, 1000, 10);
insert into emp_fk values(9001, '유나', '잇지', 7000, sysdate, 5000, 1000, 20);
select * from emp_fk, dept_fk;
select * from dept_fk;

delete from dept_fk
    where deptno = 20;

delete from emp_fk
    where deptno = 20;


-- 데이터 사전 : 데이터베이스 메모리 성능, 사용자, 권한, 객체 등 
-- 오라클 데이터베이스 운영에 필요한 중요한 데이터가 보관되어 있음
select * from dict;

-- 인덱스 : 데이터 검색 성능 향상을 위해 테이블 열에 사용하는 객체
select * from user_indexes;
create index idx_emp_sal on emp(sal);


-- 테이블뷰 : 가상 테이블로 부르는 뷰는 하나 이상의 테이블을 조회하는 select문을 저장하는 객체
-- 사용목적 : 필요한 테이블만 제공하거나 테이블의 특정 열을 숨기는 등의 보안 목적으로 사용 할 수 있음
create view vw_emp20
as (select empno, ename, job, deptno 
    from emp
    where deptno = 20);
    
-- 규칙에 따라 순번을 생성하는 시퀀스
-- 시퀀스(Sequence) : 오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자를 생성하는 객체
create table dept_sequence
as (select * from dept where 1 <> 1);

select * from dept_sequence;

-- 시퀀스 테이블 만들기
create sequence seq_dept_sequence
increment by 10
start with 10
maxvalue 90
minvalue 0
nocycle
cache 2;

select * from user_sequences;

insert into dept_sequence values(seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');
select * from dept_sequence;
insert into dept_sequence values(seq_dept_sequence.nextval, 'REACT', 'SUWON');




    

