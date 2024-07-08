# 게시판 관련 testCase SQL문
/*
-- TEST 007 자유게시판
INSERT INTO tbl_post
(post_id, title, content, post_type, member_id, created_at, updated_at, active_yn)
VALUES
(NULL, 'title', 'content', 'community', 3, NOW(), NOW(), TRUE);

SELECT * FROM tbl_post;



-- TEST 008 문의게시판
INSERT INTO tbl_post
(post_id, title, content, post_type, member_id, created_at, updated_at, active_yn)
VALUES
(NULL, 'title', 'content', 'ask', 3, NOW(), NOW(), TRUE);

SELECT * FROM tbl_post;



 -- TEST 009 공모전 안내글 작성
DELIMITER //

CREATE OR REPLACE TRIGGER after_post_for_contest
        AFTER INSERT ON tbl_post
        FOR EACH ROW
BEGIN
        IF NEW.post_type = 'contest' THEN
                INSERT INTO tbl_contest (contest_post_id, deadline)
                VALUES(NEW.post_id, NOW());
        END IF;
END //

DELIMITER ;

SELECT * FROM tbl_post;
SELECT * FROM tbl_contest;

INSERT INTO tbl_post
(post_id, title, content, post_type, member_id, created_at, updated_at, active_yn)
VALUES
(NULL, 'title', 'coaaaantent', 'contest', 3, NOW(), NOW(), TRUE);

SELECT * FROM tbl_post;
SELECT * FROM tbl_contest;


-- Test 010 모집글 작성
-- 1. 팀이 만들어져있는 경우에 모집글 작성
select * from tbl_team;
select * from tbl_post;
select * from tbl_post_tag;
select * from tbl_recruit;

START TRANSACTION;

-- 게시글에 모집 게시글 작성
INSERT INTO tbl_post (title, content, post_type, member_id, created_at, updated_at, active_yn) VALUES
('개발자들 모여라', '안모이면 개발자 아님', 'recruit', 9, NOW(), NOW(), TRUE);

-- 방금 삽입한 recruit 포스트의 post_id 가져오기
SET @recruit_post_id =  LAST_INSERT_ID();

-- 모집 게시글 작성 태그
INSERT INTO tbl_post_tag (post_id, tag_id) VALUES(@recruit_post_id, 1);

-- 모집 게시글에 정보 삽입
INSERT INTO tbl_recruit (recruit_post_id, team_id) VALUES (@recruit_post_id, 3);

-- ROLLBACK;
COMMIT;

select * from tbl_team;
select * from tbl_post;
select * from tbl_post_tag;
select * from tbl_recruit;

-- 2. 팀이 없는 경우에 모집글 작성

select * from tbl_post;
select * from tbl_post_tag;
select * from tbl_team;
select * from tbl_team_member;
select * from tbl_recruit;

START TRANSACTION;

-- tbl_post에 데이터 삽입
INSERT INTO tbl_post(title, content, post_type, created_at, updated_at, active_yn, member_id)
VALUES ('모집글 테스트', '으아아아아ㅏ', 'recruit', NOW(), NOW(), TRUE, 1);

-- 방금 삽입한 recruit 포스트의 post_id 가져오기
SET @recruit_post_id = LAST_INSERT_ID();

-- tbl_post_tag에 태그 삽입
INSERT INTO tbl_post_tag(post_id, tag_id)
VALUES
(@recruit_post_id, 1),
(@recruit_post_id, 2);

-- tbl_team에 데이터 삽입
INSERT INTO tbl_team(introduction, created_at, updated_at, active_yn)
VALUES ('null', NOW(), NOW(), TRUE);

-- 방금 삽입한 팀의 team_id 가져오기
SET @recruit_team_id = LAST_INSERT_ID();

-- tbl_team_member에 팀 멤버 삽입
INSERT INTO tbl_team_member(team_role, created_at, updated_at, active_yn, member_id, team_id)
VALUES(0, NOW(), NOW(), TRUE, 1, @recruit_team_id);

-- tbl_recruit에 모집 정보 삽입
INSERT INTO tbl_recruit(recruit_post_id, team_id)
VALUES (@recruit_post_id, @recruit_team_id);

COMMIT;

select * from tbl_post;
select * from tbl_post_tag;
select * from tbl_team;
select * from tbl_team_member;
select * from tbl_recruit;



-- Test 011 유형 별 리스트 조회
SELECT
          title
        , content
        , post_type
FROM tbl_post
WHERE post_type = 'recruit';



-- Test 012 모집 시험 생성
-- 시험 문제 작성
INSERT INTO tbl_question
(question, recruit_post_id)
VALUES
('TRIGGER가 무엇인지 작성해주세요.',2),
('DML의 종류를 설명하세요', 2),
('RDB와 NoSQL의 차이를 설명하세요',2);

-- 시험 문제 수정
UPDATE tbl_question
SET question = 'DELIMITER이무엇인지 작성해주세요.'
WHERE question_id = 8;

-- 시험 문제 삭제
DELETE FROM tbl_question
WHERE question_id = 8;



-- Test 013 시험 문제 조회
SELECT
        question
FROM tbl_question
WHERE recruit_post_id = 2;



-- Test 014 팀 지원
INSERT INTO tbl_answer(member_id, question_id, answer, created_at) VALUES
(6, 1,'서한준입니다.', NOW());

INSERT INTO tbl_request (sender_nickname, receiver_nickname, read_checked, member_id, team_id, created_at, updated_at, active_yn) VALUES
('서한준', '추지훈', TRUE, 6, 4, NOW(), NOW(), TRUE);



-- Test 015 공지사항 작성
-- 공지사항 작성
INSERT INTO tbl_post (title, content, post_type, member_id, created_at, updated_at, active_yn)
VALUES
('게시글 작성 유의사항(광고)', '허가없는 광고성 게시글 작성 시 즉시 삭제조치됩니다.', 'notification', 1, NOW(), NOW(), TRUE);

-- 공지사항 수정
UPDATE tbl_post
SET title = '광고 유의사항', content = '허가없는 광고성 게시글 작성 시 탈퇴조치'
WHERE post_id = 16;



-- Test 016 공지사항 삭제
UPDATE tbl_post
SET active_yn = FALSE,
updated_at = now()
WHERE post_id=15;



-- Test 017 게시글 단일 조회
SELECT
          title
        , content
        , post_type
        , member_id
FROM tbl_post
WHERE post_id = 1;



-- Test 018 스크랩
-- TRUE: like , FALSE: scrap
-- 스크랩
INSERT INTO tbl_scrap_like
(scrap_like_id, member_id, post_id, flag, created_at)
VALUES
(NULL, 9, 3, FALSE, NOW());

-- 스크랩 취소
DELETE FROM tbl_scrap_like
WHERE scrap_like_id = 2;




-- Test 019 스크랩 필터링
#1. 스크랩 필터링
SELECT p.post_id, p.title, p.content
FROM tbl_scrap_like sl
JOIN tbl_post p ON sl.post_id = p.post_id
WHERE sl.member_id = 3         -- scrap_like 테이블애 존재하는 id값 입력하여 해당 멤버가 스크랩 한 게시글 조회
  AND sl.flag = 0
  AND p.active_yn = TRUE;

#2. 좋아요 필터링
SELECT p.post_id, p.title, p.content
FROM tbl_scrap_like sl
JOIN tbl_post p ON sl.post_id = p.post_id
WHERE sl.member_id = 1         -- scrap_like 테이블애 존재하는 id값 입력하여 해당 멤버가 스크랩 한 게시글 조회
  AND sl.flag = 1
  AND p.active_yn = TRUE;



-- Test 020 좋아요
1. 좋아요
INSERT INTO tbl_scrap_like (scrap_like_id, member_id, post_id, flag, created_at)
VALUES (NULL, 1, 10, TRUE, NOW());

2. 좋아요 취소
DELETE FROM tbl_scrap_like
WHERE scrap_like_id = 3 ;



-- Test 021 댓글
INSERT INTO tbl_comment (content, post_id, member_id, created_at, updated_at, active_yn)
VALUES ('test용 댓글입니다.', 10, 1, NOW(), NOW(), TRUE);

UPDATE tbl_comment
SET content = '수정된 test용 댓글입니다.',
    updated_at = NOW()
WHERE comment_id = 10
  AND member_id =  1;

UPDATE tbl_comment
SET active_yn = FALSE,
    updated_at = NOW()
WHERE comment_id = 10
  AND member_id =  1;
*/