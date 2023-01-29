USE db_multicampus;
CREATE TABLE Book (
    bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookTitle VARCHAR(30),
    bookAuthor VARCHAR(20),
    bookYear INTEGER,
    bookPrice INTEGER,
    bookPublisher CHAR(10)
);

INSERT INTO Book VALUES('B001', '자바프로그래밍', '홍길동', 2021, 30000, '서울출판사');
INSERT INTO Book VALUES('B002', '데이터베이스', '이몽룡', 2020, 25000, '멀티출판사');
INSERT INTO Book VALUES('B003', 'HTML/CSS', '성춘향', 2021, 18000, '강남출판사');

SELECT bookNo as '도서 번호', bookTitle as '도서 제목', bookAuthor as '저자', bookYear as 
'발행연도', bookPrice as '가격', bookPublisher as '출판사' FROM Book;