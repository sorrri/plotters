ALTER TABLE tbl_profile ADD FOREIGN KEY (profile_member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_team_member ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_team_member ADD FOREIGN KEY (team_id) REFERENCES tbl_team (team_id);

ALTER TABLE tbl_request ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_request ADD FOREIGN KEY (team_id) REFERENCES tbl_team (team_id);

ALTER TABLE tbl_member_report ADD FOREIGN KEY (reported_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_member_report ADD FOREIGN KEY (reporter_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_post ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_comment ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_comment ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_member_auth ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_member_auth ADD FOREIGN KEY (auth_id) REFERENCES tbl_auth (auth_id);

ALTER TABLE tbl_scrap_like ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_scrap_like ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_contest ADD FOREIGN KEY (contest_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_skill ADD FOREIGN KEY (tag_id) REFERENCES tbl_tag (tag_id) ON DELETE CASCADE;

ALTER TABLE tbl_skill ADD FOREIGN KEY (profile_id) REFERENCES tbl_profile (profile_member_id);

ALTER TABLE tbl_question ADD FOREIGN KEY (recruit_post_id) REFERENCES tbl_recruit (recruit_post_id);

ALTER TABLE tbl_recruit ADD FOREIGN KEY (recruit_post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_recruit ADD FOREIGN KEY (team_id) REFERENCES tbl_team (team_id);

ALTER TABLE tbl_answer ADD FOREIGN KEY (member_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_answer ADD FOREIGN KEY (question_id) REFERENCES tbl_question (question_id);

ALTER TABLE tbl_post_report ADD FOREIGN KEY (reporter_id) REFERENCES tbl_member (member_id);

ALTER TABLE tbl_post_report ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_post_tag ADD FOREIGN KEY (post_id) REFERENCES tbl_post (post_id);

ALTER TABLE tbl_post_tag ADD FOREIGN KEY (tag_id) REFERENCES tbl_tag (tag_id) ON DELETE CASCADE;
