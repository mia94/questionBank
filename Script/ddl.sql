-- questionbank
DROP SCHEMA IF EXISTS questionbank;

-- questionbank
CREATE SCHEMA questionbank;

-- 회원
CREATE TABLE questionbank.customer (
	customer_code CHAR(4)     NOT NULL COMMENT '회원코드', -- 회원코드
	customer_name VARCHAR(20) NOT NULL COMMENT '이름', -- 이름
	id            VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	password      VARCHAR(20) NOT NULL COMMENT '비밀번호', -- 비밀번호
	email         VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
	employee      TINYINT(4)  NOT NULL COMMENT '관리자여부' -- 관리자여부
)
COMMENT '회원';

-- 회원
ALTER TABLE questionbank.customer
	ADD CONSTRAINT
		PRIMARY KEY (
			customer_code -- 회원코드
		);

-- 문제(1)
CREATE TABLE questionbank.question (
	question_code  CHAR(10)     NOT NULL COMMENT '문제코드', -- 문제코드
	question_title TEXT         NOT NULL COMMENT '문제', -- 문제
	choice1        VARCHAR(255) NOT NULL COMMENT '보기1', -- 보기1
	choice2        VARCHAR(255) NOT NULL COMMENT '보기2', -- 보기2
	choice3        VARCHAR(255) NOT NULL COMMENT '보기3', -- 보기3
	choice4        VARCHAR(255) NOT NULL COMMENT '보기4', -- 보기4
	correct        TINYINT      NOT NULL COMMENT '정답', -- 정답
	state          VARCHAR(20)  NOT NULL COMMENT '오류/수정예정', -- 오류/수정예정
	correct_rate   INT(11)      NULL     COMMENT '정답률', -- 정답률
	picture        TEXT         NULL     COMMENT '그림/보기', -- 그림/보기
	subject        CHAR(1)      NULL     COMMENT '과목', -- 과목
	year           INTEGER      NULL     COMMENT '출제연도', -- 출제연도
	round          TINYINT      NULL     COMMENT '회차' -- 회차
)
COMMENT '문제(1)';

-- 문제(1)
ALTER TABLE questionbank.question
	ADD CONSTRAINT
		PRIMARY KEY (
			question_code -- 문제코드
		);

-- 건의사항 댓글
CREATE TABLE questionbank.reply (
	reply_code INT(11)       NOT NULL COMMENT '댓글코드', -- 댓글코드
	board      INT(11)       NOT NULL COMMENT '게시글코드', -- 게시글코드
	replytext  VARCHAR(1000) NOT NULL COMMENT '댓글내용', -- 댓글내용
	regdate    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '입력날짜', -- 입력날짜
	moddate    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정날짜', -- 수정날짜
	writer     CHAR(4)       NOT NULL COMMENT '작성자(회원코드)' -- 작성자(회원코드)
)
COMMENT '건의사항 댓글';

-- 건의사항 댓글
ALTER TABLE questionbank.reply
	ADD CONSTRAINT
		PRIMARY KEY (
			reply_code -- 댓글코드
		);

ALTER TABLE questionbank.reply
	MODIFY COLUMN reply_code INT(11) NOT NULL AUTO_INCREMENT COMMENT '댓글코드';

-- 시험 결과
CREATE TABLE questionbank.resulttest (
	resultTest_code INT(11)  NOT NULL COMMENT '결과시험코드', -- 결과시험코드
	customer        CHAR(4)  NOT NULL COMMENT '회원코드', -- 회원코드
	answer          INT(11)  NULL     COMMENT '입력한 답(100)', -- 입력한 답(1)
	correct         INT(11)  NULL     COMMENT '답(100)', -- 답(1)
	spendTime       INT(11)  NULL     COMMENT '걸린 시간', -- 한문제당 걸린 시간
	pass            TINYINT  NOT NULL COMMENT '합격여부(60점)', -- 정답여부
	question        CHAR(10) NULL     COMMENT '문제코드' -- 문제코드
)
COMMENT '시험 결과';

-- 시험 결과
ALTER TABLE questionbank.resulttest
	ADD CONSTRAINT
		PRIMARY KEY (
			resultTest_code -- 결과시험코드
		);

ALTER TABLE questionbank.resulttest
	MODIFY COLUMN resultTest_code INT(11) NOT NULL AUTO_INCREMENT COMMENT '결과시험코드';

-- 과목(5과목 20문제)
CREATE TABLE questionbank.subject (
	subject_code CHAR(1)     NOT NULL COMMENT '과목', -- 과목코드
	subject_name VARCHAR(20) NOT NULL COMMENT '과목이름' -- 과목이름
)
COMMENT '과목(5과목 20문제)';

-- 과목(5과목 20문제)
ALTER TABLE questionbank.subject
	ADD CONSTRAINT
		PRIMARY KEY (
			subject_code -- 과목코드
		);

-- 건의사항
CREATE TABLE questionbank.board (
	board_code  INT(11)      NOT NULL COMMENT '게시글코드', -- 게시글코드
	board_title VARCHAR(200) NOT NULL COMMENT '제목', -- 제목
	content     TEXT         NOT NULL COMMENT '내용', -- 내용
	regdate     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '게시날짜', -- 게시날짜
	moddate     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정날짜', -- 수정날짜
	viewcnt     INT(11)      NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	writer      CHAR(4)      NOT NULL COMMENT '회원코드(작성자)' -- 회원코드(작성자)
)
COMMENT '건의사항';

-- 건의사항
ALTER TABLE questionbank.board
	ADD CONSTRAINT
		PRIMARY KEY (
			board_code -- 게시글코드
		);

ALTER TABLE questionbank.board
	MODIFY COLUMN board_code INT(11) NOT NULL AUTO_INCREMENT COMMENT '게시글코드';

-- 정정요구
CREATE TABLE questionbank.reqUpdate (
	req_code    INT(11)     NOT NULL COMMENT '정정요구코드', -- 정정요구코드
	question    CHAR(10)    NOT NULL COMMENT '문제', -- 문제
	content     TEXT        NOT NULL COMMENT '변경사유', -- 변경사유
	ori_correct TINYINT     NOT NULL COMMENT '기존정답', -- 기존정답
	req_correct TINYINT     NULL     COMMENT '요청정답', -- 요청정답
	state       VARCHAR(30) NULL     COMMENT '정정전/수정완료', -- 상태
	writer      CHAR(4)     NOT NULL COMMENT '회원코드', -- 회원코드
	regdate     TIMESTAMP   NOT NULL DEFAULT now() COMMENT '게시날짜', -- 게시날짜
	moddate     TIMESTAMP   NOT NULL DEFAULT now() COMMENT '수정날짜' -- 수정날짜
)
COMMENT '정정요구';

-- 정정요구
ALTER TABLE questionbank.reqUpdate
	ADD CONSTRAINT PK_reqUpdate -- 정정요구 기본키
		PRIMARY KEY (
			req_code -- 정정요구코드
		);

ALTER TABLE questionbank.reqUpdate
	MODIFY COLUMN req_code INT(11) NOT NULL AUTO_INCREMENT COMMENT '정정요구코드';

-- 건의사항 댓글
ALTER TABLE questionbank.reply
	ADD CONSTRAINT FK_board_TO_reply -- FK_board_TO_reply
		FOREIGN KEY (
			board -- 게시글코드
		)
		REFERENCES questionbank.board ( -- 건의사항
			board_code -- 게시글코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	ADD INDEX FK_board_TO_reply (
		board -- 게시글코드
	);

-- 건의사항 댓글
ALTER TABLE questionbank.reply
	ADD CONSTRAINT FK_customer_TO_reply -- FK_customer_TO_reply
		FOREIGN KEY (
			writer -- 작성자(회원코드)
		)
		REFERENCES questionbank.customer ( -- 회원
			customer_code -- 회원코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	ADD INDEX FK_customer_TO_reply (
		writer -- 작성자(회원코드)
	);

-- 시험 결과
ALTER TABLE questionbank.resulttest
	ADD CONSTRAINT FK_customer_TO_resultTest -- FK_customer_TO_resultTest
		FOREIGN KEY (
			customer -- 회원코드
		)
		REFERENCES questionbank.customer ( -- 회원
			customer_code -- 회원코드
		),
	ADD INDEX FK_customer_TO_resultTest (
		customer -- 회원코드
	);

-- 건의사항
ALTER TABLE questionbank.board
	ADD CONSTRAINT FK_customer_TO_board -- FK_customer_TO_board
		FOREIGN KEY (
			writer -- 회원코드(작성자)
		)
		REFERENCES questionbank.customer ( -- 회원
			customer_code -- 회원코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	ADD INDEX FK_customer_TO_board (
		writer -- 회원코드(작성자)
	);

-- 문제(1)
ALTER TABLE questionbank.question
	ADD CONSTRAINT FK_subject_TO_question -- 과목(5과목 20문제) -> 문제(1)
		FOREIGN KEY (
			subject -- 과목
		)
		REFERENCES questionbank.subject ( -- 과목(5과목 20문제)
			subject_code -- 과목코드
		);

-- 시험 결과
ALTER TABLE questionbank.resulttest
	ADD CONSTRAINT FK_question_TO_resulttest -- 문제(1) -> 시험 결과
		FOREIGN KEY (
			question -- 문제코드
		)
		REFERENCES questionbank.question ( -- 문제(1)
			question_code -- 문제코드
		);

-- 정정요구
ALTER TABLE questionbank.reqUpdate
	ADD CONSTRAINT FK_question_TO_reqUpdate -- 문제(1) -> 정정요구
		FOREIGN KEY (
			question -- 문제
		)
		REFERENCES questionbank.question ( -- 문제(1)
			question_code -- 문제코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 정정요구
ALTER TABLE questionbank.reqUpdate
	ADD CONSTRAINT FK_customer_TO_reqUpdate -- 회원 -> 정정요구
		FOREIGN KEY (
			writer -- 회원코드
		)
		REFERENCES questionbank.customer ( -- 회원
			customer_code -- 회원코드
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;