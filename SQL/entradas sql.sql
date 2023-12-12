--SELECT <atributos y columnas que queremos mostrar> => * muestra todos
--FROM <Tabla que queremos que se muestre>
--WHERE <Condicion para mostrar>
--
--
--
--

SELECT Nombre, Altura, Altura*100-- Juan 1,82 182
FROM Jugador JOIN Persona ON Jugador.NIF = Persona.NIF
WHERE Altuta > 1.7 AND Nombre LIKE 'E__n%'; --  _ =>cualquier caracter(1) % =>cualquier cosa ' '=> un espacio representa un espacio
--                                   Eden Hazard

SELECT Num_socios --salen repetidos
FROM Club;

SELECT DISTINCT Num_socios --NO salen repetidos
FROM Club;

SELECT *
FROM Club
WHERE Num_socios > 1000
ORDER BY Num_socios ASC, Nombre ASC; --DES descendente LENGTH(nombre)=>num de caracteres
--                       Al poner dos , al haber empate tiene en cuante la segunda sentencia