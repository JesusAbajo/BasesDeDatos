-- Para procesar este archivo (se puede especificar también la ruta): /process datos.ra
-- Antes debéis crear las relaciones (tablas).
-- Falta la última tupla de cada tabla y debéis escribir vosotros la instrucción de inserción en cada caso
/abolish

create table programadores(dni string primary key, nombre string,direcci�n string, tel�fono string);
insert into programadores(dni, nombre, direcci�n, tel�fono) values('1','Jacinto','Jazmín 4','91-8888888');
insert into programadores(dni, nombre, direcci�n, tel�fono) values('2','Herminia','Rosa 4','91-7777777');
insert into programadores(dni, nombre, direcci�n, tel�fono) values('3','Calixto','Clavel 3','91-1231231');
insert into programadores (dni, nombre, direcci�n, tel�fono) values ('4','Teodora','Petunia 3','91-6666666');


create table analistas(dni string primary key, nombre string,
direcci�n string, tel�fono string);
insert into analistas(dni, nombre, direcci�n, tel�fono) values('4','Teodora','Petunia 3','91-6666666');
insert into analistas(dni, nombre, direcci�n, tel�fono) values('5','Evaristo','Luna 1','91-1111111');
insert into analistas(dni, nombre, direcci�n, tel�fono) values('6','Luciana','J�piter 2','91-8888888');
insert into analistas(dni, nombre, direcci�n, tel�fono) values('7','Nicodemo','Plut�n 3',NULL);


-- Para crear una clave primaria de más de un atributo hay que añadir al final como si fuese otro campo lo siguiente: primary key (códigopr, dniemp)
create table distribuci�n(c�digopr string, dniemp string, horas int,primary key (c�digopr, dniemp));
insert into distribuci�n(c�digopr, dniemp, horas) values('P1','1',10);
insert into distribuci�n(c�digopr, dniemp, horas) values('P1','2',40);
insert into distribuci�n(c�digopr, dniemp, horas) values('P1','4',5);
insert into distribuci�n(c�digopr, dniemp, horas) values('P2','4',10);
insert into distribuci�n(c�digopr, dniemp, horas) values('P3','1',10);
insert into distribuci�n(c�digopr, dniemp, horas) values('P3','3',40);
insert into distribuci�n(c�digopr, dniemp, horas) values('P3','4',5);
insert into distribuci�n(c�digopr, dniemp, horas) values('P3','5',30);
insert into distribuci�n(c�digopr, dniemp, horas) values('P4','4',20);
insert into distribuci�n (c�digopr, dniemp, horas) values('P4','5',10);


create table proyectos(c�digo string primary key, descripci�n string, dnidir string);
insert into proyectos(c�digo, descripci�n, dnidir) values('P1','N�mina','4');
insert into proyectos(c�digo, descripci�n, dnidir) values('P2','Contabilidad','4');
insert into proyectos(c�digo, descripci�n, dnidir) values('P3','Producci�n','5');
insert into proyectos(c�digo, descripci�n, dnidir) values('P4','Clientes','5');
insert into proyectos (c�digo, descripci�n, dnidir) values('P5', 'Ventas', '6');


empleados := programadores union analistas;

dnidirporempleados := (project dnidir (proyectos)) product empleados;

datosdirproyecto := project nombre, direcci�n, tel�fono (select dnidir = dni (dnidirporempleados));


vista1 := project dni(empleados);

vista2 := project dni(programadores intersect analistas);

dnitrabajadores := project dniemp (distribuci�n);

dnidirectores := project dnidir(proyectos);

vista3 := project dni(empleados) difference (dnitrabajadores union dnidirectores);

--------------------------------------------------------------


select true (vista4);
select true (vista5);
select true (vista6);
select true (vista7);

--------------------------------------------------------------
insert into programadores values ('4','Teodora','Petunia 3','91-6666666');
insert into analistas values ('7','Nicodemo','Plut�n 3',NULL);
insert into distribuci�n values ('P4','5',10);
insert into proyectos values('P5', 'Ventas', '6');

empleados := programadores union analistas;

dnidirporempleados := (project dnidir (proyectos)) product empleados;

datosdirproyecto := project nombre, direcci�n, tel�fono (select dnidir = dni (dnidirporempleados));


vista1 := project dni(empleados);

vista2 := project dni(programadores intersect analistas);

dnitrabajadores := project dniemp (distribuci�n);

dnidirectores := project dnidir(proyectos);

vista3 := project(vista1 difference (dnitrabajadores union dnidirectores));




