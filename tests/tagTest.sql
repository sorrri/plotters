# 태그 관련 testCase SQL문

/*
-- TEST 039 태그 생성
INSERT INTO `tbl_tag` (`tag_id`, `tag_name`, `tag_type`) VALUES
        (NULL, 'HeidiSQL', 'stack');



-- TEST 040 프로필 태그
SELECT * FROM tbl_skill
WHERE profile_id = 2;



-- TEST 041 게시글 태그
SELECT * FROM tbl_post_tag
WHERE post_id = 2;



-- TEST 042 전체 태그
SELECT * FROM tbl_tag;



-- TEST 043 태그 삭제
DELETE
FROM tbl_tag
WHERE tag_name = 'HeidiSQL';



-- TEST 044 게시물 태그
INSERT INTO tbl_post_tag (post_id, tag_id)
VALUES(1,4);



-- TEST 045 프로필 태그 생성
INSERT INTO tbl_skill
VALUES(
NULL,"",3,8 );



-- TEST 046 프로필 태그 수정
DELETE
  FROM tbl_skill
 WHERE tag_id = 4 AND profile_id = 5;

REPLACE
   INTO tbl_skill
        VALUES (NULL, "vuejs.github",3,8);

SELECT * FROM tbl_skill;
*/
