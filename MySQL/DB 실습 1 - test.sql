show databases;
create database mydb;
use mydb;
create table test
(a int not null, b char(10),
primary key(a) )
engine=InnoDB default charset=utf8;
show tables;
insert into test values(1, 'data 123');
insert into test values(2, 'data 2345');
insert into test values(3, 'data 34567');
insert into test values(4, 'data 456789');
insert into test values(5, 'data 5678901');
select * from test;
select * from test where a >= 2;