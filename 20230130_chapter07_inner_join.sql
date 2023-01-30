USE sqlDB;

SELECT * from usertbl;
SELECT * from buytbl;
SELECT * 
FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID;

SELECT * 
FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID
WHERE buyTbl.userID = 'JYP';

SELECT * 
FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID
ORDER BY num;


SELECT userID, name, prodName, addr, mobile1 + mobile2 AS '연락처'
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID ORDER BY num; -- userID가 어느 테이블의 소속인지 불분명해서 오류 발생

SELECT buyTbl.userID, name, prodName, addr, mobile1 + mobile2 AS '연락처'
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID ORDER BY num;

SELECT buyTbl.userID, name, prodName, addr, mobile1 + mobile2 
  FROM buyTbl, userTbl
  WHERE buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userTbl.name, buyTbl.prodName, userTbl.addr, 
         userTbl.mobile1 + userTbl.mobile2  AS '연락처'
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID;

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userID = U.userID;

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userID = U.userID
   WHERE B.userID = 'JYP';

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(mobile1, U.mobile2)  AS '연락처'
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   WHERE B.userID = 'JYP';

SELECT U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT U.userID, U.name,  U.addr
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   ORDER BY U.userID ;

SELECT DISTINCT U.userID, U.name,  U.addr
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   ORDER BY U.userID ;

SELECT U.userID, U.name,  U.addr
   FROM userTbl U
   WHERE EXISTS (
      SELECT * 
      FROM buyTbl B
      WHERE U.userID = B.userID );
      
      
      
-- <실습 4> --

USE sqlDB;
CREATE TABLE stdTbl 
( stdName    VARCHAR(10) NOT NULL PRIMARY KEY,
  addr	  CHAR(4) NOT NULL
);
CREATE TABLE clubTbl 
( clubName    VARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo    CHAR(4) NOT NULL
);
CREATE TABLE stdclubTbl
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   stdName    VARCHAR(10) NOT NULL,
   clubName    VARCHAR(10) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdTbl(stdName),
FOREIGN KEY(clubName) REFERENCES clubTbl(clubName)
);
INSERT INTO stdTbl VALUES ('김범수','경남'), ('성시경','서울'), ('조용필','경기'), ('은지원','경북'),('바비킴','서울');
INSERT INTO clubTbl VALUES ('수영','101호'), ('바둑','102호'), ('축구','103호'), ('봉사','104호');
INSERT INTO stdclubTbl VALUES (NULL, '김범수','바둑'), (NULL,'김범수','축구'), (NULL,'조용필','축구'), (NULL,'은지원','축구'), (NULL,'은지원','봉사'), (NULL,'바비킴','봉사');stdclubtbl
SELECT * FROM stdtbl;
SELECT * FROM clubtbl;
SELECT * FROM stdclubtbl;

SELECT S.stdName, S.addr, SC.clubName, C.roomNo
   FROM stdTbl S 
      INNER JOIN stdclubTbl SC
           ON S.stdName = SC.stdName
      INNER JOIN clubTbl C
	  ON SC.clubName = C.clubName 
   ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
   FROM  stdTbl S
      INNER JOIN stdclubTbl SC
           ON SC.stdName = S.stdName
      INNER JOIN clubTbl C
	 ON SC.clubName = C.clubName
    ORDER BY C.clubName;