spool %ORA_OUT%\q_1_14_febrero.txt
PROMPT CONFIGURA PAGINA Y LINEA
SHOW USER
SET PAGESIZE 99
SET LINESIZE 150
SET COLSEP '*'
SET underline '='
SET FEDBACK ON 
SET ECHO ON
SET FLUSH ON
SET NEWPAGE 0
SET NULL NADA
spool off


spool %ORA_OUT%\q_2_14_febrero.txt
PROMPT DESPLIEGA LOS OBJETOS TIPO TABLA E INDEX EN PARA EL USUARIO HR
COLUMN OWNER        FORMAT A10 JUS     CENTER
COLUMN OBJECT_NAME  FORMAT A25 JUSTIFY CENTER
COLUMN Tipo         FORMAT A10 JUS     CENTER
SELECT OWNER, OBJECT_NAME, OBJECT_TYPE "Tipo"
	   FROM ALL_OBJECTS
	   WHERE OWNER ="HR"
	   AND OBJECT_TYPE ='TABLE'
	   OR  OBJECT_TYPE ='INDEX'
	   ORDER BY 3,2;
spool off


spool %ORA_OUT%\q_3_14_febrero.txt
  DESC ALL_TAB_COLUMNS
 PROMPT DSPLIEGA ATRIBUTOS DE LA TABLA ALL_TAB_COLUMNS
 COLUMN OWNER FORMAT A6
 COLUMN TABLE_NAME FORMAT A25
 COLUMN COLUMN_NAME FORMAT A18
 COLUMN DATA_TYPE FORMAT A10
 COLUMN Tipo FORMAT A10  JUS CENTER
 SELECT OWNER, TABLE_NAME, COLUMN_NAME, DATA_TYPE "Tipo"
 	FROM ALL_TAB_COLUMNS
 	WHERE OWNER = 'HR'
 	AND TABLE_NAME ='EMPLOYEES'
 	ORDER BY 2,3;
spool off


spool %ORA_OUT%\q_4_14_febrero.txt
DESC EMPLOYEES
PROMPT DESPLIEGA STRIBUTOS DE LA TABLA EMPLOYEES
SELECT EMPLYE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID, SALARY
  FROM SALARY> 4000
  AND SALARY< 7000;

spool off


spool %ORA_OUT%\q_5_14_febrero.txt
PROMPT DESPLIEGA LOS EMPLEADOS CON SALARIO ENTRE 4000 Y 7000
COLUMN EMP_NO FORMAT 9999
COLUMN FIRST_NAME FORMST A10
COLUMN APELLIDO FORMAT A12 JUSTIFY CENTER
COLUMN Jefe FORMAT 9999
COLUMN SALARY




spool %ORA_OUT%


---------/* EJERCICIO EN CONSOLA*/





SQL*Plus: Release 11.2.0.2.0 Production on MiÚ Feb 14 07:10:51 2018

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL>
SQL> connect as sysdb
SP2-0306: Invalid option.
Usage: CONN[ECT] [{logon|/|proxy} [AS {SYSDBA|SYSOPER|SYSASM}] [edition=value]]
where <logon> ::= <username>[/<password>][@<connect_identifier>]
      <proxy> ::= <proxyuser>[<username>][/<password>][@<connect_identifier>]
SQL> connect HR
Enter password:
ERROR:
ORA-28000: the account is locked


SQL> CONECT HR/HR
SP2-0734: unknown command beginning "CONECT HR/..." - rest of line ignored.
SQL> CONNECT HR/HR
ERROR:
ORA-28000: the account is locked


SQL> connect HR/HR
ERROR:
ORA-28000: the account is locked


SQL> CONNECT AS SYSDBA
Enter user-name: Marcos
Enter password:
Connected.
SQL> ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK
  2  ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK;
ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK
*
ERROR at line 2:
ORA-00922: missing or invalid option


SQL> ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK
  2
SQL> ALTER USER HR IDENTIFIED BY HR ACCOUNT UNLOCK;

User altered.

SQL> DESC EMPLOYEES
ERROR:
ORA-04043: object EMPLOYEES does not exist


SQL> CONNECT HR/HR
Connected.
SQL> DESC EMPLOYEES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER(6)
 FIRST_NAME                                         VARCHAR2(20)
 LAST_NAME                                 NOT NULL VARCHAR2(25)
 EMAIL                                     NOT NULL VARCHAR2(25)
 PHONE_NUMBER                                       VARCHAR2(20)
 HIRE_DATE                                 NOT NULL DATE
 JOB_ID                                    NOT NULL VARCHAR2(10)
 SALARY                                             NUMBER(8,2)
 COMMISSION_PCT                                     NUMBER(2,2)
 MANAGER_ID                                         NUMBER(6)
 DEPARTMENT_ID                                      NUMBER(4)

SQL> SELECT COUNT (*) FROM EMPLOYEES;

  COUNT(*)
----------
       107

SQL> SHOW PAGESIZE
pagesize 14
SQL> SET PAGESIZE 99
SQL> SET LINESIZE 150
SQL> SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  2  FROM EMPLOYEES
  3  WHERE ROWNUM <= 20;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                     SALARY
----------- -------------------- ------------------------- ----------
        100 Steven               King                           24000
        101 Neena                Kochhar                        17000
        102 Lex                  De Haan                        17000
        103 Alexander            Hunold                          9000
        104 Bruce                Ernst                           6000
        105 David                Austin                          4800
        106 Valli                Pataballa                       4800
        107 Diana                Lorentz                         4200
        108 Nancy                Greenberg                      12008
        109 Daniel               Faviet                          9000
        110 John                 Chen                            8200
        111 Ismael               Sciarra                         7700
        112 Jose Manuel          Urman                           7800
        113 Luis                 Popp                            6900
        114 Den                  Raphaely                       11000
        115 Alexander            Khoo                            3100
        116 Shelli               Baida                           2900
        117 Sigal                Tobias                          2800
        118 Guy                  Himuro                          2600
        119 Karen                Colmenares                      2500

20 rows selected.

SQL> SET COLSEP '*'
SQL> SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  2  FROM EMPLOYEES
  3  WHERE ROWNUM <= 20;

EMPLOYEE_ID*FIRST_NAME          *LAST_NAME                *    SALARY
-----------*--------------------*-------------------------*----------
        100*Steven              *King                     *     24000
        101*Neena               *Kochhar                  *     17000
        102*Lex                 *De Haan                  *     17000
        103*Alexander           *Hunold                   *      9000
        104*Bruce               *Ernst                    *      6000
        105*David               *Austin                   *      4800
        106*Valli               *Pataballa                *      4800
        107*Diana               *Lorentz                  *      4200
        108*Nancy               *Greenberg                *     12008
        109*Daniel              *Faviet                   *      9000
        110*John                *Chen                     *      8200
        111*Ismael              *Sciarra                  *      7700
        112*Jose Manuel         *Urman                    *      7800
        113*Luis                *Popp                     *      6900
        114*Den                 *Raphaely                 *     11000
        115*Alexander           *Khoo                     *      3100
        116*Shelli              *Baida                    *      2900
        117*Sigal               *Tobias                   *      2800
        118*Guy                 *Himuro                   *      2600
        119*Karen               *Colmenares               *      2500

20 rows selected.

SQL> COLUMN SALARY FORMAT $99,999.00
SQL> SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  2  FROM EMPLOYEES
  3  WHERE ROWNUM <= 20;

EMPLOYEE_ID*FIRST_NAME          *LAST_NAME                *     SALARY
-----------*--------------------*-------------------------*-----------
        100*Steven              *King                     * $24,000.00
        101*Neena               *Kochhar                  * $17,000.00
        102*Lex                 *De Haan                  * $17,000.00
        103*Alexander           *Hunold                   *  $9,000.00
        104*Bruce               *Ernst                    *  $6,000.00
        105*David               *Austin                   *  $4,800.00
        106*Valli               *Pataballa                *  $4,800.00
        107*Diana               *Lorentz                  *  $4,200.00
        108*Nancy               *Greenberg                * $12,008.00
        109*Daniel              *Faviet                   *  $9,000.00
        110*John                *Chen                     *  $8,200.00
        111*Ismael              *Sciarra                  *  $7,700.00
        112*Jose Manuel         *Urman                    *  $7,800.00
        113*Luis                *Popp                     *  $6,900.00
        114*Den                 *Raphaely                 * $11,000.00
        115*Alexander           *Khoo                     *  $3,100.00
        116*Shelli              *Baida                    *  $2,900.00
        117*Sigal               *Tobias                   *  $2,800.00
        118*Guy                 *Himuro                   *  $2,600.00
        119*Karen               *Colmenares               *  $2,500.00

20 rows selected.

SQL> SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  2  FROM EMPLOYEES
  3  WHERE ROWNUM <= 20;

EMPLOYEE_ID*FIRST_NAME          *LAST_NAME                *     SALARY
-----------*--------------------*-------------------------*-----------
        100*Steven              *King                     * $24,000.00
        101*Neena               *Kochhar                  * $17,000.00
        102*Lex                 *De Haan                  * $17,000.00
        103*Alexander           *Hunold                   *  $9,000.00
        104*Bruce               *Ernst                    *  $6,000.00
        105*David               *Austin                   *  $4,800.00
        106*Valli               *Pataballa                *  $4,800.00
        107*Diana               *Lorentz                  *  $4,200.00
        108*Nancy               *Greenberg                * $12,008.00
        109*Daniel              *Faviet                   *  $9,000.00
        110*John                *Chen                     *  $8,200.00
        111*Ismael              *Sciarra                  *  $7,700.00
        112*Jose Manuel         *Urman                    *  $7,800.00
        113*Luis                *Popp                     *  $6,900.00
        114*Den                 *Raphaely                 * $11,000.00
        115*Alexander           *Khoo                     *  $3,100.00
        116*Shelli              *Baida                    *  $2,900.00
        117*Sigal               *Tobias                   *  $2,800.00
        118*Guy                 *Himuro                   *  $2,600.00
        119*Karen               *Colmenares               *  $2,500.00

20 rows selected.

SQL> SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  2  FROM EMPLOYEES
  3  WHERE ROWNUM <= 20
  4  ORDER BY 4;

EMPLOYEE_ID*FIRST_NAME          *LAST_NAME                *     SALARY
-----------*--------------------*-------------------------*-----------
        119*Karen               *Colmenares               *  $2,500.00
        118*Guy                 *Himuro                   *  $2,600.00
        117*Sigal               *Tobias                   *  $2,800.00
        116*Shelli              *Baida                    *  $2,900.00
        115*Alexander           *Khoo                     *  $3,100.00
        107*Diana               *Lorentz                  *  $4,200.00
        105*David               *Austin                   *  $4,800.00
        106*Valli               *Pataballa                *  $4,800.00
        104*Bruce               *Ernst                    *  $6,000.00
        113*Luis                *Popp                     *  $6,900.00
        111*Ismael              *Sciarra                  *  $7,700.00
        112*Jose Manuel         *Urman                    *  $7,800.00
        110*John                *Chen                     *  $8,200.00
        103*Alexander           *Hunold                   *  $9,000.00
        109*Daniel              *Faviet                   *  $9,000.00
        114*Den                 *Raphaely                 * $11,000.00
        108*Nancy               *Greenberg                * $12,008.00
        102*Lex                 *De Haan                  * $17,000.00
        101*Neena               *Kochhar                  * $17,000.00
        100*Steven              *King                     * $24,000.00

20 rows selected.

SQL> SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  2  FROM EMPLOYEES
  3  WHERE ROWNUM <= 20
  4  ORDER BY 4 DESC;

EMPLOYEE_ID*FIRST_NAME          *LAST_NAME                *     SALARY
-----------*--------------------*-------------------------*-----------
        100*Steven              *King                     * $24,000.00
        101*Neena               *Kochhar                  * $17,000.00
        102*Lex                 *De Haan                  * $17,000.00
        108*Nancy               *Greenberg                * $12,008.00
        114*Den                 *Raphaely                 * $11,000.00
        103*Alexander           *Hunold                   *  $9,000.00
        109*Daniel              *Faviet                   *  $9,000.00
        110*John                *Chen                     *  $8,200.00
        112*Jose Manuel         *Urman                    *  $7,800.00
        111*Ismael              *Sciarra                  *  $7,700.00
        113*Luis                *Popp                     *  $6,900.00
        104*Bruce               *Ernst                    *  $6,000.00
        105*David               *Austin                   *  $4,800.00
        106*Valli               *Pataballa                *  $4,800.00
        107*Diana               *Lorentz                  *  $4,200.00
        115*Alexander           *Khoo                     *  $3,100.00
        116*Shelli              *Baida                    *  $2,900.00
        117*Sigal               *Tobias                   *  $2,800.00
        118*Guy                 *Himuro                   *  $2,600.00
        119*Karen               *Colmenares               *  $2,500.00

20 rows selected.

SQL>




SELECT COUNT (*) FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE ROWNUM <= 20;
