SELECT *
FROM DUAL;
----------1 y 2
SELECT c.cif, c.nombre,COUNT(DISTINCT j.nif) AS NumJugadores
FROM club c JOIN jugador j
ON c.cif = j.cif
GROUP BY c.cif, c.nombre;

select * FROM club;
select * FROM jugador;


SELECT AVG(j.altura)
FROM jugador j JOIN persona p
ON j.nif = p.nif;

--------3
SELECT MIN(j.altura) as "min(altura)"
        ,MAX(j.altura) as "max(altura)"
        ,round(avg(j.altura),4) as "round(avg(altura),4)"
FROM jugador j JOIN persona p
ON j.nif = p.nif
WHERE p.nombre LIKE '%e%';


---------------9
SELECT c.cif, c.nombre,SUM(0 + NVL(f.cantidad, 0)) AS SUMAFINANCIACIONES
FROM club c LEFT JOIN financia f
ON c.cif = f.cif_C
GROUP BY c.cif, c.nombre
ORDER BY SUMAFINANCIACIONES DESC;