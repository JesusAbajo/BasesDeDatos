--JESUS ABAJO MAGRO 03204849Y
--BASES DE DATOS, 2 B

--ejercicio 1
SELECT i.nombre, v.nombre, e.fecha, e.duracion, v.altura
FROM isla i JOIN volcan v
ON i.id = v.isla_id 
JOIN erupcion e ON 
    v.id = e.volcan_id
WHERE v.altura < 750 AND e.duracion > 10;

--ejercicio 2
SELECT SUM(e.duracion)
FROM erupcion e JOIN volcan v
ON e.volcan_id = v.id
WHERE v.nombre LIKE 'Stromboli';

--ejercicio 3
(SELECT i.nombre
FROM isla i)
MINUS
(SELECT DISTINCT(i.nombre)
FROM isla i JOIN volcan v 
ON i.id = v.isla_id);


--testers
SELECT *
FROM isla i JOIN volcan v
ON i.id = v.isla_id ;

SELECT *
FROM isla i;

SELECT * 
FROM erupcion e;
--fin testers

--ejercicio 4
SELECT DISTINCT v.nombre, MAX(0 + NVL(e.explosividad, 0))
FROM volcan v LEFT JOIN erupcion e
ON v.id = e.volcan_id
GROUP BY v.nombre;

--ejercicio 5
SELECT DISTINCT i.nombre, v.nombre, e.duracion
FROM isla i LEFT JOIN volcan v
ON i.id = v.isla_id 
LEFT JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.extension < 1000 AND (e.id IS NOT NULL) OR (v.nombre IS NULL AND i.extension  < 1000)
ORDER BY i.nombre;


--testers 2
SELECT DISTINCT i.nombre
FROM isla i LEFT JOIN volcan v
ON i.id = v.isla_id 
LEFT JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.extension < 1000 AND (e.id IS NOT NULL) OR (v.nombre IS NULL AND i.extension  < 1000)
ORDER BY i.nombre;


SELECT DISTINCT i.nombre
FROM isla i LEFT JOIN volcan v
ON i.id = v.isla_id 
LEFT JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.extension < 1000 AND COUNT(v.nombre) = COUNT(v.id)
ORDER BY i.nombre;
--fin testers 2
