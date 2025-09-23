-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.43 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- dolk 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `dolk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dolk`;

-- 테이블 dolk.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `board_id` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `anonymous` int DEFAULT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 dolk.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `m_id` varchar(255) NOT NULL,
  `m_pwd` varchar(255) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `m_email` varchar(255) DEFAULT NULL,
  `m_num` bigint DEFAULT NULL,
  `m_age` int DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `uk_m_email` (`m_email`),
  UNIQUE KEY `uk_m_num` (`m_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 dolk.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_id` text,
  `pinned` int DEFAULT NULL,
  `published_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 dolk.post 구조 내보내기
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int NOT NULL,
  `board_id` int DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `coment_md` text,
  `title` varchar(255) DEFAULT NULL,
  `visibility` varchar(50) DEFAULT NULL,
  `view_count` int DEFAULT NULL,
  `like_count` int DEFAULT NULL,
  `comment_count` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_post_author` (`author_id`),
  KEY `fk_post_board` (`board_id`),
  CONSTRAINT `fk_post_author` FOREIGN KEY (`author_id`) REFERENCES `member` (`m_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_post_board` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 dolk.post_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `post_comment` (
  `comment_id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `coment_md` text,
  `title` varchar(255) DEFAULT NULL,
  `visibility` varchar(50) DEFAULT NULL,
  `view_count` int DEFAULT NULL,
  `like_count` int DEFAULT NULL,
  `comment_count` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_author` (`author_id`),
  KEY `fk_comment_post` (`post_id`),
  CONSTRAINT `fk_comment_author` FOREIGN KEY (`author_id`) REFERENCES `member` (`m_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 dolk.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
