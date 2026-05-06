-- [test_db]라는 이름의 데이터베이스를 생성하시오.

CREATE DATABASE test_db;

-- [test_db] 데이터베이스를 사용할 준비를 해주세요.

USE test_db;

-- [users] 테이블을 생성하고, 아래 문제들은 [users] 테이블을 바탕으로 실습해 주세요.

-- 테이블 생성하기

CREATE TABLE users (
	id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    age INT,
    gender CHAR(1),
    height DECIMAL(5, 2),
    weight DECIMAL(5, 2),
    sign_up_day DATE
);

-- 데이터 삽입하기

INSERT INTO users (id, email, age, gender, height, weight, sign_up_day)
VALUES (1, 'codeit@naver.com', 28, 'm', 178.2, 70.0, '2019-03-26'),
	(2, 'cowboy@codeit.kr', 31, 'm', NULL, 70.2, '2019-01-05'),
	(3, 'taehos@hanmail.net', 27, 'm', 181.3, 70.0, '2017-03-14'),
	(4, 'sungsos@naver.com', 36, 'f', 167.7, 66.2, '2017-03-20'),
	(5, 'teddy@kakaot.com', 41, 'f', 177.3, 77.2, '2016-08-03');

-- Q1. 모든 열을 조회하시오.

SELECT *
FROM users
;

-- Q2. email과 gender 열을 조회하시오.

SELECT email, gender
FROM users
;

-- Q3. gender 열에 있는 범주를 중복 제거한 후 조회하시오.

SELECT DISTINCT gender
FROM users
;

-- Q4. 나이가 30세보다 많은 사용자에 대한 데이터만 조회하시오.

SELECT *
FROM users
WHERE age > 30
;

-- Q5. 성별이 여성인 데이터만 조회하시오.

SELECT *
FROM users
WHERE gender = 'f'
;

-- Q6. 나이가 40세보다 많고 성별이 여성인 데이터만 조회하시오.

SELECT *
FROM users
WHERE age > 40 AND gender = 'f'
;

-- Q7. 성별 평균 나이를 조회하시오.

SELECT gender
	, AVG(age)
FROM users
GROUP BY gender
;

-- Q8. 성별 평균 나이를 계산한 후 남성 그룹에 한하여 성별과 평균 나이를 조회하시오.

SELECT gender
	, AVG(age)
FROM users
GROUP BY gender
HAVING gender = 'm'
;

-- Q9. 성별 평균 나이를 계산한 후 남성 그룹에 한하여 성별과 평균 나이(avg_age)로 조회하시오.

SELECT gender
	, AVG(age) AS avg_age
FROM users
GROUP BY gender
HAVING gender = 'm'
;

-- Q10. 데이터를 나이를 기준으로 오름차순 정렬하시오.

SELECT *
FROM users
ORDER BY age ASC
;

-- Q11. 데이터를 이메일을 기준으로 오름차순 정렬하시오.

SELECT *
FROM users
ORDER BY email ASC
;

-- Q12. 데이터를 가입 일자를 기준으로 오름차순 정렬하시오.

SELECT *
FROM users
ORDER BY sign_up_day ASC
;

-- Q13. 데이터를 나이를 기준으로 내림차순 정렬하시오.

SELECT *
FROM users
ORDER BY age DESC
;

-- Q14. 데이터를 성별을 기준으로 오름차순 정렬하고, 가입 일자를 기준으로 내림차순 정렬하시오.

SELECT *
FROM users
ORDER BY gender ASC, sign_up_day DESC
;

-- Q15. 가장 최근에 가입한 사용자 1명에 대한 데이터만 조회하시오.

SELECT *
FROM users
ORDER BY sign_up_day DESC
LIMIT 1
;

-- Q16. 가장 최근에 가입한 사용자 3명에 대한 데이터만 조회하시오.

SELECT *
FROM users
ORDER BY sign_up_day DESC
LIMIT 0, 3
;