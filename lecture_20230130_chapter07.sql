
/* 07장 */


SELECT CAST('2020-10-19 12:35:29.123' AS DATE) AS 'DATE'
SELECT CAST('2020-10-19 12:35:29.123' AS TIME) AS 'TIME' ;
SELECT CAST('2020-10-19 12:35:29.123' AS DATETIME) AS 'DATETIME' ; 


-- <실습 1> --

USE sqlDB;

SET @myVar1 = 5 ;
SET @myVar2 = 3 ;
SET @myVar3 = 4.25 ;
SET @myVar4 = '가수 이름==> ' ;

SELECT @myVar1 ;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4 , Name FROM userTbl WHERE height > 180 ;

SET @myVar1 = 3 ;
PREPARE myQuery 
    FROM 'SELECT Name, height FROM userTbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1 ;

-- </실습 1> --

USE sqlDB ;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl ;

SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수'  FROM buyTbl ;
-- 또는
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수'  FROM buyTbl ;

SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);
SELECT CAST('2020@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)) ,'=' )  AS '단가X수량',
	price*amount AS '구매액' 
  FROM buyTbl ;

SELECT '100' + '200' ; -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
SELECT CONCAT('100', '200'); -- 문자와 문자를 연결 (문자로 처리)
SELECT CONCAT(100, '200'); -- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
SELECT 1 > '2mega'; -- 정수인 2로 변환되어서 비교
SELECT 3 > '2MEGA'; -- 정수인 2로 변환되어서 비교
SELECT 0 = 'mega2'; -- 문자는 0으로 변환됨


SELECT IF (100>200, '참이다', '거짓이다');

SELECT IFNULL(NULL, '널이군요'), IFNULL(100, '널이군요');

SELECT NULLIF(100,100), NULLIF(200,100);

SELECT 	CASE 10
		WHEN 1  THEN  '일'
		WHEN 5  THEN  '오'
		WHEN 10 THEN  '십' 
		ELSE '모름'
	END AS 'CASE연습';
    
    
    
SELECT ASCII('A'), convert(CHAR(65) using utf8), CHAR(65);
SELECT ASCII('A'), CHAR(65); -- Workbench의 버그, BLOB에 오른쪽 버튼, Open Value in Viewer 선택 위쪽에 Text 탭 클릭


SELECT BIT_LENGTH('abc'),  CHAR_LENGTH('abc'), LENGTH('abc');
SELECT BIT_LENGTH('가나다'),  CHAR_LENGTH('가나다'), LENGTH('가나다'); -- 한글은 글자당 3바이트 할당.

SELECT CONCAT_WS('/', '2023', '01', '30');

SELECT ELT(2, '하나', '둘', '셋'), FIELD('둘', '하나', '둘', '셋'), FIND_IN_SET('둘', '하나,둘,셋'), INSTR('하나둘셋', '둘'), LOCATE('둘', '하나둘셋');

SELECT FORMAT(123456.123456, 4);

SELECT BIN(31), HEX(31), OCT(31);

SELECT INSERT('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi', 3, 2, '@@@@');

SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH');

SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5, '##');

SELECT LTRIM('   이것이'), RTRIM('이것이   ');

SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');

SELECT REPEAT('이것이', 3);

SELECT REPLACE ('이것이 MySQL이다', '이것이' , 'This is');

SELECT REVERSE ('MySQL');

SELECT CONCAT('이것이', SPACE(10), 'MySQL이다');

SELECT SUBSTRING('대한민국만세', 3, 2);

SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2),  SUBSTRING_INDEX('cafe.naver.com', '.', -2);

SELECT ABS(-100);

SELECT CEILING(4.7), FLOOR(4.7), ROUND(4.7);

SELECT CONV('AA', 16, 2), CONV(100, 10, 8);

SELECT DEGREES(PI()), RADIANS(180);

SELECT MOD(157, 10), 157 % 10, 157 MOD 10;

SELECT POW(2,3), SQRT(9);

SELECT RAND(), FLOOR(1 + (RAND() * (6-1)) );

SELECT SIGN(100), SIGN(0), SIGN(-100.123);

SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);

SELECT ADDDATE('2022-06-20', INTERVAL 1000 DAY), ADDDATE('2023-01-30', INTERVAL 1 MONTH);
SELECT SUBDATE('2023-01-30', INTERVAL 31 DAY), SUBDATE('2023-01-30', INTERVAL 1 MONTH);

SELECT ADDTIME('2020-01-01 23:59:59', '1:1:1'), ADDTIME('15:00:00', '2:10:10');
SELECT SUBTIME('2020-01-01 23:59:59', '1:1:1'), SUBTIME('15:00:00', '2:10:10');

SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURRENT_TIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

SELECT DATE(NOW()), TIME(NOW());

SELECT DATEDIFF('2023-06-23', NOW()), TIMEDIFF('23:23:59', '12:11:10');

SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

SELECT LAST_DAY('2023-06-01');

SELECT MAKEDATE(2023, 100);

SELECT MAKETIME(12, 11, 10);

SELECT PERIOD_ADD(202001, 11), PERIOD_DIFF(202001, 201812);

SELECT QUARTER('2020-07-07');

SELECT TIME_TO_SEC('12:11:10');

SELECT CURRENT_USER(), DATABASE();

USE sqlDB;
SELECT * FROM userTBL;
SELECT FOUND_ROWS();

USE sqlDB;
UPDATE buyTBL SET price=price*2;
SELECT ROW_COUNT();

SELECT SLEEP(5);
SELECT '5초후에 이게 보여요';


-- <실습 2> --

USE  sqlDB;
CREATE TABLE maxTbl ( col1 LONGTEXT,  col2 LONGTEXT);

INSERT INTO maxTbl VALUES (REPEAT('A', 1000000), REPEAT('가',1000000));

SELECT LENGTH(col1), LENGTH(col2) FROM maxTBL;

INSERT INTO maxTbl VALUES (REPEAT('A', 10000000), REPEAT('가',10000000));

/*
CD %PROGRAMDATA%
CD MySQL
CD "MySQL Server 5.7"
DIR

NOTEPAD my.ini 

max_allowed_packet=4M --> 1000M

NET STOP MySQL
NET START MySQL

*/

INSERT INTO maxTbl VALUES (REPEAT('A', 10000000), REPEAT('가',10000000));

SELECT LENGTH(col1), LENGTH(col2) FROM maxTBL;

SHOW variables LIKE 'max%';

/*

secure-file-priv=C:/TEMP

*/

USE sqlDB;
SELECT * INTO OUTFILE 'C:/TEMP/userTBL.txt' FROM userTBL;

CREATE TABLE memberTBL LIKE userTBL; -- 테이블 구조만 복사
LOAD DATA LOCAL INFILE 'C:/TEMP/userTBL.txt' INTO TABLE memberTBL;


-- </실습 2> --



-- <실습 3> --

USE sqlDB;
CREATE TABLE pivotTest
   (  uName CHAR(3),
      season CHAR(2),
      amount INT );

INSERT  INTO  pivotTest VALUES
	('김범수' , '겨울',  10) , ('윤종신' , '여름',  15) , ('김범수' , '가을',  25) , ('김범수' , '봄',    3) ,
	('김범수' , '봄',    37) , ('윤종신' , '겨울',  40) , ('김범수' , '여름',  14) ,('김범수' , '겨울',  22) ,
	('윤종신' , '여름',  64) ;
SELECT * FROM pivotTest;

SELECT uName, 
  SUM(IF(season='봄', amount, 0)) AS '봄', 
  SUM(IF(season='여름', amount, 0)) AS '여름',
  SUM(IF(season='가을', amount, 0)) AS '가을',
  SUM(IF(season='겨울', amount, 0)) AS '겨울',
  SUM(amount) AS '합계' FROM pivotTest GROUP BY uName ;


-- </실습 3> --

USE sqlDB;
SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
	FROM userTBL 
    WHERE height >= 180;

SET @json='{ "userTBL" :
  [
	{"name":"임재범","height":182},
	{"name":"이승기","height":182},
	{"name":"성시경","height":186},
    {"name":"성시경","height":180}
  ]
}' ;
SELECT JSON_VALID(@json);
SELECT JSON_SEARCH(@json, 'all', '성시경');
SELECT JSON_EXTRACT(@json, '$.userTBL[2].name');
SELECT JSON_INSERT(@json, '$.userTBL[0].mDate', '2009-09-09');
SELECT JSON_REPLACE(@json, '$.userTBL[0].name', '홍길동');
SELECT JSON_REMOVE(@json, '$.userTBL[0]');
SELECT @json;