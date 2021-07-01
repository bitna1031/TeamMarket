CREATE TABLE reply(
rno NUMBER PRIMARY KEY,
bno NUMBER NOT NULL,
replytext VARCHAR2(1000) NOT NULL,
replyer VARCHAR2(30) NOT NULL,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT SYSDATE,

CONSTRAINT reply_fk_bno FOREIGN KEY(bno) REFERENCES board(bno)
)

select b.bno, b.title, b.readcnt, b.content, b.userId, to_char(b.updatedate,'yyyy-mm-dd') as updatedate ,
		(SELECT COUNT(*) FROM reply WHERE bno = b.bno) as recnt from board b ORDER BY b.bno DESC

SELECT * FROM board

select bno, title, readcnt, content, writer, to_char(updatedate,'yyyy-mm-dd') as updatedate,
		recnt from board ORDER BY bno DESC

CREATE TABLE board_1(
bno NUMBER PRIMARY KEY,
title VARCHAR2(60) NOT NULL,
content VARCHAR2(3000) NOT NULL,
userId VARCHAR2(30) NOT NULL,
readcnt NUMBER DEFAULT 0,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT SYSDATE,
FOREIGN KEY(userid) REFERENCES member(userid) ON DELETE CASCADE
);

CREATE TABLE member(
   userId VARCHAR2(6),
   userPw VARCHAR2(12) NOT NULL,
   userName VARCHAR2(30) NOT NULL,
   email VARCHAR2(100),
   regdate DATE DEFAULT SYSDATE,
   updateDate DATE DEFAULT SYSDATE,
   PRIMARY KEY(userId)
)

DROP TABLE board

CREATE TABLE board (
bno NUMBER PRIMARY KEY,
title VARCHAR2(60) NOT NULL,
content VARCHAR2(3000) NOT NULL,
writer VARCHAR2(30) NOT NULL,
readcnt NUMBER DEFAULT 0,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT SYSDATE
)



alter table board add CONSTRAINT board_fk_userid FOREIGN KEY(userid) REFERENCES member(userid)



SELECT TO_CHAR(SYSDATE, 'RRRR-MM-DD') AS regdate from board

update board set updatedate = to_char(updatedate,'RRRR-MM-DD')

alter table board ADD recnt NUMBER DEFAULT 0;

SELECT * FROM member

CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 100
MAXVALUE 100000000
NOCYCLE

DROP SEQUENCE board_seq

board_seq.CURRVAL