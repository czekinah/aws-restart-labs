CREATE DATABASE IF NOT EXISTS restart_db;
USE restart_db;

-- One row per student
CREATE TABLE RESTART (
  student_id       INT PRIMARY KEY,
  student_name     VARCHAR(60)  NOT NULL,
  restart_city     VARCHAR(60)  NOT NULL,
  graduation_date  DATETIME     NOT NULL
);

DESCRIBE RESTART;

-- Cohort
INSERT INTO RESTART VALUES
 (1001,'Czekinah Tolentino','Manila','2026-10-16 10:00:00'),
 (1002,'Jomar Delos Reyes','Manila','2026-10-16 10:00:00'),
 (1003,'Aira Santos','Cebu','2026-10-16 10:00:00'),
 (1004,'Paolo Mendoza','Davao','2026-10-16 10:00:00'),
 (1005,'Nicole Ramos','Manila','2026-10-16 10:00:00'),
 (1006,'Miguel Cruz','Baguio','2026-10-16 10:00:00'),
 (1007,'Hazel Bautista','Cebu','2026-10-16 10:00:00'),
 (1008,'Rafael Lim','Iloilo','2026-10-16 10:00:00'),
 (1009,'Trisha Navarro','Manila','2026-10-16 10:00:00'),
 (1010,'Enrico Villanueva','Davao','2026-10-16 10:00:00');

SELECT * FROM RESTART;

-- One row per certification, related to RESTART on student_id
CREATE TABLE CLOUD_PRACTITIONER (
  student_id          INT,
  certification_date  DATETIME NOT NULL
);

DESCRIBE CLOUD_PRACTITIONER;

-- Certification events, one per student who passed
INSERT INTO CLOUD_PRACTITIONER VALUES
 (1001,'2026-11-05 09:30:00'),
 (1003,'2026-11-07 13:00:00'),
 (1005,'2026-11-12 09:30:00'),
 (1008,'2026-11-18 15:45:00'),
 (1010,'2026-11-20 11:15:00');

SELECT * FROM CLOUD_PRACTITIONER;

-- Students who have certified, name from RESTART, date from CLOUD_PRACTITIONER
SELECT r.student_id,
       r.student_name,
       c.certification_date
FROM RESTART r
INNER JOIN CLOUD_PRACTITIONER c
  ON r.student_id = c.student_id
ORDER BY r.student_id;
