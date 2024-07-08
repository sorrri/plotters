
# 프로젝트 소개
> 효율적인 팀 빌딩을 위한 플랫폼 - 작당모의(Plotters)

### 팀 구성

| 김서현                                   | 김소리    | 용길한        | 장민근         | 정준서           |
| ------------------------------------- | ------ | ---------- | ----------- | ------------- |
| [1etterh](https://github.com/1etterh) | sorrri | Yong-ga-ri | caolian2003 | JeongJunSeo99 |

## 기존 서비스와의 차별점
1. 프로필 설정을 통한 커뮤니케이션 비용 절감
2. 팀원 모집시 기술 스택, 포지션 설정 가능 
3. 팀원 모집글에 질문 첨부 기능
4. 기술스택을 태그로 등록하여 필터링 검색 기능 제공
![!\[\[plotters_logo.jpg\]\]](https://github.com/1willcommit/jdme/blob/cf8edc69e225e9e27e1ad7f38c1a530a1656e0c3/plotters_logo.jpg)

## 예상 이용자
- 공모전/프로젝트/스터디를 함께 할 팀원을 구하려는 학생

## 프로젝트 진행 과정
1. 5인 1조로 모여 회의 후 주제선정 
2. 채택된 주제에 대한 요구사항 정의
3. 데이터 수집 및 모델링작업
4. HeidiSQL, MariaDB를 활용하여 실제 Database 구축

---

## 주제 선정

- 각자 생각해본 주제에 대해 이야기 해본 결과 스터디나 공모전의 팀원을 모집하기 위한 팀 빌딩 플랫폼을 만들기로 결정하였다.
- 기존 방식의 커뮤니케이션 비용을 절감하고 사용자 간의 신뢰도를 높이기 위해 프로필에 포트폴리오를 첨부하고 모집 공고 글에는 자신만의 질문을 만들 수 있는 기능을 추가했다.
- 팀을 구성하면 팀 소개 페이지를 첨부할 수 있어 지원자 역시 모집 중인 팀의 정보를 확인할 수 있는 기능을 추가했다.


*_references_*
1. [_요즘것들_](https://www.allforyoung.com)
2. [_비긴메이트_](https://beginmate.com/)
3. [_인프런_](https://www.inflearn.com/community/projects)

---

## 요구사항 분석

[_요구사항 분석_](https://docs.google.com/spreadsheets/d/1kQ2-s_K4Ma4VO2P3hSHa7F0qFnhoF_lXNa2N63ZqfLA/edit?usp=sharing)
[_UML 작성_](https://drive.google.com/file/d/1vNPQ37NkD-3BpiN6Q_jewkCN-UdQRACd/view?usp=sharing)

--- 

## 데이터 수집 및 개념 모델링

### Entity 정의
> 요구사항 분석단계에서 명사를 추출하고 속성과 엔터티를 구분한다.


| 명사        | 구분        | 비고                                                                                                          |
| --------- | --------- | ----------------------------------------------------------------------------------------------------------- |
| 회원        | Entity    | 시스템 상의 역할은 관리자와 일반 회원으로 구분되며, 팀 내에서는 팀장과 팀원으로 구분된다.                                                         |
| guest     | 게스트       | 로그인하지 않은 사람(Read-only)                                                                                      |
| undefined | 일반 회원     | 프로필 등록을 하지 않은 사람. 자동으로 프로필이 생성되지만 active_yn이 False인 상태임. 한번이라도 update가 실행되면 active_yn이 True                 |
| user      | 일반 회원     | 프로필을 1회 이상 UPDATE한 사람                                                                                       |
| admin     | 관리자       | 관리자                                                                                                         |
| 프로필       | Entity    | 계정을 만들면 자동으로 생성되며, Nickname값은 undefined로 자동 부여된다. UPDATE 전까지 active_yn= FALSE                               |
| 게시판       | Attribute | 게시글의 속성에 포함된다.(공지사항, 문의게시판, 모집글, 자유게시판)                                                                     |
| 게시글       | Entity    | 제목, 내용, 작성자 포함                                                                                              |
| 댓글        | Entity    | 소속 게시글, 작성자                                                                                                 |
| 알림        | Entity    | 발신인, 수신인, 팀 id, 활성화 여부                                                                                      |
| 팀         | Entity    | 팀 소개 및 멤버들에 대한 정보                                                                                           |
| 기술스택      | Entity    | 관리자만 추가할 수 있는 기술스택 tag. 유저는 이 태그를 활용하여 1. 자신의 프로필에 태그와 포트폴리오 url을 첨부할 수 있으며 2. 게시글이나 유저 검색시에도 태그를 활용할 수 있다. |
| 포지션       | Entity    | 관리자만 추가할 수 있는 포지션 tag. 기술 스택tag와 동일하게 사용 가능하다.                                                              |

### 개념 모델(Conceptual Model)
> 도출된 Entity의 속성을 파악하고 이들 사이의 관계를 고려하여 간략한 ERD를 작성하였다.

