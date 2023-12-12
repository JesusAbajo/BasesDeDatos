
Conversación abierta. 1 mensaje leído.

Ir al contenido
Uso de Correo de Universidad Complutense de Madrid con lectores de pantalla
3 de 1.022
BD LAB 2
Recibidos

Jesús Abajo Magro <jabajo01@ucm.es>
4 oct 2021 17:43 (hace 17 horas)
para mí

--arbitros victorias locales
SELECT  DISTINCT persona.nombre
FROM  persona JOIN  enfrenta
ON persona.NIF = enfrenta.NIF
WHERE enfrenta.goles_local > enfrenta.goles_visitante;

--ramas patrocinadores de clubes populares
SELECT DISTINCT patrocinador.rama
FROM patrocinador JOIN financia
ON patrocinador.cif = financia.cif_p
JOIN club
ON financia.cif_c = club.cif
WHERE club.num_socios > 50000;

--personas que han asistido a victoria local
SELECT DISTINCT p.nif, p.nombre
FROM enfrenta e JOIN asiste a
ON (e.cif_local = a.cif_local AND e.cif_visitante = a.cif_visitante)
JOIN persona p
ON a.nif = p.nif
WHERE e.goles_local > e.goles_visitante;

--personas que no son jugadores
(SELECT nif, nombre
FROM persona p)
MINUS
(SELECT p.nif, p.nombre
FROM persona p JOIN jugador j
ON p.nif= j.nif);

--partidos ganados por club local
SELECT c.nombre AS ClubLocal, e.goles_local AS GolesLocal, e.goles_visitante AS GolesVisitante, cl.nombre AS ClubVisitante
FROM enfrenta e JOIN club c
ON e.cif_local = c.cif
JOIN club cl
ON e.cif_visitante = cl.cif
WHERE e.goles_local > e.goles_visitante
ORDER BY e.goles_local DESC, e.goles_visitante DESC, c.nombre DESC;

--clubes con todos los partidos locales ganados
(SELECT c.nombre
FROM enfrenta e JOIN club c
ON e.cif_local = c.cif)
MINUS
(SELECT DISTINCT c.nombre
FROM enfrenta e JOIN club c
ON e.cif_local = c.cif
WHERE e.goles_visitante >= e.goles_local);

--clubes arbitrados por Velasco Carballo
SELECT c.nombre
FROM persona p JOIN arbitro a
ON p.NIF = a.NIF JOIN enfrenta e
ON a.NIF = e.NIF JOIN club c
ON e.cif_local = c.CIF
WHERE p.nombre = 'Velasco Carballo';


--Asistentes a los partidos => SOLO jugadores y arbitros
--NO FUNCIONA
SELECT p.NIF, p.nombre
FROM persona p JOIN enfrenta e
ON p.NIF = e.NIF JOIN jugador j
ON j.NIF = p.NIF JOIN asiste a
ON j.NIF = a.NIF
WHERE altura IS NOT NULL OR colegio IS NOT NULL;

select * from club;
select * from patrocinador;
select * from financia;
select * from arbitro;
select * from asiste join persona ON persona.nif = asiste.nif;
select * from enfrenta;

