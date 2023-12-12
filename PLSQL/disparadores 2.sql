CREATE TABLE Amigo(
    Nombre VARCHAR(50),
    Edad INTEGER
);

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER disp_Amigos
    BEFORE INSERT
    ON Amigos
        FOR EACH ROW
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Ejecutando disparador');
        END;
        /
        
INSERT INTO Amigo VALUES ('Pepe', 39);
INSERT INTO Amigo VALUES ('Eva', 29);
UPDATE Amigo SET Edad = 55;
DELETE FROM Amigo;