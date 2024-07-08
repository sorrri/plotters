| TestCase ID | 소분류 | 실행 내용 | 선수진행 TestCase | P/F |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |
| TEST_002 | 로그인 | member table에 저장된 정보를 SELECT해서 사용자 입력과 비교 | 계정생성 | PASS |
| TEST_003 | 비밀번호변경 | 1. 이메일을 통해 회원 SELECT        2.입력된 이메일과 비밀번호을 통해 member table에서 비밀번호 UPDATE | 로그인, 계정생성 | PASS |
| TEST_004 | 회원탈퇴 | 1. 기능을 요청한 memebr의 active_yn을 false로 UPDATE   2. 프로필 active_yn을 n으로 UPDATE 3-1. 팀장이라면 team 테이블과 team_member 전체 비활성화 3-2. 팀원이라면 team_member 테이블에서 해당 유저를 비활성화 4. 해당 회원이 작성한 전체 게시글 비활성화  5. 댓글 비활성화 | 로그인 | PASS |
| TEST_005 | 프로필 등록 | 1. 회원 id로 profile 테이블에 정보 UPDATE 2. 권한 user로 변경 | 로그인, 태그 생성(필수 X) | PASS |
| TEST_005-1 | 태그 등록 | 프로필 별 관심스택 테이블에 태그 id와 회원 id 를 사용해서 INSERT(optional) | X | PASS |
| TEST_006 | 프로필 수정 | 회원 id로 profile 테이블에 정보 UPDATE | 프로필 등록 | PASS |
| TEST_006-1 | 태그 수정 | 회원 id로 tbl_skill UPDATE or DELETE or CREATE) | 프로필 등록 | PASS |
| TEST_007 | 자유글 작성 | post table에 INSERT (게시글 유형은 자유로) | 프로필 등록 | PASS |
| TEST_008 | 문의글 작성 | post table에 INSERT (게시글 유형은 문의로) | 프로필 등록 | PASS |
| TEST_009 | 공모전 안내글 작성 | 0. 관리자인지 아닌지 확인 1. post table에 INSERT (게시글 유형은 공모전으로)   2. contest table에 post id와 dead line INSERT(nullable 아니면 전부 넣기) | 로그인(관리자), 태그생성(필수 X) | PASS |
| TEST_010 | 모집글 작성 | 1. 팀이 있는 경우 -> 1-1 게시글 INSERT   1-2. 태그가 달려 있는 경우, tag_id가 입력되었고, post_id와 사용해서 post_tag 테이블 INSERT 1-3. member_id(회원 테이블)로 team_member table로부터 본인이 팀장인 team_id SELECT 1-4. 모집글 테이블 INSERT                    2.팀이 없는 경우 -> 2-1. 게시글 INSERT  2-2. 태그가 달려 있는 경우, tag_id가 입력되었고, post_id와 사용해서 post_tag 테이블 INSERT  2-3. Team table INSERT 2-4. member_id와 team_id로 team member table INSERT | 프로필 등록,팀 생성(필수 X), 태그생성(필수 X) | PASS |
| TEST_011 | 유형별 리스트 조회 | post_tbl에서 유형별 리스트 조회(ex. where type=0) | X | PASS |
| TEST_012 | 모집시험 생성 | 1. post_id가 입력되고, tbl_question에 INSERT 2. UPDATE, DELETE(question_id가 추가로 입력됨) | 프로필 등록, 팀 생성 | PASS |
| TEST_013 | 시험 문제 조회 | post_id로 team_question테이블 조회 | 로그인, 프로필 등록 | PASS |
| TEST_014 | 팀 지원 | member_id, post_id가 입력되고, tbl_question에 INSERT 답변을 누르면 답변 테이블이랑 요청테이블에 INSERT | 로그인, 프로필 등록 | PASS |
| TEST_015 | 공지사항 작성 | post table에 CREATE (게시글 유형은 공지로) | 관리자 로그인 | PASS |
| TEST_016 | 공지사항 삭제 | post table 공지사항 DELETE | 관리자 로그인 | PASS |
| TEST_017 | 게시글 단일 조회 | post table에서 post_id로 SELECT | X | PASS |
| TEST_018 | 스크랩 | scrap_like_id가 입력된다 -> 스크랩&좋아요 table INSERT & DELETE (flag 값은 정책 따라가기) | 게시글 조회, 로그인 | PASS |
| TEST_019 | 스크랩 필터링 | member_id가 입력된다 -> 스크랩 & 좋아요 table SELECT (member_id 값으로 여러 row가져와짐) | 게시글 조회, 로그인 | PASS |
| TEST_020 | 좋아요 | member_id와 post_id가 입력된다 -> 스크랩& 좋아요 table INSERT & DELETE (flag 값은 정책 따라가기) | 게시글 조회, 로그인 | PASS |
| TEST_021 | 댓글 | member_id와 post_id가 입력된다 -> 댓글 테이블에 CRUD | 게시글 조회, 프로필 등록 | PASS |
| TEST_022 | 팀 생성 | team table에 팀 정보 INSERT, team_member테이블 팀장으로 추가 | 프로필 등록 | PASS |
| TEST_023 | 팀원 목록 조회 | team_tbl의 team_id로 team_member_tbl 조인으로 조회(SELECT로 JOIN) | X | PASS |
| TEST_024 | 팀 관리 | team_id가 입력된다 -> team 테이블 update | 팀장 로그인 | PASS |
| TEST_025 | 유저 관리 | team_id와 member_id가 입력된다 -> team_member 테이블에서 UPDATE, team_member 비활성화(추방) | 팀장 로그인 | PASS |
| TEST_026 | 참여 권유 | member_id, nickname를 받아 request table에 수신자 정보 INSERT 프로필 목록 리스트가 이미 조회된 상태. | 팀장 로그인 | PASS |
| TEST_027 | 요청 반려 | request table pk로 DELETE | 참여 권유 | PASS |
| TEST_028 | 요청승낙 | member_id와 team_id가 입력 1. request_table DELETE 2. team_member table INSERT | 참여 권유 | PASS |
| TEST_029 | 태그 필터링 검색 | 사용자가 태그를 이용하여 필터링 검색 => 태그_이름 active_yn y로 필터링 | 태그 생성 | PASS |
| TEST_030 | 닉네임검색 | 사용자 닉네임(nickname)을 검색(SELECT & like 활용) active_yn y로 필터링 | 프로필 등록(피검색자) | PASS |
| TEST_030-1 | 프로필 상세조회 | 사용자 프로필 id로 조회 | 프로필 등록 | PASS |
| TEST_031 | 태그 필터링검색 | 사용자가 태그를 이용하여 필터링 검색 => 게시글_태그 active_yn y로 필터링 | 태그 생성, 게시글 생성 | PASS |
| TEST_032 | 키워드검색 | 키워드가 입력된다 -> title이나 content에 키워드가 포함된 게시글 SELECT(like 활용) | 게시글 생성 | PASS |
| TEST_033 | 정렬 | 정렬 정보가 제공(날짜순 or 이름순 등) -> 게시글 SELECT 시 order_by | 게시글 생성 | PASS |
| TEST_034 | 게시글 신고 | post_report table에 게시글 정보 INSERT | 프로필 등록, 게시글 생성 | PASS |
| TEST_035 | 유저 신고 | member_id(신고자)로, profile_id(피신고자)를 profile_tbl에서 member_id를 가져와서 member_report table에 회원 정보 INSERT | 프로필 등록(피신고자), 로그인(신고자) | PASS |
| TEST_036 | 게시글 삭제 | 1. post_report table INSERT 시, trigger 생성되어 있어야 함         2. post_report table에 동일 post_id 5회 이상이면 post_id로 post active_yn UPDATE | 게시글 생성 and 게시글 신고 | PASS |
| TEST_037 | 회원 관리 | 1. member_report table에 INSERT 시, trigger 생성되어 있어야함 2. member_report 테이블에 동일 memeber_id 5개 이상이면 active_N | 프로필 등록 and 유저신고 | PASS |
| TEST_038 | 태그 생성 | 관리자만 태그를 생성할 수 있다. | 로그인(관리자/마스터) | PASS |
| TEST_039 | 프로필 태그 | member_id로 tag_profile_tbl 에서 조회 JOIN WHERE | 프로필 태그 생성 | PASS |
| TEST_040 | 게시글 태그 | post_id로 tag_post_tbl 에서 조회 JOIN WEHRE | 게시글 태그 생성 | PASS |
| TEST_041 | 전체 태그 | tag_tbl에서 전부 조회 JOIN WHERE | 태그 생성 | PASS |
| TEST_042 | 태그 삭제 | 관리자가 태그를 삭제할 수 있다.(CASCADE) 1. tag 테이블 DELETE 2. 프로필-tag 테이블 DELETE (cascade) 3. 게시글-tag 테이블 DELETE (cascade) | 태그 생성 | PASS |
| TEST_043 | 게시글 태그 | 게시글 생성 및 수정 시, (다중으로) 태그를 생성, 삭제 할 수 있다. (CREATE, DELETE) (member_id, post_id로 post_tag 조회하여 row 삭제) | 게시글 생성, 태그 생성 | PASS |
| TEST_044 | 프로필 태그 생성 | 사용자가 본인의 프로필 태그를 생성할 수 있다.(CREATE) | 태그 생성, 프로필 등록 | PASS |
| TEST_045 | 프로필 태그 수정 | 사용자가 본인의 태그를 수정할 수 있다. (태그 링크 포함)(UPDATE, DELETE) | 프로필 등록 | PASS |