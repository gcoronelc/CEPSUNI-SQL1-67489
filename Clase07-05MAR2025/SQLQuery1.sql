-- INNER JOIN
/*

FROM tabla1 alias1
JOIN tabla2 alias2 ON (condicion_combinacion_1)
JOIN tabla3 alias3 ON (condicion_combinacion_2)
JOIN tabla4 alias4 ON (condicion_combinacion_3)
. . .
. . .

*/

-- Ejemplo 01
/*
Se necesita un reporte con el nombre de los empleados
y el nombre del departamento donde trabaja.
Base de datos: RH
*/

select 
	d.nombre [nombre departamento],
	e.nombre, e.apellido
from RH..departamento d
join RH..empleado e on d.iddepartamento = e.iddepartamento
order by 1;
go

select 
	d.nombre [nombre departamento],
	count(1) [cant. empleados],
	sum(e.sueldo) [planilla]
from RH..departamento d
join RH..empleado e on d.iddepartamento = e.iddepartamento
group by d.nombre
order by 1;
go

-- Ejercicio 1
SELECT 
    c.cur_nombre AS NombreCurso, 
    a.alu_nombre AS NombreAlumno
FROM EDUCA2..MATRICULA m
JOIN EDUCA2..CURSO c ON m.cur_id = c.cur_id
JOIN EDUCA2..ALUMNO a ON m.alu_id = a.alu_id
ORDER BY c.cur_nombre, a.alu_nombre;
GO

-- Combinación externa
/*

FROM tabla1 alias1
[LEFT | RIGHT | FULL] [OUTER] JOIN tabla2 alias2 ON Condicion_Combinacion

*/


/*
Se necesita un reporte con el nombre de los empleados
y el nombre del departamento donde trabaja.
El resultado debe incluir los departamentos que no tienen empleados.
Base de datos: RH
*/

select 
	d.nombre [nombre departamento],
	e.nombre, e.apellido
from RH..departamento d
left join RH..empleado e on d.iddepartamento = e.iddepartamento
order by 1;
go


SELECT 
    d.nombre AS NombreDepartamento,
    COALESCE(e.nombre, 'SIN EMPLEADOS') AS NombreEmpleado
FROM RH..departamento d
LEFT JOIN RH..empleado e ON d.iddepartamento = e.iddepartamento
ORDER BY d.nombre, e.nombre;
GO


select 
	d.nombre [nombre departamento],
	count(e.idempleado) [cant. empleados],
	sum(COALESCE(e.sueldo,0)) [planilla]
from RH..departamento d
left join RH..empleado e on d.iddepartamento = e.iddepartamento
group by d.nombre
order by 1;
go


SELECT 
    d.nombre AS NombreDepartamento,
    COUNT(e.idempleado) AS CantidadEmpleados,
    COALESCE(SUM(e.sueldo), 0) AS TotalPlanilla
FROM RH..departamento d
LEFT JOIN RH..empleado e ON d.iddepartamento = e.iddepartamento
GROUP BY d.nombre
ORDER BY TotalPlanilla DESC;


SELECT 
    d.nombre AS NombreDepartamento, 
    c.nombre AS NombreCargo
FROM RH..departamento d
CROSS JOIN RH..cargo c
ORDER BY d.nombre, c.nombre;
GO


SELECT 
    e.nombre AS NombreEmpleado,
	e.idcargo AS [Cargo Empleado],
    COALESCE(j.nombre, 'SIN JEFE') AS NombreJefe,
	COALESCE(j.idcargo,'SIN CARGO') AS [Cargo Jefe]
FROM rh..empleado e
LEFT JOIN rh..empleado j ON e.jefe = j.idempleado
ORDER BY j.nombre, e.nombre;
go


SELECT 
    e.nombre AS NombreEmpleado,
	e.idcargo AS [Cargo Empleado],
	ce.nombre AS [Nombre Cargo Empleado],
    COALESCE(j.nombre, 'SIN JEFE') AS NombreJefe,
	COALESCE(j.idcargo,'SIN CARGO') AS [Cargo Jefe],
	COALESCE(cj.nombre,'SIN CARGO') AS [Nombre Cargo Jefe]
FROM rh..empleado e
JOIN RH..cargo ce ON e.idcargo = ce.idcargo
LEFT JOIN rh..empleado j ON e.jefe = j.idempleado
LEFT JOIN RH..cargo cj ON j.idcargo = cj.idcargo
ORDER BY j.nombre, e.nombre;
go




