INSERT INTO questionbank.subject(subject_code, subject_name)VALUES
('A', '전자계산기구조'),
('D', '데이터베이스'),
('C', '데이터 통신'),
('O', '운영체제'),
('S', '소프트웨어 공학');

INSERT INTO questionbank.customer
(customer_code, customer_name, id, password, email, employee)
values
('C001', '홍길동', 'honggil', '11112222', 'hong@test.com', 0),
('C002', '배수지', 'suzy94', '22221111', 'suzy94@test.co.kr', 0),
('C003', '라리사', 'lalalalisa', '22223333', 'lisa@test.com', 0),
('C004', '우선미', 'E001', '22221111', 'mia94@test.com', 1),
('C005', '나직원', 'E002', '22221111', 'emp02@test.co.kr', 1),
('C006', '직원임', 'E003', '22223333', 'e003@test.com', 1);