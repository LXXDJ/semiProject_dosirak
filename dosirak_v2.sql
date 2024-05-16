DROP DATABASE IF EXISTS DOSIRAK;
CREATE DATABASE DOSIRAK;
USE DOSIRAK;
DROP TABLE IF EXISTS ADMIN CASCADE;
DROP TABLE IF EXISTS USER CASCADE;

CREATE TABLE IF NOT EXISTS ADMIN (
    ID VARCHAR(20) PRIMARY KEY COMMENT '관리자아이디',
    NAME VARCHAR(5) NOT NULL COMMENT '이름',
    BIRTH DATE COMMENT '생년월일',
    GENDER CHAR COMMENT '성별',
    CONTACT VARCHAR(5) COMMENT '내선번호',
    EMAIL VARCHAR(50) NOT NULL COMMENT '이메일',
    DEPARTMENT VARCHAR(10) COMMENT '부서',
    POSITION VARCHAR(10) COMMENT '직급',
    AUTHORITY CHAR NOT NULL COMMENT '권한등급' DEFAULT 3,
    PWD VARCHAR(255) UNIQUE NOT NULL COMMENT '비밀번호',
    JOINDATE DATE NOT NULL COMMENT '입사날짜',
    WITHDRAWAL BOOLEAN NOT NULL COMMENT '퇴직여부' DEFAULT FALSE,
    ROLE VARCHAR(50) NOT NULL COMMENT '사용자구분' DEFAULT 'ADMIN'
) ENGINE=INNODB COMMENT '관리자';

INSERT INTO ADMIN (ID, NAME, BIRTH, GENDER, CONTACT, EMAIL, DEPARTMENT, POSITION, AUTHORITY, PWD, JOINDATE, WITHDRAWAL, ROLE) VALUES
('choijihyun7', '최지현', '1975-02-10', '여', '101', 'choijihyun7@gmail.com', '마케팅', '팀장', '2', '$2a$10$Un1IY9KPrmNH.Dc3c7dQ.e1DQTH8IZErLi4L4MCv/2SOUq0FYA4se', '2021-04-12', FALSE, 'ADMIN'),
('hanyeeun5', '한예은', '1998-05-25', '여', '104', 'hanyeeun5@gmail.com', '마케팅', '팀원', '3', '$2a$10$kG4kMTVOijM1yW3YaxO1sOpm/6tQ.khie7XWv.1yjLSce/y2W1dU.', '2023-10-23', FALSE, 'ADMIN'),
('hhwo146', '홍현우', '1970-06-30', '남', '400', 'hhwo146@naver.com', '인사재무', '임원', '1', '$2a$10$rhWYjJFJwazvWRqDBrp.Lus1t1jSCkyJthDgfBNfENX3RHyzXAite', '2020-06-07', FALSE, 'ADMIN'),
('hwangyunseo9', '황윤서', '1994-08-15', '여', '203', 'hwangyunseo9@daum.net', '운영', '팀원', '3', '$2a$10$BIwiyW0k6ozFwghjqRPZcetLxrHEWKlJL3A6ziHQOVWjDHJdSiJPi', '2022-04-23', FALSE, 'ADMIN'),
('imjunho67', '임준호', '1993-08-08', '남', '403', 'imjunho67@naver.com', '인사재무', '팀원', '3', '$2a$10$QjlGH.huZo0zxlkNeKix6OlALvHJ25Tyzo6GzvS5Sm3f7IyVYF32.', '2021-10-11', FALSE, 'ADMIN'),
('imseongmin82', '임성민', '1992-08-25', '남', '404', 'imseongmin82@daum.net', '인사재무', '팀원', '3', '$2a$10$dUrEbTmrjpKkdnbPluRA6eRhrjv7yHsl0WTZGcgjfUTLHY3Rc6F0u', '2021-04-23', FALSE, 'ADMIN'),
('jeongseongwoo14', '정성우', '1973-06-20', '남', '401', 'jeongseongwoo14@naver.com', '인사재무', '팀장', '2', '$2a$10$L.WufiCzVWsGjl.6Kx./FeOpldZuLPW46XGgPeo.FC1/SgkPAHASG', '2020-05-25', FALSE, 'ADMIN'),
('jeongseoyeon11', '정서연', '1985-06-15', '여', '302', 'jeongseoyeon11@gmail.com', '고객서비스', '부서장', '2', '$2a$10$b1Ew/FbLdkcKuVuv4dnqKOfgUK0u8iuRbOGYvpHLOW0m3VO7ce3S6', '2017-06-10', FALSE, 'ADMIN'),
('jmsevwx4', '정민서', '1976-09-25', '여', '500', 'jmsevwx4@naver.com', '시스템', '임원', '1', '$2a$10$CkgsgJ81QACem01RJv6oqekubwQbAnNX8G3JliXyqMkZFjYy7I5Qu', '2009-03-21', FALSE, 'ADMIN'),
('kanghaeun99', '강하은', '1983-02-15', '여', '502', 'kanghaeun99@naver.com', '시스템', '부서장', '2', '$2a$10$fROuVZ8Nh9LtGuGjvi3jHerpbYLUarhnkFPI9JhEBIW2CQ0XGHova', '2010-07-01', FALSE, 'ADMIN'),
('kimdoyoon12', '김도윤', '1991-11-20', '남', '504', 'kimdoyoon12@daum.net', '시스템', '팀원', '3', '$2a$10$37OjgDAkLCTLK8bKFiZZY.7yo65T00UmxsQDUqJnpHd24zaO8zacK', '2023-03-18', FALSE, 'ADMIN'),
('kimminjun34', '김민준', '1985-08-30', '남', '202', 'kimminjun34@naver.com', '운영', '부서장', '2', '$2a$10$axa0VVJlMxNR126tAfb.f.JthnNrMbM5u1faohjjqqKwfa36CDW4S', '2006-02-15', FALSE, 'ADMIN'),
('kjiy198', '김지연', '1975-05-01', '여', '100', 'kjiy198@naver.com', '마케팅', '임원', '1', '$2a$10$oHNzIO03/qsNEKaJw13zJuQqfMKO1csX4pOjW1oyc6oNukE82inmy', '2014-09-04', FALSE, 'ADMIN'),
('leejiwon88', '이지원', '1991-06-08', '여', '103', 'leejiwon88@daum.net', '마케팅', '팀원', '3', '$2a$10$MeoVpoiLQxASvm8pKa9Ok./ouuzRumsuzM5hJeabYJtOJnApdhIw6', '2011-01-12', FALSE, 'ADMIN'),
('leeseojin22', '이서진', '1980-10-30', '남', '501', 'leeseojin22@gmail.com', '시스템', '팀장', '2', '$2a$10$ZMZ04MUZh5GYVTJukA5XsuuqTHD6NokIDyEfnCHWXiK06sjxwWN96', '2010-12-10', FALSE, 'ADMIN'),
('ly2824h8', '이서연', '1978-11-20', '남', '300', 'ly2824h8@naver.com', '고객서비스', '임원', '1', '$2a$10$wvTAml/cIGpxMmGLamiOvOspxfCqmySIWvyQ6LYLZZGdX9rpcgBvS', '2009-11-08', FALSE, 'ADMIN'),
('moonjihun3', '문지훈', '1974-10-12', '남', '402', 'moonjihun3@gmail.com', '인사재무', '부서장', '2', '$2a$10$POqLfUoIPYYPh4oEWzVk6uQqr7Sx2cyr3cE3sROyiTumDTDWUagzy', '2011-09-24', FALSE, 'ADMIN'),
('ojiwon77', '오지원', '1997-07-03', '남', '204', 'ojiwon77@naver.com', '운영', '팀원', '3', '$2a$10$fgovX18vircQzzzEJwQVD.WPQu4SnY8anYiezfcXbIKwp96/kM7z6', '2010-01-25', FALSE, 'ADMIN'),
('parkjiyeon1', '박지연', '1983-04-22', '여', '102', 'parkjiyeon1@naver.com', '마케팅', '부서장', '2', '$2a$10$.juD4WsGTOBeL3pNqJkowuuDjmves8uzGwuZqV0C9VkM3X/BwcrdS', '2008-10-09', FALSE, 'ADMIN'),
('parkjunho92', '박준호', '1982-08-10', '남', '201', 'parkjunho92@naver.com', '운영', '팀장', '2', '$2a$10$Ri6frvYamxBsFdsOPZFAwOpJJ.KhaC7t8J8AwjR8wu5wBZO8liTE2', '2009-07-15', FALSE, 'ADMIN'),
('pmji37', '박민지', '1972-08-15', '여', '200', 'pmji37@naver.com', '운영', '임원', '1', '$2a$10$2CkSuDH/7lZRskg8.diVD.YTaYqkRFp8CQ6SRVwWdnbsvGAc683BK', '2011-03-21', FALSE, 'ADMIN'),
('seojiwoo23', '서지우', '1992-10-30', '남', '303', 'seojiwoo23@daum.net', '고객서비스', '팀원', '3', '$2a$10$OIylpLbh4xqbYAofAMV0Ru871OTOdAVCsf2NwfqA20EaNtnOmYf6m', '2010-07-19', FALSE, 'ADMIN'),
('sinminseo8', '신민서', '1996-04-23', '여', '304', 'sinminseo8@gmail.com', '고객서비스', '팀원', '3', '$2a$10$FDODUbEzinVcOJOVuHdrhu3VgfpXxTHz/DYG/Ag3zaOOOeMEx1Gd.', '2009-11-11', FALSE, 'ADMIN'),
('sonjimin44', '손지민', '1978-12-05', '여', '301', 'sonjimin44@naver.com', '고객서비스', '팀장', '2', '$2a$10$HJrx6isBbbNNROuEuKJmHe8yuZu3z4n9RgpO9IZ8FvIJ1XJXyPjyO', '2011-02-03', FALSE, 'ADMIN'),
('yoonseoyeon6', '윤서연', '1992-05-05', '여', '503', 'yoonseoyeon6@naver.com', '시스템', '팀원', '3', '$2a$10$bEAvfO9NXRelA3TVa8Un7O8BsC9lnB9138sRET0UodL8QxM8b.3yW', '2010-01-17', FALSE, 'ADMIN');

CREATE TABLE IF NOT EXISTS USER (
    ID VARCHAR(20) UNIQUE NOT NULL COMMENT '회원아이디',
    NAME VARCHAR(5) NOT NULL COMMENT '이름',
    BIRTH DATE NOT NULL COMMENT '생년월일',
    GENDER CHAR NOT NULL COMMENT '성별',
    PHONE VARCHAR(20) NOT NULL COMMENT '휴대폰번호',
    EMAIL VARCHAR(50) UNIQUE NOT NULL COMMENT '이메일',
    ADDRESS1 VARCHAR(50) COMMENT '주소1',
    ADDRESS2 VARCHAR(50) COMMENT '주소2',
    ADDRESS3 VARCHAR(50) COMMENT '주소3',
    AGREE VARCHAR(10) COMMENT '마케팅동의',
    PWD VARCHAR(255) NOT NULL COMMENT '비밀번호',
    JOINDATE DATE NOT NULL COMMENT '가입날짜',
    WITHDRAWAL BOOLEAN NOT NULL COMMENT '탈퇴여부' DEFAULT FALSE,
    ROLE VARCHAR(50) NOT NULL COMMENT '사용자구분' DEFAULT 'USER'
) ENGINE=INNODB COMMENT '회원';

INSERT INTO USER (ID, NAME, BIRTH, GENDER, PHONE, EMAIL, ADDRESS1, ADDRESS2, ADDRESS3, AGREE, PWD, JOINDATE, WITHDRAWAL, ROLE) VALUES
('cool12', '최승현', '1990-03-29', '남', '01023456789', 'cool12@nate.com', '48058', '부산광역시 해운대구 해운대로 77', '405호', '문자, 이메일', '$2a$10$4XV/8bY3TLHvxJmH7h6f4.DED8JmYm3EXwLkgpvLHpsyQ/lkcI/3q', '2024-05-02', 0, 'USER'),
('don789', '신동우', '1982-08-17', '남', '01012345678', 'don789@naver.com', '42156', '울산광역시 중구 성남로 876', '102호', '문자, 이메일', '$2a$10$WRUi07pZ5xwFk69tNMjYPOh2WwN8IYTxHElHFXBuVSUfd8fW90LIW', '2024-05-02', 0, 'USER'),
('gaonkim44', '김가온', '1981-10-25', '여', '01098765432', 'gaonkim44@naver.com', '12345', '서울특별시 강남구 강남대로 777', '403호', '문자', '$2a$10$Zo1hGy2sKPDNGYgakHqm7uqVMaS994MtkhKSET68R/tfVv0mUOjc2', '2024-04-26', 0, 'USER'),
('gayu99', '윤가연', '1981-01-15', '여', '01087654321', 'gayu99@naver.com', '30123', '세종특별자치시 조치원읍 용두로 444', '303호', '문자, 이메일', '$2a$10$EsT/Xl4PrbvAWKNAce0QueHJC1VfwKKanDyFuMneyH6lp1rH50/qy', '2024-04-26', 0, 'USER'),
('haunoh98', '오하은', '1987-04-20', '여', '01087654321', 'haunoh98@gmail.com', '41234', '경기도 파주시 금릉로 666', '202호', '문자, 이메일', '$2a$10$UBp3TrIy5JVMXBT11G61HupaOO8jXQeuFLQ5iwYuvewd5Xuv/psOe', '2024-04-26', 0, 'USER'),
('hdonguk1', '한동욱', '1972-04-05', '남', '01098761234', 'hdonguk1@naver.com', '44708', '울산광역시 남구 삼산로 22', '301호', '이메일', '$2a$10$hLLq5mGixNMzaDkUYv93tuEGOLlJdyHrtGavimQuKvPLMr3YYOKri', '2024-04-27', 0, 'USER'),
('hkwang88', '곽영훈', '1989-06-07', '남', '01098765432', 'hkwang88@daum.net', '41232', '부산광역시 사하구 다대로 987', '201호', '문자', '$2a$10$2/cHN1FyKLw2PPNcz6L2NuF.y4n2YsD5YSzXGN6a/nieOgBkRxirG', '2024-04-27', 0, 'USER'),
('hohwan45', '안준호', '1992-07-19', '남', '01098765432', 'hohwan45@gmail.com', '07507', '서울특별시 강서구 양천로 9', '101호', '이메일', '$2a$10$H3KAxjNFvr5AjWML6WWRg.P2Bkl2Ng5qUiJ/j.ok/N3qYS861Krly', '2024-04-27', 0, 'USER'),
('jhyukoh10', '오준혁', '1978-03-03', '남', '01098765432', 'jhyukoh10@hanmail.net', '30123', '세종특별자치시 나성로 555', '202호', '이메일', '$2a$10$7o6YCbEqKSalNjXJrf/xW.PhX.P7NCxq7stBpc4FLT56XlHntYDhW', '2024-04-27', 0, 'USER'),
('jihlim77', '임지혜', '1979-12-08', '여', '01087654321', 'jihlim77@gmail.com', '12345', '경기도 의정부시 평화로 777', '501호', '문자, 이메일', '$2a$10$9PXXlo0R4MfhsxMzbceKXOiEi16XJHreZdK5zF0bmlRVuV6/bKQcS', '2024-04-27', 0, 'USER'),
('jihyun1', '김지현', '1990-09-04', '여', '01087654321', 'jihyun1@daum.net', '41123', '경기도 고양시 덕양구 화정로 777', '201호', '문자', '$2a$10$jQb8H5rTEsebHVmdSPWUSuJCS7UCHHFAFY.JiKl1ZEYMpj64GqX7K', '2024-04-28', 0, 'USER'),
('jinwo21', '손진우', '1983-11-11', '남', '01034567890', 'jinwo21@daum.net', '30077', '세종특별자치시 세종로 333', '202호', '이메일', '$2a$10$CcIFdWxi6yHj0IRIgvpSzegG9a5a9u0HjedRLfSPu0ZVx6wObReDG', '2024-04-28', 0, 'USER'),
('jiwon98', '한지원', '1975-03-07', '여', '01065432187', 'jiwon98@gmail.com', '12156', '경기도 안산시 상록구 반월로 555', '102호', '문자', '$2a$10$OtXF19MG4v.zR/e4cheCCukgw6FJgH9pdE/oTU8fHdQVHaaIHkFbW', '2024-04-28', 0, 'USER'),
('jiwoo2', '최지우', '1992-06-09', '여', '01087654321', 'jiwoo2@naver.com', '60123', '부산광역시 연제구 중앙대로 111', '502호', '문자, 이메일', '$2a$10$hc7/0HDV11u9oawK3/06SOwhZ.vTcbuYEyUo.OiIUzpKIikXhIwK.', '2024-04-28', 0, 'USER'),
('jiwoon21', '곽지원', '1982-08-18', '여', '01098765432', 'jiwoon21@gmail.com', '30123', '대전광역시 중구 대종로 333', '102호', '문자', '$2a$10$iCyCd9gqyvPZcOXxjVWPme4w1lN1Zu6NGvDjXtK7ROj2DHqQyDy7K', '2024-04-28', 0, 'USER'),
('jiyo999', '백지윤', '1984-07-26', '여', '01087654321', 'jiyo999@naver.com', '61187', '부산광역시 동래구 충렬대로 111', '401호', '문자, 이메일', '$2a$10$N9XKTYeD7U7RnUfraF6G0.Zm9Rzk7MXQDe6DuMlVLY3iQjfrLmBaK', '2024-04-29', 0, 'USER'),
('jmin56', '정민석', '1985-09-07', '남', '01054321678', 'jmin56@gmail.com', '12345', '인천광역시 연수구 송도대로 123번길 8', '501호', '문자', '$2a$10$xkpOtLvlgjzX3xXMIMqkL.tEWz6cz.pW7F7un4ZZ9Dmquz5XSLJJe', '2024-04-29', 0, 'USER'),
('juaan123', '안주아', '1976-02-03', '여', '01098764567', 'juaan123@gmail.com', '41234', '경기도 안산시 단원구 고잔로 888', '101호', '이메일', '$2a$10$Cr1u6p2TYLkmPKW/9md8Tur5bzdzLhqCrp6pVe0E.F5HrsPlFAoUG', '2024-04-29', 0, 'USER'),
('junho25', '이준호', '1988-05-02', '남', '01098765432', 'junho25@naver.com', '16654', '경기도 수원시 영통구 매탄로 67번길 21', '201호', '문자, 이메일', '$2a$10$Cwj6cUfJhQOqm4olfmCKPOdhqkwOW9OPrao19Y6giMjfM0gwOc8PW', '2024-04-29', 0, 'USER'),
('jwbaek99', '백준원', '1974-11-09', '남', '01087654321', 'jwbaek99@gmail.com', '41267', '대구광역시 수성구 수성로 321', '303호', '문자, 이메일', '$2a$10$EvyP31rRCU8EaQeZwsXlE.d1SkomkYzZ3qEHthhSWXLWweDiOhRTq', '2024-04-29', 0, 'USER'),
('kmg34', '김민기', '1986-10-12', '남', '01087654321', 'kmg34@naver.com', '41167', '경기도 수원시 장안구 권광로 666', '303호', '문자', '$2a$10$IYuTqTbZ0wM6Co7y/wiUSOKZ9lfnr1D91Mk5PLjblRKlIuY6jvVMm', '2024-04-29', 0, 'USER'),
('ldongh34', '임동현', '1995-06-30', '남', '01087654321', 'ldongh34@gmail.com', '43123', '경기도 안양시 동안구 시민대로 456번길 33', '401호', '문자, 이메일', '$2a$10$zYqujVK4br6OjTNGLOleieL0ve3l.f7hjk.iGHJA4N/f2x/vrC90e', '2024-04-30', 0, 'USER'),
('mjjeon45', '전민재', '1991-12-25', '남', '01076543218', 'mjjeon45@naver.com', '42176', '인천광역시 남동구 구월로 789', '102호', '문자', '$2a$10$vQghXb06X0/SAqCj3lfobupIAr9lxlLv4M2uEe3ri8P/p7q1XS8D.', '2024-04-30', 0, 'USER'),
('seohyun3', '정서현', '1986-11-22', '여', '01043218765', 'seohyun3@gmail.com', '30276', '대전광역시 서구 둔산로 222', '101호', '문자', '$2a$10$16xhcpU/Uf330goHifgQauRTFtx5YFh18YBAiDM0dJFZHL6VJeUgS', '2024-04-30', 0, 'USER'),
('seokk67', '강준서', '1979-12-01', '남', '01067895432', 'seokk67@naver.com', '61002', '광주광역시 서구 농성로 55', '203호', '이메일', '$2a$10$6uZlhjFLhnR5b1PahYEDAuRAl3/VD6kPKly.Z1ZKWPcbjhv6lxFlS', '2024-04-30', 0, 'USER'),
('seoyun90', '박서연', '1977-05-14', '여', '01098765432', 'seoyun90@gmail.com', '40876', '인천광역시 부평구 부평대로 999', '202호', '문자', '$2a$10$JFwSOEGXIIpcZEUf/1HsWuHAjjxwO5KGS2MvT3aQ3Ix7tRY161TV2', '2024-04-30', 0, 'USER'),
('sjseoh71', '서승진', '1997-04-30', '남', '01087654321', 'sjseoh71@gmail.com', '41234', '대전광역시 동구 동서대로 234', '404호', '문자, 이메일', '$2a$10$onhm9uZOAitgjaOPxwMDW.ZZTEgqbDXKWzBkhL4pSTMpgSygzYWu.', '2024-04-30', 0, 'USER'),
('smh555', '황성민', '1987-02-14', '남', '01043218765', 'smh555@naver.com', '05571', '서울 송파구 올림픽로 8', '102호', '문자', '$2a$10$Zi3490XOo9wPuNhqU0r63eiG/50WVvgzDoxxd2NHXu5e5HHHkZa6C', '2024-05-02', 0, 'USER'),
('soomi22', '강수민', '1996-07-31', '여', '01098765432', 'soomi22@hanmail.net', '61187', '울산광역시 북구 화봉로 333', '401호', '문자, 이메일', '$2a$10$DQ6jCm8qLxBZSEzAj0gz1eus/rGJSEpaACC1Fpn3NxS6ByGBIqZKy', '2024-05-02', 0, 'USER'),
('soyhwang8', '황소연', '1994-10-02', '여', '01012345678', 'soyhwang8@daum.net', '41123', '경기도 시흥시 마유로 888', '302호', '문자, 이메일', '$2a$10$fe1PrzJI4bE/1qLHKIQM2.hGv0//nHK6ec6b.RPi5LYUIfFPDZHLS', '2024-05-02', 0, 'USER'),
('starry2', '김성우', '1993-07-15', '남', '01012345678', 'starry2@gmail.com', '06133', '서울 강남구 테헤란로 123번길 45', '101호', '문자', '$2a$10$1a95mXsTFpRtOLjA6oScj.402sx9BrIOe0LyhBXAWJFDNYZKPK8te', '2024-05-02', 0, 'USER'),
('subini34', '전수빈', '1993-05-03', '여', '01098761234', 'subini34@daum.net', '40123', '인천광역시 서구 연희로 222', '201호', '이메일', '$2a$10$JqMzek9dU1ZBn9cR416WvOtf9QK5kqbVQ25wmJ62N4Tedey7oLQsC', '2024-05-02', 0, 'USER'),
('susu45', '신수아', '1976-06-27', '여', '01098765432', 'susu45@hanmail.net', '30123', '세종특별자치시 조치원읍 용두로 555', '102호', '이메일', '$2a$10$1igiK6Wz0l0wa3LTgTkSO.kbeZCCOUOgbH3VcWCh1gDobAPYSL5dq', '2024-05-02', 0, 'USER'),
('yeeun78', '이예은', '1983-02-28', '여', '01023456789', 'yeeun78@naver.com', '42156', '대구광역시 달서구 월배로 888', '404호', '이메일', '$2a$10$vAg8OrVbPg5tQFaA3sgbNu3snGspHZ5p6A/Pi2PinJyXsl4kSotC2', '2024-05-01', 0, 'USER'),
('yerin33', '서예린', '1991-03-12', '여', '01087654321', 'yerin33@naver.com', '61188', '울산광역시 울주군 온산읍 공단로 444', '303호', '문자, 이메일', '$2a$10$WI4.y9s5YMF60PA44/oMKOV7526TW1ulYZ/W6SniI.et9pb4HNkRK', '2024-05-01', 0, 'USER'),
('yjpark11', '박영준', '1976-10-18', '남', '01087654321', 'yjpark11@daum.net', '41967', '대구광역시 중구 국채보상로 100', '302호', '문자', '$2a$10$E5jA67iWnaIwO4G4BLEUZOlOGO5mdrAlr0DNWadHd1d9GGIAq6mAi', '2024-05-01', 0, 'USER'),
('yjy987', '윤준영', '1998-08-23', '남', '01087654321', 'yjy987@hanmail.net', '34119', '대전광역시 유성구 대학로 145', '102호', '문자', '$2a$10$Rtdhzwbd6gWYOJAiA5wmQuIY9wW7nZQq7lIog.ZQtCu72ym/GeFW6', '2024-05-01', 0, 'USER'),
('yoons22', '조윤서', '1999-08-11', '여', '01098765432', 'yoons22@gmail.com', '41256', '대구광역시 남구 중앙대로 999', '103호', '문자', '$2a$10$k077g9Hio5fJzfpx6BeIrek5XmkpZf0OND6Q4CVbNANHHRwALcVZK', '2024-05-01', 0, 'USER'),
('young876', '조영호', '1980-01-20', '남', '01098765432', 'young876@hanmail.net', '41235', '경기도 고양시 일산동구 호수로 567', '205호', '문자', '$2a$10$c8.9Ts6Wok7zsOTQj/jX3uCy3EqPYmpUoIYwEONRSn.s22JHFfkBq', '2024-05-01', 0, 'USER'),
('yujin56', '손유진', '1988-04-17', '여', '01098765432', 'yujin56@naver.com', '03083', '서울특별시 종로구 창경궁로 666', '201호', '문자', '$2a$10$fF9Wzfku0MzKHzIo56U0quvn3sCQNu0CSf9kzHBptsVOp3CTqqOva', '2024-05-01', 0, 'USER');
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
CREATE TABLE IF NOT EXISTS ANSWER (
ANSWER_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '답변코드',
ANSWER_STATUS BOOLEAN NOT NULL COMMENT '답변상태',
ANSWER_CONTENT TEXT(500) NOT NULL COMMENT '답변내용',
ANSWER_DATE DATE NOT NULL COMMENT '답변날짜',
ADMIN_ID VARCHAR(20) COMMENT '관리자아이디',
REVIEW_CODE INT(20) COMMENT '리뷰코드',
ASK_CODE INT COMMENT '문의코드',
foreign key (ADMIN_ID) references ADMIN (ID),
foreign key (ASK_CODE) references ASK (ASK_CODE)
) ENGINE=INNODB COMMENT '답변';

CREATE TABLE IF NOT EXISTS CUSTOMER_IMG (
                                            IMG_CODE INT(20) AUTO_INCREMENT PRIMARY KEY COMMENT '이미지코드',
    REF_ASK_CODE INT COMMENT '문의코드',
    ORIGINAL_NAME varchar(50) COMMENT '파일이름',
    SAVED_NAME VARCHAR(225) COMMENT '저장된이름',
    SAVE_PATH VARCHAR(225) COMMENT '저장경로',
    FILE_TYPE VARCHAR(50) COMMENT '파일형식',
    THUMB_NAIL_PATH varchar(225) COMMENT '썸네일저장경로',
    ATTACHMENT_STATUS CHAR COMMENT '저장상태',
    foreign key (REF_ASK_CODE) references ASK (ASK_CODE)
    ) ENGINE=INNODB COMMENT '이미지파일';
CREATE TABLE IF NOT EXISTS NOTICE (
NOTICE_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '공지코드',
NOTICE_TITLE VARCHAR(225) NOT NULL COMMENT '공지제목',
NOTICE_CONTENT TEXT(500) NOT NULL COMMENT '공지내용',
NOTICE_DATE DATE COMMENT '공지날짜',
ADMIN_ID VARCHAR(20) COMMENT '관리자아이디',
foreign key (ADMIN_ID) references ADMIN (ID)
) ENGINE=INNODB COMMENT '공지사항';

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, ADMIN_ID) VALUES
(1,'공지사항 페이지가 오픈 되었습니다.','도시樂의 홈페이지가 오픈되었습니다.\r\n앞으로 많은 이용 부탁드립니다.','2024-04-23','choijihyun7'),
(2,'배송 휴무 일정 안내','2023년 4월 배송 휴무 일정 안내드립니다.\r\n고객님의 양해 부탁드리며, 아래 내용 확인하셔서 이용에 불편 없으시기를 바랍니다.','2024-04-23','choijihyun7'),
(3,'이벤트 당첨자 안내','안녕하세요. 고객님. 도시樂 입니다.\r\n지난번 진행하였던 구매 이벤트 당첨 안내 드립니다.\r\n이벤트에 참여해주신 많은 고객 분들에게 감사드립니다.\r\n\r\n앞으로도 많은 참여 부탁드립니다.','2024-04-23','choijihyun7'),
(4,'서비스 점검 안내','안녕하세요. 고객님. 도시樂 입니다.\r\n저희 홈페이지를 이용해주시는 고객님께 항상 감사드립니다.\r\n아래의 내용으로 시스템 점검 계획을 안내 드리니, 이용에 참고 부탁드립니다.\r\n\r\n2024월 1월 1일 오전 0시~오전 5시\r\n\r\n','2024-04-23','choijihyun7'),
(5,'가입 이벤트 당첨자 안내','안녕하세요. 고객님. 도시樂 입니다.\r\n지난번 진행하였던 가입 이벤트 당첨 안내 드립니다.\r\n이벤트에 참여해주신 많은 고객 분들에게 감사드립니다.\r\n\r\n앞으로도 많은 참여 부탁드립니다.','2024-04-23','choijihyun7'),
(6,'가입 이벤트 당첨자 안내 (추가)','추가 당첨자를 안내 드립니다.','2024-04-23','choijihyun7'),
(7,'홈페이지 리뉴얼 예정 안내','안녕하세요. 도시樂입니다.\r\n홈페이지를 리뉴얼 할 예정입니다.\r\n\r\n일정 참고 부탁드립니다.','2024-04-23','choijihyun7'),
(8,'카카오페이 결제 안내','안녕하세요. 도시樂 입니다.\r\n카카오페이 결제를 도입할 예정입니다.\r\n\r\n많은 관심 부탁드리겠습니다.','2024-04-23','choijihyun7'),
(9,'결제 일시 중단 안내','안녕하세요.\r\n홈페이지 점검을 위해 결제가 일시적으로 중단될 예정입니다.\r\n일정 참고 부탁드리겠습니다.','2024-04-23','choijihyun7'),
(10,'배송지 변경 안내','안녕하세요. 배송지 변경에 관한 많은 문의가 들어오고 있습니다.\r\n이와 같은 사유는 고객센터 이용 부탁드리겠습니다.\r\n\r\n감사합니다.','2024-04-23','choijihyun7'),
(11,'도시樂 명절 휴무 안내','안녕하세요. 도시樂 입니다.\r\n명절 기간동안 모든 서비스가 중단되오니 참고 부탁드립니다.','2024-04-23','choijihyun7');

CREATE TABLE IF NOT EXISTS QNA (
QNA_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '질문코드',
QNA_TITLE VARCHAR(225) NOT NULL COMMENT '질문제목',
QNA_ANSWER TEXT(1000) NOT NULL COMMENT '답변내용',
ADMIN_ID VARCHAR(20) COMMENT '관리자아이디',
ASK_CATEGORY_CODE INT(5) NOT NULL COMMENT '문의분류코드',
foreign key (ADMIN_ID) references ADMIN (ID),
foreign key (ASK_CATEGORY_CODE) references ask_category (ASK_CATEGORY_CODE)
) ENGINE=INNODB COMMENT '자주묻는질문';

INSERT INTO QNA (QNA_CODE, QNA_TITLE, QNA_ANSWER, ADMIN_ID, ASK_CATEGORY_CODE) VALUES
(1,'아이디, 비밀번호를 잊어버렸습니다','아이디, 비밀번호 찾기 안내\r\n\r\n하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.\r\n\r\n(PC) 홈페이지 상단 [로그인] > 화면 아래 [아이디 찾기], [비밀번호 찾기]\r\n\r\n[참고]\r\n가입 시 기재한 메일 주소가 기억나지 않으시거나 오류가 발생하는 경우 고객센터로 문의 바랍니다.\r\n상담 시에는 고객님의 개인정보보호를 위해 기존에 사용하시던 비밀번호는 안내가 불가하며, 개인정보 확인 후 임시 비밀번호를 설정해드립니다.','choijihyun7',1),
(2,'개명을 하여 회원정보의 이름을 바꾸고 싶습니다.','개명으로 인한 회원정보 수정 방법\r\n\r\n-개명하신 경우, 홈페이지 로그인 후 [마이페이지]에서 수정하실 수 있습니다.\r\n-마이페이지 > 회원정보 수정 > 재로그인 > 이름 변경\r\n\r\n[참고]\r\n아이디는 변경이 불가합니다.','choijihyun7',1),
(3,'회원정보를 바꾸고 싶습니다.','[회원정보 변경 안내]\r\n\r\n- 아래 경로를 통해 회원정보를 직접 변경하실 수 있습니다.\r\n\r\n- 수정가능 항목 : 비밀번호/이름/이메일주소/휴대폰번호/생년월일/성별 (아이디 불가)\r\n- (PC) 마이페이지 > 회원정보 수정\r\n\r\n[참고]\r\n- 배송지 수정은 [마이페이지>배송지 관리]에서 직접 수정하실 수 있습니다.','choijihyun7',1),
(4,'회원가입에 제한이 있나요?','회원 가입 시, 별도의 조건은 없습니다.\r\n회원가입 후 다양한 혜택과 상품을 만나보세요!','choijihyun7',1),
(5,'회원 탈퇴 후, 재가입이 가능한가요?','회원탈퇴 후, 3개월 이내에는 동일한 연락처로 가입이 불가능합니다.','choijihyun7',1),
(6,'구매하는 방법이 궁금합니다.','희망 상품 클릭 > 수량 체크 > 장바구니 담기 > 장바구니 확인 > 결제\r\n\r\n장바구니에 담지 않고 바로 결제도 가능합니다.','choijihyun7',2),
(7,'전화로 주문할 수 있나요?','전화(유선상) 주문 불가\r\n\r\n- 전화주문은 불가하며, 현재 인터넷으로만 주문 가능합니다.\r\n- 별도의 오프라인 매장을 보유하고 있지 않습니다.','choijihyun7',2),
(8,'주문이 안 됩니다.','시스템 이상으로 주문이 불가한 경우\r\n\r\n모든 인터넷창을 종료 > 홈페이지 재접속 > 재로그인 진행\r\n\r\n[참고]\r\n공용 PC의 경우 높은 방화벽으로 설정되어 있어, 결제가 어려울 수 있습니다.\r\n결제에 필요한 콘텐츠 사용 및 프로그램을 전부 허용해주셔야 합니다.','choijihyun7',2),
(9,'제가 해외에 살고 있는데 주문이 가능한가요?','해외로 주문/배송은 불가한 점 참고 바랍니다.','choijihyun7',2),
(10,'무통장 입금(현금 구매) 가능한가요?','무통장 입금(현금) 구매 불가 안내\r\n\r\n-결제시간과 입금시간이 다를 경우, 구매하시고자 하는 상품의 빠른 품절로 주문한 상품을 받지 못하는 사례가 발생할 수 있어 무통장입금은 미거래하고 있습니다.\r\n-대신 카드결제, 카카오페이 등 간편결제 시스템을 제공하고 있는 점 참고 바랍니다. ','choijihyun7',2),
(11,'배송지역 검색 시, 배송 불가지역으로 조회됩니다.','신도시/신규 지번 등으로 일부 배송 불가지역이 확인될 수 있으며,\r\n이런 경우 1대1 문의하기를 이용하여 문의를 남겨주시면 감사하겠습니다.','choijihyun7',3),
(12,'배송이 지연된다고 알림을 받았어요','먼저 이용에 불편을 드려 죄송합니다.\r\n\r\n고객님께 약속 드린 배송시간을 준수하기 위해 최선을 다하고 있으나 하기와 같은 이유로 간혹, 부득이하게 배송이 지연되는 점 양해 말씀 드립니다.\r\n\r\n-악천후, 예기치 못한 도로교통 상황(ex. 사고, 도로침수, 정체)\r\n\r\n배송이 지연되는 경우, 해당 사실과 도착예정시간을 고객님께 문자로 안내 도와드리고 있으며 최대한 신속하고 안전하게 배송드릴 수 있도록 노력하겠습니다.','choijihyun7',3),
(13,'회사, 관공서, 학교, 기숙사, 시장, 공단 등으로 배송받고 싶은데 가능한가요?','일부 장소는 출입에 제한이 발생하여 원활한 배송이 어렵습니다. \r\n아래 장소 참고 부탁드립니다.\r\n\r\n- 관공서, 학교(기숙사), 회사, 시장, 백화점, 공단지역 등','choijihyun7',3),
(14,'배송 후에 배송완료 문자를 주나요?','배송 직후 문자가 전송됩니다. 홈페이지에서도 배송완료 내역을 확인할 수 있습니다.','choijihyun7',3),
(15,'택배배송 주문마감 시간이 변동될 수도 있나요?','주문마감시간은 변동되지 않고 한동안 그대로 유지됩니다. \r\n이와 관련한 서비스가 확장될 예정이므로 참고 부탁드립니다.','choijihyun7',3),
(16,'교환/반품 어떻게 진행되나요?','받으신 상품을 교환(반품) 하실 경우, \r\n교환 사유+문제가 발생한 부분을 확인할 수 있는 사진과 함께 \r\n1대1 문의하기로 문의 바랍니다.','choijihyun7',4),
(17,'교환/반품 진행 시, 배송비가 부과되나요?','단순변심에 의한 교환/반품 시 \r\n배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야 합니다.','choijihyun7',4),
(18,'주문을 취소하고 싶습니다.','주문 취소는 [주문 완료] 상태일 때만 가능합니다.\r\n\r\n주문내역에서 직접 취소가 가능하며, \r\n부득이 직접 취소가 어려운 상황일 경우 고객센터로 문의 바랍니다.\r\n\r\n배송이 시작된 [배송준비중] 단계부터는 취소가 제한되는 점 \r\n고객님들의 양해 부탁드립니다.','choijihyun7',4),
(19,'교환/반품 처리기간은 얼마나 걸리나요?','교환 및 반품의 처리 기간은 상품에 따라 다를 수 있으며, \r\n재고 유/무 여부(교환 시) 및 택배사 사정에 의해 처리 및 지연이 발생할 수 있습니다.\r\n\r\n- 교환/반품 : 회수 센터에 상품 도착 이후 영업일 기준 약 3일 소요','choijihyun7',4),
(20,'반품상품을 고객센터를 통하지 않고 제가 직접 택배로 보내도 되나요?','고객센터로 문의 후, 회수 안내를 받으시길 바랍니다.\r\n\r\n-상품출고 센터와 회수 물류센터가 다르므로 꼭 고객센터를 통해 접수 바랍니다.\r\n-절차를 통하지 않고 임의로 택배를 보내실 경우, 별도 안내없이 반송처리 되거나 상품이 분실될 위험이 있습니다.\r\n-고객센터로 문의 후, 절차에 따라 진행 부탁드립니다.','choijihyun7',4),
(21,'상품 후기는 어떻게 작성하나요?','배송완료일로부터 30일 동안 상품 후기를 작성하실 수 있습니다. \r\n(30일 경과 시, 후기 작성이 불가능합니다.)\r\n\r\n주문내역에서 구매확정 선택 후, 리뷰작성을 선택해주세요.','choijihyun7',5),
(22,'홈페이지 팝업창 해제를 꼭 해야하나요?','홈페이지에서는 고객님께 유용하고 중요한 정보를 팝업창을 통해 안내드리고 있습니다. (배송 휴무 안내 / 시스템 점검 / 이벤트 등)\r\n\r\n팝업차단을 해제하시면 더 많은 혜택과 쇼핑 기회를 누리실 수 있습니다.','choijihyun7',5),
(23,'장바구니에 담은 상품들은 계속 보존되나요?','상품을 담은 시점부터 최대 90일간 저장이 가능합니다. \r\n\r\n90일 동안 구매하지 않으실 경우, 순차로 장바구니에서 자동 소멸되오니 이용에 참고 부탁드립니다.','choijihyun7',5),
(24,'품절된 상품은 언제 재입고 되나요?','품절 상품들은 각각 재입고 기간이 달라 정확한 안내가 어렵습니다.\r\n이용에 참고 부탁드립니다.','choijihyun7',5),
(25,'1대1 게시판으로 문의 남기는 방법은 없나요?','하기 경로를 통해 문의/불만 내용을 남겨주시면 관리자가 확인하여 빠르게 도움 드리도록 하겠습니다.\r\n\r\n고객센터 > 1대1 문의하기\r\n\r\n[참고]\r\n제품 하자/제품 이상 등으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.','choijihyun7',5);

CREATE TABLE IF NOT EXISTS MENU
(
    menu_code         INT PRIMARY KEY AUTO_INCREMENT,
    menu_name         VARCHAR(20)                          NOT NULL,
    menu_category     ENUM ('rice','main','side','kimchi') NOT NULL,
    menu_extracash    INT                                  NOT NULL,
    menu_status       ENUM ('Y', 'S', 'N')                 NOT NULL,
    menu_carbo        FLOAT                                NOT NULL,
    menu_sugar        FLOAT                                NOT NULL,
    menu_protein      FLOAT                                NOT NULL,
    menu_fat          FLOAT                                NOT NULL,
    menu_saturatedfat FLOAT                                NOT NULL,
    menu_transfat     FLOAT                                NOT NULL,
    menu_cholesterol  FLOAT                                NOT NULL,
    menu_natrium      FLOAT                                NOT NULL,
    menu_calory       INTEGER                              NOT NULL
);

CREATE TABLE IF NOT EXISTS SUIT_BOX
(
    suitbox_code INT(10) AUTO_INCREMENT PRIMARY KEY,
    rice_code    INT NOT NULL,
    main_code    INT NOT NULL,
    side_code    INT NOT NULL,
    kimchi_code  INT NOT NULL,
    FOREIGN KEY (rice_code) REFERENCES MENU (menu_code),
    FOREIGN KEY (main_code) REFERENCES MENU (menu_code),
    FOREIGN KEY (side_code) REFERENCES MENU (menu_code),
    FOREIGN KEY (kimchi_code) REFERENCES MENU (menu_code)
);


-- MENU 테이블에 더미 데이터 삽입
-- rice 카테고리 더미 데이터
INSERT INTO MENU (menu_name, menu_category, menu_extracash, menu_status, menu_carbo, menu_sugar, menu_protein, menu_fat,
                  menu_saturatedfat, menu_transfat, menu_cholesterol, menu_natrium, menu_calory)
VALUES ('현미밥', 'rice', 0, 'Y', 40.0, 0.5, 3.0, 0.5, 0.1, 0.0, 0.0, 0.0, 200),
       ('보리밥', 'rice', 0, 'S', 45.0, 1.0, 3.5, 0.8, 0.2, 0.0, 0.0, 0.0, 220),
       ('검정콩밥', 'rice', 200, 'Y', 42.0, 0.8, 4.0, 0.6, 0.1, 0.0, 0.0, 0.0, 210),
       ('오곡밥', 'rice', 200, 'Y', 38.0, 0.7, 3.8, 0.4, 0.0, 0.0, 0.0, 0.0, 190),
       ('카무트밥', 'rice', 300, 'N', 40.0, 1.0, 3.5, 0.7, 0.1, 0.0, 0.0, 0.0, 210),
       ('기장밥', 'rice', 200, 'S', 43.0, 0.6, 4.2, 0.5, 0.1, 0.0, 0.0, 0.0, 200),
       ('귀리밥', 'rice', 200, 'S', 39.0, 0.4, 4.0, 0.5, 0.1, 0.0, 0.0, 0.0, 190),
       ('흑미밥', 'rice', 0, 'Y', 41.0, 0.6, 4.1, 0.6, 0.1, 0.0, 0.0, 0.0, 200),
       ('곤약밥', 'rice', 200, 'Y', 35.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 30),
-- main 카테고리
       ('갈비찜', 'main', 500, 'Y', 20.0, 5.0, 25.0, 15.0, 5.0, 0.0, 100.0, 1000.0, 400),
       ('함박스테이크', 'main', 0, 'N', 30.0, 2.0, 20.0, 15.0, 6.0, 0.0, 90.0, 800.0, 350),
       ('닭갈비', 'main', 200, 'S', 25.0, 10.0, 30.0, 10.0, 3.0, 0.0, 80.0, 1200.0, 380),
       ('고추장 삼겹살', 'main', 500, 'Y', 15.0, 3.0, 20.0, 25.0, 10.0, 0.0, 110.0, 1500.0, 450),
       ('생선까스', 'main', 200, 'S', 35.0, 2.0, 15.0, 20.0, 5.0, 0.0, 70.0, 900.0, 380),
       ('우삼겹숙주볶음', 'main', 200, 'Y', 20.0, 5.0, 25.0, 20.0, 8.0, 0.0, 120.0, 1300.0, 420),
       ('두부감자조림', 'main', 0, 'Y', 25.0, 5.0, 10.0, 15.0, 3.0, 0.0, 60.0, 800.0, 300),
       ('살치살 새우 찹스테이크', 'main', 700, 'Y', 25.0, 2.0, 30.0, 20.0, 7.0, 0.0, 100.0, 1100.0, 430),
       ('연어 스테이크', 'main', 1000, 'N', 20.0, 3.0, 30.0, 15.0, 4.0, 0.0, 80.0, 900.0, 380),
-- side 카테고리
       ('소고기 장조림', 'side', 300, 'N', 15.0, 5.0, 15.0, 10.0, 4.0, 0.0, 80.0, 900.0, 300),
       ('어묵 잔멸치 볶음', 'side', 0, 'S', 20.0, 3.0, 10.0, 5.0, 2.0, 0.0, 60.0, 800.0, 250),
       ('소시지 야채볶음', 'side', 200, 'S', 25.0, 2.0, 10.0, 15.0, 6.0, 0.0, 70.0, 1000.0, 320),
       ('동그랑땡', 'side', 0, 'Y', 30.0, 1.0, 15.0, 10.0, 3.0, 0.0, 50.0, 700.0, 280),
       ('호박전', 'side', 0, 'Y', 20.0, 3.0, 5.0, 10.0, 2.0, 0.0, 40.0, 600.0, 200),
       ('계란말이', 'side', 0, 'N', 10.0, 2.0, 10.0, 10.0, 2.0, 0.0, 90.0, 700.0, 250),
       ('깻잎 장아찌', 'side', 0, 'Y', 5.0, 1.0, 2.0, 5.0, 1.0, 0.0, 20.0, 300.0, 100),
       ('어묵 볶음', 'side', 0, 'Y', 25.0, 4.0, 8.0, 5.0, 2.0, 0.0, 40.0, 500.0, 220),
       ('감자채볶음', 'side', 0, 'S', 30.0, 2.0, 5.0, 10.0, 3.0, 0.0, 30.0, 400.0, 180),
       ('미나리무침', 'side', 0, 'Y', 10.0, 3.0, 3.0, 5.0, 1.0, 0.0, 20.0, 200.0, 80),
-- kimchi 카테고리
       ('배추김치', 'kimchi', 0, 'Y', 5.0, 2.0, 1.0, 0.5, 0.2, 0.0, 0.0, 1000.0, 30),
       ('깍두기', 'kimchi', 0, 'Y', 4.0, 1.5, 0.8, 0.3, 0.1, 0.0, 0.0, 900.0, 25),
       ('오이소박이', 'kimchi', 0, 'Y', 6.0, 3.0, 1.5, 0.7, 0.3, 0.0, 0.0, 1100.0, 35),
       ('갓김치', 'kimchi', 0, 'S', 4.0, 1.0, 1.0, 0.4, 0.2, 0.0, 0.0, 950.0, 30),
       ('나박김치', 'kimchi', 0, 'S', 5.0, 2.0, 1.2, 0.6, 0.3, 0.0, 0.0, 1000.0, 30),
       ('열무김치', 'kimchi', 0, 'Y', 4.0, 1.5, 1.0, 0.5, 0.2, 0.0, 0.0, 950.0, 30),
       ('무생채', 'kimchi', 0, 'N', 3.0, 1.0, 0.8, 0.3, 0.1, 0.0, 0.0, 850.0, 20),
       ('총각김치', 'kimchi', 0, 'Y', 5.0, 2.5, 1.0, 0.5, 0.2, 0.0, 0.0, 1000.0, 30);

-- SUIT_BOX 테이블에 더미 데이터 삽입
INSERT INTO SUIT_BOX (rice_code, main_code, side_code, kimchi_code)
VALUES (1, 15, 19, 34),
       (4, 12, 22, 35),
       (5, 13, 23, 32),
       (2, 12, 21, 31),
       (3, 11, 25, 36),
       (4, 17, 23, 33),
       (1, 13, 27, 34);
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
CREATE TABLE IF NOT EXISTS PRODUCT_IMG (
                                           IMG_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '이미지 코드',
                                           PRODUCT_CODE INT COMMENT '상품 코드',
                                           SAVED_NAME VARCHAR(255) NOT NULL COMMENT '저장이름 코드',
                                           SAVE_PATH VARCHAR(255) NOT NULL COMMENT '저장 경로',
                                           FOREIGN KEY (PRODUCT_CODE) REFERENCES tbl_product(PRODUCT_CODE)
)AUTO_INCREMENT = 70007001 COMMENT '이미지 파일';
    CREATE TABLE IF NOT EXISTS `ORDER` (
    ORDER_CODE INT PRIMARY KEY AUTO_INCREMENT COMMENT '주문 코드',
    ORDER_STATUS VARCHAR(1) DEFAULT 'O' CHECK(ORDER_STATUS IN ('O', 'X', 'C')) NOT NULL COMMENT '주문 상태',
    ID VARCHAR(20) NOT NULL COMMENT '사용자 ID',
    ORDER_RECIPIENT VARCHAR(5) COMMENT '수령인',
    ORDER_CONTACT VARCHAR(11) COMMENT '주문자 연락처',
    ORDER_ADDRESS1 VARCHAR(100) COMMENT '주문자 주소1',
    ORDER_ADDRESS2 VARCHAR(100) COMMENT '주문자 주소2',
    ORDER_ADDRESS3 VARCHAR(100) COMMENT '주문자 주소3',
    FOREIGN KEY (ID) REFERENCES USER (ID)
)AUTO_INCREMENT = 30003001 COMMENT '주문';
CREATE TABLE IF NOT EXISTS CART (
    CARTITEM_COUNT INT NOT NULL COMMENT '장바구니에 담긴 상품의 수량',
    ID VARCHAR(20) NOT NULL COMMENT '사용자 ID',
    PRODUCT_CODE INT COMMENT '상품 코드',
    SUITBOX_CODE INT COMMENT '맞춤 상품 코드',
    FOREIGN KEY (ID) REFERENCES USER(ID),
    FOREIGN KEY (PRODUCT_CODE) REFERENCES TBL_PRODUCT (PRODUCT_CODE),
    FOREIGN KEY (SUITBOX_CODE) REFERENCES SUIT_BOX (SUITBOX_CODE)
) COMMENT '장바구니';
CREATE TABLE IF NOT EXISTS PAY (
    ORDER_CODE INT NOT NULL COMMENT '주문 코드',
    PAY_PRICE INT NOT NULL COMMENT '결제 가격',
    PAY_DATE DATE NOT NULL COMMENT '결제 일자',
    PAY_STATUS VARCHAR(1) CHECK(PAY_STATUS IN ('O', 'F', 'X')) COMMENT '결제 상태',
    PAY_METHOD VARCHAR(7) NOT NULL COMMENT '결제 수단',
    FOREIGN KEY (ORDER_CODE) REFERENCES `ORDER` (ORDER_CODE)
) COMMENT '결제';
CREATE TABLE IF NOT EXISTS REFUND (
    REFUND_CODE INT PRIMARY KEY AUTO_INCREMENT COMMENT '환불 코드',
    ORDER_CODE INT NOT NULL COMMENT '주문 코드',
    REFUND_PRICE INT NOT NULL COMMENT '환불 가격',
    REFUND_DATE DATE NOT NULL COMMENT '환불 일자',
    REFUND_REASON VARCHAR(200) COMMENT '환불 이유',
    REFUND_STATUS VARCHAR(1) DEFAULT 'R' CHECK( REFUND_STATUS IN ('R', 'P', 'A', 'D')) COMMENT '환불 상태',
    FOREIGN KEY (ORDER_CODE) REFERENCES `ORDER` (ORDER_CODE)
)AUTO_INCREMENT = 40004001 COMMENT '환불';
CREATE TABLE IF NOT EXISTS DELIVERY (
    ORDER_CODE INT NOT NULL COMMENT '주문 코드',
    DELIVERY_CODE INT AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '배송 코드',
    DELIVERY_STATUS VARCHAR(7) DEFAULT 'P' CHECK ( DELIVERY_STATUS IN ('P', 'I', 'C', 'D')) NOT NULL COMMENT '배송 상태',
    FOREIGN KEY (ORDER_CODE) REFERENCES `ORDER` (ORDER_CODE)
)AUTO_INCREMENT = 50005001 COMMENT '배송';
CREATE TABLE IF NOT EXISTS DETAIL (
    DETAIL_CODE INT AUTO_INCREMENT PRIMARY KEY COMMENT '상세 주문 코드',
    DETAIL_STATUS VARCHAR(1) DEFAULT 'O' CHECK( DETAIL_STATUS IN ('O', 'X')) COMMENT '주문 상세 상태',
    DETAILITEM_COUNT INT NOT NULL COMMENT '상세 주문 수량',
    PRODUCT_CODE INT COMMENT '상품 코드',
    SUITBOX_CODE INT COMMENT '맞춤 상품 코드',
    ORDER_CODE INT NOT NULL COMMENT '주문 코드',
    FOREIGN KEY (PRODUCT_CODE) REFERENCES TBL_PRODUCT (PRODUCT_CODE),
    FOREIGN KEY (SUITBOX_CODE) REFERENCES SUIT_BOX (SUITBOX_CODE),
    FOREIGN KEY (ORDER_CODE) REFERENCES `ORDER` (ORDER_CODE)
)AUTO_INCREMENT = 60006001 COMMENT '주문상세';
INSERT INTO `ORDER` (ORDER_STATUS, ID, ORDER_RECIPIENT, ORDER_CONTACT, ORDER_ADDRESS1, ORDER_ADDRESS2, ORDER_ADDRESS3) VALUES
    ('O', 'cool12', '최승현', '01023456789', '48058', '부산광역시 해운대구 해운대로 77', '405호'),
    ('C', 'don789', '신동우', '01012345678', '42156', '울산광역시 중구 성남로 876', '102호'),
    ('X', 'gaonkim44', '김가온', '01098765432', '12345', '서울특별시 강남구 강남대로 777', '403호'),
    ('O', 'gayu99', '윤가연', '01087654321', '30123', '세종특별자치시 조치원읍 용두로 444', '303호'),
    ('O', 'haunoh98', '오하은', '01087654321', '41234', '경기도 파주시 금릉로 666', '202호'),
    ('O', 'hdonguk1', '한동욱', '01098761234', '44708', '울산광역시 남구 삼산로 22', '301호'),
    ('O', 'hkwang88', '곽영훈', '01098765432', '41232', '부산광역시 사하구 다대로 987', '201호'),
    ('O', 'hohwan45', '안준호', '01098765432', '07507', '서울특별시 강서구 양천로 9', '101호'),
    ('O', 'jhyukoh10', '오준혁', '01098765432', '30123', '세종특별자치시 나성로 555', '202호'),
    ('O', 'jihlim77', '임지혜', '01087654321', '12345', '경기도 의정부시 평화로 777', '501호'),
    ('O', 'jihyun1', '김지현', '01087654321', '41123', '경기도 고양시 덕양구 화정로 777', '201호'),
    ('O', 'jinwo21', '손진우', '01034567890', '30077', '세종특별자치시 세종로 333', '202호'),
    ('O', 'jiwon98', '한지원', '01065432187', '12156', '경기도 안산시 상록구 반월로 555', '102호'),
    ('O', 'jiwoo2', '최지우', '01087654321', '60123', '부산광역시 연제구 중앙대로 111', '502호'),
    ('O', 'jiwoon21', '곽지원', '01098765432', '30123', '대전광역시 중구 대종로 333', '102호'),
    ('O', 'jiyo999', '백지윤', '01087654321', '61187', '부산광역시 동래구 충렬대로 111', '401호'),
    ('O', 'jmin56', '정민석', '01054321678', '12345', '인천광역시 연수구 송도대로 123번길 8', '501호'),
    ('O', 'juaan123', '안주아', '01098764567', '41234', '경기도 안산시 단원구 고잔로 888', '101호'),
    ('O', 'junho25', '이준호', '01098765432', '16654', '경기도 수원시 영통구 매탄로 67번길 21', '201호'),
    ('O', 'jwbaek99', '백준원', '01087654321', '41267', '대구광역시 수성구 수성로 321', '303호'),
    ('O', 'kmg34', '김민기', '01087654321', '41167', '경기도 수원시 장안구 권광로 666', '303호'),
    ('O', 'ldongh34', '임동현', '01087654321', '43123', '경기도 안양시 동안구 시민대로 456번길 33', '401호'),
    ('O', 'mjjeon45', '전민재', '01076543218', '42176', '인천광역시 남동구 구월로 789', '102호'),
    ('O', 'seohyun3', '정서현', '01043218765', '30276', '대전광역시 서구 둔산로 222', '101호'),
    ('O', 'seokk67', '강준서', '01067895432', '61002', '광주광역시 서구 농성로 55', '203호'),
    ('O', 'seoyun90', '박서연', '01098765432', '40876', '인천광역시 부평구 부평대로 999', '202호'),
    ('O', 'sjseoh71', '서승진', '01087654321', '41234', '대전광역시 동구 동서대로 234', '404호'),
    ('O', 'smh555', '황성민', '01043218765', '05571', '서울 송파구 올림픽로 8', '102호'),
    ('O', 'soomi22', '강수민', '01098765432', '61187', '울산광역시 북구 화봉로 333', '401호'),
    ('O', 'soyhwang8', '황소연', '01012345678', '41123', '경기도 시흥시 마유로 888', '302호'),
    ('O', 'starry2', '김성우', '01012345678', '06133', '서울 강남구 테헤란로 123번길 45', '101호'),
    ('O', 'subini34', '전수빈', '01098761234', '40123', '인천광역시 서구 연희로 222', '201호'),
    ('O', 'susu45', '신수아', '01098765432', '30123', '세종특별자치시 조치원읍 용두로 555', '102호'),
    ('O', 'yeeun78', '이예은', '01023456789', '42156', '대구광역시 달서구 월배로 888', '404호'),
    ('O', 'yerin33', '서예린', '01087654321', '61188', '울산광역시 울주군 온산읍 공단로 444', '303호'),
    ('O', 'yjpark11', '박영준', '01087654321', '41967', '대구광역시 중구 국채보상로 100', '302호'),
    ('O', 'yjy987', '윤준영', '01087654321', '34119', '대전광역시 유성구 대학로 145', '102호'),
    ('O', 'yoons22', '조윤서', '01098765432', '41256', '대구광역시 남구 중앙대로 999', '103호'),
    ('O', 'young876', '조영호', '01098765432', '41235', '경기도 고양시 일산동구 호수로 567', '205호'),
    ('O', 'yujin56', '손유진', '01098765432', '03083', '서울특별시 종로구 창경궁로 666', '201호');



INSERT INTO PAY (ORDER_CODE, PAY_PRICE, PAY_DATE, PAY_STATUS, PAY_METHOD)
VALUES
    (30003001, 138000, '2024-04-15', 'O', '신용카드'),
    (30003002, 15500, '2024-04-16', 'O', '카카오페이'),
    (30003003, 223000, '2024-04-17', 'O', '신용카드'),
    (30003004, 72000, '2024-04-18', 'O', '신용카드'),
    (30003005, 235000, '2024-04-19', 'O', '카카오페이'),
    (30003006, 111500, '2024-04-20', 'O', '신용카드'),
    (30003007, 197500, '2024-04-21', 'O', '무통장입금'),
    (30003008, 186000, '2024-04-22', 'O', '카카오페이'),
    (30003009, 38000, '2024-04-23', 'O', '신용카드'),
    (30003010, 120000, '2024-04-24', 'O', '신용카드'),
    (30003011, 101500, '2024-04-25', 'O', '카카오페이'),
    (30003012, 59000, '2024-04-26', 'O', '신용카드'),
    (30003013, 60000, '2024-04-27', 'O', '무통장입금'),
    (30003014, 15000, '2024-04-28', 'O', '카카오페이'),
    (30003015, 160000, '2024-04-29', 'O', '신용카드'),
    (30003016, 57000, '2024-04-30', 'O', '신용카드'),
    (30003017, 74000, '2024-05-01', 'O', '카카오페이'),
    (30003018, 97000, '2024-05-02', 'O', '무통장입금'),
    (30003019, 76000, '2024-05-03', 'O', '신용카드'),
    (30003020, 123500, '2024-05-04', 'O', '카카오페이'),
    (30003021, 73000, '2024-05-05', 'O', '신용카드'),
    (30003022, 99000, '2024-05-06', 'O', '카카오페이'),
    (30003023, 54000, '2024-05-07', 'O', '신용카드'),
    (30003024, 145000, '2024-05-08', 'O', '무통장입금'),
    (30003025, 135000, '2024-05-09', 'O', '카카오페이'),
    (30003026, 156000, '2024-05-10', 'O', '신용카드'),
    (30003027, 128500, '2024-05-11', 'O', '카카오페이'),
    (30003028, 49000, '2024-05-12', 'O', '신용카드'),
    (30003029, 83000, '2024-05-13', 'O', '신용카드'),
    (30003030, 88000, '2024-05-14', 'O', '카카오페이'),
    (30003031, 11000, '2024-05-15', 'O', '신용카드'),
    (30003032, 146000, '2024-05-16', 'O', '카카오페이'),
    (30003033, 75000, '2024-05-17', 'O', '신용카드'),
    (30003034, 39000, '2024-05-18', 'O', '신용카드'),
    (30003035, 70000, '2024-05-19', 'O', '카카오페이'),
    (30003036, 88000, '2024-05-20', 'O', '신용카드'),
    (30003037, 147000, '2024-05-21', 'O', '신용카드'),
    (30003038, 113000, '2024-05-22', 'O', '카카오페이'),
    (30003039, 59000, '2024-05-23', 'O', '신용카드'),
    (30003040, 137000, '2024-05-24', 'O', '무통장입금');

INSERT INTO REFUND (ORDER_CODE, REFUND_PRICE, REFUND_DATE, REFUND_REASON, REFUND_STATUS) VALUES
    (30003001, 12000, '2024-04-20', '상품 불만족', 'R'),
    (30003003, 8000, '2024-04-21', '오배송', 'P'),
    (30003005, 10000, '2024-04-22', '고객 요청', 'A'),
    (30003008, 5000, '2024-04-23', '상품 파손', 'R'),
    (30003010, 15000, '2024-04-24', '상품 교체 요청', 'P'),
    (30003015, 6000, '2024-04-25', '고객 요청', 'A'),
    (30003018, 7000, '2024-04-26', '주문 취소', 'R'),
    (30003022, 9000, '2024-04-27', '상품 오배송', 'P'),
    (30003030, 13000, '2024-04-28', '상품 교체 요청', 'R'),
    (30003035, 11000, '2024-04-29', '상품 불만족', 'D');

INSERT INTO DELIVERY (ORDER_CODE, DELIVERY_STATUS) VALUES
    (30003001, 'P'),
    (30003002, 'I'),
    (30003003, 'C'),
    (30003004, 'P'),
    (30003005, 'D'),
    (30003006, 'C'),
    (30003007, 'I'),
    (30003008, 'P'),
    (30003009, 'C'),
    (30003010, 'P'),
    (30003011, 'D'),
    (30003012, 'I'),
    (30003013, 'C'),
    (30003014, 'P'),
    (30003015, 'I'),
    (30003016, 'C'),
    (30003017, 'D'),
    (30003018, 'P'),
    (30003019, 'I'),
    (30003020, 'C'),
    (30003021, 'D'),
    (30003022, 'I'),
    (30003023, 'C'),
    (30003024, 'P'),
    (30003025, 'I'),
    (30003026, 'C'),
    (30003027, 'D'),
    (30003028, 'I'),
    (30003029, 'C'),
    (30003030, 'P'),
    (30003031, 'I'),
    (30003032, 'C'),
    (30003033, 'P'),
    (30003034, 'I'),
    (30003035, 'C'),
    (30003036, 'D'),
    (30003037, 'I'),
    (30003038, 'P'),
    (30003039, 'C'),
    (30003040, 'D');


INSERT INTO DETAIL (DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUES
    ('O', 3, 8, 30003001),
    ('O', 2, 2, 30003001),
    ('X', 4, 13, 30003001),
    ('O', 1, 14, 30003001),
    ('O', 5, 8, 30003001),
    ('O', 3, 8, 30003002),
    ('O', 4, 2, 30003002),
    ('O', 2, 3, 30003002),
    ('O', 5, 4, 30003002),
    ('X', 1, 5, 30003002),
    ('O', 2, 8, 30003003),
    ('O', 3, 2, 30003003),
    ('X', 4, 3, 30003003),
    ('O', 1, 4, 30003003),
    ('O', 5, 5, 30003003),
    ('O', 4, 8, 30003004),
    ('O', 5, 2, 30003004),
    ('O', 1, 3, 30003004),
    ('O', 3, 4, 30003004),
    ('O', 2, 5, 30003004),
    ('O', 3, 8, 30003005),
    ('X', 4, 2, 30003005),
    ('O', 2, 3, 30003005),
    ('O', 5, 4, 30003005),
    ('O', 1, 5, 30003005),
    ('O', 5, 8, 30003006),
    ('O', 2, 2, 30003006),
    ('O', 4, 3, 30003006),
    ('O', 3, 4, 30003006),
    ('O', 1, 5, 30003006),
    ('O', 4, 8, 30003007),
    ('O', 3, 2, 30003007),
    ('O', 2, 3, 30003007),
    ('O', 1, 4, 30003007),
    ('O', 5, 5, 30003007),
    ('O', 1, 8, 30003008),
    ('O', 2, 2, 30003008),
    ('O', 5, 3, 30003008),
    ('O', 3, 4, 30003008),
    ('O', 4, 5, 30003008),
    ('O', 3, 8, 30003009),
    ('O', 1, 2, 30003009),
    ('O', 4, 3, 30003009),
    ('O', 5, 4, 30003009),
    ('X', 2, 5, 30003009),
    ('O', 1, 8, 30003010),
    ('O', 2, 2, 30003010),
    ('O', 3, 3, 30003010),
    ('O', 4, 4, 30003010),
    ('O', 5, 5, 30003010),
    ('O', 2, 8, 30003011),
    ('O', 3, 2, 30003011),
    ('O', 4, 3, 30003011),
    ('O', 5, 4, 30003011),
    ('O', 1, 5, 30003011),
    ('O', 5, 8, 30003012),
    ('O', 3, 2, 30003012),
    ('O', 2, 3, 30003012),
    ('O', 4, 4, 30003012),
    ('O', 1, 5, 30003012),
    ('O', 3, 8, 30003013),
    ('O', 4, 2, 30003013),
    ('O', 2, 3, 30003013),
    ('O', 1, 4, 30003013),
    ('O', 5, 5, 30003013),
    ('O', 5, 8, 30003014),
    ('O', 4, 2, 30003014),
    ('O', 3, 3, 30003014),
    ('O', 2, 4, 30003014),
    ('O', 1, 5, 30003014),
    ('O', 2, 8, 30003015),
    ('O', 3, 2, 30003015),
    ('O', 4, 3, 30003015),
    ('O', 1, 4, 30003015),
    ('O', 5, 5, 30003015),
    ('O', 3, 8, 30003016),
    ('O', 4, 2, 30003016),
    ('O', 2, 3, 30003016),
    ('O', 1, 4, 30003016),
    ('O', 5, 5, 30003016),
    ('O', 3, 8, 30003017),
    ('O', 4, 2, 30003017),
    ('O', 2, 3, 30003017),
    ('O', 1, 4, 30003017),
    ('O', 5, 5, 30003017),
    ('O', 3, 8, 30003018),
    ('O', 4, 2, 30003018),
    ('O', 2, 3, 30003018),
    ('O', 1, 4, 30003018),
    ('O', 5, 5, 30003018),
    ('O', 3, 8, 30003019),
    ('O', 4, 2, 30003019),
    ('O', 2, 3, 30003019),
    ('O', 1, 4, 30003019),
    ('O', 5, 5, 30003019),
    ('O', 3, 8, 30003020),
    ('O', 4, 2, 30003020),
    ('O', 2, 3, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 5, 5, 30003020),
    ('O', 3, 8, 30003021),
    ('O', 4, 2, 30003021),
    ('O', 2, 3, 30003021),
    ('O', 1, 4, 30003021),
    ('O', 5, 5, 30003021),
    ('O', 3, 8, 30003022),
    ('O', 4, 2, 30003022),
    ('O', 2, 3, 30003022),
    ('O', 1, 4, 30003022),
    ('O', 5, 5, 30003022),
    ('O', 3, 8, 30003023),
    ('O', 4, 2, 30003023),
    ('O', 2, 3, 30003023),
    ('O', 1, 4, 30003023),
    ('O', 5, 5, 30003023),
    ('O', 3, 8, 30003024),
    ('O', 4, 2, 30003024),
    ('O', 2, 3, 30003024),
    ('O', 1, 4, 30003024),
    ('O', 5, 5, 30003024),
    ('O', 3, 8, 30003025),
    ('O', 4, 2, 30003025),
    ('O', 2, 3, 30003025),
    ('O', 1, 4, 30003025),
    ('O', 5, 5, 30003025),
    ('O', 3, 8, 30003026),
    ('O', 4, 2, 30003026),
    ('O', 2, 3, 30003026),
    ('O', 1, 4, 30003026),
    ('O', 5, 5, 30003026),
    ('O', 3, 8, 30003027),
    ('O', 4, 2, 30003027),
    ('O', 2, 3, 30003027),
    ('O', 1, 4, 30003027),
    ('O', 5, 5, 30003027),
    ('O', 3, 8, 30003028),
    ('O', 4, 2, 30003028),
    ('O', 2, 3, 30003028),
    ('O', 1, 4, 30003028),
    ('O', 5, 5, 30003028),
    ('O', 3, 8, 30003029),
    ('O', 4, 2, 30003029),
    ('O', 2, 3, 30003029),
    ('O', 1, 4, 30003029),
    ('O', 5, 5, 30003029),
    ('O', 3, 8, 30003030),
    ('O', 4, 2, 30003030),
    ('O', 2, 3, 30003030),
    ('O', 1, 4, 30003030),
    ('O', 5, 5, 30003030),
    ('O', 3, 8, 30003031),
    ('O', 4, 2, 30003031),
    ('O', 2, 3, 30003031),
    ('O', 1, 4, 30003031),
    ('O', 5, 5, 30003031),
    ('O', 3, 8, 30003032),
    ('O', 4, 2, 30003032),
    ('O', 2, 3, 30003032),
    ('O', 1, 4, 30003032),
    ('O', 5, 5, 30003032),
    ('O', 3, 8, 30003033),
    ('O', 4, 2, 30003033),
    ('O', 2, 3, 30003033),
    ('O', 1, 4, 30003033),
    ('O', 5, 5, 30003033),
    ('O', 3, 8, 30003034),
    ('O', 4, 2, 30003034),
    ('O', 2, 3, 30003034),
    ('O', 1, 4, 30003034),
    ('O', 5, 8, 30003034),
    ('O', 3, 8, 30003035),
    ('O', 4, 2, 30003035),
    ('O', 2, 3, 30003035),
    ('O', 1, 4, 30003035),
    ('O', 5, 5, 30003035),
    ('O', 3, 8, 30003036),
    ('O', 4, 2, 30003036),
    ('O', 2, 3, 30003036),
    ('O', 1, 4, 30003036),
    ('O', 5, 8, 30003036),
    ('O', 3, 8, 30003037),
    ('O', 4, 2, 30003037),
    ('O', 2, 3, 30003037),
    ('O', 1, 4, 30003037),
    ('O', 5, 5, 30003037),
    ('O', 3, 8, 30003038),
    ('O', 4, 2, 30003038),
    ('O', 2, 3, 30003038),
    ('O', 1, 4, 30003038),
    ('O', 5, 5, 30003038),
    ('O', 3, 8, 30003039),
    ('O', 4, 2, 30003039),
    ('O', 2, 3, 30003039),
    ('O', 1, 4, 30003039),
    ('O', 5, 5, 30003039),
    ('O', 3, 8, 30003040),
    ('O', 4, 2, 30003040),
    ('O', 2, 3, 30003040),
    ('O', 1, 4, 30003040),
    ('O', 5, 5, 30003040);


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
CREATE TABLE VERIFY (
    VERIFYPAGE VARCHAR(255) NOT NULL,
    VERIFYCODE VARCHAR(255) NOT NULL,
    VERIFYTIME DATETIME NOT NULL
);
CREATE TABLE IF NOT EXISTS survey_version
(
    version_id      INT PRIMARY KEY AUTO_INCREMENT COMMENT '버전 식별코드',
    version_name    VARCHAR(255) NOT NULL COMMENT '버전 별칭',
    version_explain VARCHAR(40)  NOT NULL COMMENT '버전 설명',
    update_date     DATE         NOT NULL COMMENT '추가된 날짜',
    status          BOOLEAN      NOT NULL COMMENT '사용 상태'
);


-- survey_question 테이블 생성

CREATE TABLE IF NOT EXISTS survey_question
(
    question_id       INT AUTO_INCREMENT PRIMARY KEY COMMENT '질문 코드',
    version_id        INT         NOT NULL COMMENT '설문 버전',
    question_order    INT         NOT NULL COMMENT '질문 순서',
    question_text     VARCHAR(50) NOT NULL COMMENT '질문 내용',
    question_category CHAR(1)     NOT NULL CHECK (question_category IN ('C', 'P', 'F', 'W')) COMMENT '질문 분류(C, P, F, W)',
    FOREIGN KEY (version_id) REFERENCES survey_version (version_id)
);
-- survey_answer 테이블 생성
CREATE TABLE IF NOT EXISTS survey_answer
(
    answer_id    INT AUTO_INCREMENT PRIMARY KEY COMMENT '답변 코드',
    question_id  INT         NOT NULL COMMENT '질문 코드',
    answer_text  VARCHAR(30) NOT NULL COMMENT '답변 내용',
    answer_value INT         NOT NULL COMMENT '답변 값',
    FOREIGN KEY (question_id) REFERENCES survey_question (question_id)
);
-- survey_range 테이블 생성
CREATE TABLE IF NOT EXISTS survey_range
(
    version_id INT NOT NULL,
    category   CHAR(1) CHECK (category IN ('C', 'P', 'F', 'W')),
    range1     INT,
    range2     INT,
    range3     INT,
    range4     INT,
    PRIMARY KEY (version_id, category),
    FOREIGN KEY (version_id) REFERENCES survey_version (version_id),
    CHECK (range1 < range2 AND range2 < range3 AND range3 < range4)
);
-- survey_result 테이블 생성(더미데이터 X)
CREATE TABLE IF NOT EXISTS SURVEY_RESULT
(
    user_id               VARCHAR(20) NOT NULL,
    survey_height         DOUBLE      NOT NULL,
    survey_weight         DOUBLE      NOT NULL,
    survey_bmi            DOUBLE      NOT NULL,
    survey_age            INT         NOT NULL,
    survey_diet           VARCHAR(10) NOT NULL,
    survey_workout_score INT         NOT NULL,
    survey_carbo_score    INT         NOT NULL,
    survey_protein_score  INT         NOT NULL,
    survey_fat_score      INT         NOT NULL,
    survey_diabetes       BOOLEAN,
    survey_cancer         BOOLEAN,
    survey_kidney         BOOLEAN,
    survey_blood          BOOLEAN,
    survey_date           DATE,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES `USER` (id)
);
    CREATE TABLE IF NOT EXISTS REVIEW_IMG (
    IMG_CODE INT(20) AUTO_INCREMENT PRIMARY KEY COMMENT '이미지코드',
    REF_REVIEW_CODE INT COMMENT '리뷰코드',
    ORIGINAL_NAME varchar(50) COMMENT '파일이름',
    SAVED_NAME VARCHAR(225) COMMENT '저장된이름',
    SAVE_PATH VARCHAR(225) COMMENT '저장경로',
    FILE_TYPE VARCHAR(50) COMMENT '파일형식',
    THUMB_NAIL_PATH varchar(225) COMMENT '썸네일저장경로',
    ATTACHMENT_STATUS CHAR COMMENT '저장상태',
    foreign key (REF_REVIEW_CODE) references REVIEW (REVIEW_CODE)
) ENGINE=INNODB COMMENT '이미지파일';

-- SURVEY_VERSION 더미 생성
INSERT INTO SURVEY_VERSION (version_name, version_explain, update_date, status)
VALUES ('첫 번째 설문', '처음으로 등록한 설문', '2024-04-23', 1);

-- 버전 1에 대한 더미 데이터 삽입
INSERT INTO survey_question (version_id, question_order, question_text, question_category)
VALUES (1, 1, '하루에 과일을 얼마나 드시나요?', 'C'),
       (1, 2, '하루에 콩류를 얼마나 드시나요?', 'P'),
       (1, 3, '하루 간식을 얼마나 드시나요?', 'C'),
       (1, 4, '하루에 기름진 음식을 얼마나 드시나요?', 'F'),
       (1, 5, '하루에 드시는 동물성 지방 양은?', 'F'),
       (1, 6, '하루에 드시는 단백질 풍부 음식 양은?', 'P'),
       (1, 7, '하루에 드시는 주식 양은?', 'C'),
       (1, 8, '하루에 드시는 육류 양은?', 'P'),
       (1, 9, '하루에 드시는 기름진 유제품 빈도는?', 'F'),
       (1, 10, '하루에 드시는 밥 끼수는?', 'C'),
       (1, 11, '하루에 드시는 우유나 유제품 양은?', 'P'),
       (1, 12, '하루에 드시는 다른 지방 섭취 음식은?', 'F'),
       (1, 13, '하루에 드시는 과일 개수는?', 'C'),
       (1, 14, '하루에 드시는 식물성 지방 양은?', 'F'),
       (1, 15, '하루에 드시는 난류 양은?', 'P'),
       (1, 16, '하루에 활동적인 생활 정도는?', 'W'),
       (1, 17, '일주일에 정규운동 횟수는?', 'W'),
       (1, 18, '하루에 유산소 운동 시간은?', 'W'),
       (1, 19, '주말 운동 빈도는?', 'W'),
       (1, 20, '주로 하는 운동 종류는?', 'W');

-- 답변 생성
INSERT INTO survey_answer (question_id, answer_text, answer_value)
VALUES (1, '1개 미만', 1),
       (1, '1~2개', 2),
       (1, '3개 이상', 3),

       (2, '자주 먹음', 3),
       (2, '가끔 먹음', 2),
       (2, '거의 안 먹음', 1),

       (3, '매일', 3),
       (3, '몇 번씩', 2),
       (3, '거의 안 먹음', 1),

       (4, '1끼', 1),
       (4, '2끼', 2),
       (4, '3끼 이상', 3),

       (5, '자주 먹음', 3),
       (5, '가끔 먹음', 2),
       (5, '거의 안 먹음', 1),

       (6, '1끼', 1),
       (6, '2끼', 2),
       (6, '3끼 이상', 3),

       (7, '적게 먹음', 1),
       (7, '보통', 2),
       (7, '많이 먹음', 3),

       (8, '매일', 3),
       (8, '몇 번씩', 2),
       (8, '거의 안 먹음', 1),

       (9, '많이 먹음', 3),
       (9, '보통', 2),
       (9, '적게 먹음', 1),

       (10, '1끼', 1),
       (10, '2끼', 2),
       (10, '3끼 이상', 3),

       (11, '자주 먹음', 3),
       (11, '가끔 먹음', 2),
       (11, '거의 안 먹음', 1),

       (12, '자주 먹음', 3),
       (12, '가끔 먹음', 2),
       (12, '거의 안 먹음', 1),

       (13, '1개 미만', 1),
       (13, '1~2개', 2),
       (13, '3개 이상', 3),

       (14, '매일', 3),
       (14, '몇 번씩', 2),
       (14, '거의 안 먹음', 1),

       (15, '많이 먹음', 3),
       (15, '보통', 2),
       (15, '적게 먹음', 1),

       (16, '거의 하지 않음', 1),
       (16, '약간', 2),
       (16, '꾸준히', 3),

       (17, '전혀 안 함', 1),
       (17, '1~2번', 2),
       (17, '3번 이상', 3),

       (18, '30분 미만', 1),
       (18, '30분~1시간', 2),
       (18, '1시간 이상', 3),

       (19, '거의 안 함', 1),
       (19, '약간', 2),
       (19, '많이', 3),

       (20, '유산소 운동', 1),
       (20, '근력 운동', 2),
       (20, '다양한 종류', 3);

INSERT INTO SURVEY_RANGE (version_id, category, range1, range2, range3, range4)
VALUES (1, 'C', 3, 6, 9, 12),
       (1, 'P', 3, 7, 10, 12),
       (1, 'F', 2, 5, 8, 11),
       (1, 'W', 2, 6, 8, 10);
INSERT INTO SURVEY_RESULT VALUES
    ('cool12', 175, 68, 22.2, 26, 'normal', 4, 3, 3, 3, 1, 0, 0, 0, '2024-03-02'),
    ('don789', 186, 86, 24.86, 22, 'normal', 5, 3, 2, 3, 1, 0, 0, 0, '2024-03-25'),
    ('haunoh98', 152, 53, 22.94, 28, 'diet', 2, 1, 2, 1, 1, 0, 0, 0, '2024-04-15'),
    ('jihlim77', 156, 57, 23.42, 23, 'normal', 4, 3, 3, 3, 1, 0, 0, 0, '2024-04-28'),
    ('jmin56', 178, 96, 30.3, 21, 'diet', 4, 3, 3, 3, 1, 0, 0, 0, '2024-05-01');
    
    INSERT INTO PRODUCT_IMG (PRODUCT_CODE, SAVED_NAME, SAVE_PATH)
VALUES
    (1, 'befd7462-119e-44a8-bffe-4b86bc508f1d.png', 'C:/Dosirak/original/productUpload'),
    (2, 'f8a9597f-bb2e-455d-9f68-2a49d35fad8a.png', 'C:/Dosirak/original/productUpload'),
    (2, 'ffe713e5-0c20-4989-ab45-539c47450454.PNG', 'C:/Dosirak/original/productUpload'),
    (3, 'df8a51fb-2701-4dd3-8294-c5a42ac060d9.png', 'C:/Dosirak/original/productUpload'),
    (4, 'ab246f39-752f-454b-9660-4ffcbede045c.PNG', 'C:/Dosirak/original/productUpload'),
    (4, 'a354ab8e-2fcf-4038-a29a-ccd7abd97687.PNG', 'C:/Dosirak/original/productUpload'),
    (5, '451beda3-b05b-4343-b066-6137af604659.png', 'C:/Dosirak/original/productUpload'),
    (6, '2aea79a6-b10c-455c-928f-1ebafd53c7c6.PNG', 'C:/Dosirak/original/productUpload'),
    (6, '8a46ceb8-b472-4505-913d-32b1515a6095.PNG', 'C:/Dosirak/original/productUpload'),
    (7, '787561cf-81fb-4e33-84f8-fdbeb9ddce95.PNG', 'C:/Dosirak/original/productUpload'),
    (7, '7452ca40-7a37-455c-b569-b44d5ce99553.PNG', 'C:/Dosirak/original/productUpload'),
    (8, '2bef7fb9-edf9-4f57-815e-41470acde3f6.PNG', 'C:/Dosirak/original/productUpload'),
    (8, 'b08bf45d-1973-4d13-8e03-13a8993cd2c5.PNG', 'C:/Dosirak/original/productUpload'),
    (9, '10e2cb78-229f-461e-8feb-7fc754244b62.PNG', 'C:/Dosirak/original/productUpload'),
    (9, 'ba1ef5a3-5bc6-4612-b6c4-74a2b785c915.PNG', 'C:/Dosirak/original/productUpload'),
    (10, '2da828f7-2b4c-44d2-9008-8f9df26b3228.PNG', 'C:/Dosirak/original/productUpload'),
    (11, '0ea1e153-6714-4e8d-b492-8deea447d354.PNG', 'C:/Dosirak/original/productUpload'),
    (11, 'c0529d1e-9709-4a36-9070-5b2ca195a542.PNG', 'C:/Dosirak/original/productUpload'),
    (12, '37a28bf9-8711-4b12-b86c-d44873268911.PNG', 'C:/Dosirak/original/productUpload'),
    (12, 'ae91883a-377f-48f0-84a3-bac20274a782.PNG', 'C:/Dosirak/original/productUpload'),
    (13, '2da66355-fe8a-49b6-965a-16109e1fb2bd.PNG', 'C:/Dosirak/original/productUpload'),
    (13, '84e90c95-180f-4f4f-bf67-66d19d58f1b6.PNG', 'C:/Dosirak/original/productUpload'),
    (14, 'd968c7e8-cfb7-4592-b587-c8a11db8bd41.PNG', 'C:/Dosirak/original/productUpload'),
    (14, 'ea3ae706-d8b5-43a2-ae3d-5133623f6f78.PNG', 'C:/Dosirak/original/productUpload'),
    (15, '11589e77-3790-4ec2-8fca-9a94e44828c8.PNG', 'C:/Dosirak/original/productUpload'),
    (15, 'efa45712-f79a-4dec-9dd9-c8cb485ae3c4.PNG', 'C:/Dosirak/original/productUpload'),
    (16, 'ed4ff32d-9f79-43b3-84c7-73ec58e3a209.PNG', 'C:/Dosirak/original/productUpload'),
    (16, 'c8b06081-d3e7-4ffb-8d48-07a9c29ea65b.PNG', 'C:/Dosirak/original/productUpload'),
    (17, '0aaa1cef-74a7-4f41-8b39-ce0e7609e922.PNG', 'C:/Dosirak/original/productUpload'),
    (17, 'cbc97279-132f-44c7-bdf1-48ea62d0de53.PNG', 'C:/Dosirak/original/productUpload'),
    (18, '961d4956-ccf3-4294-8ab8-449306709720.PNG', 'C:/Dosirak/original/productUpload'),
    (18, '6a8ee71c-44e6-40bf-ac97-1af85447a285.PNG', 'C:/Dosirak/original/productUpload'),
    (19, '28467c5e-8673-4a04-a7bf-96710faf0755.PNG', 'C:/Dosirak/original/productUpload'),
    (19, 'ecc3d0b1-04d8-4cb0-8825-26ef7d76806e.PNG', 'C:/Dosirak/original/productUpload'),
    (20, '3f3330e1-6479-4556-a2f9-da1d590e9262.PNG', 'C:/Dosirak/original/productUpload'),
    (20, '00f53e2f-207e-4a4e-b5f3-bb5849abd90b.PNG', 'C:/Dosirak/original/productUpload'),
    (21, '81a797c2-76a1-4dfd-b6df-61f98d92297b.PNG', 'C:/Dosirak/original/productUpload'),
    (21, '060bf7db-1024-4e58-a985-c923fdaac99a.PNG', 'C:/Dosirak/original/productUpload'),
    (22, 'acbddc61-5804-4048-a8f5-0142d7a14abe.PNG', 'C:/Dosirak/original/productUpload'),
    (22, '20872084-6a3b-4d7c-9bcd-94fb240858e7.PNG', 'C:/Dosirak/original/productUpload'),
    (23, 'db7eb2e1-0810-40a0-9a58-abc8a6b543b3.PNG', 'C:/Dosirak/original/productUpload'),
    (23, '17293e3d-c8af-46f3-aa8d-dabd4b5f8907.PNG', 'C:/Dosirak/original/productUpload'),
    (24, '55509841-d678-4658-85f4-ee7e22bf8fdf.PNG', 'C:/Dosirak/original/productUpload'),
    (24, 'c8f29aaf-62b2-4193-9456-cdfff6a6477f.PNG', 'C:/Dosirak/original/productUpload'),
    (25, '121f1fe4-be40-431f-954b-1bb63368ff47.PNG', 'C:/Dosirak/original/productUpload'),
    (25, '51489e10-0f16-45e3-b5e3-61b99377931d.PNG', 'C:/Dosirak/original/productUpload');
    INSERT INTO DETAIL (DETAIL_STATUS, DETAILITEM_COUNT, PRODUCT_CODE, ORDER_CODE) VALUES
    ('O', 3, 8, 30003020),
    ('O', 4, 2, 30003020),
    ('O', 2, 3, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 1, 4, 30003020),
    ('O', 5, 5, 30003020);
    
INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (1, '끝내주는 도시락', '도시락이 정말 맛있어서 감사합니다!', 'jwbaek99', NULL, 'N', 60006201, '2024-04-25');    
    
INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (2, '맛있는 도시락', '도시락이 정말 맛있어서 감사합니다!', 'jwbaek99', NULL, 'N', 60006202, '2024-04-25');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (3, '신선한 도시락', '도시락이 맛있고 신선해서 너무 좋았어요!', 'jwbaek99', NULL, 'N', 60006203, '2024-04-26');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (4, '감동적인 도시락', '도시락이 너무 감동적이에요. 감사합니다!', 'jwbaek99', NULL, 'N', 60006204, '2024-04-27');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (5, '훌륭한 도시락', '도시락이 정말 훌륭해서 매번 만족합니다!', 'jwbaek99', NULL, 'N', 60006205, '2024-04-28');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (6, '즐거운 도시락', '도시락 덕분에 항상 즐겁습니다!', 'jwbaek99', NULL, 'N', 60006206, '2024-04-29');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (7, '행복한 도시락', '도시락이 주는 행복이 느껴져요!', 'jwbaek99', NULL, 'N', 60006207, '2024-04-30');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (8, '감사한 도시락', '도시락 덕분에 감사한 마음이 들어요!', 'jwbaek99', NULL, 'N', 60006208, '2024-05-01');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (9, '만족스러운 도시락', '매번 만족하는 도시락이에요. 감사합니다!', 'jwbaek99', NULL, 'N', 60006209, '2024-05-02');

INSERT INTO review (review_code, review_title, review_content, user_id, review_editdate, review_delete, detail_code, review_date) 
VALUES (10, '도시락에 대한 칭찬', '도시락이 너무 맛있어서 감사합니다!', 'jwbaek99', NULL, 'N', 60006210, '2024-05-03');