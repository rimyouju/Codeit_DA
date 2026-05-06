-- pokemon_db 데이터베이스 생성하기

CREATE DATABASE pokemon_db;

-- pokemon_db 데이터베이스 선택하기

USE pokemon_db;

-- trainer, pokemon, battle, trainer_pokemon 테이블 불러오기

-- Q1) pokemon 테이블에 있는 모든 열을 조회하시오.

SELECT *
FROM pokemon
;

-- Q2) pokemon 테이블에서 포켓몬의 한국어 이름(kor_name)과 종합 능력치(total)을 조회하시오.

SELECT kor_name
	, total
FROM pokemon
;

-- Q3) pokemon 테이블의 행 수를 조회하시오.

SELECT COUNT(*)
FROM pokemon
;

-- Q4) trainer 테이블에서 achievement_level 범주의 종류를 조회하시오.

SELECT DISTINCT achievement_level
FROM trainer
;

-- Q5) trainer 테이블에서 achievement_level 범주의 개수를 조회하시오.

SELECT COUNT(DISTINCT achievement_level)
FROM trainer
;

-- Q6) pokemon 테이블에서 type1 범주의 개수를 조회하고 type1_cnt 별칭을 부여하시오.

SELECT COUNT(DISTINCT type1) AS type1_cnt
FROM pokemon
;

-- Q7) trainer 테이블에서 배지의 개수(badge_count)가 6개 이상인 데이터를 조회하시오.

SELECT *
FROM trainer
WHERE badge_count >= 6
;

-- Q8) trainer 테이블에서 나이가 30대인 데이터를 조회하시오.

SELECT *
FROM trainer
WHERE age BETWEEN 30 AND 39
;

-- Q9) trainer 테이블에서 트레이너의 고향이 서울인 데이터를 조회하시오.

SELECT *
FROM trainer
WHERE hometown = 'Seoul'
;

-- Q10) trainer 테이블에서 트레이너가 선호하는 포켓몬 타입(prefer_type)이 Poison이고 나이가 30세 이상인 트레이너를 조회하시오.

SELECT *
FROM trainer
WHERE prefer_type = 'Poison'
	AND age >= 30
;

-- Q11) trainer 테이블에서 트레이너가 배지의 개수가 8개이거나 고향이 제주인 트레이너를 조회하시오.

SELECT *
FROM trainer
WHERE badge_count = 8
	OR hometown = 'Jeju'
;

-- Q12) battle 테이블에서 2024년 10월 15일 이후에 대결한 데이터만 조회하시오.

SELECT *
FROM battle
WHERE battle_date >= '2024-10-15'
;

-- Q13) trainer 테이블에서 트레이너가 선호하는 포켓몬 타입(prefer_type)이 Fairy 또는 Dragon인 데이터를 조회하시오.

SELECT *
FROM trainer
WHERE prefer_type IN ('Fairy', 'Dragon')
;

-- Q14) trainer 테이블에서 트레이너의 이름이 C로 시작하는 데이터를 조회하시오.

SELECT *
FROM trainer
WHERE `name` LIKE 'C%'
;

-- Q15) trainer 테이블에서 트레이너의 이름의 세번째 알파벳이 a인 데이터를 조회하시오.

SELECT *
FROM trainer
WHERE `name` LIKE '__a%'
;

-- Q16) trainer 테이블에서 트레이너가 20~30대인 데이터를 조회하고, 나이를 기준으로 내림차순 정렬하시오.

SELECT *
FROM trainer
WHERE age BETWEEN 20 AND 39
ORDER BY age DESC
;

-- Q17) trainer 테이블에서 트레이너 이름(name)을 대문자로 표기하고, 배지의 개수(badge_count)를 '_'로 연결한 새로운 컬럼을 name_badge로 조회하시오.

SELECT CONCAT(UPPER(name), '_', badge_count) AS name_badge
FROM trainer
;

-- Q18) trainer_pokemon 테이블에서 트레이너의 현재 레벨(level)의 최솟값(min_lv), 최댓값(max_lv), 평균값(avg_lv)을 구하고 평균값은 소수점 아래 첫째자리까지 반올림하시오.

SELECT MIN(level) AS min_lv
	, MAX(level) AS max_lv
    , ROUND(AVG(level), 1) AS avg_lv
FROM trainer_pokemon
;

-- Q19) trainer 테이블에서 이름(name)의 길이가 긴 순서대로 내림차순 정렬하고, 이름의 길이가 같은 경우 알파벳 순으로 오름차순 정렬하시오.

SELECT *
FROM trainer
ORDER BY LENGTH(name) DESC, name ASC
;

-- Q20) pokemon 테이블에서 종합 능력치(total)가 가장 높은 포켓몬 상위 5개를 조회하시오.

SELECT *
FROM pokemon
ORDER BY total DESC
LIMIT 5
;

-- Q21) 전설의 포켓몬인지 아닌지 여부(is_legendary)에 따라
-- 최대 체력(max_hp), 최소 체력(min_hp), 평균 체력(avg_hp), 평균 속도(avg_speed)를 조회하시오.

SELECT is_legendary
	, MAX(hp) AS max_hp
    , MIN(hp) AS min_hp
    , AVG(hp) AS avg_hp
    , AVG(speed) AS avg_speed
FROM pokemon
GROUP BY is_legendary
;

-- Q22) 전설의 포켓몬인지 아닌지 여부(is_legendary)에 따라 최대 체력(max_hp), 최소 체력(min_hp), 평균 체력(avg_hp), 평균 속도(avg_speed)를 조회하고 평균 체력이 센 순으로 조회하시오.

SELECT is_legendary
	, MAX(hp) AS max_hp
    , MIN(hp) AS min_hp
    , AVG(hp) AS avg_hp
    , AVG(speed) AS avg_speed
FROM pokemon
GROUP BY is_legendary
ORDER BY AVG(hp) DESC
;

-- Q23) trainer_pokemon 테이블에서 트레이너가 방생(Released)하지 않은 포켓몬들을 대상으로 트레이너별 포켓몬의 최대 경험치(max_point)와 평균 경험치(avg_point)를 구하시오.
-- Status의 종류 : Active(현재 트레이너가 보유 중인 포켓몬), Released(트레이너가 방생한 포켓몬), Training(포켓몬이 훈련 중)

SELECT trainer_id
	, MAX(experience_point) AS max_point
    , AVG(experience_point) AS avg_point
FROM trainer_pokemon
WHERE status != 'Released'
GROUP BY trainer_id
;

-- Q24) 전설의 포켓몬인지 아닌지 여부(is_legendary)에 따라 최대 체력(max_hp), 최소 체력(min_hp), 평균 체력(avg_hp), 평균 속도(avg_speed)를 조회하고 평균 속도가 100보다 큰 경우만 필터링하시오.

SELECT is_legendary
	, MAX(hp) AS max_hp
    , MIN(hp) AS min_hp
    , AVG(hp) AS avg_hp
    , AVG(speed) AS avg_speed
FROM pokemon
GROUP BY is_legendary
HAVING AVG(speed) > 100
;

-- Q25) trainer_pokemon 테이블에서 각 월별로 포획된 포켓몬 수를 구하시오.

SELECT MONTH(catch_date) AS catch_month
	, COUNT(pokemon_id) AS pokemon_cnt
FROM trainer_pokemon
GROUP BY MONTH(catch_date)
ORDER BY catch_month
;

-- Q26) trainer 테이블에서 트레이너 성취도(achievement_level)별 최연장자, 최연소자, 평균 나이, 평균 배지 수를 출력하고 평균 배지 수로 오름차순 정렬하시오.

SELECT achievement_level
	, MAX(age) AS max_age
    , MIN(age) AS min_age
    , AVG(age) AS avg_age
    , AVG(badge_count) AS avg_badge
FROM trainer
GROUP BY achievement_level
ORDER BY avg_badge
;

-- Q27) 전설의 포켓몬인지 아닌지 여부(is_legendary)에 따라 최대 체력(max_hp), 최소 체력(min_hp), 평균 체력(avg_hp), 평균 속도(avg_speed)를 조회하고 총계를 조회하시오.

SELECT is_legendary
	, MAX(hp) AS max_hp
    , MIN(hp) AS min_hp
    , AVG(hp) AS avg_hp
    , AVG(speed) AS avg_speed
FROM pokemon
GROUP BY is_legendary
WITH ROLLUP
;

-- Q28) pokemon 테이블에서 hp를 문자형으로 변환하여 hp_char로 조회하시오.

SELECT *
	, CAST(hp AS CHAR) AS hp_char
FROM pokemon
;

-- Q29) trainer 테이블에서 이름과 나이를 name(age) 형태로 조회하고 name_age 컬럼명으로 조회하시오.

SELECT *
	, CONCAT(name, '(', age, ')') AS name_age
FROM trainer
;

-- Q30) trainer 테이블에서 이름과 배지의 개수를 name_badge_count 형태로 조회하고 name_badge 컬럼명으로 조회하시오.

SELECT *
	, CONCAT(name, '_', badge_count) AS name_badge
FROM trainer
;

-- Q31) trainer 테이블에서 achievement_level의 가장 첫 번째 알파벳만 조회하시오.

SELECT *
	, LEFT(achievement_level, 1)
FROM trainer
;

-- Q32) trainer 테이블에서 name을 모두 대문자로 조회하시오.

SELECT *
	, UPPER(name)
FROM trainer
;

-- Q33) trainer 테이블에서 achievement_level의 Expert를 Professional로 변경하시오.

SELECT *
	, REPLACE(achievement_level, 'Expert', 'Professional')
FROM trainer
;

-- Q34) trainer 테이블에서 name의 문자의 길이를 조회하시오.

SELECT *
	, LENGTH(name)
FROM trainer
;

-- Q35) battle 테이블에서 battle_date의 년, 월, 일을 조회하시오.

SELECT battle_date
	, YEAR(battle_date)
    , MONTH(battle_date)
    , DAY(battle_date)
FROM battle
;

-- Q36) catch_date를 날짜형 데이터로 바꾸고 catch_ymd로 조회하시오.

SELECT *
	, CAST(catch_date AS DATE) AS catch_ymd
FROM trainer_pokemon
;

-- Q37) trainer_pokemon 테이블에서 catch_date을 YYYYMMDD 형태로 catch_ymd 컬럼명으로 조회하시오.

SELECT *
	, DATE_FORMAT(catch_date, '%Y%m%d') AS catch_ymd
FROM trainer_pokemon
;

-- Q38) trainer_pokemon 테이블에서 catch_date과
-- catch_date 기준 1주일 후(after_1w), 1주일 전(before_1w)을 조회하시오.

SELECT *
	, DATE_ADD(catch_date, INTERVAL 7 DAY) AS after_1w
    , DATE_SUB(catch_date, INTERVAL 7 DAY) AS before_1w
FROM trainer_pokemon
;

-- Q39) trainer_pokemon 테이블에서 catch_date과 현재 날짜 간의 차이를 조회하시오.
-- 현재 날짜 : CURRENT_DATE()

SELECT *
	, DATEDIFF(CURRENT_DATE(), catch_date) AS days_diff
FROM trainer_pokemon
;
