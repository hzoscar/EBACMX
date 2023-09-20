-- Ejercicio Selección y Agrupación

-- ----------------------------------------------------------------------------------------
-- Insertar 20 registros de actividades de cliente, aplicarlas a los clientes existentes
-- ----------------------------------------------------------------------------------------

INSERT INTO actividades  VALUES('26','2','2023-03-12','duró 2 minutos','1');
INSERT INTO actividades  VALUES('27','3','2023-02-12','presentar una queja','4');
INSERT INTO actividades  VALUES('28','3','2023-03-15','presentar una queja','4');
INSERT INTO actividades  VALUES('29','3','2023-03-15','cancelacion de la membresia','1');
INSERT INTO actividades  VALUES('30','3','2023-03-20','revisar si la membresia le fue retirada','4');
INSERT INTO actividades  VALUES('31','2','2023-02-10','duró 10 minutos','5');
INSERT INTO actividades  VALUES('32','1','2023-02-10','para un comedor nuevo','5');
INSERT INTO actividades  VALUES('33','2','2023-02-13','duró 15 minutos','5');
INSERT INTO actividades  VALUES('34','1','2023-02-13','para diferentes juego de sala','2');
INSERT INTO actividades  VALUES('35','3','2023-02-17','revisar la disponibilidad de un comedor','2');
INSERT INTO actividades  VALUES('36','2','2023-03-21','duró 4 minutos','5');
INSERT INTO actividades  VALUES('37','2','2023-03-22','duró 10 minutos','4');
INSERT INTO actividades  VALUES('38','2','2023-03-23','duró 7 minutos','3');
INSERT INTO actividades  VALUES('39','2','2023-03-24','duró 17 minutos','2');
INSERT INTO actividades  VALUES('40','1','2023-03-25','diferentes set de cortinas','1');
INSERT INTO actividades  VALUES('41','2','2023-02-13','Duró 5 minutos','3');
INSERT INTO actividades  VALUES('42','1','2023-02-14','de un mueble para la sala','3');
INSERT INTO actividades  VALUES('43','3','2023-03-17','para un rembolso','3');
INSERT INTO actividades  VALUES('44','2','2023-03-20','duró 1 minutos','2');
INSERT INTO actividades  VALUES('45','2','2023-03-24','duró 3 minutos','2');

-- -----------------------------------------------------------------------------------------
-- Insertar 5 clientes que no tengan actividad alguna
-- ------------------------------------------------------------------------------------------

INSERT INTO Clientes VALUES('6','Luis','Herrera','54526190','3113726122','luish@example.com','tranversal 12-4b','Tenjo','1999-05-23','casado');
INSERT INTO Clientes VALUES('7','Natalia','Cordoba','78358759','3119537133','cor_n@example.com','El tropel 3-45','Cajica','1970-08-14','soltera');
INSERT INTO Clientes VALUES('8','Noel','Jimenez','10408561','3110948122','noel_jim@example.com','calle 6b-18','Tabio','1991-01-01','soltero');
INSERT INTO Clientes VALUES('9','Andres','Sarmiento','37235013','3132846128','sar_a37@example.com','la esmeralda','Tenjo','2001-07-02','soltero');
INSERT INTO Clientes VALUES('10','David','Briceno','81345642','3104481211','dabri81@example.com','centro 3a-45','Cajica','1996-02-04','soltero');

-- --------------------------------------------------------------------------------------------------
--  Hacer un listado de clientes y registros por actividad, mostrando el cliente con sus actividades 
-- utilizando INNER JOIN
-- ---------------------------------------------------------------------------------------------------
SELECT 
	CL.idcliente, 
	CL.cedula,
	CL.nombre,
	CL.apellido,
	CL.correoelectronico,
	AC.fecha,
	TA.tipoactividad 
FROM clientes CL
INNER JOIN actividades AC ON CL.idcliente = AC.idcliente
INNER JOIN tipoactividades TA ON AC.idtipoactividad  = TA.idtipoactividad
ORDER BY idcliente 

--------------------------------------------------------------------------------------------------
--Hacer un listado de clientes y actividades con LEFT OUTER JOIN y explicar los blancos en los 5 
--últimos clientes generados que no tienen actividades
---------------------------------------------------------------------------------------------------
SELECT  
	CL.idcliente, 
	CL.cedula,
	CL.nombre,
	CL.apellido,
	CL.correoelectronico,
	AC.fecha,
	TA.tipoactividad 
FROM clientes CL
LEFT JOIN actividades AC ON CL.idcliente = AC.idcliente
LEFT JOIN tipoactividades TA ON AC.idtipoactividad  = TA.idtipoactividad

-- Como se puede apreciar en el QUERY los clientes con el "idcliente" >=6 no tienen actividades
-- por lo cual el valor es nulo.

-- Estos son los clientes que no han tenido actividades recientes (desde el inicio de este año):
SELECT 
	CL.idcliente, 
	CL.cedula,
	CL.nombre,
	CL.apellido,
	CL.correoelectronico
FROM Clientes CL
WHERE CL.idcliente NOT IN
		(SELECT DISTINCT idcliente
		FROM actividades AC 
		)
-- ----------------------------------------------------------------------------------------------------
-- Hacer un listado que ordene todas las actividades: a) por ID de cliente, b) por fecha de actividad
-- -----------------------------------------------------------------------------------------------------
SELECT
	AC.idcliente,
	TA.tipoactividad,
	CL.nombre ,
	CL.apellido,
	AC.fecha
FROM actividades ac
INNER JOIN tipoactividades TA ON AC.idtipoactividad  = TA.idtipoactividad
INNER JOIN clientes CL ON AC.idcliente = CL.idcliente 
ORDER BY idcliente, fecha desc 

SELECT
	AC.idcliente,
	TA.tipoactividad,
	CL.nombre ,
	CL.apellido,
	AC.fecha
FROM actividades ac
INNER JOIN tipoactividades TA ON AC.idtipoactividad  = TA.idtipoactividad
INNER JOIN clientes CL ON AC.idcliente = CL.idcliente 
ORDER BY  fecha desc, idcliente 

-- ------------------------------------------------------------------------------------------------------
-- Hacer un listado que muestre el número de actividades por cliente y ordenarlo por nombre del 
-- cliente
-- -------------------------------------------------------------------------------------------------------
SELECT
	CL.apellido || ',' || CL.nombre as FullName,
	COUNT (AC.idcliente) AS Number_activity
from clientes CL
LEFT JOIN actividades AC ON CL.idcliente = AC.idcliente 
GROUP BY FullName
ORDER BY Number_activity, FullName;

