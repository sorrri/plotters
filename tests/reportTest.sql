# 신고 관련 testCase SQL문

/*
-- TEST 035 게시글 신고
INSERT INTO tbl_post_report (report_type, reporter_id, post_id, created_at)
VALUES ('test_query', 2, 7, NOW());



-- TEST 036 유저 신고
INSERT INTO tbl_member_report (report_type, reported_id, reporter_id, created_at)
VALUES ('test_query', 2, 4, NOW());



-- TEST 037 게시글 삭제
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

SELECT * FROM tbl_post_report;
SELECT * FROM tbl_post;

INSERT INTO tbl_post_report (post_report_id, report_type, reporter_id, post_id, created_at)
VALUES(NULL, 'trigger', 2, 6, NOW());

select * from tbl_post;

SELECT * FROM tbl_post_report;
SELECT * FROM tbl_post;



-- TEST 038 회원 관리
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

SHOW TRIGGERS;
*/