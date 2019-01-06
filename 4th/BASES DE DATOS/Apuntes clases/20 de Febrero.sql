spool %ORA_OUT%\salidaV$TIMEZONE_NAMES.txt
setlinesize 150
setpagesize 30
column tzname format a45;
column tzabbrev fromat a45
set timing on
SELECT TZNAME, TZABBREV 
	FROM V$TIMEZONE_NAMES;
set timing off
spool off

----------

spool %ORA_OUT%\salida-V$TABLESPACE.txt
COLUMN TS# FORMAT 999;
column NAME format a25;
column INCLUDE_IN_DATABASE_BACKUP format a25
SELECT TS#, NAME, INCLUDED_IN_DATABASE_BACKUP
	FROM V$TABLESPACE;
spool off

-------------

spool %ORA_OUT%\V$TABLESPACE.txt
column INDEX_NAME format a25;
column INDEX_TYPE format a25;
column TABLE_OWNER format a25;
column TABLE_NAME format a25;
column BLEVEL format a25;
column LEAF_BLOCKS format a25;
SELECT
INDEX_NAME, INDEX_TYPE, TABLE_OWNER, TABLE_NAME
BLEVEL, LEAF_BLOCKS
	FROM USER_INDEXES;
spool off


---------------
spool "C:\Users\marco\OneDrive\escritorio\salidaROLE_SYS_PRIVS.txt"
column ROLE format a35;
column PRVILEGE format a35;
column ADMIN_OPTION format a35;
SELECT ROLE, PRIVILEGE, ADMIN_OPTION
FROM ROLE_SYS_PRIVS;
spool off

--------------

spool
"C:\Users\marco\OneDrive\escritorio\salidaROLE_SYS_PRIVS.txt"
column ROLE format a35;
column PRIVILEGE format a35;
column ROLE, OPTION format a35;
SELECT ROLE, PRIVILEGE, ADMIN_OPTION
	FROM 


-----------------