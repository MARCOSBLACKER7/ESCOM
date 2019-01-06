PROMPT Chapter 8: Set Operations and Chapter 9: Complex Joins
PROMPT create table an populate it
DROP TABLE T3; DROP TABLE T2; DROP TABLE T1;
CREATE TABLE t1
 (col1 NUMBER);
CREATE TABLE t2

 (col2 NUMBER);
CREATE TABLE t3 
 (col3 NUMBER);

INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (2);
INSERT INTO t1 VALUES (3);
INSERT INTO t1 VALUES (10);
INSERT INTO t1 VALUES (20);
INSERT INTO t1 VALUES (30);
 
INSERT INTO t2 VALUES (2);
INSERT INTO t2 VALUES (3);
INSERT INTO t2 VALUES (4);
INSERT INTO t2 VALUES (20);
INSERT INTO t2 VALUES (30);
INSERT INTO t2 VALUES (40);

INSERT INTO t3 VALUES (2);
INSERT INTO t3 VALUES (3);
INSERT INTO t3 VALUES (5);
INSERT INTO t3 VALUES (20);
INSERT INTO t3 VALUES (30);
INSERT INTO t3 VALUES (50);

SELECT *FROM T1;
SELECT *FROM T2;
SELECT *FROM T3;

COMMIT;
--ANSI FULL OUTER JOIN
SELECT col1
	FROM t1;
REM
REM
SELECT col2;
	FROM t2;
REM
REM
SELECT col1, col2
	FROM t1 LEFT OUTER JOIN t2
	ON t1.col1=t2.col2;
REM
SELECT col1,col2
	FROM t1 RIGHT OUTER JOIN t2
	ON t1.col1=t2.col2;
REM  FULL OUTER JOIN Using The UNION Operator
	SELECT col1, col2
		FROM t1, t2
		WHERE t1.col1=t2.col2(+)
UNION
	SELECT col1,col2
	FROM t1,t2
	WHERE t1.col1(+)=t2.col2;
UNION
	SELECT col1, col2
	FROM t1,t2
	WHERE t1.col1(+)=t2.col2;
---------------------
SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
	FROM course c LEFT OUTER JOIN section s
	ON c.course_no = s.source_no
	WHERE c.prerequisite =350;
REM
REM
SELECT c.course cno,s.course sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
	FROM course c, section s
	WHERE c.course_no = s.course_no(+)
	AND c.prerequisite= 350;
REM
REM
COLUMN DESCRIPTION FORMAT A27
COLUMN LOC FORMAT A13
SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
	FROM c.course_no cno, s.source_no sno,
	WHERE c.course_no = s.source_no(+)
	ANDs.location(+) ='L507';


REM 
SELECT city, state,zip,
	(SELECT COUNT(*)
	FROM student s
	WHERE s.zip=z.zip)
		AS student_count
	FROM zipcode z
	WHERE state = 'CT'