--user테이블
CREATE TABLE ott_user (
    user_id  VARCHAR2(10) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    role  VARCHAR2(10) NOT NULL
);

--관리자 테이블
INSERT INTO ott_user VALUES('admin','123','admin');

--작품 정보 테이블
CREATE TABLE ott (
    id      NUMBER(10) NOT NULL PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    genre VARCHAR2(25) NOT NULL,
    director VARCHAR2(20) NOT NULL,
    actor VARCHAR2(50) NOT NULL,
    cnt NUMBER DEFAULT 0 NOT NULL,
    poster  VARCHAR2(255),
    image  VARCHAR2(255),
    content VARCHAR2(2000) NOT NULL,
    server VARCHAR2(20) NOT NULL
);
--작품 id 시퀀스
CREATE SEQUENCE ott_seq START WITH 1 INCREMENT BY 1;

--즐겨찾기
CREATE TABLE favorite (
    seq NUMBER(10) PRIMARY KEY,
    user_id VARCHAR2(10), --user테이블 id
    ott_id  NUMBER(10),      --영화,드라마 정보 테이블 id
    FOREIGN KEY (user_id) REFERENCES ott_user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (ott_id) REFERENCES ott(id) ON DELETE CASCADE
);

--즐겨찾기 순서 시퀀스
CREATE SEQUENCE fav_seq START WITH 1 INCREMENT BY 1;

---------------------드라마
INSERT INTO ott VALUES(ott_seq.NEXTVAL,'재벌집 막내아들','드라마', '김태희, 장은재', '송중기, 이성민'
, 100, '재벌집 막내아들.jpg', '재벌집 막내아들.jpg', '재벌 총수 일가의 오너리스크를 관리하는 비서가 재벌가의 막내아들로 회귀하여 인생 2회차를 사는 판타지 드라마',
'NETFLIX');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'수리남 ','드라마','윤종빈 ','하정우,황정민 '
,200,'수리남.jpg','수리남.jpg','남미 국가 수리남을 장악한 무소불위의 마약 대부로 인해 누명을 쓴 한 민간인이 국정원의 비밀 임무를 수락하며 벌어지는 이야기를 그린 넷플릭스 시리즈 '
,'NETFLIX');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'천원짜리 변호사','드라마','최수진,최창환','남궁민,김지은'
,50,'천원짜리 변호사.jpg','천원짜리 변호사.jpg','수임료는 단돈 천원 실력은 단연 최고, ‘갓성비 변호사’ 천지훈이 빽 없는 의뢰인들의 가장 든든한 빽이 되어주는 통쾌한 변호 활극!'
,'WAVVE');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'약한영웅','드라마','유수민 ','박지훈,최현욱 '
,20,'약한영웅.jpg','약한영웅.jpg'
,'상위 1% 모범생 연시은이 처음으로 친구가 된 수호, 범석과 함께 수많은 폭력에 맞서나가는 과정을 그린 약한 소년의 강한 액션 성장 드라마 '
,'WAVVE');
--------------------------액션/스릴러 

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'헌트','액션/스릴러','이정재 ','이정재,정우성 '
,200,'헌트.jpg','헌트.jpg','[조직 내 숨어든 스파이를 색출하라! ‘사냥꾼’이 될 것인가, ‘사냥감’이 될 것인가!] 망명을 신청한 북한 고위 관리를 통해 정보를 입수한 안기부 해외팀 ‘박평호’(이정재)와 국내팀 ‘김정도’(정우성)는 조직 내 숨어든 스파이 ‘동림’ 색출 작전을 시작한다. '
,'WAVVE');


INSERT INTO ott VALUES(ott_seq.NEXTVAL,'아바타','액션/스릴러','제임스 카메론','샘 워딩턴'
,500,'아바타.jpg','아바타.jpg','지구 에너지 고갈 문제를 해결하기 위해 판도라 행성으로 향한 인류는 원주민 ‘나비족’과 대립하게 된다. 이 과정에서, 전직 해병대원 제이크 설리(샘 워싱턴)가 ‘아바타’ 프로그램을 통해 ‘나비족’의 중심부에 투입되는데… 피할 수 없는 전쟁! 이 모든 운명을 손에 쥔 제이크! 그 누구도 넘보지 못한 역대급 세계가 열린다! 아바타: 인간과 ‘나비족’의 DNA를 결합해 만들어졌으며 링크룸을 통해 인간의 의식으로 원격 조종할 수 있는 새로운 생명체'
,'WATCHA');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'악인전','액션/스릴러','이원태','마동석, 김무열'
,1,'악인전.jpg','악인전.jpg','우연히 연쇄살인마의 표적이 되었다 살아난 조직 보스 장동수와 범인잡기에 혈안이 된 강력반 미친개 정태석. 타협할 수 없는 두 사람이 연쇄살인마 K를 잡기 위해 손잡는다. 표적은 하나, 룰도 하나! 먼저 잡는 놈이 갖는다!'
,'NETFLIX');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'스파이더맨 노 웨이 홈','액션/스릴러','존 왓츠','톰 홀랜드'
,90,'스파이더맨 노 웨이 홈.jpg','스파이더맨 노 웨이 홈.jpg'
,'미스테리오의 계략으로 세상에 정체가 탄로난 스파이더맨 피터 파커는 하루 아침에 평범한 일상을 잃게 된다. 문제를 해결하기 위해 닥터 스트레인지를 찾아가 도움을 청하지만 뜻하지 않게 멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다. 닥터 옥토퍼스를 비롯해 스파이더맨에게 깊은 원한을 가진 숙적들의 강력한 공격에 피터 파커는 사상 최악의 위기를 맞게 되는데…'
,'NETFLIX');

--------------------------------------------------------멜로/로맨스 
INSERT INTO ott VALUES(ott_seq.NEXTVAL,'노트북 ','멜로/로맨스','닉 카사베츠 ','라이언 고슬링,레이첼 맥아담스 '
,100,'노트북.jpg','노트북.jpg'
,'17살, ‘노아’는 밝고 순수한 ‘앨리’를 보고 첫눈에 반한다. 빠른 속도로 서로에게 빠져드는 둘. 그러나 이들 앞에 놓인 장벽에 막혀 이별하게 된다. 24살, ‘앨리’는 우연히 신문에서 ‘노아’의 소식을 접하고 잊을 수 없는 첫사랑 앞에서 다시 한 번 선택의 기로에 서게 되는데… 열일곱의 설렘, 스물넷의 아픈 기억, 그리고 마지막까지… 한 사람을 지극히 사랑했으니 내 인생은 성공한 인생입니다'
,'WAVVE');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'어바웃타임 ','멜로/로맨스','리처드  커티스','도널 글리슨, 레이첼 맥아담스'
,40,'어바웃타임.jpg','어바웃타임.jpg'
,'모태솔로 팀(돔놀 글리슨)은 성인이 된 날, 아버지(빌 나이)로부터 놀랄만한 가문의 비밀을 듣게 된다. 바로 시간을 되돌릴 수 있는 능력이 있다는 것! 꿈을 위해 런던으로 간 팀은 우연히 만난 사랑스러운 여인 메리에게 첫눈에 반하게 된다. 그녀의 사랑을 얻기 위해 자신의 특별한 능력을 마음껏 발휘하는 팀하지만 그와 그녀의 사랑이 완벽해질수록 팀을 둘러싼 주변 상황들은 미묘하게 엇갈리고, 예상치 못한 사건들이 여기저기 나타나기 시작하는데… 어떠한 순간을 다시 살게 된다면, 과연 완벽한 사랑을 이룰 수 있을까?  '
,'WATCHA');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'그 시절 우리가 좋아했던 소녀','멜로/로맨스','구파도','가진동, 천옌시'
,80,'그 시절 우리가 좋아했던 소녀.jpg','그 시절 우리가 좋아했던 소녀.jpg'
,'학교 대표 얼간이 커징텅과 친구들은 최고의 모범생 션자이를 좋아한다. 수업 도중 사고를 친 커징텅은 션자이의 특별 감시를 받게 되고 둘은 점점 가까워진다. 션자이에 대한 마음이 커진 커징텅은 자신만의 방식으로 고백을 하지만 션자이는 대답하지 않는다. 그렇게 15년이 지나고, 두 사람은 다시 만나게 되는데… 그 때 너도 나와 같은 마음이었을까? '
,'WATCHA');

INSERT INTO ott VALUES(ott_seq.NEXTVAL,'라라랜드','멜로/로맨스','데이미언 셔젤','라이언 고슬링, 엠마 스톤'
,350,'라라랜드.jpg','라라랜드.jpg'
,'꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다. '
,'NETFLIX');


commit;




