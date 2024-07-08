
# 프로젝트 소개
> 효율적인 팀 빌딩을 위한 플랫폼 - 작당모의(Plotters)

![!\[\[plotters_logo.jpg\]\]](https://github.com/1willcommit/jdme/blob/0497b35b685a6d9817392aaec2c6d34b00996a4f/assets/plotters_logo.jpg)

### 팀 구성

| 김서현                                   | 김소리    | 용길한        | 장민근         | 정준서           |
| ------------------------------------- | ------ | ---------- | ----------- | ------------- |
| [1etterh](https://github.com/1etterh) | sorrri | Yong-ga-ri | caolian2003 | JeongJunSeo99 |

## 프로젝트 배경
- IT  공모전 팀원 모집 플랫폼 기능이 제한적임
    1. 공모전 및 대외활동 참여를 위해 팀원 모집 시 **예비 팀원의 스펙 정보 부족**
    2. **이미 존재하는 공모전 팀에 참가 시, 참가 팀에 대한 정보 부족**
    3. 유저들이 제시하는 **실력에 대한 신뢰성이 보장되지 않음**

## 프로젝트 목적
- **커뮤니케이션 비용 ↓**
    -   공모전 팀원 모집에 참가하는 유저들은 모두 프로필을 작성하여 기존 오픈카톡, 구글폼 설문 등을 통해 플랫폼 외부적으로 실력을 확인해야하는 단계가 줄어듦

    - 프로필을 통해 원하는 유저나 팀을 찾는데 보다 효율적
- **유저 실력에 대한 신뢰도 보장**

    - 유저가 보유한 기술 수준을 ‘팀원 모집 시험’, ‘기술 스택이 포함된 본인 깃허브 링크’ 기능으로  보장된 신뢰 제공

## 기존 서비스와의 차별점
1. 프로필 설정을 통한 커뮤니케이션 비용 절감
2. 팀원 모집시 기술 스택, 포지션 설정 가능
3. 팀원 모집글에 질문 첨부 기능
4. 기술스택을 태그로 등록하여 필터링 검색 기능 제공
   ![title](https://drive.google.com/file/d/1EGVKStm3jJRhSVkJiEOBgRIfxAHjlrB4/view?usp=drive_link)

#### _references_
1. [_OKKY_](https://okky.kr/)
2. [_Hola_](https://holaworld.io/)
3. [_Beginmate_](https://beginmate.com/)
---

## 예상 이용자
- 공모전/프로젝트/스터디를 함께 할 팀원을 구하려는 학생

## 프로젝트 진행 과정
1. 5인 1조로 모여 회의 후 주제선정
2. 채택된 주제에 대한 요구사항 정의
3. 데이터 수집 및 모델링작업
4. HeidiSQL, MariaDB를 활용하여 실제 Database 구축

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

