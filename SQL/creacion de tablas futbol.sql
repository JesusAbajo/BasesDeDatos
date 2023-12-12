CREATE TABLE Club (
CIF CHAR( 9 ) PRIMARY KEY, --CIF esclave primaria
Nombre VARCHAR( 50 ) NOT NULL,
Sede VARCHAR( 100 ) NOT NULL,
Num_Socios INTEGER NOT NULL
) ;

CREATE TABLE Patrocinador (
CIF CHAR( 3 ) PRIMARY KEY,
NomPat VARCHAR( 50 ) NOT NULL,
Rama VARCHAR( 20 ) NOT NULL,
Eslogan VARCHAR( 40 )
) ;

CREATE TABLE Persona (
NIF CHAR( 9 ) PRIMARY KEY, 
Nombre VARCHAR( 50 ) NOT NULL
) ;

CREATE TABLE Jugador (
NIF CHAR( 9 ) PRIMARY KEY, 
Altura INTEGER NOT NULL,
CIF CHAR( 3 ) NOT NULL,
    FOREIGN KEY (NIF) REFERENCES Persona(NIF),
    FOREIGN KEY (CIF) REFERENCES Patrocinador(CIF)
) ;

CREATE TABLE Arbitro (
NIF CHAR( 9 ) PRIMARY KEY, 
Colegio VARCHAR( 50 ) NOT NULL,
Fecha_Colegiatura DATE NOT NULL,
    FOREIGN KEY (NIF) REFERENCES Persona(NIF)
) ;

CREATE TABLE Patrocina (
NIF CHAR( 9 ), 
CIF CHAR( 3 ),
Cantidad INTEGER NOT NULL,
    PRIMARY KEY (NIF, CIF),
    FOREIGN KEY (NIF) REFERENCES Persona(NIF),
    FOREIGN KEY (CIF) REFERENCES Patrocinador(CIF)
) ;

CREATE TABLE Financia (
CIF_P CHAR( 3 ), 
CIF_C CHAR( 3 ),
Cantidad INTEGER NOT NULL,
    PRIMARY KEY (CIF_P, CIF_C),
    FOREIGN KEY (CIF_P) REFERENCES Patrocinador(CIF),
    FOREIGN KEY (CIF_C) REFERENCES Club(CIF)
) ;

CREATE TABLE Enfrenta (
CIF_local CHAR( 3 ), 
CIF_Visitante CHAR( 3 ),
Goles_local INTEGER NOT NULL,
Goles_visitente INTEGER NOT NULL,
Fecha DATE NOT NULL,
NIF CHAR( 9 )NOT NULL,
    PRIMARY KEY (CIF_local, CIF_visitante),
    FOREIGN KEY (CIF_local) REFERENCES Club(CIF),
    FOREIGN KEY (CIF_visitante) REFERENCES Club(CIF),
    FOREIGN KEY (NIF) REFERENCES Arbitro(NIF)
) ;

CREATE TABLE Asitente (
NIF CHAR( 9 ), 
CIF_local CHAR( 3 ), 
CIF_Visitante CHAR( 3 ),
    PRIMARY KEY (NIF, CIF_local, CIF_visitante),
    FOREIGN KEY (NIF) REFERENCES Persona(NIF),
    FOREIGN KEY (CIF_local, CIF_visitante) REFERENCES Enfrenta(CIF_local, CIF_visitante)
) ;