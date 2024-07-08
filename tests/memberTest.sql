# 회원 관련 testCase SQL문
/*
-- TEST-001 회원가입

SELECT * FROM tbl_member;
SELECT * FROM tbl_profile;
SELECT * FROM tbl_member_auth
 WHERE member_id = 16;

DELIMITER //

CREATE OR REPLACE TRIGGER after_create_member
        AFTER INSERT ON tbl_member
        FOR EACH ROW
BEGIN
        INSERT INTO tbl_profile (profile_member_id, introduction, profile_image, nickname, soft_skill, created_at, updated_at, active_yn)
        VALUES (NEW.member_id, NULL, NULL, NULL, NULL, NOW(), NOW(), FALSE);
        INSERT INTO tbl_member_auth (member_id, auth_id)
        VALUES (NEW.member_id, 4);
END //

DELIMITER ;

-- 완료 테스트
INSERT INTO tbl_member (member_id, password, email, created_at, updated_at, active_yn) VALUES
(NULL, 'test_password', 'test@email.com', NOW(), NOW(), FALSE);

SELECT * FROM tbl_member;
SELECT * FROM tbl_profile;
SELECT * FROM tbl_member_auth
 WHERE member_id = 16;



-- TEST-002 로그인

SELECT * FROM tbl_member
 WHERE email = '1etterh.dev@gmail.com'
   AND PASSWORD = 'qswedlmer!ml3$5'
   AND active_yn = TRUE;



-- TEST-003 비밀번호 변경

SELECT * FROM tbl_member WHERE email = 'rlfgks97@gmail.com';

UPDATE tbl_member
   SET password = 'new_password'
 WHERE email = 'rlfgks97@gmail.com';

SELECT * FROM tbl_member WHERE email = 'rlfgks97@gmail.com';



-- TEST-004 회원 탈퇴

DELIMITER //

CREATE OR REPLACE TRIGGER after_delete_account
        AFTER UPDATE ON tbl_member
        FOR EACH ROW
BEGIN
        -- 활성화된 유저라면
        IF (NEW.active_yn <> OLD.active_yn) AND (NEW.active_yn = FALSE) THEN
                -- 프로필 비활성화
                UPDATE tbl_profile
                SET active_yn = FALSE, updated_at = NOW()
                WHERE profile_member_id = NEW.member_id;
        END IF;
END //

DELIMITER ;

-- 게시글((모집공고) 커뮤니티, 문의게시판) 비활성화
SELECT * FROM tbl_post WHERE member_id = 3;
UPDATE tbl_post
        SET active_yn = FALSE, updated_at = NOW()
 WHERE member_id = 3;
SELECT * FROM tbl_post WHERE member_id = 3;

-- 댓글 삭제
SELECT * FROM tbl_comment WHERE member_id = 4;
UPDATE tbl_comment
   SET active_yn = FALSE, updated_at = NOW()
 WHERE member_id = 4;
SELECT * FROM tbl_comment WHERE member_id = 4;

-- team_member 비활성화
SELECT * FROM tbl_team_member WHERE member_id = 3;
UPDATE tbl_team_member
SET active_yn = FALSE, updated_at = NOW()
WHERE member_id = 3; -- sample
SELECT * FROM tbl_team_member WHERE member_id = 3;

*/