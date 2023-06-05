-- Ejercicios Agregación

---------------------------------------------------------------
-- Generar una agrupación por cliente que indique el número de actividades de esta forma:
-- Nombre, Apellido, Número de Actividades
---------------------------------------------------------------
select cl.nombre ,
		cl.apellido ,
		COUNT(idtipoactividad) AS Numactividad
from clientes cl
inner join actividades ac on ac.idcliente=cl.idcliente
group by cl.nombre , cl.apellido;  

-----------------------
-- GENERAR
-----------------------

---------------------------------------------------------------
-- 1) un listado total del número de actividades por día:
-- Fecha, # actividades.
---------------------------------------------------------------
select * from actividades a; 

select 
	fecha,
	COUNT(fecha) AS Numactividad
from actividades a 
group by (fecha)
order by fecha;

---------------------------------------------------------------
-- 2) Además generar una subdivisión por el tipo de actividad:
-- Fecha, Tipo de Actividad, # Actividades.
---------------------------------------------------------------
select * from actividades a;

select 
	ac.fecha,
	tac.tipoactividad,
	COUNT(fecha) AS Numactividad
from actividades ac
inner join tipoactividades tac on ac.idtipoactividad =tac.idtipoactividad
group by ac.fecha, tac.tipoactividad
order by fecha;

---------------------------------------------------------------
-- Generar una suma total de actividades y cliente:
-- Tipo de Actividad, # Clientes
---------------------------------------------------------------
select 
	tac.tipoactividad, 
	COUNT(idcliente) AS Numclientes
from actividades ac
inner join tipoactividades tac on ac.idtipoactividad =tac.idtipoactividad 
group by tac.tipoactividad
order by numclientes

---------------------------------------------------------------
-- Generar una cuenta (COUNT) del número total de clientes,
-- y del número total de clientes que tienen y no tienen actividades
---------------------------------------------------------------

-- # total de clientes
SELECT COUNT(distinct IDCLIENTE) AS NumClientes
FROM clientes c  

-- # total de clientes que tienen actividades
SELECT 
	COUNT(idcliente) AS Numclientes
FROM Clientes CL
WHERE CL.idcliente IN
		(SELECT DISTINCT idcliente
		FROM actividades a  
		)

-- # total de clientes que no tienen actividades
SELECT 
	COUNT(idcliente) AS Numclientes
FROM Clientes CL
WHERE CL.idcliente NOT IN
		(SELECT DISTINCT idcliente
		FROM actividades a  
		)

---------------------------------------------------------------
-- Obtener la actividad más reciente y la menos reciente
---------------------------------------------------------------

-- Actividad mas reciente
select 
	ac.fecha,
	tac.tipoactividad
	from actividades ac
inner join tipoactividades tac on ac.idtipoactividad =tac.idtipoactividad
where fecha=(select max(fecha) from actividades)

-- Actividad menos reciente
select 
	ac.fecha,
	tac.tipoactividad
	from actividades ac
inner join tipoactividades tac on ac.idtipoactividad =tac.idtipoactividad
where fecha=(select min(fecha) from actividades)

