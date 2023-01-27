-- 실습
SELECT userid AS '사용자', SUM(price*amount) AS '총구매액'
FROM buyTBL
GROUP BY userid;

WITH abc(userid, total)
AS
(SELECT userid AS '사용자', SUM(price*amount) FROM buyTBL GROUP BY userid)
SELECT * FROM abc ORDER BY total DESC;