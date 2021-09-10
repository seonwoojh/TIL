use company;
set sql_safe_updates = 0;
show tables;

### department 테이블에 아래 2개의 튜플을 추가하기
insert into department values('영업부', 7, '33344555', '1990-01-01');
insert into department values('비서실', 8, '999887777', '2010-01-01');
select * from department;

### dept_locations 테이블에 7번 부서의 위치 3개를 추가하기. 애트리뷰트 값은 임의로 부여함.
insert into dept_locations value(7, 'Seoul');
insert into dept_locations value(7, 'Busan');
insert into dept_locations value(7, 'Kangwon');
select * from dept_locations;

### works_on 테이블에 튜플 5개를 추가함. 애트리뷰트 값은 참조 무결성 조건을 만족하는 임의의 값을 부여함.
select * from works_on;
-- select ssn from employee; # 참조무결성 확인
-- select pnumber from project; # 참조무결성 확인

insert into works_on value('888665555',10,15.5);
insert into works_on value('123456789',30,15.1);
insert into works_on value('987654321',1,15.7);
insert into works_on value('333445555',1,30.1);
insert into works_on value('666884444',2,27.1);
select * from works_on;

### 30000 이상의 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, bdate from employee where salary >= 30000;

###  5번 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, bdate from employee where salary >= 30000 and dno = 5;


### 'Research' 부서에 근무하는 사람 중에서 30000 이상 salary를 받는 사원의 ssn과 이름, 생일을 검색하기.
select ssn, fname, bdate, dno from employee, department where salary >= 30000 and 'Research' in (select dname from department);


### 일반 중첩 질의를 사용하여, 'Research' 부서에 근무하는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate from employee where dno in (select dnumber from department where dname = 'Research');


### exists 연산자를 사용하는 상관 중첩 질의를 사용하여, 'Research' 부서에 근무하는 사원들의 fname, lname, bdate 검색하기
select fname, lname, bdate, dno from employee as e where exists(select * from department as d 
where e.dno = d.dnumber and dname = 'Research');


### 일반 중첩 질의를 사용하여, 부양 가족이 없는 사원들의 fname, lname, bdate 검색하기
select * from employee;

### 상관 중첩 질의를 사용하여, 부양 가족이 없는 사원들의 fname, lname, bdate 검색하기


### 내부 조인을 사용하여, 사원들의 이름과 부양가족의 이름을 검색하기
select fname, lname from employee, dependent where ssn=essn;

### 왼쪽 outer join을 사용하여, 사원들의 이름과 부양가족의 이름을 검색하기