-- 결제 테이블
/*
	결제 정보 DB
	paymentpk - 결제 pk
	merchant_uid - 상점 거래ID
	userpk - 회원 pk
	addresspk - 주소 pk
	amount - 총 결제 금액
	pg_provider - 결제 수단
	pg_tid - PG승인번호
	rdt - 결제일
*/
CREATE TABLE cookit_payment(
	paymentpk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	merchant_uid VARCHAR(25) UNIQUE,
	userpk INT UNSIGNED NOT NULL,
	addresspk INT UNSIGNED NOT NULL,
	amount int UNSIGNED NOT NULL,
	imp_uid VARCHAR(30) NOT NULL,
	pg_provider VARCHAR(10) NOT NULL,
	pg_tid VARCHAR(30) NOT NULL,
	rdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 결제정보 담을 테이블 생성하기... 아래있는 테이블 수정 필!!
-- 결제 테이블
/*
	결제 상품 DB
	purchasepk - 결제 pk 
	paymentpk - 결제정보 pk
	goodspk - 상품 pk
	rdt - 결제일
*/
CREATE TABLE cookit_payment_goods(
	paygoodspk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	paymentpk INT UNSIGNED NOT NULL, 
	goodspk INT UNSIGNED NOT NULL, 
	rdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- 사용자 테이블 
/*
   회원정보 Db
   userpk - 회원 pk
   email - 이메일 (id 기능 겸용)
   pw - 비밀번호
   nm - 이름
   gender - 성별 1- 남, 2- 여, 3- 선택안함
   birthdaymm - 생일 (월) 01 ~ 09 값 중 입력가능
   birthdaydd - 생일 (일) 01 ~ 31 값 중 입력가능
   rdt - 가입일
   ldt - 마지막 로그인 일
   joinpath - 회원가입 경로 0- 관리자 but 0 설정 막기,  1- 홈페이지, 2- 네이버, etc
              지정 경로 이외의 값 ex) 0 이 넘어오면 가입 거절 //
   deluser - 삭제여부 정상유지- 0, 삭제- 1 
   ukey - 
*/
CREATE TABLE cookit_user(
   userpk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   email VARCHAR(50) UNIQUE NOT NULL,
   pw VARCHAR(500) NOT NULL DEFAULT '',
   nm VARCHAR(10) NOT NULL,
   gender TINYINT UNSIGNED NOT NULL CHECK(gender IN (1, 2, 3)),
   birthdaymm VARCHAR(2) NOT NULL DEFAULT 00 CHECK(birthdaymm >= 00 AND birthdaymm <= 09),
   birthdaydd VARCHAR(2) NOT NULL DEFAULT 00 CHECK(birthdaydd >= 00 AND birthdaydd <= 31),
   rdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
   ldt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
   joinpath TINYINT UNSIGNED NOT NULL,
   deluser TINYINT UNSIGNED NOT NULL DEFAULT 0 CHECK(deluser >= 0 AND deluser <= 1),
   ukey VARCHAR(50) UNIQUE NOT NULL DEFAULT ''
);
-- 회원가입 동의 테이블 
/*
   회원가입 동의 Db
   agreepk - 동의 정보pk
   userpk - 회원 pk
   termsOfUse - 이용약관
   userInformation - 개인정보
   marketing - 마케팅
   notRealpage -
   rdt - 
*/
CREATE TABLE cookit_agree(
	agreepk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	userpk INT UNSIGNED NOT NULL,
	termsOfUse TINYINT UNSIGNED NOT NULL CHECK(termsOfUse IN(0,1)),
	userInformation TINYINT UNSIGNED NOT NULL CHECK(userInformation IN(0,1)),
	marketing TINYINT UNSIGNED NOT NULL DEFAULT 0 CHECK(marketing IN(0,1)),
	notRealpage TINYINT UNSIGNED NOT NULL CHECK(notRealpage IN(0,1)),
	rdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- 배송지 테이블
/*
	shipping address Db
	addresspk - 배송지 pk
	addrnm - 받는사람
	addr - 주소
	detailedaddr - 상세주소
	addrtel - 연락처
	addrdefault - 기본배송지 설정
	userpk - 회원 pk
	
*/
CREATE TABLE cookit_shipping_address(
	addresspk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	addrnm VARCHAR(5) not null,
	addr VARCHAR(100) not null,
	detailedaddr VARCHAR(50) not null,
	addrtel VARCHAR(16) not null,
	addrdefault TINYINT UNSIGNED NOT NULL,
	userpk INT UNSIGNED NOT NULL
);

-- 리뷰 테이블
/*
	리뷰 Db
	reviewpk - 리뷰 pk
	goodspk - 상품 pk
	userpk - 회원 pk
	revscore - 별점 (0~5)
	revctnt - 리뷰 내용
	revimg	- 리뷰이미지 1개
	rdt - 등록일
	mdt - 수정일
	isdel - 삭제
*/
CREATE TABLE cookit_review(
	reviewpk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	goodspk INT UNSIGNED NOT NULL, 
	userpk INT UNSIGNED NOT NULL, 
	revscore TINYINT UNSIGNED NOT NULL DEFAULT 0 CHECK(revscore >=0 AND revscore<=5),
	revctnt VARCHAR(1000) NOT NULL DEFAULT '',
	revimg VARCHAR(10) NOT NULL DEFAULT '',
	rdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	mdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	isdel TINYINT UNSIGNED NOT NULL DEFAULT 0
);

-- 상품 테이블
/*
	상품 Db
	goodspk - 상품 pk ( select 시 문자가 있다면 속도차이 발생(양이 많은경우 해당)
	gnum - 상품코드(년월 4자리+숫자 4자리)
	categorypk - 카테고리 pk
	gnm - 상품명
	price - 가격
	quantity	- 보유 수량
	rdt - 등록일
	isdel - 삭제
*/
CREATE TABLE cookit_goods(
	goodspk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	gnum VARCHAR(8) UNIQUE NOT NULL,
	categorypk INT UNSIGNED,
	gnm VARCHAR(50) NOT NULL,
	price INT UNSIGNED NOT NULL DEFAULT 0,
	quantity TINYINT UNSIGNED NOT NULL DEFAULT 0,
	rdt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	isdel TINYINT UNSIGNED DEFAULT 0
);

-- 상품 카테고리 테이블
/*
	상품 category Db
	gcategorypk - 카테고리 pk
	categorynm - 카테고리 이름
*/
CREATE TABLE cookit_goods_category(
	categorypk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	categorynm VARCHAR(10) NOT NULL
);

-- 상품 이미지 테이블
/*
	상품 image Db
	imgpk - 이미지 pk
	goodspk - 해당상품 pk
	img - 이미지 명
	defaultimage - 메인되는 기본 이미지 설정
*/
CREATE TABLE cookit_goods_image (
	imgpk INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	goodspk INT UNSIGNED NOT NULL,
	img VARCHAR(50),
	defaultimage TINYINT UNSIGNED
);
