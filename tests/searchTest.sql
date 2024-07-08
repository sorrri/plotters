# 검색 관련 testCase SQL문

/*
-- TEST 029 태그 필터링 검색
SELECT a.profile_member_id, a.introduction, a.profile_image, a.nickname, a.soft_skill, a.created_at, a.updated_at
        FROM tbl_profile a
        JOIN tbl_skill b ON a.profile_member_id = b.profile_id
        WHERE b.tag_id IN (SELECT c.tag_id FROM
                                                                tbl_tag c
                                                                WHERE c.tag_name = 'spring boot' OR c.tag_name= 'mariaDB')
                                                and
                        a.active_yn = '1'
        GROUP BY a.profile_member_id;



-- TEST 030 닉네임 검색
SELECT profile_member_id, introduction, profile_image, nickname, soft_skill, created_at, updated_at
        FROM tbl_profile
        WHERE nickname LIKE '%정준서%';



-- TEST 031 프로필 상세 조회
SELECT a.profile_member_id, a.introduction, a.profile_image, a.nickname, a.soft_skill, a.created_at, a.updated_at, b.url, c.tag_name
        FROM tbl_profile a
        JOIN tbl_skill b ON a.profile_member_id = b.profile_id
        JOIN tbl_tag c ON b.tag_id = c.tag_id
        WHERE a.profile_member_id = 1;



-- TEST 032 태그 필터링 검색
SELECT a.post_id, a.title, a.content, a.post_type, a.member_id, a.created_at, a.updated_at
        FROM tbl_post a
        JOIN tbl_post_tag b ON a.post_id = b.post_id
        WHERE b.tag_id IN (SELECT c.tag_id FROM
                                                                tbl_tag c
                                                                WHERE c.tag_name = 'spring boot' OR c.tag_name= 'mariaDB')
                                                and
                        a.active_yn = '1'
        GROUP BY a.post_id;


-- TEST 033 키워드 검색
SELECT a.post_id, a.title, a.content, a.post_type, a.member_id, a.created_at, a.updated_at
        FROM tbl_post a
        WHERE a.title LIKE '%사람%' OR a.content LIKE '%사람%';



-- TEST 034 정렬
SELECT a.post_id, a.title, a.content, a.post_type, a.member_id, a.created_at, a.updated_at
        FROM tbl_post a
        ORDER BY a.created_at DESC;
*/