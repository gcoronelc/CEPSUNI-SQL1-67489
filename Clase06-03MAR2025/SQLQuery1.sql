
select count(*) [emps] from RH..empleado;
select count(1) [emps] from RH..empleado;
select count(1000) [emps] from RH..empleado;
select count('x') [emps] from RH..empleado;
select count(idempleado) [emps] from RH..empleado;
select sum(1) [emps] from RH..empleado;
select count(comision) [emps] from RH..empleado;
go

select count(1) [emps] 
from RH..empleado
where comision is null;
go

select sum(case when comision is null then 1 else 0 end) [emps] 
from RH..empleado;
go


SELECT AVG(sueldo) AS salario_promedio
FROM rh..empleado;


SELECT SUM(pag_importe) AS total_recaudado
FROM EDUCA2..PAGO;

SELECT SUM(mat_precio) AS total_comprometido
FROM EDUCA2..MATRICULA;

SELECT * FROM RH..departamento;
GO

SELECT SUM(SUELDO) PLANILLA FROM RH..empleado WHERE iddepartamento=100;
GO

SELECT SUM(SUELDO) PLANILLA FROM RH..empleado WHERE iddepartamento=101;
GO

SELECT SUM(SUELDO) PLANILLA FROM RH..empleado WHERE iddepartamento=103;
GO

SELECT 
	IDDEPARTAMENTO, 
	SUM(SUELDO) [PLANILLA SIN COMISION],
	SUM(SUELDO + COMISION) [PLANILLA SIN IS NULL],
	SUM(SUELDO + ISNULL(COMISION,0)) [PLANILLA CON COMISION]
FROM RH..empleado 
GROUP BY IDDEPARTAMENTO;
GO

SELECT 
	iddepartamento, 
	COUNT(1) [CANT TRABAJADORES],
	AVG(sueldo) [SALARIO PROMEDIO]
FROM RH..empleado 
GROUP BY iddepartamento; 
GO


SELECT cur_id, SUM(pag_importe) AS total_recaudado
FROM EDUCA2..PAGO
GROUP BY cur_id
ORDER BY total_recaudado DESC;
GO

SELECT cur_id, COUNT(alu_id) AS cantidad_matriculados
FROM EDUCA2..MATRICULA
GROUP BY cur_id
ORDER BY cantidad_matriculados DESC;
GO

-- Fecha de hoy: 03/03/2025
-- Ciclo actual es: 2025-03

SELECT cp.IdProfesor, COUNT(cp.IdCursoProg) AS CantidadCursos
FROM edutec..CursoProgramado cp
WHERE cp.IdCiclo = '2025-03'
GROUP BY cp.IdProfesor
HAVING COUNT(cp.IdCursoProg) > 2
ORDER BY CantidadCursos DESC;


SELECT IdCiclo, IdCurso, COUNT(IdCursoProg) AS CantidadCursosFROM edutec..CursoProgramadoWHERE left(IdCiclo,4) = '2025'GROUP BY IdCiclo, IdCursoHAVING COUNT(IdCursoProg) = 6ORDER BY 1 desc,2;
go

SELECT c.CategoryID, c.CategoryName, AVG(p.UnitPrice) AS PrecioPromedio
FROM Northwind..Categories c
JOIN Northwind..Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY PrecioPromedio DESC;


-- Ejemplo de ROLLUP

SELECT 
	YEAR(OrderDate) AS Año, 
	MONTH(OrderDate) AS Mes, 
	COUNT(OrderID) AS TotalPedidos 
FROM Northwind..Orders 
GROUP BY ROLLUP(YEAR(OrderDate), MONTH(OrderDate)) 
ORDER BY Año, Mes; 
GO

-- Ejemplo de CUBE

SELECT 
	YEAR(OrderDate) AS Año, 
	MONTH(OrderDate) AS Mes, 
	COUNT(OrderID) AS TotalPedidos 
FROM Northwind..Orders 
GROUP BY CUBE(YEAR(OrderDate), MONTH(OrderDate)) 
ORDER BY Año, Mes; 
GO

-- Ejemplo de GROUPING SETS

SELECT 
	YEAR(OrderDate) AS Año, 
	MONTH(OrderDate) AS Mes, 
	COUNT(OrderID) AS TotalPedidos 
FROM Northwind..Orders 
GROUP BY GROUPING SETS ( 
	(YEAR(OrderDate), MONTH(OrderDate)), 
	(YEAR(OrderDate)), 
	() 
) 
ORDER BY Año, Mes; 
GO

SELECT 
    YEAR(pag_fecha) AS Año,
    MONTH(pag_fecha) AS Mes,
    SUM(pag_importe) AS IngresoTotal
FROM educa2..PAGO
GROUP BY ROLLUP (YEAR(pag_fecha), MONTH(pag_fecha))
ORDER BY Año DESC, Mes DESC;
GO

