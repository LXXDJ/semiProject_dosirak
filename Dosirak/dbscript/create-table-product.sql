USE dosirak;

DROP TABLE IF EXISTS tbl_product CASCADE;
CREATE TABLE IF NOT EXISTS tbl_product(
    PRODUCT_CODE    INT(255) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    PRODUCT_NAME    VARCHAR(20) UNIQUE                  NOT NULL,
    product_price   INTEGER(20)                         NOT NULL,
    product_status  VARCHAR(20)                         NOT NULL,
    product_summary VARCHAR(20)                         NOT NULL,
    product_category_code int(10) NOT NULL ,
    FOREIGN KEY (product_category_code) REFERENCES tbl_product_category(product_main_category_code)
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS tbl_Nav(
    NAV_NAME VARCHAR(255),
    NAV_INFO VARCHAR(255)
)ENGINE = INNODB;

INSERT INTO tbl_product (PRODUCT_NAME, product_price, product_status, product_summary, product_category_code)
VALUES
    ('봄맛 도시락', 13000, '판매중', '맛난거', 2),
    ('옛날 도시락', 12000, '판매중', '옛날맛 그대로~', 2),
    ('수라상 도시락', 23000, '판매중', '한상 푸짐!', 2),
    ('돼지감자소스 가자미구이', 12000, '판매중', '건강한 한상을!', 2),
    ('전복내장솥밥&닭곰탕', 12000, '판매중', '솥밥의 감칠맛과 식감!', 2),
    ('오야꼬동&소고기 렌틸콩 오크라볶음', 12000, '판매중', '건강한 감칠맛!', 2),
    ('돌솥 매콤낙지 비빔밥', 12000, '판매중', '쫄깃한 낙지에 매콤함을!', 4),
    ('진저포크구이&겨자부추무침', 9800, '판매중', '육즙 가득한 구이 요리', 4),
    ('매운 돼지고기찜&느타리버섯 소불고기', 12000, '판매중', '입맛 돋우는 매콤함!', 4),
    ('오징어 제육볶음&소고기 파래조림', 12000, '판매중', '건강한 포만감!', 4),
    ('새나물 도시락', 12000, '판매중', '새싹과 같이 상쾌한 하루', 5),
    ('약밥 도시락 1주 식단 5종, 10개', 36800, '판매중', '한주동안 건강하게!', 5),
    ('소고기샤브전골&부추잡채', 13000, '판매중', '저민 소고기와 신선한 채소를 듬뿍!', 5),
    ('한우우거지해장국&해물부추전 세트', 12000, '판매중', '개운하고 깔끔한 맛', 5),
    ('순한 마파두부덮밥&돼지고기 짜장', 14000, '판매중', '색다른 중화풍 미식여행!', 6),
    ('토마토포크스튜', 12000, '판매중', '마지막 한입까지 깔끔하게!', 6),
    ('명란버터솥밥', 12000, '판매중', '김치 양념이 쏙 배어 깊고 진한 맛', 6),
    ('녹차불고기 해초쌈&두부 고사리조림', 12000, '판매중', '바다의 맛과 향이 입안 가득!', 6),
    ('우삼겹깍두기볶음밥', 12000, '판매중', '남녀노소 누구나 좋아할 볶음밥!', 6),
    ('나물 도시락', 13000, '판매중', '나물의 향취가 배!', 7),
    ('투움바쉬림프', 12000, '판매중', '근사한 식사!', 7),
    ('중화풍 마늘종 치킨', 12000, '판매중', '근사한 중화풍 한 상!', 7),
    ('경장육사&춘빙', 12000, '판매중', '담백하고 건강하게', 7),
    ('흑후추 소불고기', 12000, '판매중', '듬뿍 뿌려 짜릿하게 퍼지는 진한 향!', 7),
    ('크래미 샐러드', 6900, '판매중', '크레미에 레몬 드레싱!', 8),
    ('훈제 닭가슴살', 4000, '판매중', '담백함 위로 짭조름한 향미!', 9);

DROP TABLE IF EXISTS tbl_product_category CASCADE;
CREATE TABLE IF NOT EXISTS tbl_product_category(
    product_main_category_code     INT(255) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    product_main_category_name     VARCHAR(20)                  NOT NULL,
    product_sub_category_code INT(255)                         ,
    FOREIGN KEY (product_sub_category_code) REFERENCES tbl_product_category (product_main_category_code)
) ENGINE = INNODB;
INSERT INTO tbl_product_category VALUES ('1','건강 도시락',null);
INSERT INTO tbl_product_category VALUES ('2','정성 도시락',null);
INSERT INTO tbl_product_category VALUES ('3','간편식',null);
INSERT INTO tbl_product_category VALUES ('4','암환자 회복식단','1');
INSERT INTO tbl_product_category VALUES ('5','신장 관리식단','1');
INSERT INTO tbl_product_category VALUES ('6','혈압 관리식단','1');
INSERT INTO tbl_product_category VALUES ('7','혈당 관리식단','1');
INSERT INTO tbl_product_category VALUES ('8','샐러드','3');
INSERT INTO tbl_product_category VALUES ('9','닭 가슴살','3');


DROP TABLE IF EXISTS tbl_detail CASCADE;
CREATE TABLE IF NOT EXISTS tbl_detail(
    detailitem_count INT(255)           NOT NULL,
    detailitem_code  VARCHAR(20) UNIQUE NOT NULL,
    suitbox_code     INT(20)            NOT NULL,
    detail_code      int(20) primary key,
    order_code       INT(12)            not null,
    FOREIGN KEY (order_code) REFERENCES tbl_order (order_code)
) ENGINE = INNODB;

DROP TABLE IF EXISTS tbl_order CASCADE;
CREATE TABLE IF NOT EXISTS tbl_order(
    order_code      INT(12) primary key NOT NULL,
    order_status    VARCHAR(5) UNIQUE   NOT NULL,
    order_recipient VARCHAR(5)          NOT NULL,
    order_contact   int(20) NOT NULL ,
    oder_address VARCHAR(100) NOT NULL ,
    user_id VARCHAR(20) not null ,
    FOREIGN KEY (user_id) REFERENCES USER (ID)
) ENGINE = INNODB;
drop table product_img;
CREATE TABLE IF NOT EXISTS PRODUCT_IMG (
                                           IMG_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '이미지 코드',
                                           PRODUCT_CODE INT COMMENT '상품 코드',
                                           SAVED_NAME VARCHAR(255) NOT NULL COMMENT '저장이름 코드',
                                           SAVE_PATH VARCHAR(255) NOT NULL COMMENT '저장 경로',
                                           FOREIGN KEY (PRODUCT_CODE) REFERENCES tbl_product(PRODUCT_CODE)
)AUTO_INCREMENT = 70007001 COMMENT '이미지 파일';
INSERT INTO PRODUCT_IMG (PRODUCT_CODE, SAVED_NAME, SAVE_PATH)
VALUES
    (80, 'befd7462-119e-44a8-bffe-4b86bc508f1d.png', 'C:/Dosirak/original/productUpload'),
    (82, 'f8a9597f-bb2e-455d-9f68-2a49d35fad8a.png', 'C:/Dosirak/original/productUpload'),
    (82, 'ffe713e5-0c20-4989-ab45-539c47450454.PNG', 'C:/Dosirak/original/productUpload'),
    (83, 'df8a51fb-2701-4dd3-8294-c5a42ac060d9.png', 'C:/Dosirak/original/productUpload'),
    (84, 'ab246f39-752f-454b-9660-4ffcbede045c.PNG', 'C:/Dosirak/original/productUpload'),
    (84, 'a354ab8e-2fcf-4038-a29a-ccd7abd97687.PNG', 'C:/Dosirak/original/productUpload'),
    (85, '451beda3-b05b-4343-b066-6137af604659.png', 'C:/Dosirak/original/productUpload'),
    (86, '2aea79a6-b10c-455c-928f-1ebafd53c7c6.PNG', 'C:/Dosirak/original/productUpload'),
    (86, '8a46ceb8-b472-4505-913d-32b1515a6095.PNG', 'C:/Dosirak/original/productUpload'),
    (87, '787561cf-81fb-4e33-84f8-fdbeb9ddce95.PNG', 'C:/Dosirak/original/productUpload'),
    (87, '7452ca40-7a37-455c-b569-b44d5ce99553.PNG', 'C:/Dosirak/original/productUpload'),
    (89, '2bef7fb9-edf9-4f57-815e-41470acde3f6.PNG', 'C:/Dosirak/original/productUpload'),
    (89, 'b08bf45d-1973-4d13-8e03-13a8993cd2c5.PNG', 'C:/Dosirak/original/productUpload'),
    (90, '10e2cb78-229f-461e-8feb-7fc754244b62.PNG', 'C:/Dosirak/original/productUpload'),
    (90, 'ba1ef5a3-5bc6-4612-b6c4-74a2b785c915.PNG', 'C:/Dosirak/original/productUpload'),
    (91, '2da828f7-2b4c-44d2-9008-8f9df26b3228.PNG', 'C:/Dosirak/original/productUpload'),
    (92, '0ea1e153-6714-4e8d-b492-8deea447d354.PNG', 'C:/Dosirak/original/productUpload'),
    (92, 'c0529d1e-9709-4a36-9070-5b2ca195a542.PNG', 'C:/Dosirak/original/productUpload'),
    (93, '37a28bf9-8711-4b12-b86c-d44873268911.PNG', 'C:/Dosirak/original/productUpload'),
    (93, 'ae91883a-377f-48f0-84a3-bac20274a782.PNG', 'C:/Dosirak/original/productUpload'),
    (94, '2da66355-fe8a-49b6-965a-16109e1fb2bd.PNG', 'C:/Dosirak/original/productUpload'),
    (94, '84e90c95-180f-4f4f-bf67-66d19d58f1b6.PNG', 'C:/Dosirak/original/productUpload'),
    (95, 'd968c7e8-cfb7-4592-b587-c8a11db8bd41.PNG', 'C:/Dosirak/original/productUpload'),
    (95, 'ea3ae706-d8b5-43a2-ae3d-5133623f6f78.PNG', 'C:/Dosirak/original/productUpload'),
    (96, '11589e77-3790-4ec2-8fca-9a94e44828c8.PNG', 'C:/Dosirak/original/productUpload'),
    (96, 'efa45712-f79a-4dec-9dd9-c8cb485ae3c4.PNG', 'C:/Dosirak/original/productUpload'),
    (97, 'ed4ff32d-9f79-43b3-84c7-73ec58e3a209.PNG', 'C:/Dosirak/original/productUpload'),
    (97, 'c8b06081-d3e7-4ffb-8d48-07a9c29ea65b.PNG', 'C:/Dosirak/original/productUpload'),
    (98, '0aaa1cef-74a7-4f41-8b39-ce0e7609e922.PNG', 'C:/Dosirak/original/productUpload'),
    (98, 'cbc97279-132f-44c7-bdf1-48ea62d0de53.PNG', 'C:/Dosirak/original/productUpload'),
    (99, '961d4956-ccf3-4294-8ab8-449306709720.PNG', 'C:/Dosirak/original/productUpload'),
    (99, '6a8ee71c-44e6-40bf-ac97-1af85447a285.PNG', 'C:/Dosirak/original/productUpload'),
    (100, '28467c5e-8673-4a04-a7bf-96710faf0755.PNG', 'C:/Dosirak/original/productUpload'),
    (100, 'ecc3d0b1-04d8-4cb0-8825-26ef7d76806e.PNG', 'C:/Dosirak/original/productUpload'),
    (101, '3f3330e1-6479-4556-a2f9-da1d590e9262.PNG', 'C:/Dosirak/original/productUpload'),
    (101, '00f53e2f-207e-4a4e-b5f3-bb5849abd90b.PNG', 'C:/Dosirak/original/productUpload'),
    (102, '81a797c2-76a1-4dfd-b6df-61f98d92297b.PNG', 'C:/Dosirak/original/productUpload'),
    (102, '060bf7db-1024-4e58-a985-c923fdaac99a.PNG', 'C:/Dosirak/original/productUpload'),
    (103, 'acbddc61-5804-4048-a8f5-0142d7a14abe.PNG', 'C:/Dosirak/original/productUpload'),
    (103, '20872084-6a3b-4d7c-9bcd-94fb240858e7.PNG', 'C:/Dosirak/original/productUpload'),
    (104, 'db7eb2e1-0810-40a0-9a58-abc8a6b543b3.PNG', 'C:/Dosirak/original/productUpload'),
    (104, '17293e3d-c8af-46f3-aa8d-dabd4b5f8907.PNG', 'C:/Dosirak/original/productUpload'),
    (105, '55509841-d678-4658-85f4-ee7e22bf8fdf.PNG', 'C:/Dosirak/original/productUpload'),
    (105, 'c8f29aaf-62b2-4193-9456-cdfff6a6477f.PNG', 'C:/Dosirak/original/productUpload'),
    (106, '121f1fe4-be40-431f-954b-1bb63368ff47.PNG', 'C:/Dosirak/original/productUpload'),
    (106, '51489e10-0f16-45e3-b5e3-61b99377931d.PNG', 'C:/Dosirak/original/productUpload');


USE DOSIRAK;
DROP TABLE IF EXISTS ASK CASCADE;

CREATE TABLE IF NOT EXISTS ASK (
                                   ASK_CODE INT AUTO_INCREMENT KEY COMMENT '문의코드',
                                   ASK_TITLE VARCHAR(225) NOT NULL COMMENT '문의제목',
                                   ASK_CONTENT TEXT(500) NOT NULL COMMENT '문의내용',
                                   ASK_DATE DATE NOT NULL COMMENT '문의날짜',
                                   USER_ID VARCHAR(20) NOT NULL COMMENT '회원아이디',
                                   ASK_EDITDATE DATE COMMENT '수정일시',
                                   ASK_DELETE BOOLEAN COMMENT '삭제여부',
                                   ASK_CATEGORY_CODE INT(5) COMMENT '문의분류코드',
                                   foreign key (USER_ID) references USER (ID),
                                   foreign key (ASK_CATEGORY_CODE) references ask_category (ASK_CATEGORY_CODE)
) ENGINE=INNODB COMMENT '1대1문의';

INSERT INTO ASK (ASK_CODE, ASK_TITLE, ASK_CONTENT, ASK_DATE, USER_ID,ASK_EDITDATE, ASK_DELETE, ASK_CATEGORY_CODE) VALUES
                                                                                                         (1,'문의합니다.','문의합니다.','2024-01-01','starry2','2024-01-02',0,1);



USE DOSIRAK;
DROP TABLE IF EXISTS ASK_CATEGORY CASCADE;

CREATE TABLE IF NOT EXISTS ASK_CATEGORY (
                                            ASK_CATEGORY_CODE INT(20) PRIMARY KEY COMMENT '문의분류코드',
                                            ASK_CATEGORY_NAME VARCHAR(50) NOT NULL COMMENT '문의분류이름'
) ENGINE=INNODB COMMENT '문의분류';

insert into ask_category (ask_category_code, ask_category_name) values
                                                                    (1, '회원'),
                                                                    (2, '주문/결제'),
                                                                    (3, '배송/반품'),
                                                                    (4, '교환/취소/환불'),
                                                                    (5, '서비스/기타');


INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID)
VALUES
    (30003001, 'O', 'cool12'),
    (30003002, 'C', 'don789'),
    (30003003, 'X', 'gaonkim44'),
    (30003004, 'O', 'gayu99'),
    (30003005, 'C', 'haunoh98'),
    (30003006, 'O', 'hdonguk1'),
    (30003007, 'X', 'hkwang88'),
    (30003008, 'O', 'hohwan45'),
    (30003009, 'C', 'jhyukoh10'),
    (30003010, 'O', 'jihlim77'),
    (30003011, 'C', 'jihyun1'),
    (30003012, 'X', 'jinwo21'),
    (30003013, 'O', 'jiwon98'),
    (30003014, 'C', 'jiwoo2'),
    (30003015, 'X', 'jiwoon21'),
    (30003016, 'O', 'jiyo999'),
    (30003017, 'C', 'jmin56'),
    (30003018, 'X', 'juaan123'),
    (30003019, 'O', 'junho25'),
    (30003020, 'C', 'jwbaek99');

INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID, ORDER_RECIPIENT, ORDER_CONTACT, ORDER_ADDRESS1, ORDER_ADDRESS2, ORDER_ADDRESS3)
VALUES
    (30003021, 'O', 'cool12', '최승현', '01023456789', '48058', '부산광역시 해운대구 해운대로 77', '405호'),
    (30003022, 'C', 'don789', '신동우', '01012345678', '42156', '울산광역시 중구 성남로 876', '102호'),
    (30003023, 'X', 'gaonkim44', '김가온', '01098765432', '12345', '서울특별시 강남구 강남대로 777', '403호'),
    (30003024, 'O', 'gayu99', '윤가연', '01087654321', '30123', '세종특별자치시 조치원읍 용두로 444', '303호'),
    (30003025, 'C', 'haunoh98', '오하은', '01098765432', '41234', '경기도 파주시 금릉로 666', '202호'),
    (30003026, 'O', 'hdonguk1', '한동욱', '01098765432', '44708', '울산광역시 남구 삼산로 22', '301호'),
    (30003027, 'X', 'hkwang88', '곽영훈', '01098765432', '41232', '부산광역시 사하구 다대로 987', '201호'),
    (30003028, 'O', 'hohwan45', '안준호', '01098765432', '07507', '서울특별시 강서구 양천로 9', '101호'),
    (30003029, 'C', 'jhyukoh10', '오준혁', '01098765432', '30123', '세종특별자치시 나성로 555', '202호'),
    (30003030, 'O', 'jihlim77', '임지혜', '01087654321', '12345', '경기도 의정부시 평화로 777', '501호'),
    (30003031, 'C', 'jihyun1', '김지현', '01087654321', '41123', '경기도 고양시 덕양구 화정로 777', '201호'),
    (30003032, 'X', 'jinwo21', '손진우', '01034567890', '30077', '세종특별자치시 세종로 333', '202호'),
    (30003033, 'O', 'jiwon98', '한지원', '01065432187', '07508', '서울특별시 강서구 양천로 9', '401호'),
    (30003034, 'C', 'jiwoo2', '최지우', '01087654321', '60123', '부산광역시 연제구 중앙대로 111', '502호'),
    (30003035, 'X', 'jiwoon21', '곽지원', '01098765432', '30123', '대전광역시 중구 대종로 333', '102호'),
    (30003036, 'O', 'jiyo999', '백지윤', '01087654321', '61187', '부산광역시 동래구 충렬대로 111', '401호'),
    (30003037, 'C', 'jmin56', '정민석', '01054321678', '12345', '인천광역시 연수구 송도대로 123번길 8', '501호'),
    (30003038, 'X', 'juaan123', '안주아', '01098764567', '41234', '경기도 안산시 단원구 고잔로 888', '101호'),
    (30003039, 'O', 'junho25', '이준호', '01098765432', '16654', '경기도 수원시 영통구 매탄로 67번길 21', '201호'),
    (30003040, 'C', 'jwbaek99', '백준원', '01087654321', '41267', '대구광역시 수성구 수성로 321', '303호');

INSERT INTO DELIVERY (ORDER_CODE, DELIVERY_CODE, DELIVERY_STATUS)
VALUES
    (30003001, 50005001, 'P'),
    (30003002, 50005002, 'I'),
    (30003003, 50005003, 'C'),
    (30003004, 50005004, 'D'),
    (30003005, 50005005, 'P'),
    (30003006, 50005006, 'I'),
    (30003007, 50005007, 'C'),
    (30003008, 50005008, 'D'),
    (30003009, 50005009, 'P'),
    (30003010, 50005010, 'I'),
    (30003011, 50005011, 'C'),
    (30003012, 50005012, 'D'),
    (30003013, 50005013, 'P'),
    (30003014, 50005014, 'I'),
    (30003015, 50005015, 'C'),
    (30003016, 50005016, 'D'),
    (30003017, 50005017, 'P'),
    (30003018, 50005018, 'I'),
    (30003019, 50005019, 'C'),
    (30003020, 50005020, 'D'),
    (30003021, 50005021, 'P'),
    (30003022, 50005022, 'I'),
    (30003023, 50005023, 'C'),
    (30003024, 50005024, 'D'),
    (30003025, 50005025, 'P'),
    (30003026, 50005026, 'I'),
    (30003027, 50005027, 'C'),
    (30003028, 50005028, 'D'),
    (30003029, 50005029, 'P'),
    (30003030, 50005030, 'I'),
    (30003031, 50005031, 'C'),
    (30003032, 50005032, 'D'),
    (30003033, 50005033, 'P'),
    (30003034, 50005034, 'I'),
    (30003035, 50005035, 'C'),
    (30003036, 50005036, 'D'),
    (30003037, 50005037, 'P'),
    (30003038, 50005038, 'I'),
    (30003039, 50005039, 'C'),
    (30003040, 50005040, 'D');



CREATE TABLE IF NOT EXISTS review (
                                      review_code INT AUTO_INCREMENT COMMENT '리뷰코드',
                                      review_title VARCHAR(255) NOT NULL COMMENT '리뷰제목',
                                      review_content VARCHAR(255) NOT NULL COMMENT '리뷰내용',
                                      user_id VARCHAR(20) COMMENT '회원아이디',
                                      review_editdate DATE  COMMENT '수정일시',
                                      review_delete VARCHAR(2) DEFAULT 'N' NOT NULL  COMMENT '삭제여부',
                                      detail_code INT NOT NULL COMMENT '주문상세코드',
                                      review_date DATE NOT NULL COMMENT '리뷰날짜',
                                      PRIMARY KEY (review_code) ,
                                      FOREIGN KEY (user_id) REFERENCES USER(ID),
                                      FOREIGN KEY (detail_code) REFERENCES detail(detail_code)
) ENGINE=INNODB;
drop table detail;
CREATE TABLE IF NOT EXISTS DETAIL (
                                      DETAIL_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '상세 주문 코드',
                                      DETAIL_STATUS VARCHAR(1) DEFAULT 'O' CHECK( DETAIL_STATUS IN ('O', 'X')) COMMENT '주문 상세 상태',
                                      DETAILITEM_COUNT INT NOT NULL COMMENT '상세 주문 수량',
                                      PRODUCT_CODE INT COMMENT '상세 상품 코드',
                                      SUITBOX_CODE INT COMMENT '상세 맞춤 상품 코드',
                                      ORDER_CODE INT NOT NULL COMMENT '주문 코드',
                                      FOREIGN KEY (PRODUCT_CODE) REFERENCES tbl_product(PRODUCT_CODE),
                                      FOREIGN KEY (ORDER_CODE) REFERENCES `ORDER`(ORDER_CODE)
)AUTO_INCREMENT = 60006001 COMMENT '주문상세';
-- 완료 O: Complete
-- 취소 X: Canceled




INSERT INTO detail (DETAIL_CODE, DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUE ('600060011','O','5','3','30003011');
INSERT INTO detail (DETAIL_CODE, DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUE ('600060012','O','5','3','30003012');
INSERT INTO detail (DETAIL_CODE, DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUE ('600060013','O','5','3','30003013');
INSERT INTO detail (DETAIL_CODE, DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUE ('600060014','O','5','3','30003014');
INSERT INTO detail (DETAIL_CODE, DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUE ('600060015','O','5','3','30003015');


INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID) VALUE ('30003011','O','junho25');
INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID) VALUE ('30003012','O','junho25');
INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID) VALUE ('30003013','O','junho25');
INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID) VALUE ('30003014','O','junho25');
INSERT INTO `ORDER` (ORDER_CODE, ORDER_STATUS, ID) VALUE ('30003015','O','junho25');


INSERT INTO review (review_title, review_content, user_id, detail_code, review_date) VALUE ('이미지 등록 테스트','이미지 등록 테스트','junho25','600060011','2012-04-21');
INSERT INTO review (review_title, review_content, user_id, detail_code, review_date) VALUE ('이미지 등록 테스트','이미지 등록 테스트','junho25','600060012','2012-04-21');
INSERT INTO review (review_title, review_content, user_id, detail_code, review_date) VALUE ('이미지 등록 테스트','이미지 등록 테스트','junho25','600060013','2012-04-21');
INSERT INTO review (review_title, review_content, user_id, detail_code, review_date) VALUE ('이미지 등록 테스트','이미지 등록 테스트','junho25','600060014','2012-04-21');
INSERT INTO review (review_title, review_content, user_id, detail_code, review_date) VALUE ('이미지 등록 테스트','이미지 등록 테스트','junho25','600060015','2012-04-21');