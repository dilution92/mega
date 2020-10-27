CREATE TABLE test_table(
    id NUMBER PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);

SELECT * FROM test_table;


DROP TABLE account_info;

CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_uq UNIQUE (email)
);

--not null은 빈칸이 안되는 것 중복은 가능하다.
INSERT INTO account_info(id, email) VALUES (123, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (124, 'ass@gmail.com');
INSERT INTO account_info(id, email) VALUES (125, NULL);

SELECT * FROM account_info;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'ACCOUNT_INFO';
--제약조건 확인 가능

DROP TABLE account_authentication;

CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL,
    CONSTRAINT password_length_chk CHECK (length(password)>3)
);

INSERT INTO account_authentication(id, password, account_info_id)
VALUES(1, '1234', 124);

DELETE FROM account_info WHERE ID = 124;

SELECT * FROM account_authentication;



DROP TABLE account_info;
--NOT NULL 제약조건 
--제약조건 이름이 없는 경우
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) NOT NULL
);

--제약조건 이름이 있는 경우
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) CONSTRAINT account_info_email_nn NOT NULL
);
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, null); --null이 입력되지 않는다.

SELECT * FROM account_info;


DROP TABLE account_info;

--UNIQUE 제약조건
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

--UNIQUE constraint 제약조건
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) CONSTRAINT
    account_info_email_uq UNIQUE
);

INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abc@gmail.com'); --email 중복된 값입력 안됨

SELECT * FROM account_info;

DROP TABLE account_info;
--primary 제약조건
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

CREATE TABLE account_info (
    id NUMBER, 
    email VARCHAR2(128) UNIQUE,
    CONSTRAINT account_info_pk PRIMARY KEY(id)
);

INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abc@gmail.com'); --email 중복된 값입력 안됨

SELECT * FROM account_info;


DROP TABLE account_authentication;
--foreign key 제약조건
CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id)
);

CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER 
    CONSTRAINT account_info_fk REFERENCES account_info(id)
);

CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER ,
    CONSTRAINT account_info_fk foreign KEY (account_info_id) REFERENCES account_info(id)
);

INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abcd@gmail.com');
INSERT INTO account_authentication(id, password, account_info_id)
VALUES(1, '1234', 1);

SELECT * FROM account_info;
SELECT * FROM account_authentication;

DROP TABLE account_authentication CASCADE CONSTRAINTS; --부모테이블 있어도 삭제

DELETE FROM account_info WHERE id = 1;

--DELETE 
CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE CASCADE
);

CREATE TABLE account_authentication(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    account_info_id NUMBER REFERENCES account_info(id) ON DELETE SET NULL
);


--check
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    CONSTRAINT account_info_email_uq UNIQUE (email),
    CONSTRAINT account_info_email_length_chk CHECK (length(email) >3)
);

DROP TABLE account_info;
--default
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) NOT NULL,
    created_date TIMESTAMP DEFAULT SYSDATE,
    grade VARCHAR2(128) DEFAULT 'NEW'
    CONSTRAINT account_info_email_uq UNIQUE,
    CONSTRAINT account_info_email_length_chk CHECK (length(email) >3)
);

INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abcd@gmail.com');

DROP TABLE account_info1;

CREATE TABLE account_info1 (
    id NUMBER CONSTRAINT account_info1_pk  primary KEY,
    email VARCHAR2(128) CONSTRAINT account_info1_email_nn NOT NULL
);

INSERT INTO account_info1(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info1(id, email) VALUES (2, 'abcd@gmail.com');

SELECT * FROM account_info1;

CREATE TABLE account_info1 (
    id NUMBER primary KEY,
    email VARCHAR2(128) UNIQUE
);


CREATE TABLE account_info1 (
    id NUMBER primary KEY,
    email VARCHAR2(128) CONSTRAINT account_info_eami_uq UNIQUE
);


CREATE TABLE account_info1 (
    id NUMBER primary KEY,
    email VARCHAR2(128), 
    CONSTRAINT account_info_eami_uq UNIQUE (email)
);

CREATE TABLE account_authentication1(
    id NUMBER primary KEY,
    password VARCHAR2(128) CONSTRAINT account_authentication1_pwd_nn NOT NULL 
);

CREATE TABLE account_authentication1(
    id NUMBER primary KEY ,
    password VARCHAR2(128) not null,
    account_info_id number,
    CONSTRAINT account_info_fk    --제약조건 이름
    FOREIGN KEY (account_info_id) --(지정할 칼럼) 
    REFERENCES account_info (id)  --참조할 테이블과 (참조할 테이블의 칼럼)
);
DROP TABLE account_authentication1;

CREATE TABLE account_authentication1(
    id NUMBER PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    CONSTRAINT aa_pwd_chk CHECK (length (password)>7)
);

CREATE TABLE account_info1(
    id NUMBER,
    email VARCHAR2(128) NOT NULL,
    create_date TIMESTAMP DEFAULT SYSDATE
);

