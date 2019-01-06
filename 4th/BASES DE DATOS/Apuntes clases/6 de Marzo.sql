Rem configura salida
SET PAGESIZE 99
SET LINESIZE 150
SET COLSEP   '||'
SET UNDERLINE '='


COLUMN COURSE_NO FORMAT 999
COLUMN SECTION_NO FORMAT 999
COLUMN DESCRIPTION FORMAT A30
COLUMN SALON FORMAT A7
COLUMNN INSTRUCTOR_ID FORMAT 9999
SELECT course.course_no, section_no, description,
			Location SALON, instructor_id 
		FROM course, section
		WHERE course.course_no = section.course_no;

-----------------------------------

REM ESPICIFICAR ALIAS A NOMBRES DE TABLAS 
REM
SELECT c.course_no,s.section_no,c.description,
			s.location, s.instructor_id
		FROM course c, section s
		WHERE c.course_no = s.course_no
AND ROWNUM <= 25;

--------------------------------------

REM OPERADOR LIKE
SELECT  c.course_no, s.section_no, c.description,
				s.location, s.instructor_id
		FROM course c, section s
		WHERE c.course_no = s.course_no 
		AND c.description LIKE 'Intro to%';
------------------

REM NULL
SELECT instructor_id,zip, last_name, first_name
		FROM instructor
		WHERE zip IS NULL;

-----------------
PROMPT EL INSTRUCTOR Willing no aparece por no
PROMPT tener codigo postal
SELECT i.instructor_id, i.zip, i.last_name, i.first_name
		FROM instructor i, zipcode z
		WHERE i.zip=z.zip;

------------------------

PROMPT JOIN USING(COURSE)
SELECT course_no, s.section_no, c.description,
	 s.location, s.instructor_id
		FROM course c JOIN section s 
		USING (course_no);

-------------------

PROMPT ON CONDITION EN LE JOIN 
SELECT c.course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s
	ON (c.course_no = s.course_no);

-----------------------
PROMPT DESPLEGAR SOLO LAS 20 PRIMERAS TUPLAS
SELECT c.course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s
	on(c.course_no= s.course_no
		AND ROWNUM <= 20);
----------------
PROMPT SEPARANDO LA CONDICION DE FILTRADO DE LA CONDICION DE JOIN DE

SELECT c.course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s 
	ON (c.course_no = s.course_no)
	WHERE description LIKE 'B%';
-----------------------------
PROMPT PRODUCTO CARTESIANO 10 X 78 = 780

SELECT COUNT(*)
	FROM section;
SELECT COUNT(*)
	FROM instructor;
SELECT COUNT(*)
	FROM section, instructor;

------------
SELECT *
	FROM section CROSS JOIN instructor;