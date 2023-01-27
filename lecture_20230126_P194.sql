DROP DATABASE IF EXISTS sqldb; -- 만약 sqldb가 존재하면 우선 삭제한다.
CREATE DATABASE sqldb;

use sqldb;

CREATE TABLE usertbl -- 회원 테이블
(	userID		CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
	name		VARCHAR(10) NOT NULL, -- 이름
	birthYear	INT NOT NULL, -- 출생년도
    addr		CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
    mobile1		CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
    mobile2 	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
    height		SMALLINT, -- 키
    mDate		DATE -- 회원 가입일
);

desc usertbl;

CREATE TABLE buytbl -- 회원 구매 테이블(Buy Table의 약자)
(	num			INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
	userID		CHAR(8) NOT NULL, -- 아이디(FK)
	prodName	CHAR(6) NOT NULL, -- 물품명
	groupName	CHAR(4) , -- 분류
    price 		INT NOT NULL, -- 단가
    amout		SMALLINT NOT NULL, -- 수량
    FOREIGN KEY (userID) REFERENCES usertbl(userID)
);

desc buytbl;

-- usertbl 데이터 삽입
-- 원래는 usertbl(userID, name, birthYear, addr, mobile1, mobile2, height, mDate) 이렇게 작성하는 것이 원칙
-- 그런데 모든 컬럼을 테이블 만들 때 순서에 맞게 작성한다면 이 과정을 생략 할 수 있다.
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '11111111', '182', '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '22222222', '173', '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '33333333', '177', '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '44444444', '166', '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL , NULL      , '186', '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '66666666', '182', '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL , NULL      , '170', '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '88888888', '174', '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '99999999', '172', '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '00000000', '176', '2013-5-5');

-- buytbl 데이터 삽입
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL , 30  ,  2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000,  1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200 ,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200 ,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50  ,  3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80  , 10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'   , '서적', 15  ,  5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'   , '서적', 15  ,  2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50  ,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL , 30  ,  2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'   , '서적', 15  ,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL , 30  ,  2);

-- 데이터 확인
SELECT * FROM usertbl;
SELECT * FROM buytbl;

SELECT * FROM userTbl WHERE name = '김경호';
SELECT userID, Name FROM userTbl WHERE birthYear >= 1970 AND height >= 182;
SELECT userID, Name FROM userTbl WHERE birthYear >= 1970 OR height >= 182;
SELECT Name, height FROM userTbl WHERE height >= 180 AND height <= 183;
SELECT Name, height FROM userTbl WHERE height BETWEEN 180 AND 183;
SELECT Name, addr FROM userTbl WHERE addr='경남' OR  addr='전남' OR addr='경북';
SELECT Name, addr FROM userTbl WHERE addr IN ('경남','전남','경북');
SELECT Name, height FROM userTbl WHERE name LIKE '김%';
SELECT Name, height FROM userTbl WHERE name LIKE '_종신';
SELECT Name, height FROM userTbl WHERE name LIKE '%김%';
SELECT Name, height FROM userTBL WHERE height  > 177;
SELECT Name, height FROM userTbl WHERE height > (SELECT height FROM userTbl WHERE Name = '김경호');
-- 서브쿼리의 값은 1개만 나와야 이렇게 사용이 가능하다.
SELECT Name, height FROM userTbl 
   WHERE height >= (SELECT height FROM userTbl WHERE addr = '경남');
SELECT Name, height FROM userTbl 
   WHERE height >= ANY (SELECT height FROM userTbl WHERE addr = '경남');
   
-- case 1
SELECT Name, height FROM userTbl 
   WHERE height >= (SELECT min(height) FROM userTbl WHERE addr = '경남');
SELECT Name, height FROM userTbl 
   WHERE height <= ANY (SELECT height FROM userTbl WHERE addr = '경남');
-- case 2
SELECT Name, height FROM userTbl 
   WHERE height <= (SELECT max(height) FROM userTbl WHERE addr = '경남');
SELECT Name, height FROM userTbl 
   WHERE height >= ANY (SELECT height FROM userTbl WHERE addr = '경남');
-- case 3
SELECT Name, height FROM userTbl 
   WHERE height = ANY (SELECT height FROM userTbl WHERE addr = '경남');
SELECT Name, height FROM userTbl 
  WHERE height IN (SELECT height FROM userTbl WHERE addr = '경남');
-- case 4
  SELECT Name, height FROM userTbl 
  WHERE height >= ALL (SELECT height FROM userTbl WHERE addr = '경남');
    SELECT Name, height FROM userTbl 
  WHERE height >= (SELECT max(height) FROM userTbl WHERE addr = '경남');
-- case 5
  SELECT Name, height FROM userTbl 
  WHERE height <= ALL (SELECT height FROM userTbl WHERE addr = '경남');
    SELECT Name, height FROM userTbl 
  WHERE height <= (SELECT min(height) FROM userTbl WHERE addr = '경남');
  
  SELECT Name, mDate FROM userTbl ORDER BY mDate;

SELECT Name, mDate FROM userTbl ORDER BY mDate DESC;

SELECT Name, height FROM userTbl ORDER BY height DESC, name ASC;