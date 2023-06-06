-- Ejercicio -SQL Multiples Tablas

---------------------------------------------
-- Añadir una tabla Inventario que indique: 
-- El Id Item,
-- Descripción,
-- Precio Venta.
-----------------------------------------------

create table if not exists Inventario
(
	IdItem character varying(20) not null,
	Descripcion character varying(250) not null,
	PrecioVenta float not null,
	Constraint Inventario_pk PRIMARY KEY (IdItem)
);

---------------------------------------------
 -- Añadir una tabla de VentasPorCliente, donde se tiene:
 -- Id Cliente,
 -- Fecha,
 -- Id Venta,
 -- Total Venta
-----------------------------------------------

create table if not exists VentasPorCliente
(
	IdCliente character varying(20) not null,
	Fecha Date not null,
	IdVenta character varying(20) not null,
	TotalVenta float not null,
	Constraint VentasPorCliente_pk PRIMARY KEY (IdVenta),
	constraint Clientes_fk foreign key (IdCliente) references Clientes(IdCliente)	
);

---------------------------------------------
 -- Añadir una tabla ItemsPorVenta, que indique:
 -- Id Venta,
 -- Id Item,
 -- Cantidad
 -- Precio
-----------------------------------------------

create table if not exists ItemsPorVenta
(
	IdVenta character varying(20) not null,
	IdItem character varying(20) not null,
	Fecha Date not null,
	Cantidad integer not null,
	Precio float not null,
		
	Constraint ItemsPorVenta_pk PRIMARY KEY (IdVenta, IdItem),
	constraint VentasPorCliente_fk foreign key (IdVenta) references VentasPorCliente(IdVenta),
	constraint Inventario_fk foreign key (IdItem) references Inventario(IdItem)
);


---------------------------------------------
 -- Preparar la base de datos:
 -- Añadir 5 ítems,
 -- 20 Ventas a 10 diferentes clientes.
 -- Cada venta debe tener por lo menos 3 a 5 ítems en los ItemsPorVenta.
-----------------------------------------------

-----------------------------------------------
 -- Añadir 5 ítems
------------------------------------------------

insert into Inventario values ('1','Cama con colchon', 800);
insert into Inventario values ('2','Sofacama', 350);
insert into Inventario values ('3','Comedor', 900);
insert into Inventario values ('4','Juego de Sala', 1750);
insert into Inventario values ('5','Estante decorativo', 850);
insert into Inventario values ('6','Escritorio', 450);
insert into Inventario values ('7','Lavadora',1200);
insert into Inventario values ('8','Tv',1000);
insert into Inventario values ('9','Cortinas',200);
insert into Inventario values ('10','Silla de escritorio',400);
insert into Inventario values ('11','Computador',1100);
insert into Inventario values ('12','Nevera',900);


-----------------------------------------------
 -- 20 Ventas a 10 diferentes clientes.
------------------------------------------------

insert into VentasPorCliente values ('1','2023-01-13','1',1950);
insert into VentasPorCliente values ('1','2023-01-20','2',2650);
insert into VentasPorCliente values ('1','2023-01-24','3',2100);
insert into VentasPorCliente values ('1','2023-03-12','4',1050);
insert into VentasPorCliente values ('2','2023-01-12','5',1950);
insert into VentasPorCliente values ('2','2023-02-13','6',2600);
insert into VentasPorCliente values ('2','2023-02-17','7',1100);
insert into VentasPorCliente values ('3','2023-01-10','8',1250);
insert into VentasPorCliente values ('3','2023-01-13','9',1950);
insert into VentasPorCliente values ('3','2023-02-14','10',1300);
insert into VentasPorCliente values ('4','2023-01-24','11',2400);
insert into VentasPorCliente values ('4','2023-01-25','12',1000);
insert into VentasPorCliente values ('5','2023-01-13','13',700);
insert into VentasPorCliente values ('5','2023-02-10','14',2650);
insert into VentasPorCliente values ('5','2023-02-13','15',1500);
insert into VentasPorCliente values ('6','2023-02-21','16',2200);
insert into VentasPorCliente values ('7','2023-02-01','17',3900);
insert into VentasPorCliente values ('8','2023-02-12','18',2450);
insert into VentasPorCliente values ('9','2023-02-21','19',1800);
insert into VentasPorCliente values ('10','2023-02-17','20',2850);

insert into itemsporventa values ('1','1','2023-01-13',2,800);
insert into itemsporventa values ('1','2','2023-01-13',1,350);
insert into itemsporventa values ('2','3','2023-01-20',1,900);
insert into itemsporventa values ('2','4','2023-01-20',1,1750);
insert into itemsporventa values ('3','7','2023-01-24',1,1200);
insert into itemsporventa values ('3','12','2023-01-24',1,900);
insert into itemsporventa values ('4','5','2023-03-12',1,850);
insert into itemsporventa values ('4','9','2023-03-12',1,200);
insert into itemsporventa values ('5','6','2023-01-12',1,450);
insert into itemsporventa values ('5','10','2023-01-12',1,400);
insert into itemsporventa values ('5','11','2023-01-12',1,1100);
insert into itemsporventa values ('6','4','2023-02-13',1,1750);
insert into itemsporventa values ('6','5','2023-02-13',1,850);
insert into itemsporventa values ('7','3','2023-02-17',1,900);
insert into itemsporventa values ('7','9','2023-02-17',1,200);
insert into itemsporventa values ('8','2','2023-01-10',1,350);
insert into itemsporventa values ('8','3','2023-01-10',1,900);
insert into itemsporventa values ('9','4','2023-01-13',1,1750);
insert into itemsporventa values ('9','9','2023-01-13',1,200);
insert into itemsporventa values ('10','5','2023-02-14',1,850);
insert into itemsporventa values ('10','6','2023-02-14',1,450);
insert into itemsporventa values ('11','1','2023-01-24',3,800);
insert into itemsporventa values ('12','9','2023-01-25',5,200);
insert into itemsporventa values ('13','2','2023-01-13',2,350);
insert into itemsporventa values ('14','3','2023-02-10',1,900);
insert into itemsporventa values ('14','4','2023-02-10',1,1750);
insert into itemsporventa values ('15','10','2023-02-13',1,400);
insert into itemsporventa values ('15','11','2023-02-13',1,1100);
insert into itemsporventa values ('16','7','2023-02-21',1,1200);
insert into itemsporventa values ('16','8','2023-02-21',1,1000);
insert into itemsporventa values ('17','4','2023-02-01',2,1750);
insert into itemsporventa values ('17','9','2023-02-01',2,200);
insert into itemsporventa values ('18','6','2023-02-12',1,450);
insert into itemsporventa values ('18','11','2023-02-12',1,1100);
insert into itemsporventa values ('18','12','2023-02-12',1,900);
insert into itemsporventa values ('19','1','2023-02-21',1,800);
insert into itemsporventa values ('19','8','2023-02-21',1,1000);
insert into itemsporventa values ('20','5','2023-02-17',1,850);
insert into itemsporventa values ('20','8','2023-02-17',2,1000);


-------------------------------------------
-- Seleccionar los 3 ítems más vendidos
-------------------------------------------

select 
	I.descripcion AS Item, 
	sum(IPV.cantidad) AS CantidadVentas
from itemsporventa IPV
inner join inventario I on I.iditem =IPV.iditem 
group by 1
ORDER BY 2 desc
LIMIT 3;

-------------------------------------------
-- Generar un listado de clientes y sus compras que involucren nada más los ítems seleccionados
-------------------------------------------

select 
	CL.nombre,
	CL.apellido,
	I.descripcion as item
from clientes CL
inner join ventasporcliente v on cl.idcliente = v.idcliente 
inner join itemsporventa ipv on ipv.idventa  = v.idventa
inner join inventario i on i.iditem =IPV.iditem
	
-------------------------------------------
-- Generar un listado:
-- por ítem que muestre el total comprado,
-- por cliente que compró cada uno de ellos, con su fecha y cantidad.
-------------------------------------------

-- por ítem que muestre el total comprado,

select 
	I.descripcion AS Item,
	sum(IPV.cantidad) AS CantidadVentas,
	I.precioventa AS precio,
	I.precioventa * sum(IPV.cantidad) AS Totalventas
from itemsporventa IPV
inner join inventario I on I.iditem =IPV.iditem 
group by I.descripcion, I.precioventa
order by 4 desc;

-- por cliente que compró cada uno de ellos, con su fecha y cantidad.

select 
	CL.nombre,
	CL.apellido,
	I.descripcion as item,
	IPV.cantidad,
	IPV.fecha  
from clientes CL
inner join ventasporcliente v on cl.idcliente = v.idcliente 
inner join itemsporventa ipv on ipv.idventa  = v.idventa
inner join inventario i on i.iditem =IPV.iditem
ORDER BY CL.apellido;

-------------------------------------------
-- Generar un listado de clientes que han comprado y no han comprado cada ítem,
-- usando RIGHT y/o LEFT OUTER JOIN
-------------------------------------------

select distinct 
	CL.nombre,
	CL.apellido,
	--ipv.iditem,
	i.descripcion,
	v.totalventa 
from clientes cl
cross join itemsporventa ipv
left join ventasporcliente v on cl.idcliente = v.idcliente and ipv.idventa  = v.idventa
left join inventario i on i.iditem = ipv.iditem 
order by 2,4

----------------------------------------------------
-- Generar un ranking de clientes con el número de compras:
-- por ítems
-- por fecha
----------------------------------------------------

-- por ítems

select 
	cl.nombre,
	cl.apellido,
	I.descripcion AS Item,
	sum(IPV.cantidad) AS CantidadCompras
from clientes CL
inner join ventasporcliente v on cl.idcliente = v.idcliente 
inner join itemsporventa ipv on ipv.idventa  = v.idventa
inner join inventario i on i.iditem =IPV.iditem
group by I.descripcion,
	cl.nombre,
	cl.apellido
order by 3,4 desc;

-- por fecha

select 
	cl.nombre,
	cl.apellido,
	ipv.fecha as fecha,
	sum(IPV.cantidad) AS CantidadCompras
from clientes CL
inner join ventasporcliente v on cl.idcliente = v.idcliente 
inner join itemsporventa ipv on ipv.idventa  = v.idventa
group by ipv.fecha,
	cl.nombre,
	cl.apellido
order by 3,4 desc;



