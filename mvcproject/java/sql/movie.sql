CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    summary TEXT,
    poster_url VARCHAR(255)
);

INSERT INTO movies (title, summary, poster_url) VALUES
('그랜드 부다페스트 호텔', 
 '전설의 호텔리어 구스타브와 벨보이 제로의 유쾌한 모험.',
 'https://upload.wikimedia.org/wikipedia/ko/1/16/The_Grand_Budapest_Hotel.jpg'),

('인사이드 아웃', 
 '감정을 의인화한 캐릭터들이 주인공의 마음속에서 펼치는 이야기.',
 'https://upload.wikimedia.org/wikipedia/ko/0/05/Inside_Out_poster.jpg'),

('인터스텔라', 
 '지구의 미래를 위해 떠나는 우주 탐사의 감동적인 이야기.',
 'https://upload.wikimedia.org/wikipedia/ko/b/bc/Interstellar_film_poster.jpg'),

('센과 치히로의 행방불명', 
 '이세계에 빠진 소녀 치히로가 부모를 되찾기 위한 모험.',
 'https://upload.wikimedia.org/wikipedia/ko/f/f9/Spirited_Away_Korean_Poster.jpg'),

('기생충',
 '가난한 가족과 부자 가족의 충돌로 벌어지는 블랙코미디 스릴러.',
 'https://upload.wikimedia.org/wikipedia/ko/5/53/%EA%B8%B0%EC%83%9D%EC%B6%A9.jpg'),

('어벤져스: 엔드게임',
 '마블 히어로들이 인피니티 전쟁 이후 다시 모여 운명을 건 대결.',
 'https://upload.wikimedia.org/wikipedia/ko/9/9b/Avengers_Endgame_poster.jpg');
 
 SELECT * FROM movies
