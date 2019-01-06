SQL*Plus: Release 11.2.0.2.0 Production on Mar Feb 13 07:13:57 2018

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect user as sysdba
Enter password:
Connected.
SQL> select sysdate from dual;

SYSDATE
--------
13/02/18

SQL> SELECT SYSDATE + 30 FROM DUAL;

SYSDATE+
--------
15/03/18

SQL> SELECT SYSTIMESTAMP FROM DUAL;

SYSTIMESTAMP
---------------------------------------------------------------------------
13/02/18 08:05:59.462000 -06:00

SQL>
