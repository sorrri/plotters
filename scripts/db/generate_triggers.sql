
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

--------------------------------------------
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

---------------------------------------------------------
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

--------------------------------------------------------
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

-----------------------------------------------------------
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

-------------------------------------------------------
DELIMITER //

CREATE OR REPLACE TRIGGER trg_update_post_status
AFTER INSERT ON tbl_post_report
FOR EACH ROW
BEGIN
    -- 동일 post_id의 report 횟수 카운트
    DECLARE report_count INT;
    
    SELECT COUNT(*)
    INTO report_count
    FROM tbl_post_report
    WHERE post_id = NEW.post_id;
    
    -- report 횟수가 5회 이상이면 post의 active_yn 업데이트
    IF report_count >= 5 THEN
        UPDATE tbl_post
        SET active_yn = 0
        WHERE post_id = NEW.post_id;
    END IF;
END//

DELIMITER ;

-----------------------------------------------------------
DELIMITER // 

CREATE OR REPLACE TRIGGER after_member_report
    AFTER INSERT
    ON tbl_member_report
    FOR EACH ROW
BEGIN
        if (SELECT COUNT(*)
            FROM tbl_member_report
            WHERE reported_id = NEW.reported_id)
            >= 5
        then 
                  UPDATE tbl_member
                  SET active_yn = FALSE
                  WHERE member_id = NEW.reported_id;
        END if;                
END//

DELIMITER ;
