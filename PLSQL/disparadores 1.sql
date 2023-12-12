MIRAR SINTAXIS EN EL CAMPUS VIRTUAL

cosa := 34
cosa2 := 'Hola' || 'Josefina'
cosa3 := 3 * 2
---------------------
IF cosa < 3 THEN
--
ELSE    (tbn se puede poner ELSIF ---)
--
END IF
----------------------
WHILE cosa < 3 THEN
--
END LOOP
----------------------
--> SACAR POR PANTALLA
DBMS_OUTPUT.PUTLINE(3);
DBMS_OUTPUT.PUTLINE('HOLA');
	HACE FALTA PONER <<SET SEREROUTPUT >>
----------------------
	SEGUIR REVISNDO SINTAXIS :(((((((((


-------------FUNCIONES-------------

CREATE OR REPLACE FUNCTION dup(n INTEGER) RETURN INTEGER IS
	ret INTEGER;
BEGIN
  ret := 2*n;
  RETURN ret;
END;
/

--> INVOCAR FUNCIONES
SELECT dup(3)
FROM dual;

SET SERVEROUTPUT ON;

DECLARE
  cosa INTEGER;
BEGIN
  cosa := dup(6);
  DBMS_OUTPUT.PUT_LINE('Doble: ' || cosa)
END;
/

CREATE OR REPLACE FUNCTION sumatorio(a INTEGER, b INTEGER) RETURN INTEGER IS
  accum INTEGER := 0;
BEGIN
  FOR i IN a..b LOOP
    accum := accum + 1;
  END LOOP;
  RETURN accum;
END;
/


CREATE OR REPLACE PROCEDURE borra_bajos(
        h Jugador.Altura%TYPE) IS
BEGIN
  IF h <= 2 THEN
    DELETE FROM Jugador
    WHERE Altura < h;
  END IF;
END;
/
DECLARE 
 umbral Jugador.Altura%TYPE := 1.75;
BEGIN
  borra_bajos(umbral); 
END;
/


--DELETE INSERT UPDATE => perdectamente utilizables en los procedimientos


------CURSORES/ SELECT INTO------

--si queremos return de mas de una fila usamos un SELECT INTO
--EN CUALQUIER OTRO CASO USAMOS UN CURSOR

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE lista_jugadores(
        pcif club.cif%TYPE) 
		IS CURSOR cr_jugador_club IS (
			SELECT p.nombre, j.altura
			FROM Persona p JOIN Jugador j
			ON p.nif = j.nif
			WHERE j.cif = pcif AND j.altura > 1.9);
BEGIN
    DBMS_output.put_line('comienza lista de jugadores');
	FOR jug_info IN cr_ugador_club LOOP
	DBMS_output.put_line('* ' || jug_info.nombre);
	DBMS_output.put_line('       ' || jug_info.altura);
	END LOOP;
    DBMS_output.put_line('Finaliza lista de jugadores');
END;
/

BEGIN
  lista_jugadores('11111111X'); 
END;
/

SELECT p.nombre, j.altura
FROM Persona p JOIN Jugador j
ON p.nif = j.nif
WHERE j.cif = '11111111X';


CREATE OR REPLACE PROCEDURE imprime_altos IS
	CURSOR cr_jugaores IS 	SELECT *
				FROM Persona p JOIN Jugador j
				ON p.nif = j.nif
				WHERE altura > 1.70;

BEGIN 
	FOR fila In cr_jugadores LOOP
		DBMS_OUTPUT.PUT_LINE(fila.NIF || ' -> ' || fila.nombre);
	END LOOP;
END;

CREATE OR REPLACE PROCEDURE num_jugadores(
        pcif club.cif%TYPE) RETURN INT IS
		IS CURSOR cr_jugador_club IS (
			SELECT j.nif
			FROM Jugador j
			WHERE j.cif = pcif);
		accum INT;
BEGIN
		accum := 0;
    DBMS_output.put_line('comienza lista de jugadores');
	FOR jug_info IN cr_ugador_club LOOP
		
	accum := accum + 1;
	END LOOP;
	RETURN accum;
END;
/

SELECT num_jugadores('11111111X')
FROM DUAL;

SELECT j.nif
FROM Jugador j
WHERE j.cif = '11111111X';

SELECT COUNT(*) AS conteo
FROM Jugador j
WHERE j.cif = '11111111X';

--SAME CON SELECT INTO
CREATE OR REPLACE PROCEDURE num_jugadores2(
        pcif club.cif%TYPE) RETURN INT IS v_num_jug

BEGIN
	SELECT COUNT(*) AS conteo
	INTO v_num_jug
	FROM Jugador j
	WHERE j.cif = pcif;
	
	RETURN v_num_jug
END;
/
SELECT num_jugadores2('11111111X') --llamamos a la funcion / cursor
FROM DUAL;





---------EXCEPCIONES------------

--ver pagina 39 de los apuntes

[...]
CREATE OR REPLACE ...
...
BEGIN 
...
	EXCEPTION
		WHEN TOO_MANY_ROWS THEN	
		DBMS_OUTPUT.PUT_LINE('consulta SELECT INTO varias filas');
		WHEN NO_DATA_FOUND THEN	
		DBMS_OUTPUT.PUT_LINE('consulta SELECT INTO no devuelve ninguna fila');
		WHEN OTHERS THEN	
		DBMS_OUTPUT.PUT_LINE('otro error : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('con mensaje: ' || SQLERRM);

[...]


--tambien se pueden hacer excepciones personalizadas <:(
--pagina 42 (es facil)





---------DISPARADORES-----------

--	PAGINAS 44 45 ...
-- solo vamos a usar disparadores de tablas


CREATE OR REPLACE TRIGGER corrige_altura
BEFORE UPDATE OF Altura OR INSERT
ON jugador
FOR EACH ROW WHEN(NEW.Altura > 3)
BEGIN 
	DBMS_OUTPUT.PUT_LINE(' balaffwefefefwfe')
	NEW.Altura := :NEW.Altura * 0.3048;
END;









