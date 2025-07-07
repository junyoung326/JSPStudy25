USE mvcProjectDB; -- 현재 사용자가 정의된 데이터베이스를 쓰겠다.

CREATE TABLE IF NOT EXISTS product( -- IF NOT EXISTS (product테이블이 없으면 생성)
	p_title VARCHAR(20), -- 제목
	p_year VARCHAR(5),	-- 출시연도
	p_view  INT, -- 조회수
	p_detail VARCHAR(50), -- 상세정보
	p_cast	VARCHAR(50), -- 출연진
	p_rank INT, -- 순위
   	p_creator VARCHAR(10),	-- 크리에이터
	p_age   VARCHAR(5), -- 관람등급
	p_genre VARCHAR(10) -- 장르
)default CHARSET=utf8;
ALTER TABLE product ADD image VARCHAR(255);


INSERT INTO product (p_title, p_year, p_view, p_detail, p_cast, p_rank, p_creator, p_age, p_genre) 
VALUES('인셉션', '2010', 0, '꿈속의 꿈을 조종하는 능력을 가진 남자의 이야기', '레오나르도 디카프리오, 조셉 고든 레빗', 1, '크리스토퍼 놀란', '15', 'SF');
UPDATE Product SET image = '인셉션.jpg' WHERE p_title = '인셉션';

INSERT INTO product (p_title, p_year, p_view, p_detail, p_cast, p_rank, p_creator, p_age, p_genre)
VALUES('인터스텔라', '2014', 0, '인류 생존을 위한 우주 탐사를 그린 감동적인 SF 대작', '매튜 매커너히, 앤 해서웨이', 2, '크리스토퍼 놀란', '12', 'SF');
UPDATE Product SET image = '인터스텔라.jpg' WHERE p_title = '인터스텔라';

INSERT INTO product (p_title, p_year, p_view, p_detail, p_cast, p_rank, p_creator, p_age, p_genre)
VALUES('기생충', '2019', 0, '두 가족이 얽히며 벌어지는 블랙코미디 스릴러', '송강호, 이선균, 조여정', 3, '봉준호', '15', '드라마');
UPDATE Product SET image = '기생충.jpg' WHERE p_title = '기생충';


desc product;
select * from product;
drop table product;  -- 잘못 생성시 제거



-- 회원
CREATE TABLE users (
    id VARCHAR(50) PRIMARY KEY,
    pw VARCHAR(100) NOT NULL,
    name VARCHAR(30) NOT NULL,
    birth DATE NOT NULL,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone VARCHAR(20)
);


SHOW TABLES;

SELECT * FROM USERS;

drop table users;
