CREATE TABLE Book (
  bookid      INTEGER PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INTEGER 
);

CREATE TABLE  Customer (
  custid      INTEGER PRIMARY KEY,  
  name        VARCHAR(40),
  address     VARCHAR(50),
  phone       VARCHAR(20)
);

CREATE TABLE Orders (
  orderid INTEGER PRIMARY KEY,
  custid  INTEGER , -- FK
  bookid  INTEGER , -- FK
  saleprice INTEGER ,
  orderdate DATE,
  FOREIGN KEY (custid) REFERENCES Customer(custid),
  FOREIGN KEY (bookid) REFERENCES Book(bookid)
);

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE( '2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));

CREATE TABLE Imported_Book (
  bookid      INTEGER,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INTEGER 
);

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);
commit;


SELECT * FROM book;
SELECT * FROM Customer;
SELECT * FROM Orders;


SELECT *
FROM Customer C
Join Orders O
ON C.custid = O.custid; -- 20번

SELECT *
FROM Customer, Orders
WHERE customer.custid = Orders.custid; -- 20번 강사님 답

SELECT *
FROM Customer C
Join Orders O
ON C.custid = O.custid
ORDER BY C.custid; -- 21번

SELECT *
FROM Customer, Orders
WHERE customer.custid = Orders.custid
ORDER BY Customer.custid; -- 21번 강사님 답

SELECT C.name, O.saleprice
FROM customer C
Join Orders O
ON C.custid = O.custid; -- 22번

SELECT name, saleprice
FROM Customer, Orders
WHERE customer.custid = Orders.custid; -- 22번 강사님 답

SELECT C.name, SUM(O.saleprice)
FROM Customer C
Join Orders O
ON C.custid = O.custid GROUP BY C.name ORDER BY C.name; -- 23번

SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
GROUP BY Customer.name
ORDER BY Customer.name; -- 23번 강사님 답

SELECT C.name, B.bookname
FROM Customer C
Join Orders O
ON C.custid = O.custid
Join BooK B
ON B.bookid = O.bookid; -- 24번

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid
		AND Orders.bookid = Book.bookid; -- 24번 강사님 답

SELECT  C.name
       ,B.bookname
FROM Customer C
JOIN
(
	SELECT  O.custid
	       ,B.bookname
	FROM Orders O
	JOIN Book B
	ON O.bookid = B.bookid
) B
ON C.custid = B.custid; -- 24번 정욱님 답 = 데이터 낭비 최소화

SELECT C.name, B.bookname
FROM Customer C
Join Orders O
ON C.custid = O.custid
Join BooK B
ON B.bookid = O.bookid WHERE B.price = 20000; -- 25번

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid
		AND Book.price = 20000; -- 25번 강사님 답

SELECT C.name, O.saleprice
FROM Customer C
Left Join Orders O
ON C.custid = O.custid; -- 26번

SELECT customer.name, saleprice
FROM Customer
LEFT OUTER JOIN Orders
ON Customer.custid = Orders.custid; -- 26번 강사님 답

SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) from book); -- 27번 못 풀었음ALTER

SELECT  bookname
FROM Book
WHERE price = (
SELECT  MAX(price)
FROM Book); -- 27번 정욱님 답, 강사님 답과 동일

SELECT 
    b.bookname, b.price
FROM
    book b
ORDER BY price DESC
LIMIT 1; -- 27번 재원님 답

SELECT DISTINCT C.name
FROM Customer C
Join Orders O
ON C.custid = O.custid; -- 28번

SELECT name
FROM Customer
WHERE custid IN (SELECT custid FROM Orders); -- 28번 강사님 답

SELECT DISTINCT C.name
FROM Customer C
Join Orders O
ON C.custid = O.custid
join book B
ON B.bookid = O.bookid
WHERE B.publisher Like '대한미디어'; -- 29번

SELECT name
FROM Customer
WHERE custid IN (SELECT custid FROM Orders WHERE bookid IN
				(SELECT bookid FROM Book WHERE publisher='대한미디어')); -- 29번 강사님 답

SELECT publisher
FROM book
WHERE price > (select avg(price))
GROUP BY publisher;-- 30번 못 풀었음
SELECT publisher, ROUND(AVG(price)) FROM book GROUP BY publisher;

SELECT  B.publisher	'출판사'
       ,R.avg_price	'출판사 도서별 평균 가격'
       ,B.bookname	'출판사 도서별 평균 가격보다 비싼 도서'
       ,B.price	'도서의 가격'
FROM Book B
JOIN
(
	SELECT  publisher
	       ,ROUND(AVG(price)) as 'avg_price'
	FROM Book
	GROUP BY  publisher
) R
ON B.publisher = R.publisher
WHERE B.price > R.avg_price; -- 30번 정욱님 답

SELECT b1.bookname
FROM Book b1
WHERE b1.price > (SELECT avg(b2.price) FROM book b2 WHERE b2.publisher=b1.publisher); -- 30번 강사님 답

WITH avgprice(publisher, avg)
	AS (
		SELECT publisher, ROUND(AVG(price)) FROM book GROUP BY publisher
    )
    SELECT B.bookname FROM book B
		INNER JOIN avgprice AP ON B.publisher = AP.publisher
    WHERE B.price > AP.avg; -- 30번 이승현2님 답

SELECT DISTINCT C.name, C.address
FROM Customer C
Join Orders O 
ON C.custid = O.custid; -- 31번

SELECT  name
       ,address
FROM Customer
WHERE custid IN ( SELECT DISTINCT custid FROM Orders ); -- 31번 정욱님 답

SELECT DISTINCT C.name, C.address FROM Customer C
	INNER JOIN orders O ON O.custid = C.custid
   WHERE C.name NOT IN ( SELECT C.name WHERE O.custid IS NULL) ; -- 31번 미림님 답

SELECT name, address
FROM Customer cs
WHERE EXISTS (SELECT * FROM Orders od WHERE cs.custid = od.custid); -- 31번 강사님 답
-- EXIST는 행의 대한 결과, 튜플 이라고 함

-- 퀴즈 --
/*
20. 고객과 고객의 주문에 관한 데이터를 모두 보이시오.


21. 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.


22. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.


23. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.


24. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.


25. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.


26. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.


27. 가장 비싼 도서의 이름을 보이시오.


28. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.


29. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.


30. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.


31. 주문이 있는 고객의 이름과 주소를 보이시오.

*/