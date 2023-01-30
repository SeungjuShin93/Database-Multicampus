-- </실습 4> --
USE sqlDB;
SELECT * FROM usertbl;
SELECT * FROM buytbl;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM userTbl U
     INNER JOIN buyTbl B
         ON U.userID = B.userID 
   ORDER BY U.userID;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM userTbl U
      LEFT OUTER JOIN buyTbl B
         ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM buyTbl B 
      RIGHT OUTER JOIN userTbl U
         ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM userTbl U
      LEFT OUTER JOIN buyTbl B
         ON U.userID = B.userID 
   WHERE B.prodName IS NULL
   ORDER BY U.userID;



-- <실습 5> --

USE sqlDB;
SELECT * FROM stdtbl;
SELECT * FROM stdclubtbl;
SELECT S.stdName, S.addr, SC.clubName
   FROM stdTbl S 
      LEFT OUTER JOIN stdclubTbl SC
          ON S.stdName = SC.stdName
   ORDER BY S.stdName;
   
SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdTbl S 
      LEFT OUTER JOIN stdclubTbl SC
          ON S.stdName = SC.stdName
      LEFT OUTER JOIN clubTbl C
          ON SC.clubName = C.clubName
   ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
   FROM  stdTbl S
      LEFT OUTER JOIN stdclubTbl SC
          ON SC.stdName = S.stdName
      RIGHT OUTER JOIN clubTbl C
          ON SC.clubName = C.clubName
   ORDER BY C.clubName ;

SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdTbl S 
      LEFT OUTER JOIN stdclubTbl SC
          ON S.stdName = SC.stdName
      LEFT OUTER JOIN clubTbl C
          ON SC.clubName = C.clubName
UNION 
SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM  stdTbl S
      LEFT OUTER JOIN stdclubTbl SC
          ON SC.stdName = S.stdName
      RIGHT OUTER JOIN clubTbl C
          ON SC.clubName = C.clubName;