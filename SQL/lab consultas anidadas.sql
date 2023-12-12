--CONSULTAS ANIDADAS--

--EJERCICIO 3
--Clubes tales que todos sus jugadores tienen la letra E
SELECT c.nombre
FROM Club c
WHERE NOT EXISTS     
    ((SELECT j.nif
    FROM Jugador j
    WHERE c.cif = j.cif)
    MINUS
    (SELECT j.nif
    FROM jugador j JOIN persona p
    ON j.nif = p.nif
    WHERE (p.nombre LIKE '%e%' OR p.nombre LIKE '%E%')));

--MAS COMPACTA, DADA POR EL PROFESOR--
SELECT C.nombre
FROM Club C
WHERE NOT EXISTS    
    (SELECT J.nif
     FROM Jugador J JOIN Persona P ON J.nif = P.nif
     WHERE J.CIF = C.CIF AND P.nombre NOT LIKE '%e%' AND p.nombre NOT LIKE '%E%');

select * from club;
select * from jugador j join persona p ON  j.nif = p.nif ORDER BY j.cif;


--EJERCICIO 4
--Personas que asistieron a todos los partidos del RMCF 
SELECT *
FROM Persona P
WHERE NOT EXISTS (--PARTIDOS DEL RMCF A LOS Q NO HA IDO x PERSONA
			(SELECT CIF_local, CIF_Visitante
			FROM Enfrenta
            WHERE (CIF_local LIKE '11111111X' OR CIF_Visitante LIKE '11111111X'))
			MINUS
			(SELECT CIF_local, CIF_Visitante
			FROM Asiste
			WHERE NIF = P.NIF AND (CIF_local LIKE '11111111X' OR CIF_Visitante LIKE '11111111X')));

--tabla asiste pasado a nombres de persona y clubes            
            SELECT p.nombre, c1.nombre, c2.nombre
            FROM persona p JOIN asiste a
            ON a.nif = p.nif 
            JOIN club c1
            ON c1.cif = a.cif_local 
            JOIN club c2
            ON c2.cif = a.cif_visitante ;






