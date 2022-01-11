SHOW databases;
CREATE database mydb;
USE mydb;
CREATE TABLE test
(a int NOT NULL, b CHAR(10),
PRIMARY KEY(a) )
engine=InnoDB default charset=utf8;
SHOW tables;
INSERT INTO test VALUES(1, 'data 123');
INSERT INTO test VALUES(2, 'data 2345');
INSERT INTO test VALUES(3, 'data 34567');
INSERT INTO test VALUES(4, 'data 456789');
INSERT INTO test VALUES(5, 'data 5678901');
SELECT * FROM test;
SELECT * FROM test WHERE a >= 2;
