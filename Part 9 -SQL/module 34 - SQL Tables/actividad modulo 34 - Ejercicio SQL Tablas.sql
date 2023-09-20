-- Ejercicio SQL Tablas

-- -----------------------------------------------------
-- Generación de tabla maestro Clientes.
-- Incluir Cédula, datos personales, telf, dirección, etc.
-- Mínimo 10 campos
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Clientes
(	
	IdCliente CHARACTER VARYING(20) NOT NULL,
	Nombre CHARACTER VARYING(40) NOT NULL,
	Apellido CHARACTER VARYING(40) NOT NULL,
	Cedula CHARACTER VARYING(20) NOT NULL,
	Telefono CHARACTER VARYING(60) NOT NULL,
	CorreoElectronico CHARACTER VARYING (150) NOT NULL,
	Direccion CHARACTER VARYING(60) NOT NULL,
	Ciudad CHARACTER VARYING(45) NOT NULL,
	FechaDeNacimiento DATE,
	EstadoCivil CHARACTER VARYING(45) NOT NULL,
	
	CONSTRAINT Clientes_pk PRIMARY KEY (IdCliente)
);

-- -----------------------------------------------------
-- Generación de una tabla de Actividades por Cliente.
-- Cada actividad debe tener un ID,
-- así como el tipo de actividad:
	-- cotización,
	-- visita sitio web y
	-- llamada cliente,
-- junto con campos de descripción y fecha. 
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Actividades
(	
	IdActividad CHARACTER VARYING(20) NOT NULL,
	IdTipoActividad CHARACTER VARYING(20) NOT NULL,
	Fecha DATE,
	Descripcion CHARACTER VARYING(150) NOT NULL,
	
	CONSTRAINT Actividades_pk PRIMARY KEY (IdActividad)
);

-- Olvide añadir una columna en la tabla de actividades 
ALTER TABLE Actividades 
ADD IdCliente CHARACTER VARYING (20) NOT NULL;


-- -----------------------------------------------------
-- Generación de una tabla de Tipo de Actividades,
-- que contenga el ID y el Tipo de la actividad,
-- relacionada con la de Actividades por Cliente
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS TipoActividades
(	
	IdTipoActividad CHARACTER VARYING(20) NOT NULL,
	TipoActividad CHARACTER VARYING(150) NOT NULL,
	CONSTRAINT TipoActividades_pk PRIMARY KEY (IdTipoActividad)
);

-- -----------------------------------------------------
-- Generación de llaves primarias y foráneas
-- -----------------------------------------------------

-- Las llaves primarias ya las generé cuando creé las tablas

ALTER TABLE actividades 
	ADD CONSTRAINT fk_actividades_clientes 
	FOREIGN KEY (idcliente)
	REFERENCES clientes (idcliente);
ALTER TABLE actividades 	
	ADD CONSTRAINT fk_actividades_tipoactividades
	FOREIGN KEY (idtipoactividad)
	REFERENCES tipoactividades (idtipoactividad);

-- -----------------------------------------------------
-- Generación de índices en la tabla Clientes a nivel de apellido, nombre
-- -----------------------------------------------------

CREATE INDEX Clientes_nombre_ix ON Clientes (Nombre);
CREATE INDEX Clientes_apellido_ix ON Clientes (Apellido);

-- -----------------------------------------------------
-- Añadir una restricción para que la descripción de la actividad no sea NULA
-- -----------------------------------------------------

-- En el momento en el que creé la tabla añadí la restricción para que la 
-- descripción de la actividad no fuera NULA.Sin embargo, no lo hice para 
-- el campo fecha por lo añado la restricción a esa columna.

ALTER TABLE actividades  
	ALTER COLUMN fecha
	SET NOT NULL;

-- -----------------------------------------------------
-- Insertar 5 clientes,
-- 3 tipos de actividad y
-- 25 registros de actividades en total
-- -----------------------------------------------------

----------------------------
-- Insertar 5 clientes
----------------------------
INSERT INTO Clientes VALUES('1','Pedro','Flores','43526190','3110001122','pedrof@example.com','tranversal 42-3c','Cajica','1980-02-13','casado');
INSERT INTO Clientes VALUES('2','Elvira','Cespedes','19358759','3110001133','elv345@example.com','El quintal 5-36','Tenjo','1960-06-23','viuda');
INSERT INTO Clientes VALUES('3','Sandra','Villamil','23408561','3110441122','sandra_vil@example.com','calle 5a-7','Tabio','1990-02-13','casada');
INSERT INTO Clientes VALUES('4','Joaquin','Amaya','89235013','3130701128','joqa_43@example.com','alto de los pinos','Cajica','2000-07-02','soltero');
INSERT INTO Clientes VALUES('5','Lorena','Briceno','67345642','3101202211','lorno_01@example.com','centro 2b-40','Tenjo','1997-12-12','soltera');

---------------------------------
-- Insertar 3 tipos de actividad
---------------------------------
INSERT INTO tipoactividades  VALUES('1','cotización');
INSERT INTO tipoactividades  VALUES('2','visita sitio web');
INSERT INTO tipoactividades  VALUES('3','llamada cliente');

-------------------------------------------------
-- Insertar 25 registros de actividades en total
-------------------------------------------------
INSERT INTO actividades  VALUES('1','2','2023-01-13','duró 5 minutos','1');
INSERT INTO actividades  VALUES('2','1','2023-01-14','de un mueble para la sala','1');
INSERT INTO actividades  VALUES('3','3','2023-01-17','para un rembolso','1');
INSERT INTO actividades  VALUES('4','2','2023-01-20','duró 1 minutos','1');
INSERT INTO actividades  VALUES('5','2','2023-01-24','duró 3 minutos','1');

INSERT INTO actividades  VALUES('6','2','2023-01-12','duró 2 minutos','2');
INSERT INTO actividades  VALUES('7','3','2023-01-12','presentar una queja','2');
INSERT INTO actividades  VALUES('8','3','2023-01-15','presentar una queja','2');
INSERT INTO actividades  VALUES('9','3','2023-01-15','cancelacion de la membresia','2');
INSERT INTO actividades  VALUES('10','3','2023-01-20','revisar si la membresia le fue retirada','2');

INSERT INTO actividades  VALUES('11','2','2023-01-10','duró 10 minutos','3');
INSERT INTO actividades  VALUES('12','1','2023-01-10','para un comedor nuevo','3');
INSERT INTO actividades  VALUES('13','2','2023-01-13','duró 15 minutos','3');
INSERT INTO actividades  VALUES('14','1','2023-01-13','para diferentes juego de sala','3');
INSERT INTO actividades  VALUES('15','3','2023-01-17','revisar la disponibilidad de un comedor','3');

INSERT INTO actividades  VALUES('16','2','2023-01-21','duró 4 minutos','4');
INSERT INTO actividades  VALUES('17','2','2023-01-22','duró 10 minutos','4');
INSERT INTO actividades  VALUES('18','2','2023-01-23','duró 7 minutos','4');
INSERT INTO actividades  VALUES('19','2','2023-01-24','duró 17 minutos','4');
INSERT INTO actividades  VALUES('20','1','2023-01-25','diferentes set de cortinas','4');

INSERT INTO actividades  VALUES('21','2','2023-01-05','duró 8 minutos ','5');
INSERT INTO actividades  VALUES('22','1','2023-01-13','para forros de sofa','5');
INSERT INTO actividades  VALUES('23','3','2023-01-13','revisar disponibilidad forros de sofa en diferentes colores','5');
INSERT INTO actividades  VALUES('24','3','2023-01-13','solicitar envio forros de sofa','5');
INSERT INTO actividades  VALUES('25','3','2023-01-13','cambio direccion entrega','5');

-- -----------------------------------------------------
-- Hacer un SELECT de:
-- todos los clientes,
-- y luego uno de clientes y
-- tipo de actividad
-- -----------------------------------------------------

SELECT * FROM clientes;
SELECT * FROM tipoactividades;
SELECT * FROM actividades;

-- -----------------------------------------------------
-- Hacer un SELECT que genere un listado completo de actividades por cliente incluyendo: 
	--ID Gobierno,
	-- Nombre,
	--Apellido,
	-- Email,
	-- Fecha de la actividad,
	-- Tipo de Actividad
-- -----------------------------------------------------

SELECT CL.cedula, CL.nombre, CL.apellido, CL.correoelectronico,AC.fecha,TA.tipoactividad 
FROM actividades AC
INNER JOIN clientes CL ON AC.idcliente = CL.idcliente
INNER JOIN tipoactividades TA ON AC.idtipoactividad  = TA.idtipoactividad 
