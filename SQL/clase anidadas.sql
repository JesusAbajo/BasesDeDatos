SELECT *
FROM dual;

SELECT 3
FROM dual;

SELECT p.nombre, c.nombre AS club, j.altura
FROM jugador j JOIN club c ON j.cif = c.cif
                JOIN persona p ON p.nif = j.nif
WHERE Altura = (SELECT MAX(Altura) --si cambiamos el MAX por AVG y el = por < nos daria los mas altos que la media
                FROM jugador); -- lo de despues del igual es una consulta anidada
                
SELECT AVG(altura)
FROM jugador;

SELECT  NIF, altura * 100 AS altura, (SELECT ROUND(AVG(altura), 2) FROM jugador) AS media
FROM Jugador;

SELECT *
FROM jugador  
WHERE altura > (SELECT MIN(altura) FROM jugador);
-- ^v son lo mismo
SELECT *
FROM jugador  
WHERE altura > ANY (SELECT altura FROM jugador);

SELECT *
FROM jugador  
WHERE altura >= ALL (SELECT altura FROM jugador);--el mas alto

--------------------------------------------------------


SELECT cif
FROM club
WHERE num_socios > 50000;


SELECT persona.nombre, jugador.altura
FROM jugador JOIN persona ON jugador.nif = persona.nif
WHERE cif NOT IN   (SELECT cif
                FROM club
                WHERE num_socios > 50000);



SELECT * 
FROM jugador j1
WHERE altura != ALL (SELECT Altura 
                    FROM jugador j2
                    WHERE j1.NIF !=  j2.NIF); --quita los jugadores con alturas repetidas

SELECT * 
FROM jugador j
WHERE altura != ALL (null);



-- ALL ANY IN EXIST

--EXIST => lo utilizamos para simular un para todo


SELECT *
FROM jugador j
WHERE NOT EXISTS (SELECT *
                FROM financia
                WHERE cif_c = j.cif); --jugadores que juegan en un equipo sin financiacion
                
                
                
                
                
                