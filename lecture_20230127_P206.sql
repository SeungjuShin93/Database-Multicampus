use sqldb;

SELECT 
    addr
FROM
    userTbl;

SELECT 
    addr
FROM
    userTbl
ORDER BY addr;

SELECT DISTINCT
    addr
FROM
    userTbl;

SELECT DISTINCT
    addr
FROM
    userTbl
ORDER BY addr;

-- SELECT name, DISTINCT addr FROM userTbl ORDER BY addr; -- 특정 항목만 DISTINCT 쓰는 것이 허용 되지 않음

desc usertbl;

USE employees;

SELECT 
    emp_no, hire_date
FROM
    employees
ORDER BY hire_date ASC;

USE employees;
SELECT emp_no, hire_date FROM employees LIMIT 5;
SELECT emp_no, hire_date FROM employees LIMIT 0, 5; -- LIMIT 5 OFFSET 0과 동일;
SELECT emp_no, hire_date FROM employees LIMIT 5 OFFSET 5;
SELECT emp_no, hire_date FROM employees LIMIT 6, 5; -- 인덱스 6위치부터 즉 7번째부터 5개를 표시
SELECT emp_no, hire_date FROM employees LIMIT 5 OFFSET 10; -- LIMIT 10, 5와 동일한 표현

SELECT emp_no, hire_date FROM employees 
   ORDER BY hire_date ASC;

SELECT emp_no, hire_date FROM employees 
   ORDER BY hire_date ASC
   LIMIT 0, 5;  -- LIMIT 5 OFFSET 0 과 동일	


USE sqlDB;
CREATE TABLE buyTbl2 (SELECT * FROM buyTbl);
SELECT * FROM buyTbl2;
desc buytbl;
desc buytbl2; -- PK와 FK 같은 제약 조건은 복제되지 않음

CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buyTbl);
SELECT * FROM buyTbl3;

CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buyTbl);
SELECT * FROM buyTbl3;

SELECT * FROM buytbl ORDER BY userID;
SELECT userID, SUM(amount) FROM buyTbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'  
   FROM buyTbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액'  
   FROM buyTbl GROUP BY userID;
   
   USE sqlDB;
SELECT * FROM buytbl;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl ;

SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buyTbl  GROUP BY userID;

SELECT * FROM usertbl;
SELECT Name, MAX(height), MIN(height) FROM userTbl; -- GROUP BY 가 없어서 max나 min은 1개만 선택되는건데, 이건 불가능

SELECT Name, MAX(height), MIN(height) FROM userTbl GROUP BY Name;

SELECT Name, height
   FROM userTbl 
   WHERE height = (SELECT MAX(height)FROM userTbl) 
       OR height = (SELECT MIN(height)FROM userTbl) ;
SELECT MAX(height)FROM userTbl;
SELECT MIN(height)FROM userTbl;


SELECT * FROM usertbl;
SELECT COUNT(*) FROM userTbl;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM userTbl;

USE sqlDB;
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   GROUP BY userID ;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   WHERE SUM(price*amount) > 1000 
   GROUP BY userID ;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 ;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 
   ORDER BY SUM(price*amount) ;

SELECT num, groupName, SUM(price * amount) AS '비용' 
   FROM buyTbl
   GROUP BY  groupName, num
   WITH ROLLUP;

SELECT groupName, SUM(price * amount) AS '비용' 
   FROM buyTbl
   GROUP BY  groupName
   WITH ROLLUP;
   
   
USE sqlDB;
CREATE TABLE testTbl1 (
    id INT,
    userName CHAR(3),
    age INT
);
INSERT INTO testTbl1 VALUES (1, '홍길동', 25);
SELECT * FROM testTbl1;
INSERT INTO testTbl1(id, userName, age) VALUES (2, '이순신', 35);
SELECT * FROM testTbl1;
INSERT INTO testTbl1(id, userName) VALUES (2, '설현');
INSERT INTO testTbl1(userName, age, id) VALUES ('초아', 26,  3);
SELECT * FROM testTbl1;


USE  sqlDB;
CREATE TABLE testTbl2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName CHAR(3),
    age INT
);
desc testtbl2;

INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2(userName, age) VALUES ('유경', 21);
SELECT * FROM testTbl2;

ALTER TABLE testTbl2 AUTO_INCREMENT=100;
INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
INSERT INTO testTbl2 VALUES (NULL, '찬미2', 21);
SELECT * FROM testTbl2;


USE  sqlDB;
CREATE TABLE testTbl3 
  (id  int AUTO_INCREMENT PRIMARY KEY, 
   userName char(3), 
   age int );
ALTER TABLE testTbl3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;
INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19),(NULL, '나연', 20),(NULL, '정연', 18); -- 이런식으로도 가능
SELECT * FROM testTbl3;

SELECT * FROM testTbl2;
INSERT INTO testTbl2 VALUES (NULL, '모모', 19);
INSERT INTO testTbl2 VALUES (NULL, '모모2', 29);
INSERT INTO testTbl2 VALUES (NULL, '정연2', 28);
SELECT * FROM testTbl2;
ALTER TABLE testTbl2 AUTO_INCREMENT=120;
INSERT INTO testTbl2 VALUES (NULL, '정연3', 28);
SELECT * FROM testTbl2;


USE sqlDB;
CREATE TABLE testTbl4 (
    id INT,
    Fname VARCHAR(50),
    Lname VARCHAR(50)
);
INSERT INTO testTbl4 
  SELECT emp_no, first_name, last_name
    FROM employees.employees ;
SELECT * FROM testTbl4;

USE sqlDB;
CREATE TABLE testTbl5 
   (SELECT emp_no, first_name, last_name  FROM employees.employees) ;


UPDATE testTbl4
    SET Lname = '없음'
    WHERE Fname = 'Kyoichi';
SELECT * FROM testTbl4 WHERE Fname = 'Kyoichi';

SELECT * FROM buytbl;
USE sqlDB;
UPDATE buyTbl 
SET price = price * 1.5;
commit;

UPDATE buyTbl 
SET price = price * 1.1;
SELECT * FROM buytbl2;
DELETE FROM buytbl2 where num = 2;
UPDATE buytbl2 SET amount = 100 WHERE num = 2;
rollback;
ALTER TABLE buytbl2 CHANGE amout amount INT;
rollback; -- -- 오토커밋이 안되어 있을 때 되돌리는 기능
SELECT @@AUTOCOMMIT; -- 기본은 오토커밋 1이 있음
SET AUTOCOMMIT = FALSE; -- 오토커밋 방지

USE sqlDB;
DELETE FROM testTbl4 WHERE Fname = 'Aamer';

USE sqlDB;
DELETE FROM testTbl4 WHERE Fname = 'Aamer'  LIMIT 5;