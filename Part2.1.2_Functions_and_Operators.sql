-- music 데이터베이스 생성하기
CREATE DATABASE music;

-- music 데이터베이스 선택하기
USE music;

/*
File > Open SQL Script > 다음 sql 스크립트를 순차적으로 실행하세요.
(schema > artists > albums > songs > users > history > playlists)
*/

/*
Q1.
history 테이블에서 played_at, user_id, song_id를 조회하세요.
만약 played_at이 2025년 1월 1일 이후라면, song_id는 'Played After 2025'라는 텍스트로 바꾸고,
그렇지 않으면 기존 song_id 값을 그대로 출력하세요.
*/
SELECT played_at
	, user_id
    , IF(played_at >= '2025-01-01', 'Played After 2025', song_id) AS song_id
FROM history
;

/*
Q2.
albums 테이블에서 title과 release_date을 조회하세요.
앨범의 release_date가 2020년 1월 1일 전이라면 'Classic'이라고 표시하고,
2020년 1월 1일 이후 2025년 1월 1일 이전이라면 'Modern'이라고 표시하고,
2025년 1월 1일 후라면 'Recent'라고 표시하고 category라는 이름으로 조회하세요.
*/
SELECT title
	, release_date
    , CASE WHEN release_date < '2020-01-01' THEN 'Classic'
		WHEN release_date BETWEEN '2020-01-01' AND '2025-01-01' THEN 'Modern'
        WHEN release_date > '2025-01-01' THEN 'Recent'
        ELSE NULL END AS category
FROM albums
;


/*
Q3.
playlists 테이블에서 모든 열을 조회하세요.
description이 NULL인 경우 "No Description"으로 출력하도록 하고, 그렇지 않으면 기존 description을 출력하여 details로 조회하세요.
단, IFNULL 함수를 사용하세요.
*/
SELECT *
	, IFNULL(description, 'No Description') AS details
FROM playlists
;

/*
Q4.
playlists 테이블에서 creator_id가 1인 경우 creator_id를 NULL로 출력하고,
그렇지 않으면 기존의 creator_id 값을 그대로 출력하여 creator_details로 조회하세요.
*/
SELECT *
	, NULLIF(creator_id, 1) AS creator_details
FROM playlists
;

/*
Q5.
playlists 테이블에서 모든 열을 조회하세요.
description이 NULL이면 "No Description"으로 대체하고, 그렇지 않으면 기존의 description 값을 출력하여 description_details로 조회하세요.
또한 creator_id가 NULL인 경우 'Unknown'을 대신 출력하여 creator_details로 조회하세요.
단, COALESCE 함수를 사용하세요.
*/
SELECT *
	, COALESCE(description, 'No Description') AS description_details
    , COALESCE(creator_id, 'Unknown') AS creator_details
FROM playlists
;


/*
Q6.
users 테이블에서 id와 username을 조회하고, id를 문자열 형식으로 변환하여 id_as_string이라는 별칭을 사용해 출력하세요.
*/
SELECT id
	, CAST(id AS CHAR) AS id_as_string
	, username
FROM users
;


/*
Q7.
songs 테이블에서 duration_seconds를 조회하고, 이를 소수점 두 자리를 가진 DECIMAL 형식으로 변환하여 duration_decimal이라는 별칭을 사용해 출력하세요.
*/
SELECT duration_seconds
	, CAST(duration_seconds AS DECIMAL(10, 2)) AS duration_decimal
FROM songs
;

/*
Q8.
history 테이블에서 user_id와 song_id를 조회하고, song_id를 SIGNED 정수로 변환하여 song_id_signed라는 별칭을 사용해 출력하세요.
*/
SELECT user_id
	, CAST(song_id AS SIGNED) AS song_id_signed
FROM history
;

/*
Q9.
albums 테이블에서 모든 열을 조회하고, artist_id를 UNSIGNED 정수로 변환하여 artist_id_unsigned라는 별칭을 사용해 출력하세요.
*/
SELECT *
	, CAST(artist_id AS UNSIGNED) AS artist_id_unsigned
FROM albums
;

/*
Q10.
albums 테이블에서 모든 열을 조회하고, release_date을 날짜 형식 (DATE)으로 변환하여 release_date_casted라는 별칭을 사용해 출력하세요.
*/
SELECT *
	, CAST(release_date AS DATE) AS release_date_casted
FROM albums
;

/*
Q11.
history 테이블에서 played_at을 조회하고, 이를 날짜와 시간 형식 (DATETIME)으로 변환하여 played_at_casted라는 별칭을 사용해 출력하세요.
*/
SELECT CAST(played_at AS DATETIME) AS played_at_casted
FROM history
;

/*
Q12.
artists 테이블에서 name과 id를 연결하여 artist_info라는 별칭으로 출력하세요.
예를 들어, "ArtistName (ID: 1)"과 같은 형식으로 결과를 출력하세요.
*/
SELECT *
	, CONCAT(name, ' (ID: ', id, ')') AS artist_info
FROM artists
;

/*
Q13.
songs 테이블에서 title의 첫 5글자만 추출하여 short_title이라는 별칭으로 출력하세요.
*/
SELECT *
	, LEFT(title, 5) AS short_title
FROM songs
;


/*
Q14.
albums 테이블에서 각 앨범의 title의 길이를 구하여 title_length라는 별칭으로 출력하세요.
*/
SELECT *
	, LENGTH(title) AS title_length
FROM albums
;

/*
Q15.
users 테이블에서 username을 대문자로 변환하여 username_upper라는 별칭으로 출력하세요.
*/
SELECT *
	, UPPER(username) AS username_upper
FROM users
;

/*
Q16.
artists 테이블에서 name을 소문자로 변환하여 name_lower라는 별칭으로 출력하세요.
*/
SELECT *
	, LOWER(name) AS name_lower
FROM artists
;

/*
Q17.
다음 문자열의 앞뒤 공백을 제거하여 after_trimmed라는 별칭으로 출력하세요.
*/
SELECT CONCAT('   ', 'Hello', '   ') AS before_trimmed;
SELECT TRIM(CONCAT('   ', 'Hello', '   ')) AS after_trimmed;

/*
Q18.
다음 문자열의 왼쪽 공백을 제거하여 after_trimmed라는 별칭으로 출력하세요.
*/
SELECT CONCAT('   ', 'Hello') AS before_trimmed;
SELECT LTRIM(CONCAT('   ', 'Hello')) AS after_trimmed;

/*
Q19.
다음 문자열의 오른쪽 공백을 제거하여 after_trimmed라는 별칭으로 출력하세요.
*/
SELECT CONCAT('Hello', '   ') AS before_trimmed;
SELECT RTRIM(CONCAT('Hello', '   ')) AS after_trimmed;

/*
Q20.
songs 테이블에서 title의 왼쪽 3글자를 추출하여 left_title이라는 별칭으로 출력하세요.
*/
SELECT *
	, LEFT(title, 3) AS left_title
FROM songs
;

/*
Q21.
albums 테이블에서 title의 오른쪽 4글자를 추출하여 right_title이라는 별칭으로 출력하세요.
*/
SELECT *
	, RIGHT(title, 4) AS right_title
FROM albums
;

/*
Q22.
songs 테이블에서 title에 있는 'Song'을 'Track'으로 대체하여 new_title이라는 별칭으로 출력하세요.
*/
SELECT *
	, REPLACE(title, 'Song', 'Track') AS new_title
FROM songs
;

/*
Q23.
다음 데이터의 절댓값을 구하시오.
*/
SELECT ABS(-100) AS num;

/*
Q24.
다음 데이터를 소수점 아래 셋째자리까지 반올림하시오.
*/
SELECT ROUND(165.2345, 3) AS height;

/*
Q25.
다음 데이터를 소수점 아래 셋째자리에서 자르시오.
*/
SELECT TRUNCATE(165.2345, 3) AS height;

/*
Q26.
다음 데이터보다 큰 숫자 중에서 최소 정수를 구하시오.
*/
SELECT CEIL(165.2345) AS height;

/*
Q27.
다음 데이터보다 작은 숫자 중에서 최대 정수를 구하시오.
*/
SELECT FLOOR(165.2345) AS height;

/*
Q28.
100을 2로 나눈 나머지를 구하시오.
*/
SELECT MOD(100, 2) AS remainder;

/*
Q29.
2의 3승을 구하시오.
*/
SELECT POWER(2, 3);

/*
Q30.
4의 제곱근을 구하시오.
*/
SELECT SQRT(4);

/*
Q31.
albums 테이블에서 각 앨범의 release_date에서 연도만 추출하여 release_year라는 별칭으로 출력하세요.
*/
SELECT *
	, YEAR(release_date) AS release_year
FROM albums
;

/*
Q32.
albums 테이블에서 각 앨범의 release_date에서 월만 추출하여 release_month라는 별칭으로 출력하세요.
*/
SELECT *
	, MONTH(release_date) AS release_month
FROM albums
;

/*
Q33.
albums 테이블에서 각 앨범의 release_date에서 일만 추출하여 release_day라는 별칭으로 출력하세요.
*/
SELECT *
	, DAY(release_date) AS release_day
FROM albums
;

/*
Q34.
albums 테이블에서 각 앨범의 release_date에서 요일을 추출하여 release_dayofweek라는 별칭으로 출력하세요. (1=일요일)
*/
SELECT *
	, DAYOFWEEK(release_date) AS release_dayofweek
FROM albums
;

/*
Q35.
history 테이블에서 played_at의 시 부분만 추출하여 played_hour라는 별칭으로 출력하세요.
*/
SELECT *
	, HOUR(played_at) AS played_hour
FROM history
;

/*
Q36.
history 테이블에서 played_at의 분 부분만 추출하여 played_minute라는 별칭으로 출력하세요.
*/
SELECT *
	, MINUTE(played_at) AS played_minute
FROM history
;

/*
Q37.
history 테이블에서 played_at의 초 부분만 추출하여 played_second라는 별칭으로 출력하세요.
*/
SELECT *
	, SECOND(played_at) AS played_second
FROM history
;

/*
Q38.
albums 테이블에서 각 앨범의 release_date와 현재 날짜 (CURDATE()) 간의 일 수 차이를 계산하여 days_since_release라는 별칭으로 출력하세요.
*/
SELECT *
	, DATEDIFF(CURDATE(), release_date) AS days_since_release
FROM albums
;

/*
Q39.
albums 테이블에서 각 앨범의 release_date에 30일을 더한 날짜를 계산하여 release_date_plus_30라는 별칭으로 출력하세요.
*/
SELECT *
	, DATE_ADD(release_date, INTERVAL 30 DAY) AS release_date_plus_30
FROM albums
;

/*
Q40.
albums 테이블에서 각 앨범의 release_date에서 15일을 뺀 날짜를 계산하여 release_date_minus_15라는 별칭으로 출력하세요.
*/
SELECT *
	, DATE_SUB(release_date, INTERVAL 15 DAY) AS release_date_minus_15
FROM albums
;

/*
Q41.
albums 테이블에서 release_date를 'YYYY/MM/DD' 형식으로 출력하고, 이를 release_date_formatted라는 별칭으로 출력하세요.
*/
SELECT *
	, DATE_FORMAT(release_date, '%Y/%m/%d') AS release_date_formatted
FROM albums
;

/*
Q42.
albums 테이블에서 release_date를 'YYYY-MM-DD' 형식으로 출력하고, 이를 release_date_formatted라는 별칭으로 출력하세요.
*/
SELECT *
	, DATE_FORMAT(release_date, '%Y-%m-%d') AS release_date_formatted
FROM albums
;

/*
Q43.
history 테이블에서 각 user_id별로 플레이한 곡의 개수를 계산하여 songs_played_count라는 별칭으로 출력하세요.
*/
SELECT user_id
	, COUNT(DISTINCT song_id) AS songs_played_count
FROM history
GROUP BY user_id
;

/*
Q44.
songs 테이블에서 모든 곡의 duration_seconds(곡의 길이)를 합산하여 total_duration_seconds라는 별칭으로 출력하세요.
*/
SELECT SUM(duration_seconds) AS total_duration_seconds
FROM songs
;

/*
Q45.
songs 테이블에서 모든 곡의 duration_seconds(곡의 길이)의 평균을 구하여 avg_duration_seconds라는 별칭으로 출력하세요.
*/
SELECT AVG(duration_seconds) AS avg_duration_seconds
FROM songs
;

/*
Q46.
songs 테이블에서 가장 긴 곡의 duration_seconds(곡의 길이)를 구하여 max_duration_seconds라는 별칭으로 출력하세요.
*/
SELECT MAX(duration_seconds) AS max_duration_seconds
FROM songs
;

/*
Q47.
songs 테이블에서 가장 짧은 곡의 duration_seconds(곡의 길이)를 구하여 min_duration_seconds라는 별칭으로 출력하세요.
*/
SELECT MIN(duration_seconds) AS min_duration_seconds
FROM songs
;