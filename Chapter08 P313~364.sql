
/* 08장 */


-- <실습 1> --

DROP DATABASE IF EXISTS ShopDB;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqlDB;
DROP DATABASE IF EXISTS tableDB;

CREATE TABLE `tabledb`.`buytbl` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `userid` CHAR(8) NOT NULL,
  `prodName` CHAR(6) NOT NULL,
  `groupName` CHAR(4) NULL,
  `price` INT NOT NULL,
  `amount` SMALLINT NOT NULL,
  PRIMARY KEY (`num`),
  FOREIGN KEY (userid) REFERENCES userTbl(userID)  
);

-- </실습 1> --

CREATE TABLE test (num INT);

-- <실습 2> --

DROP DATABASE tableDB;
CREATE DATABASE tableDB;

USE tableDB;
DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl -- 회원 테이블
( userID  char(8), -- 사용자 아이디
  name    nvarchar(10), -- 이름
  birthYear   int,  -- 출생년도
  addr	  nchar(2), -- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1	char(3), -- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2   char(8), -- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    smallint,  -- 키
  mDate    date  -- 회원 가입일
);
CREATE TABLE buyTbl -- 구매 테이블
(  num int, -- 순번(PK)
   userid  char(8),-- 아이디(FK)
   prodName nchar(6), -- 물품명
   groupName nchar(4) , -- 분류
   price     int , -- 단가
   amount    smallint -- 수량
);

USE tableDB;
DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL , 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);
CREATE TABLE buyTbl 
(  num int NOT NULL , 
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);


DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);
CREATE TABLE buyTbl 
(  num int NOT NULL PRIMARY KEY, 
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);

DROP TABLE IF EXISTS buyTbl;
CREATE TABLE buyTbl 
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);

DROP TABLE IF EXISTS buyTbl;
CREATE TABLE buyTbl (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4) NULL,
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY (userid) REFERENCES userTbl (userID)
);

SELECT *
FROM Information_schema.table_constraints
WHERE table_schema = 'tabledb';

SELECT *
FROM Information_schema.table_constraints
WHERE table_schema = 'tabledb' and table_name='buytbl';

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
SELECT * FROM usertbl;

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
SELECT * FROM buytbl;

DESC usertbl;
DESC buytbl;

-- </실습 2> --

DROP TABLE IF EXISTS usertbl;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);

DESCRIBE userTBL;

DROP TABLE IF EXISTS buyTbl;
DROP TABLE IF EXISTS userTbl; -- 이걸 삭제하면 참조 무결성에 위배가 됨
CREATE TABLE userTbl 
(  userID  char(8) NOT NULL,  
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL, 
  CONSTRAINT PK_userTbl_userID PRIMARY KEY (userID) -- 기본키에 이름을 주었는데도 불구하고 PRIMARY 라고 표시가 됨
  -- CONSTRAINT PRIMARY KEY PK_userTbl_userID (userID)
);
CREATE TABLE `usertbl` (
  `userID` char(8) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birthYear` int NOT NULL,
  `addr` char(2) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SHOW KEYS FROM usertbl;

DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL, 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL
);
ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID 
        PRIMARY KEY (userID);

SELECT *
FROM Information_schema.table_constraints
WHERE table_schema = 'tabledb';

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL
);
ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) ;
SHOW KEYS FROM prodTbl;

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL,
  CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) -- 복합키
);

DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY,  
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL
);
CREATE TABLE buyTbl 
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY , 
   userid  char(8) NOT NULL ,
			FOREIGN KEY(userid) REFERENCES userTbl(userID),
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL
   -- CONSTRAINT FK_usertbl_buytbl FOREIGN KEY (userID) REFERENCES usertbl(userID) -- FK_usertbl_buytbl_userID 이렇게 부여하기도 함
);
ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;

SELECT *
FROM Information_schema.table_constraints
WHERE table_schema = 'tabledb';

DROP TABLE IF EXISTS buyTbl;
CREATE TABLE buyTbl 
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userid  char(8) NOT NULL,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL, 
   CONSTRAINT FK_userTbl_buyTbl FOREIGN KEY(userid) REFERENCES userTbl(userID)
);

DROP TABLE IF EXISTS buyTbl, userTbl ;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY,  
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL
 );
CREATE TABLE buyTbl 
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userid  char(8) NOT NULL,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);
ALTER TABLE buyTbl
    ADD CONSTRAINT FK_userTbl_buyTbl 
    FOREIGN KEY (userid) 
    REFERENCES userTbl(userID);

ALTER TABLE buyTbl
	DROP FOREIGN KEY FK_userTbl_buyTbl; -- 외래 키 제거
ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buyTbl
	FOREIGN KEY (userID)
	REFERENCES userTbl (userID)
    -- ON UPDATE CASCADE;
	ON DELETE CASCADE;
  
INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
SELECT * FROM usertbl;

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
SELECT * FROM buytbl;  
SHOW KEYS FROM buytbl;

DELETE FROM usertbl WHERE userID = 'JYP';

DROP TABLE IF EXISTS buyTbl, userTbl ;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY,
  name    nvarchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL,
  email   char(30) NULL  UNIQUE
);
show keys from usertbl;

DROP TABLE IF EXISTS userTbl ;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY,
  name    nvarchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL,
  email   char(30) NULL ,  
  CONSTRAINT AK_email  UNIQUE (email)
);
show keys from usertbl; -- AK_email이란 이름이 붙음, 참고로 UK_email 이라고도 사용

DROP TABLE IF EXISTS userTbl ;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY,
  name    nvarchar(10), 
  birthYear   int CHECK (birthYear >= 1900 AND birthYear <=2023),
  mobile1	char(3) NULL, 
  CONSTRAINT CK_name CHECK (name IS NOT NULL)
);

DESC usertbl;
INSERT INTO usertbl(userid, name, mobile1) values('aaa', '이기자', '010');
SELECT * from usertbl;

ALTER TABLE usertbl
	ADD CONSTRAINT CK_mobile1
	CHECK (mobile1 IN ('010', '011', '016', '017', '018', '019'));


CREATE DATABASE IF NOT EXISTS testDB;
use testDB;
DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl 
( userID  	char(8) NOT NULL PRIMARY KEY,  
  name    	varchar(10) NOT NULL, 
  birthYear	int NOT NULL DEFAULT -1,
  addr	  	char(2) NOT NULL DEFAULT '서울',
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL DEFAULT 170, 
  mDate    	date NULL
);
DESC usertbl;

INSERT INTO usertbl(userID, name, birthYear, mobile1, mobile2)
values('aaa', '이기자', 1988, '010', '12345678');
SELECT * FROM usertbl;
DESC usertbl;

use testDB;
DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl 
( userID	char(8) NOT NULL PRIMARY KEY,  
  name		varchar(10) NOT NULL, 
  birthYear	int NOT NULL ,
  addr		char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL, 
  mDate	date NULL 
);
ALTER TABLE userTbl
	ALTER COLUMN birthYear SET DEFAULT -1;
DESC usertbl;

ALTER TABLE userTbl
	ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE userTbl
	ALTER COLUMN height SET DEFAULT 170;

-- default 문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO userTbl VALUES ('LHL', '이혜리', default, default, '011', '1234567', default, '2019.12.12');
SELECT * FROM usertbl;

-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다
INSERT INTO userTbl(userID, name) VALUES('KAY', '김아영');

-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO userTbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2017.5.5');
SELECT * FROM userTbl;

-- <실습 3> --

SHOW VARIABLES LIKE 'innodb_file_format';
SHOW VARIABLES LIKE 'innodb_large_prefix';

CREATE DATABASE IF NOT EXISTS compressDB;
USE compressDB;
CREATE TABLE normalTBL( emp_no int , first_name varchar(14));
CREATE TABLE compressTBL( emp_no int , first_name varchar(14))
	ROW_FORMAT=COMPRESSED ;

INSERT INTO normalTbl 
     SELECT emp_no, first_name FROM employees.employees;   
INSERT INTO compressTBL 
     SELECT emp_no, first_name FROM employees.employees;

SHOW TABLE STATUS FROM compressDB;

DROP DATABASE IF EXISTS compressDB;

-- </실습 3> --



-- <실습 4> --

USE employees;
CREATE TEMPORARY TABLE  IF NOT EXISTS  tempTBL (id INT, name CHAR(5));
CREATE TEMPORARY TABLE  IF NOT EXISTS employees (id INT, name CHAR(5));
DESCRIBE tempTBL;
DESCRIBE employees;

INSERT INTO tempTBL VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MySQL');
SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM employees;

-- </실습 4> --

USE tableDB;
ALTER TABLE userTbl
	ADD homepage VARCHAR(30)  -- 열추가
		DEFAULT 'http://www.hanbit.co.kr' -- 디폴트값
		NULL; -- Null 허용함
DESC usertbl;

ALTER TABLE userTbl
	DROP COLUMN mobile1;
SELECT * FROM usertbl;

ALTER TABLE userTbl
	CHANGE COLUMN name uName VARCHAR(20) NULL ;

ALTER TABLE userTbl
	DROP PRIMARY KEY; 

ALTER TABLE buyTbl
	DROP FOREIGN KEY buytbl_ibfk_1;


-- <실습 5> --

USE tableDB;
DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl 
( userID  char(8), 
  name    nvarchar(10),
  birthYear   int,  
  addr	  nchar(2), 
  mobile1	char(3), 
  mobile2   char(8), 
  height    smallint, 
  mDate    date 
);
CREATE TABLE buyTbl 
(  num int AUTO_INCREMENT PRIMARY KEY,
   userid  char(8),
   prodName nchar(6),
   groupName nchar(4),
   price     int ,
   amount    smallint
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL,'JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);

ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID
	PRIMARY KEY (userID);

ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buyTbl
	FOREIGN KEY (userID)
	REFERENCES userTbl (userID);

DELETE FROM buyTbl WHERE userid = 'BBK';
ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buyTbl
	FOREIGN KEY (userID)
	REFERENCES userTbl (userID);

INSERT INTO buyTbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);

SET foreign_key_checks = 0;
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
SET foreign_key_checks = 1;

ALTER TABLE userTbl
	ADD CONSTRAINT CK_birthYear
	CHECK  (birthYear >= 1900 AND birthYear <= YEAR(CURDATE())) ;

INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';

SET foreign_key_checks = 0;
UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';
SET foreign_key_checks = 1;

SELECT B.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userid = U.userid ;

SELECT COUNT(*) FROM buyTbl;

SELECT B.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buyTbl B
     LEFT OUTER JOIN userTbl U
        ON B.userid = U.userid
   ORDER BY B.userid ;

SET foreign_key_checks = 0;
UPDATE userTbl SET userID = 'BBK' WHERE userID='VVK';
SET foreign_key_checks = 1;

ALTER TABLE buyTbl
	DROP FOREIGN KEY FK_userTbl_buyTbl;
ALTER TABLE buyTbl 
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID)
		ON UPDATE CASCADE;

UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';
SELECT B.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userid = U.userid
  ORDER BY B.userid;

DELETE FROM userTbl WHERE userID = 'VVK';

ALTER TABLE buyTbl
	DROP FOREIGN KEY FK_userTbl_buyTbl;
ALTER TABLE buyTbl 
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

DELETE FROM userTbl WHERE userID = 'VVK';
SELECT * FROM buyTbl ;

ALTER TABLE userTbl
	DROP COLUMN birthYear ;

-- </실습 5> --

DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl -- 회원 테이블
( userID  char(8), -- 사용자 아이디
  name    nvarchar(10), -- 이름
  birthYear   int,  -- 출생년도
  addr	  nchar(2), -- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1	char(3), -- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2   char(8), -- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    smallint,  -- 키
  mDate    date  -- 회원 가입일
);
INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');

DESC usertbl;
SELECT userid, name, addr FROM userTbl;

USE tableDB;
CREATE VIEW v_userTbl
AS
	SELECT userid, name, addr FROM userTbl;

SELECT * FROM v_userTbl;  -- 뷰를 테이블이라고 생각해도 무방

SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM userTbl U
  INNER JOIN buyTbl B
     ON U.userid = B.userid ;

CREATE VIEW v_userbuyTbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM userTbl U
	INNER JOIN buyTbl B
	 ON U.userid = B.userid ;

SELECT * FROM v_userbuyTbl WHERE name = '김범수';


-- <실습 6> --

DROP TABLE IF EXISTS buyTbl, userTbl;
CREATE TABLE userTbl -- 회원 테이블
( userID  char(8), -- 사용자 아이디
  name    nvarchar(10), -- 이름
  birthYear   int,  -- 출생년도
  addr	  nchar(2), -- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1	char(3), -- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2   char(8), -- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    smallint,  -- 키
  mDate    date  -- 회원 가입일
);
ALTER TABLE userTbl
	ADD PRIMARY KEY (userID);
CREATE TABLE buyTbl -- 구매 테이블
(  num int NOT NULL  PRIMARY KEY auto_increment, -- 순번(PK)
   userid  char(8),-- 아이디(FK)
   prodName nchar(6), -- 물품명
   groupName nchar(4) , -- 분류
   price     int , -- 단가
   amount    smallint -- 수량
);
ALTER TABLE buyTbl
	ADD FOREIGN KEY(userid) REFERENCES usertbl(userID);


INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
SELECT * FROM usertbl;

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
SELECT * FROM buytbl;

-- use sqldb;
CREATE VIEW v_userbuyTbl
AS
   SELECT U.userid AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME', 
		U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
      FROM userTbl U
	INNER JOIN buyTbl B
	 ON U.userid = B.userid;

SELECT `USER ID`, `USER NAME` FROM v_userbuyTbl; -- 주의! 백틱을 사용한다.
SELECT * FROM v_userbuytbl;
SHOW CREATE VIEW v_userbuytbl;

ALTER VIEW v_userbuyTbl
AS
   SELECT U.userid AS '사용자 아이디', U.name AS '이름', B.prodName AS '제품 이름', 
		U.addr, CONCAT(U.mobile1, U.mobile2)  AS '전화 번호'
      FROM userTbl U
          INNER JOIN buyTbl B
             ON U.userid = B.userid ;

SELECT `이름`,`전화 번호` FROM v_userbuyTbl;

DROP VIEW v_userbuyTbl;

USE sqlDB;
CREATE OR REPLACE VIEW v_userTbl
AS
	SELECT userid, name, addr FROM userTbl;

DESCRIBE v_userTbl;

SHOW CREATE VIEW v_userTbl;

SELECT * FROM v_usertbl;

UPDATE v_userTbl SET addr = '부산' WHERE userid='JYP' ;
SELECT * FROM usertbl; -- 뷰를 수정했는데 실제 테이블의 내용이 수정 됨

INSERT INTO v_userTbl(userid, name, addr) VALUES('KBM','김병만','충북') ;
DESC usertbl;

CREATE VIEW v_sum
AS
	SELECT userid AS 'userid', SUM(price*amount) AS 'total'  
	   FROM buyTbl GROUP BY userid;

SELECT * FROM v_sum;

SELECT * FROM INFORMATION_SCHEMA.VIEWS
     WHERE TABLE_SCHEMA = 'tableDB' AND TABLE_NAME = 'v_sum';

CREATE VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177 ;

SELECT * FROM v_height177 ;

DELETE FROM v_height177 WHERE height < 177 ;

INSERT INTO v_height177 VALUES('KBC', '김병만', 1977 , '경기', '010', '5555555', 158, '2019-01-01') ;
SELECT * FROM usertbl;

INSERT INTO v_height177 VALUES('KBM', '김병만', 1977 , '경기', '010', '5555555', 158, '2019-01-01') ;
ALTER VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177
	    WITH CHECK OPTION ;

INSERT INTO v_height177 VALUES('WDT', '서장훈', 2006 , '서울', '010', '3333333', 155, '2019-3-3') ;

CREATE VIEW v_userbuyTbl
AS
  SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS mobile
   FROM userTbl U
      INNER JOIN buyTbl B
         ON U.userid = B.userid ;

INSERT INTO v_userbuyTbl VALUES('PKL','박경리','운동화','경기','00000000000','2020-2-2');

DROP TABLE IF EXISTS buyTbl, userTbl;

SELECT * FROM v_userbuyTbl;

CHECK TABLE v_userbuyTbl;

-- </실습 6> --

