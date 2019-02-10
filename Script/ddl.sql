-- questionBank
DROP SCHEMA IF EXISTS `questionBank`;

-- questionBank
CREATE SCHEMA `questionBank`;

-- 문제(1)
CREATE TABLE `questionBank`.`question` (
	`question_code`  CHAR(10)     NOT NULL COMMENT '문제코드', -- 문제코드
	`question_title` TEXT         NOT NULL COMMENT '문제', -- 문제
	`choice1`        VARCHAR(255) NOT NULL COMMENT '보기1', -- 보기1
	`choice2`        VARCHAR(255) NOT NULL COMMENT '보기2', -- 보기2
	`choice3`        VARCHAR(255) NOT NULL COMMENT '보기3', -- 보기3
	`choice4`        VARCHAR(255) NOT NULL COMMENT '보기4', -- 보기4
	`correct`        INT(1)       NOT NULL COMMENT '정답', -- 정답
	`state`          VARCHAR(20)  NOT NULL COMMENT '오류/수정예정', -- 문제상태
	`correct_rate`   INT          NULL     COMMENT '정답률', -- 정답률
	`picture`        TEXT         NULL     COMMENT '그림/보기' -- 그림/보기
)
COMMENT '문제(1)';

-- 문제(1)
ALTER TABLE `questionBank`.`question`
	ADD CONSTRAINT `PK_question` -- 문제(1) 기본키
		PRIMARY KEY (
			`question_code` -- 문제코드
		);

-- 과목(5과목 20문제)
CREATE TABLE `questionBank`.`subject` (
	`question`     CHAR(10)    NOT NULL COMMENT '문제코드', -- 문제코드
	`test`         CHAR(4)     NOT NULL COMMENT '시험코드', -- 시험코드
	`subject_code` CHAR(1)     NOT NULL COMMENT '과목', -- 과목
	`subject_name` VARCHAR(20) NOT NULL COMMENT '과목이름' -- 과목이름
)
COMMENT '과목(5과목 20문제)';

-- 과목(5과목 20문제)
ALTER TABLE `questionBank`.`subject`
	ADD CONSTRAINT `PK_subject` -- 과목(5과목 20문제) 기본키
		PRIMARY KEY (
			`question`, -- 문제코드
			`test`      -- 시험코드
		);

-- 출제시험(100문제)
CREATE TABLE `questionBank`.`test` (
	`test_code` CHAR(4) NOT NULL COMMENT '시험코드', -- 시험코드
	`year`      INT(4)  NOT NULL COMMENT '출제연도', -- 출제연도
	`round`     INT     NOT NULL COMMENT '회차', -- 회차
	`test_time` INT     NULL     COMMENT '시간(150분)' -- 시간(150분)
)
COMMENT '출제시험(100문제)';

-- 출제시험(100문제)
ALTER TABLE `questionBank`.`test`
	ADD CONSTRAINT `PK_test` -- 출제시험(100문제) 기본키
		PRIMARY KEY (
			`test_code` -- 시험코드
		);

-- 회원
CREATE TABLE `questionBank`.`customer` (
	`customer_code` CHAR(4)     NOT NULL COMMENT '회원코드', -- 회원코드
	`customer_name` VARCHAR(20) NOT NULL COMMENT '이름', -- 이름
	`id`            VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	`password`      VARCHAR(20) NOT NULL COMMENT '비밀번호', -- 비밀번호
	`email`         VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
	`employee`      TINYINT     NOT NULL COMMENT '관리자여부' -- 관리자여부
)
COMMENT '회원';

-- 회원
ALTER TABLE `questionBank`.`customer`
	ADD CONSTRAINT `PK_customer` -- 회원 기본키
		PRIMARY KEY (
			`customer_code` -- 회원코드
		);

-- 과목별(20문제) 응시시험
CREATE TABLE `questionBank`.`unitTest` (
	`unitTest_code` INT      NOT NULL COMMENT '과목별시험 코드', -- 과목별시험 코드
	`answer`        INT(1)   NULL     COMMENT '입력한 답(20개)', -- 입력한 답(20개)
	`correct`       TINYINT  NULL     COMMENT '정답(20개)', -- 정답(20개)
	`customer`      CHAR(4)  NOT NULL COMMENT '회원코드', -- 회원코드
	`question`      CHAR(10) NULL     COMMENT '문제코드', -- 문제코드
	`test`          CHAR(4)  NULL     COMMENT '시험코드' -- 시험코드
)
COMMENT '과목별(20문제) 응시시험';

-- 과목별(20문제) 응시시험
ALTER TABLE `questionBank`.`unitTest`
	ADD CONSTRAINT `PK_unitTest` -- 과목별(20문제) 응시시험 기본키
		PRIMARY KEY (
			`unitTest_code` -- 과목별시험 코드
		);

ALTER TABLE `questionBank`.`unitTest`
	MODIFY COLUMN `unitTest_code` INT NOT NULL AUTO_INCREMENT COMMENT '과목별시험 코드';

-- 시험 결과
CREATE TABLE `questionBank`.`resultTest` (
	`resultTest_code` INT     NOT NULL COMMENT '결과시험코드', -- 결과시험코드
	`customer`        CHAR(4) NOT NULL COMMENT '회원코드', -- 회원코드
	`answer`          INT     NULL     COMMENT '입력한 답(100)', -- 입력한 답(100)
	`correct`         INT     NULL     COMMENT '답(100)', -- 답(100)
	`spendTime`       INT     NULL     COMMENT '걸린 시간', -- 걸린 시간
	`score`           INT     NOT NULL COMMENT '시험성적', -- 시험성적
	`pass`            TINYINT NOT NULL COMMENT '합격여부(60점)', -- 합격여부(60점)
	`test`            CHAR(4) NOT NULL COMMENT '시험코드' -- 시험코드
)
COMMENT '시험 결과';

-- 시험 결과
ALTER TABLE `questionBank`.`resultTest`
	ADD CONSTRAINT `PK_resultTest` -- 시험 결과 기본키
		PRIMARY KEY (
			`resultTest_code` -- 결과시험코드
		);

ALTER TABLE `questionBank`.`resultTest`
	MODIFY COLUMN `resultTest_code` INT NOT NULL AUTO_INCREMENT COMMENT '결과시험코드';

-- 건의사항
CREATE TABLE `questionBank`.`board` (
	`board_code`  INT          NOT NULL COMMENT '게시글코드', -- 게시글코드
	`board_title` VARCHAR(200) NOT NULL COMMENT '제목', -- 제목
	`content`     TEXT         NOT NULL COMMENT '내용', -- 내용
	`regdate`     TIMESTAMP    NOT NULL DEFAULT now() COMMENT '게시날짜', -- 게시날짜
	`moddate`     TIMESTAMP    NOT NULL DEFAULT now() COMMENT '수정날짜', -- 수정날짜
	`viewcnt`     INT          NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	`writer`      CHAR(4)      NOT NULL COMMENT '회원코드(작성자)' -- 회원코드(작성자)
)
COMMENT '건의사항';

-- 건의사항
ALTER TABLE `questionBank`.`board`
	ADD CONSTRAINT `PK_board` -- 건의사항 기본키
		PRIMARY KEY (
			`board_code` -- 게시글코드
		);

ALTER TABLE `questionBank`.`board`
	MODIFY COLUMN `board_code` INT NOT NULL AUTO_INCREMENT COMMENT '게시글코드';

-- 건의사항 댓글
CREATE TABLE `questionBank`.`reply` (
	`reply_code` INT           NOT NULL COMMENT '댓글코드', -- 댓글코드
	`board`      INT           NOT NULL COMMENT '게시글코드', -- 게시글코드
	`replytext`  VARCHAR(1000) NOT NULL COMMENT '댓글내용', -- 댓글내용
	`regdate`    TIMESTAMP     NOT NULL DEFAULT now() COMMENT '입력날짜', -- 입력날짜
	`moddate`    TIMESTAMP     NOT NULL DEFAULT now() COMMENT '수정날짜', -- 수정날짜
	`writer`     CHAR(4)       NOT NULL COMMENT '작성자(회원코드)' -- 작성자(회원코드)
)
COMMENT '건의사항 댓글';

-- 건의사항 댓글
ALTER TABLE `questionBank`.`reply`
	ADD CONSTRAINT `PK_reply` -- 건의사항 댓글 기본키
		PRIMARY KEY (
			`reply_code` -- 댓글코드
		);

ALTER TABLE `questionBank`.`reply`
	MODIFY COLUMN `reply_code` INT NOT NULL AUTO_INCREMENT COMMENT '댓글코드';

-- 과목(5과목 20문제)
ALTER TABLE `questionBank`.`subject`
	ADD CONSTRAINT `FK_test_TO_subject` -- 출제시험(100문제) -> 과목(5과목 20문제)
		FOREIGN KEY (
			`test` -- 시험코드
		)
		REFERENCES `questionBank`.`test` ( -- 출제시험(100문제)
			`test_code` -- 시험코드
		);

-- 과목(5과목 20문제)
ALTER TABLE `questionBank`.`subject`
	ADD CONSTRAINT `FK_question_TO_subject` -- 문제(1) -> 과목(5과목 20문제)
		FOREIGN KEY (
			`question` -- 문제코드
		)
		REFERENCES `questionBank`.`question` ( -- 문제(1)
			`question_code` -- 문제코드
		);

-- 과목별(20문제) 응시시험
ALTER TABLE `questionBank`.`unitTest`
	ADD CONSTRAINT `FK_customer_TO_unitTest` -- 회원 -> 과목별(20문제) 응시시험
		FOREIGN KEY (
			`customer` -- 회원코드
		)
		REFERENCES `questionBank`.`customer` ( -- 회원
			`customer_code` -- 회원코드
		);

-- 과목별(20문제) 응시시험
ALTER TABLE `questionBank`.`unitTest`
	ADD CONSTRAINT `FK_subject_TO_unitTest` -- 과목(5과목 20문제) -> 과목별(20문제) 응시시험
		FOREIGN KEY (
			`question`, -- 문제코드
			`test`      -- 시험코드
		)
		REFERENCES `questionBank`.`subject` ( -- 과목(5과목 20문제)
			`question`, -- 문제코드
			`test`      -- 시험코드
		);

-- 시험 결과
ALTER TABLE `questionBank`.`resultTest`
	ADD CONSTRAINT `FK_customer_TO_resultTest` -- 회원 -> 시험 결과
		FOREIGN KEY (
			`customer` -- 회원코드
		)
		REFERENCES `questionBank`.`customer` ( -- 회원
			`customer_code` -- 회원코드
		);

-- 시험 결과
ALTER TABLE `questionBank`.`resultTest`
	ADD CONSTRAINT `FK_test_TO_resultTest` -- 출제시험(100문제) -> 시험 결과
		FOREIGN KEY (
			`test` -- 시험코드
		)
		REFERENCES `questionBank`.`test` ( -- 출제시험(100문제)
			`test_code` -- 시험코드
		);

-- 건의사항
ALTER TABLE `questionBank`.`board`
	ADD CONSTRAINT `FK_customer_TO_board` -- 회원 -> 건의사항
		FOREIGN KEY (
			`writer` -- 회원코드(작성자)
		)
		REFERENCES `questionBank`.`customer` ( -- 회원
			`customer_code` -- 회원코드
		);

-- 건의사항 댓글
ALTER TABLE `questionBank`.`reply`
	ADD CONSTRAINT `FK_board_TO_reply` -- 건의사항 -> 건의사항 댓글
		FOREIGN KEY (
			`board` -- 게시글코드
		)
		REFERENCES `questionBank`.`board` ( -- 건의사항
			`board_code` -- 게시글코드
		);

-- 건의사항 댓글
ALTER TABLE `questionBank`.`reply`
	ADD CONSTRAINT `FK_customer_TO_reply` -- 회원 -> 건의사항 댓글
		FOREIGN KEY (
			`writer` -- 작성자(회원코드)
		)
		REFERENCES `questionBank`.`customer` ( -- 회원
			`customer_code` -- 회원코드
		);