# 팀 관련 testCase SQL문
/*
-- TEST 022 팀 생성
#trigger 형태로 tbl_team에 insert 시, tbl_team_member 테이블에 data insert 불가능

SELECT * FROM tbl_team;
SELECT * FROM tbl_team_member;

# transaction 부터 commit까지 선택후 ctrl + alt + F9
START TRANSACTION;

-- 1. 새로운 팀 추가
INSERT INTO tbl_team (introduction, created_at, updated_at, active_yn)
VALUES ('test용 팀 소개 텍스트입니다.', NOW(), NOW(), TRUE);

-- 2. 가장 최근에 추가된 팀의 team_id를 변수에 저장
SET @team_id = LAST_INSERT_ID();

-- 3. tbl_team_member에 데이터 삽입
INSERT INTO tbl_team_member (member_id, team_id, team_role, created_at, updated_at, active_yn)
VALUES (5, @team_id, 0, NOW(), NOW(), TRUE);

COMMIT;

SELECT * FROM tbl_team;
SELECT * FROM tbl_team_member;



-- TEST 023 팀원 목록 조회
SELECT tm.*
  from tbl_team_member tm
  JOIN tbl_team t ON t.team_id = tm.team_id
 WHERE t.team_id = 1; -- tbl_team_member에 있는 member_id 수정하여 조회 가능



-- TEST 024 팀관리
UPDATE tbl_team
   SET introduction = '팀 소개 페이지 수정 test 입니다',
       updated_at = NOW()
 WHERE team_id = 1;


-- TEST 025 유저관리
UPDATE tbl_team_member
   SET team_role = 0
     , updated_at = NOW()
WHERE member_id = 1 AND team_id = 1; -- 수정할 멤버의 id값 입력

UPDATE tbl_team_member
   SET active_yn = FALSE
     , updated_at = NOW()
WHERE member_id = 1 AND team_id = 1; -- 수정할 멤버의 id값 입력



-- TEST 026 참여 권유
INSERT INTO tbl_request (sender_nickname, receiver_nickname, read_checked, member_id, team_id, created_at, updated_at, active_yn)
VALUES ('장민근', '정준서', FALSE, 4, 5, NOW(), NOW(), FALSE);



-- TEST 027 요청 반려
-- 삭제
DELETE FROM tbl_request
WHERE request_id = 1;



-- TEST 028 요청 승낙
DELIMITER //

CREATE OR REPLACE TRIGGER after_insert_team_member
AFTER INSERT ON tbl_team_member
FOR EACH ROW
BEGIN
    -- tbl_request에 NEW.member_id와 NEW.team_id가 있는지 확인
    IF EXISTS (SELECT 1 FROM tbl_request WHERE member_id = NEW.member_id AND team_id = NEW.team_id) THEN
        -- 조건이 만족되면 tbl_request에서 해당 레코드 삭제
        DELETE FROM tbl_request
        WHERE member_id = NEW.member_id AND team_id = NEW.team_id;
    END IF;
END//

DELIMITER ;


SELECT * FROM tbl_team_member;
SELECT * FROM tbl_request;

INSERT INTO tbl_team_member(member_id, team_role, created_at, updated_at, active_yn, team_id)
VALUES (1, 1, NOW(), NOW(), TRUE, 5);

SELECT * FROM tbl_team_member;
SELECT * FROM tbl_request;
*/













