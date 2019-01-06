set pagesize 99
set linsize 150
create table EMP(
	nif integer 
   primary key,
   	nombre varchar2(12),
   	apellidos varchar2(20),
   	nivel integer,
   	ocupacion varchar(20),
   	matricula integer);


SQL> connect HR/HR
Connected.
SQL> SELECT dbms_random.RANDOM FROM dual;

    RANDOM
==========
-472249316

SQL>
SQL> SELECT dbms_random.RANDOM FROM dual;

    RANDOM
==========
-375853176

SQL> SELECT dbms_random.RANDOM FROM dual;

    RANDOM
==========
1929073883

SQL> SELECT dbms_random.RANDOM FROM dual;

    RANDOM
==========
-1.229E+09

SQL> SELECT dbms_random.RANDOM FROM dual;

    RANDOM
==========
 297722440

SQL> SELECT ROUND(DBMS.RANDOM.VALUE(1999,2007)) NUM FROM DUAL;
SELECT ROUND(DBMS.RANDOM.VALUE(1999,2007)) NUM FROM DUAL
             *
ERROR at line 1:
ORA-00904: "DBMS"."RANDOM"."VALUE": invalid identifier


SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      1999

SQL>
SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      2005

SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      2007

SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      2003

SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      2004

SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      1999

SQL> SELECT ROUND(DBMS_RANDOM.VALUE(1999,2007)) NUM FROM DUAL;

       NUM
==========
      2006

SQL> SELECT TO_CHAR(TO_DATE('02/22/2017','MM/DD/YYYY'), 'j') FROM DUAL;

TO_CHAR
=======
2457807

SQL> SELECT TO_CHAR(TO_DATE('02/22/2017','MM/DD/YYYY'), 'j') FROM DUAL;

TO_CHAR
=======
2457807

SQL> SELECT TO_CHAR(TO_DATE('02/22/2017','MM/DD/YYYY'), 'j') FROM DUAL;

TO_CHAR
=======
2457807

SQL> SELECT TO_CHAR(TO_DATE('02/22/2017','MM/DD/YYYY'), 'j') FROM DUAL;

TO_CHAR
=======