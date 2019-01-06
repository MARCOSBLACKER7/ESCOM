Drop table EMP;
create table EMP (empleado_id integer
				CONSTRAINT EMP_ID_PK PRIMARY KEY,
				First_name varchar2(20),
				Last_name  varchar2(20),
				Reporta_a integer);
prompt tuplas
				insert into EMP Values(1,'Nancy', 'Devolio', NULL);
				insert into EMP Values(2,'Andrew', 'Fuller', 1);
				insert into EMP Values(3,'Janet', 'Leverling', 1);
				insert into EMP Values(4,'Margaret', 'Peacock', 1);
				insert into EMP Values(5,'Steven', 'Rodriguez', 3);
				insert into EMP Values(6,'Rosy', 'Buchanan', 5);
				insert into EMP Values(7,'Mary', 'Sumaya', 6);
prompt despliega empleados del jefe
				select first_name, Last_name
				from emp
				where reporta_a = 1;
prompt despliega jefe
				select first_name, Last_name, reporta_a 
				from emp
				where empleado_id =1;
prompt despliega jefe
				COLUMN FIRST_NAME FORMAT A12;
				COLUMN LAST_NAME FORMAT A12;
				COLUMN REPORTA FORMAT A12;
				select first_name, Last_name,
				  NVL(TO_CHAR(reporta_a),'SIN JEFE')REPORTA
				from emp
				where reporta_a is NULL;
					select first_name,Last_name
				from emp
				where reporta_a= NULL;
prompt declara la llave foranea

				ALTER TABLE EMP
				ADD CONSTRAINT FK_EMP_REFLEXIVA FOREIGN KEY
(REPORTA_A)
				REFERENCES EMP(EMPLEADO_ID);
prompt habilita la llave foranea
				ALTER TABLE EMP 
				ENABLE CONSTRAINT
				FK_EMP_REFLEXIVA;
prompt intentar borrar al jefe 
				DELETE FROM EMP
				WHERE EMPLEADO_ID =1;
prompt deshabilitar llave foranea
				ALTER TABLE EMP
				DISABLE CONSTRAINT
				FK_EMP_REFLEXIVA;

prompt borrar al jefe 
				DELETE FROM EMP
				WHERE EMPLEADO_ID =1;
prompt insertar al jefe 
				insert into EMP Values(1,'Nancy','Devolio', NULL);
prompt despliega todas las tuplas
				select * from emp;
COLUMN TABLE_NAME FORMAT A14
COLUMN OWNER FORMAT A14
select owner, table_name, constraint_name, constraint_type,
				table_name, deferrable, deferred
		from user_constraints
		where table_name='EMP';
