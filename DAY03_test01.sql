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

--not null�� ��ĭ�� �ȵǴ� �� �ߺ��� �����ϴ�.
INSERT INTO account_info(id, email) VALUES (123, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (124, 'ass@gmail.com');
INSERT INTO account_info(id, email) VALUES (125, NULL);

SELECT * FROM account_info;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'ACCOUNT_INFO';
--�������� Ȯ�� ����

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
--NOT NULL �������� 
--�������� �̸��� ���� ���
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) NOT NULL
);

--�������� �̸��� �ִ� ���
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) CONSTRAINT account_info_email_nn NOT NULL
);
INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, null); --null�� �Էµ��� �ʴ´�.

SELECT * FROM account_info;


DROP TABLE account_info;

--UNIQUE ��������
CREATE TABLE account_info (
    id NUMBER CONSTRAINT account_info_pk PRIMARY KEY,
    email VARCHAR2(128) UNIQUE
);

--UNIQUE constraint ��������
CREATE TABLE account_info (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(128) CONSTRAINT
    account_info_email_uq UNIQUE
);

INSERT INTO account_info(id, email) VALUES (1, 'abc@gmail.com');
INSERT INTO account_info(id, email) VALUES (2, 'abc@gmail.com'); --email �ߺ��� ���Է� �ȵ�

SELECT * FROM account_info;

DROP TABLE account_info;
--primary ��������
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
INSERT INTO account_info(id, email) VALUES (2, 'abc@gmail.com'); --email �ߺ��� ���Է� �ȵ�

SELECT * FROM account_info;


DROP TABLE account_authentication;
--foreign key ��������
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

DROP TABLE account_authentication CASCADE CONSTRAINTS; --�θ����̺� �־ ����

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
    CONSTRAINT account_info_fk    --�������� �̸�
    FOREIGN KEY (account_info_id) --(������ Į��) 
    REFERENCES account_info (id)  --������ ���̺�� (������ ���̺��� Į��)
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

