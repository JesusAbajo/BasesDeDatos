--JESUS ABAJO MAGRO

CREATE OR REPLACE PROCEDURE listar_erupciones(p_isla_id isla.id%TYPE) IS
 tiempo_total INTEGER := 0;
 nombre isla.nombre%TYPE;
 vnombre volcan.nombre%TYPE;
 fecha erupcion.fecha%TYPE;
 duracion erupcion.duracion%TYPE;
 contaux INTEGER := 0;
 it INTEGER := 0;
BEGIN
    SELECT * INTO it
    FROM isla i JOIN volcan v
    ON i.id = v.isla_id 
    JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.id = p_isla_id;
    
    SELECT i.nombre
	into nombre
    FROM isla i 
    WHERE i.id = p_isla_id;
    
    SELECT  v.nombre, e.fecha, e.duracion
    INTO  vnombre, fecha, duracion
    FROM isla i JOIN volcan v
    ON i.id = v.isla_id 
    JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.id = p_isla_id;
    
    DBMS_OUTPUT.PUT_LINE('Erupciones de la isla ID: ' || p_isla_id || ', ' ||  '"' || nombre ||  '"');
    DBMS_OUTPUT.PUT_LINE( '****************************************' ) ;
        for i IN it LOOP
            DBMS_OUTPUT.PUT_LINE('  - Volcán: ' || '"' || vnombre || '"' );
            DBMS_OUTPUT.PUT_LINE('    ' || contaux || ' ' || fecha || ' -> ' || duracion || 'dias');
            
		tiempo_total := tiempo_total + duracion;
        END LOOP;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No existe ninguna isla con ID: ' || p_isla_id) ;
    
END;
/


SELECT COUNT(*)
    FROM isla i JOIN volcan v
    ON i.id = v.isla_id 
    JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.id = 5;
    
    
        SELECT  v.nombre, e.fecha, e.duracion

    FROM isla i JOIN volcan v
    ON i.id = v.isla_id 
    JOIN erupcion e ON 
    v.id = e.volcan_id
    WHERE i.id = 5;
    
    
    
------SOLUCION CORRECTA DEL PROFESOR

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE listar_erupciones ( p_isla_id Isla . ID % TYPE ) IS
    nombre_isla Isla . Nombre %TYPE ;
    num_erup INTEGER ;
    total_erup INTEGER := 0;
    v_volcan_id Volcan . ID %TYPE ;
    CURSOR cr_volcanes IS ( SELECT V . ID , V . Nombre
                            FROM Volcan V
                            WHERE V . Isla_id = p_isla_id ) ;
    CURSOR cr_erupciones IS ( SELECT E . fecha , E . duracion
                            FROM Erupcion E
                            WHERE E . Volcan_ID = v_volcan_id ) ;
BEGIN
    SELECT I . Nombre INTO nombre_isla
    FROM Isla I
    WHERE I . ID = p_isla_id ;

        DBMS_OUTPUT . PUT_LINE ('Erupciones de la isla ID: ' || p_isla_id || ', "' || nombre_isla || '"') ; 
        DBMS_OUTPUT . PUT_LINE (' **************************************** ') ;
            FOR v IN cr_volcanes LOOP
                DBMS_OUTPUT . PUT_LINE (' - Volcán "' || v . Nombre || '"') ;
                v_volcan_id := v . id ;
                num_erup := 1;
                    FOR e IN cr_erupciones LOOP
                        DBMS_OUTPUT . PUT_LINE (' ' || num_erup || ') ' || e . fecha || ' -> ' || e . duracion || ' días ') ;
                        num_erup := num_erup + 1;
                        total_erup := total_erup + e . duracion ;
                    END LOOP ;
            END LOOP ;
        DBMS_OUTPUT . PUT_LINE ('Duración total de las erupciones : ' || total_erup ) ;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT . PUT_LINE ('No existe ninguna isla con ID: ' || p_isla_id ) ;
END;
/

BEGIN
    listar_erupciones(5);
    DBMS_OUTPUT . PUT_LINE ('') ;
    listar_erupciones(5) ;
END;
/

SELECT listar_erupciones(5)
FROM DUAL;
