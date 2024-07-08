-- --------------------------------------------------------
-- 호스트:                          192.168.0.120
-- 서버 버전:                        10.3.39-MariaDB-0ubuntu0.20.04.2-log - Ubuntu 20.04
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- testdb2 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `testdb2`;
CREATE DATABASE IF NOT EXISTS `testdb2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `testdb2`;

-- 테이블 testdb2.tbl_answer 구조 내보내기
DROP TABLE IF EXISTS `tbl_answer`;
CREATE TABLE IF NOT EXISTS `tbl_answer` (
  `answer` varchar(1023) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `tbl_answer_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `tbl_question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_answer:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_auth 구조 내보내기
DROP TABLE IF EXISTS `tbl_auth`;
CREATE TABLE IF NOT EXISTS `tbl_auth` (
  `auth_id` int(11) NOT NULL,
  `auth_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_auth:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_comment 구조 내보내기
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL DEFAULT 1,
  `post_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`),
  CONSTRAINT `tbl_comment_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_comment:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_contest 구조 내보내기
DROP TABLE IF EXISTS `tbl_contest`;
CREATE TABLE IF NOT EXISTS `tbl_contest` (
  `deadline` datetime NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  CONSTRAINT `tbl_contest_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_contest:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_member 구조 내보내기
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_member:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_member_auth 구조 내보내기
DROP TABLE IF EXISTS `tbl_member_auth`;
CREATE TABLE IF NOT EXISTS `tbl_member_auth` (
  `auth_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`auth_id`,`member_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_member_auth_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_member_auth_ibfk_2` FOREIGN KEY (`auth_id`) REFERENCES `tbl_auth` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_member_auth:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_member_report 구조 내보내기
DROP TABLE IF EXISTS `tbl_member_report`;
CREATE TABLE IF NOT EXISTS `tbl_member_report` (
  `member_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reported_id` int(11) NOT NULL,
  PRIMARY KEY (`member_report_id`),
  KEY `reported_id` (`reported_id`),
  KEY `reporter_id` (`reporter_id`),
  CONSTRAINT `tbl_member_report_ibfk_1` FOREIGN KEY (`reported_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_member_report_ibfk_2` FOREIGN KEY (`reporter_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_member_report:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_post 구조 내보내기
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE IF NOT EXISTS `tbl_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(1023) NOT NULL,
  `post_type` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_post_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_post:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_post_report 구조 내보내기
DROP TABLE IF EXISTS `tbl_post_report`;
CREATE TABLE IF NOT EXISTS `tbl_post_report` (
  `post_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`post_report_id`),
  KEY `reporter_id` (`reporter_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `tbl_post_report_ibfk_1` FOREIGN KEY (`reporter_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_post_report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_post_report:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_post_tag 구조 내보내기
DROP TABLE IF EXISTS `tbl_post_tag`;
CREATE TABLE IF NOT EXISTS `tbl_post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `tbl_post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`),
  CONSTRAINT `tbl_post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tbl_tag` (`tag_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_post_tag:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_profile 구조 내보내기
DROP TABLE IF EXISTS `tbl_profile`;
CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `introduction` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `soft_skill` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL DEFAULT 1,
  `profile_member_id` int(11) NOT NULL,
  PRIMARY KEY (`profile_member_id`),
  CONSTRAINT `tbl_profile_ibfk_1` FOREIGN KEY (`profile_member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_profile:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_question 구조 내보내기
DROP TABLE IF EXISTS `tbl_question`;
CREATE TABLE IF NOT EXISTS `tbl_question` (
  `question_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `recruit_post_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `recruit_post_id` (`recruit_post_id`),
  CONSTRAINT `tbl_question_ibfk_1` FOREIGN KEY (`recruit_post_id`) REFERENCES `tbl_recruit` (`recruit_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_question:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_recruit 구조 내보내기
DROP TABLE IF EXISTS `tbl_recruit`;
CREATE TABLE IF NOT EXISTS `tbl_recruit` (
  `recruit_post_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`recruit_post_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `tbl_recruit_ibfk_1` FOREIGN KEY (`recruit_post_id`) REFERENCES `tbl_post` (`post_id`),
  CONSTRAINT `tbl_recruit_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `tbl_team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_recruit:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_request 구조 내보내기
DROP TABLE IF EXISTS `tbl_request`;
CREATE TABLE IF NOT EXISTS `tbl_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_nickname` varchar(255) NOT NULL,
  `reciever_nickname` varchar(255) NOT NULL,
  `read_checked` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `member_id` (`member_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `tbl_request_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_request_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `tbl_team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_request:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_scrap_like 구조 내보내기
DROP TABLE IF EXISTS `tbl_scrap_like`;
CREATE TABLE IF NOT EXISTS `tbl_scrap_like` (
  `flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  KEY `member_id` (`member_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `tbl_scrap_like_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_scrap_like_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_scrap_like:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_skill 구조 내보내기
DROP TABLE IF EXISTS `tbl_skill`;
CREATE TABLE IF NOT EXISTS `tbl_skill` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `profile_member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  KEY `tag_id` (`tag_id`),
  KEY `profile_member_id` (`profile_member_id`),
  CONSTRAINT `tbl_skill_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tbl_tag` (`tag_id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_skill_ibfk_2` FOREIGN KEY (`profile_member_id`) REFERENCES `tbl_profile` (`profile_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_skill:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_tag 구조 내보내기
DROP TABLE IF EXISTS `tbl_tag`;
CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  `tag_type` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_tag:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_team 구조 내보내기
DROP TABLE IF EXISTS `tbl_team`;
CREATE TABLE IF NOT EXISTS `tbl_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_introduction` varchar(1023) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_team:~0 rows (대략적) 내보내기

-- 테이블 testdb2.tbl_team_member 구조 내보내기
DROP TABLE IF EXISTS `tbl_team_member`;
CREATE TABLE IF NOT EXISTS `tbl_team_member` (
  `team_role` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active_yn` tinyint(1) NOT NULL DEFAULT 1,
  `member_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  KEY `member_id` (`member_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `tbl_team_member_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_team_member_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `tbl_team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 testdb2.tbl_team_member:~0 rows (대략적) 내보내기

-- 트리거 testdb2.trg_member_report 구조 내보내기
DROP TRIGGER IF EXISTS `trg_member_report`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER trg_member_report
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
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
