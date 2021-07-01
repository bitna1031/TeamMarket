CREATE TABLE attach(
	filename VARCHAR2(300) NOT NULL,
	bno NUMBER NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	CONSTRAINT fk_attach_bno FOREIGN KEY(bno) REFERENCES board(bno)
)

SELECT * FROM AAA

delete FROM attach

CREATE OR REPLACE VIEW v_member AS SELECT * FROM member

DROP TABLE bbb
DROP TABLE aaa

delete from AAA

CREATE TABLE _back(
id NUMBER PRIMARY KEY,
mid NUMBER,
name VARCHAR2(12)
)

CREATE TABLE BBB(
mid NUMBER PRIMARY KEY,
mname VARCHAR2(12)
)

INSERT INTO AAA VALUES (1,100,'KIM')
INSERT INTO AAA VALUES (2,200,'LEE')
INSERT INTO AAA VALUES (3,300,'PARK')

INSERT INTO BBB VALUES (100,'김')
INSERT INTO BBB VALUES (200,'빛')
INSERT INTO BBB VALUES (300,'나')

SELECT * FROM AAA a , BBB b 

SELECT a.id, a.name, b.mid, b.mname FROM AAA a , BBB b

SELECT a.id, a.name, b.mid, b.mname FROM AAA a , BBB b WHERE a.mid = b.mid

SELECT a.id, a.name, b.mid, b.mname FROM AAA a INNER JOIN BBB b
ON a.mid = b.mid


CREATE INDEX idx_AAA_id_mid ON AAA(id,mid)








