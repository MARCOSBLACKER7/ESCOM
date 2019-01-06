CREATE OR REPLACE PACKAGE pkg
IS FUNCTION year number
	RETURN INTEGER;
	function deploy_fecha
	return varchar2;
		function deploy_fecha_2
	return varchar2;
END;
/

rem crea cuerpo del package 

CREATE OR RAPLACE PACKAGE BODY pkg 
IS
c_year_number CONSTANT INTEGER := 2017;
c_deploy_fecha varchar2(20);
c_deploy_fecha_2 varchar2(35);
FUNCTION year_number 
		RETURN INTEGER
	IS
		BEGIN
			RETURN c_year_number;
		END;
FUNCTION deploy_fecha
	RETURN varchar2
	IS
	BEGIN
	  c_deploy_fecha:= to_char(sysdate, 'j');
	  	RETURN c_deploy_fecha;
	  END;
FUNCTION deploy_fecha_2
	RETURN varchar2
	IS
	BEGIN
	c_deploy_fecha_2:= to_char(sysdate,'DAY DD/MONTH/RRRR');
	RETURN c_deploy_fecha_2;
	END;
END;
/


SELECT pkg.year_number
	FROM DUAL;
SELECT pkg.deploy_fecha 
	FROM DUAL;
SELECT pkg.deploy_fecha_2
	FROM DUAL;
/

