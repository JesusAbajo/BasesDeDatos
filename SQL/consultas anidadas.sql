SELECT * 
FROM Asiste
ORDER BY NIF ASC;

-->PERSONAS QUE HAN ASISTIDO A UN NUMERO CONCRETO DE PARTIDOS
SELECT *
FROM Persona P
WHERE (SELECT COUNT(*)
	FROM Asiste 
	WHERE NIF = P.NIF) = 3;
-------------------- en las consultas anidadas nos solemos referir  
--------------------	a las tablas del from principal

SELECT COUNT(NIF) --cuentas todas las filas en las que el nif no sea NULL
		  --para contar las columnas independientemente de eso ponemos COUNT(*)
FROM Asiste 
WHERE NIF = '00000001X'


-->PERSONAS QUE HAN ASISTIDO A TODOS LOS PARTIDOS
SELECT *
FROM Persona P
WHERE NOT EXISTS (--PARTIDOS A LOS Q NO HA IDO x PERSONA
			(SELECT CIF_local, CIF_Visitante
			FROM Enfrenta)
			MINUS
			(SELECT CIF_local, CIF_Visitante
			FROM Asiste
			WHERE NIF = P.NIF));

--PARTIDOS A LOS Q NO HA IDO UNA PERSONA
(SELECT CIF_local, CIF_Visitante
FROM Enfrenta)
MINUS
(SELECT CIF_local, CIF_Visitante
FROM Asiste
WHERE NIF = '00000001X')


-->PERSONAS QUE HAN ASISTIDO A TODOS LOS PARTIDOS OTRA MANERA
SELECT *
FROM Persona P
WHERE (SELECT COUNT (*)
	FROM Asiste A
	WHERE NIF = P.NIF =( SELECT COUNT(*)
			    FROM Enfrenta);










