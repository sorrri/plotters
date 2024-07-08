# 프로필 관련 testCase SQL문
/*
-- TEST-005 프로필 등록
DELIMITER //

CREATE OR REPLACE TRIGGER after_enroll_profile
        AFTER UPDATE ON tbl_profile
        FOR EACH ROW
BEGIN
        IF NEW.active_yn = 1 AND OLD.active_yn = 0 THEN
                UPDATE tbl_member_auth
                SET auth_id = 3
                WHERE member_id = NEW.profile_member_id;
        END IF;
END //

DELIMITER ;

-- test
SELECT * FROM tbl_profile;

UPDATE tbl_profile
        SET introduction = 'new introd',
                 profile_image = 'new image',
                 nickname = 'nickname',
                 soft_skill = 'new skilllll',
                 updated_at = NOW(),
                 active_yn = TRUE
 WHERE profile_member_id = 3;

SELECT
                 *
  FROM tbl_member_auth;



-- TEST 005-1 프로필 관리(태그 등록)
INSERT INTO tbl_skill (skill_id, url, tag_id, profile_id)
VALUES
(NULL, 'www.naver.com', 2, 3),
(NULL, 'www.naver.com', 3, 3),
(NULL, 'www.naver.com', 4, 3),
(NULL, 'www.naver.com', 5, 3);

SELECT * FROM tbl_skill;



-- TEST 006 프로필 수정
SELECT * FROM tbl_profile;

UPDATE tbl_profile
        SET introduction = 'new introduction',
                 profile_image = 'new image',
                 nickname = 'new nickname',
                 soft_skill = 'new soft skills',
                 updated_at = NOW()
--  WHERE profile_member_id = id
 WHERE profile_member_id = 3;

 SELECT * FROM tbl_profile;




-- TEST 006-1 태그 수정
DELETE
  FROM tbl_skill
 WHERE profile_id = 3
   AND tag_id = 5;

-- cascade error -> url만 수정가능
UPDATE tbl_skill
        SET URL = 'new url'
 WHERE profile_id = 3 AND tag_id = 5;
*/