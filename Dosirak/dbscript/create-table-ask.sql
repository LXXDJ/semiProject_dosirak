USE DOSIRAK;
DROP TABLE IF EXISTS ASK CASCADE;

CREATE TABLE IF NOT EXISTS ASK (
    ASK_CODE INT AUTO_INCREMENT KEY COMMENT '문의코드',
    ASK_TITLE VARCHAR(225) NOT NULL COMMENT '문의제목',
    ASK_CONTENT TEXT(500) NOT NULL COMMENT '문의내용',
    ASK_DATE DATE NOT NULL COMMENT '문의날짜',
    USER_ID VARCHAR(20) NOT NULL COMMENT '회원아이디',
    ASK_EDITDATE DATE COMMENT '수정일시' default null,
    ASK_DELETE BOOLEAN COMMENT '삭제여부',
    ASK_CATEGORY_CODE INT(5) COMMENT '문의분류코드',
    foreign key (USER_ID) references USER (ID),
    foreign key (ASK_CATEGORY_CODE) references ask_category (ASK_CATEGORY_CODE)
) ENGINE=INNODB COMMENT '1대1문의';

INSERT INTO ASK (ASK_CODE, ASK_TITLE, ASK_CONTENT, ASK_DATE, USER_ID, ASK_DELETE, ASK_CATEGORY_CODE) VALUES
(1,'문의 드립니다 (1)','문의 드립니다 (1)','2024-01-01','cool12',0,1),
(2,'문의 드립니다 (2)','문의 드립니다 (2)','2024-01-02','cool12',0,2),
(3,'문의 드립니다 (3)','문의 드립니다 (3)','2024-01-03','cool12',0,1),
(4,'문의 드립니다 (4)','문의 드립니다 (4)','2024-01-04','cool12',0,2),
(5,'문의 드립니다 (5)','문의 드립니다 (5)','2024-01-05','cool12',0,3),
(6,'문의 드립니다 (6)','문의 드립니다 (6)','2024-01-06','cool12',0,4),
(7,'문의 드립니다 (7)','문의 드립니다 (7)','2024-01-07','cool12',0,3),
(8,'문의 드립니다 (8)','문의 드립니다 (8)','2024-01-08','cool12',0,3),
(9,'문의 드립니다 (9)','문의 드립니다 (9)','2024-01-09','cool12',0,5),
(10,'문의 드립니다 (10)','문의 드립니다 (10)','2024-01-10','cool12',0,2),
(11,'문의 드립니다 (11)','문의 드립니다 (11)','2024-01-11','cool12',0,3);

select * from ask;
