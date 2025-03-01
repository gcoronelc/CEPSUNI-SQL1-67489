-- Ejercicio 2
/*
Desarrolle una sentencia SELECT para consultar el nombre, vacantes y precio de cada curso de la base de datos EDUCA2.
*/
use EDUCA2;GOSELECT cur_nombre, cur_vacantes, cur_precio from dbo.CURSO;go
-- Ejercicio 3select 	cur_id, cur_nombre, cur_vacantes, cur_precio, 	cur_vacantes * cur_precio [Importe Total]from EDUCA2..CURSO; go-- Ejercicio 4select 	IdCursoProg, IdCurso, IdCiclo, 	Vacantes + Matriculados as [Vacantes Programadas], 	Matriculados, Vacantes [Vacantes Disponibles] from EduTec..CursoProgramado;GO-- Ejercicio 5/*El área de recursos humanos necesita una consulta que permita mostrar de cada empleado su sueldo actual y cuanto sería su incremento si se proyecta un aumento del 20% a cada uno respectivamente.*/use RH;goSELECT * FROM empleado;--GOSELECT 	idempleado,apellido,nombre,	sueldo, sueldo*0.2 AUMENTO,	sueldo+sueldo*0.2 AS [SUELDO CON AUMENTO],	comision  FROM  empleado;GOSELECT     nombre,apellido, sueldo,     sueldo * 1.20 "sueldo_proyectado"FROM RH..empleado;GO-- Ejercicio 6select 	idempleado, 	CONCAT(nombre,', ',apellido) [Nombre Completo] from RH..empleado;GO-- Ejercicio 7/*MARCO AGUIRRE 19:42
- 7 Desarrollar una sentencia SELECT para consultar -- el nombre y apellido de los profesores en una sola columna. Base de datos EDUTEC*/USE EduTec;GOSELECT * FROM .. Profesor;GOSELECT  idProfesor, concat(NomProfesor, ', ',ApeProfesor) as [Nombre y apellido] FROM .. Profesor;go-- Andrea Pierina Bravo Ormeño 19:59
SELECT     IDPROFESOR,	CONCAT(NomProfesor, ', ', ApeProfesor) AS nombre_completoFROM EDUTEC..Profesor;GO-- Ejercicio 10select 	IdCursoProg [CODIGO], 	CONCAT(IdCiclo,'/',IdCurso) [CURSO], 	CONCAT(Vacantes,'/',Matriculados+Vacantes) [VACANTES] from EduTec..CursoProgramado;GO-- Ejercicio 14SELECT *  FROM EDUCA2..CURSOwhere cur_matriculados=0;GO-- Ejercicio 15-- Andrea Pierina Bravo Ormeño 20:20
SELECT     ProductID,     ProductName,     UnitPriceFROM Northwind..ProductsWHERE     UnitPrice <= 20;GO-- Probando AND y ORselect * from Northwind.dbo.Productswhere (UnitPrice > 50 OR UnitsInStock > 30) AND CategoryID = 6;GO-- Pregunta 21-- MARCO AGUIRRE 21:00

SELECT * FROM  rh..empleadoWHERE IDCARGO='C02'OR IDCARGO='C01';GO-- Pregunta 22-- Andrea Pierina Bravo Ormeño 21:04

select ProductID, ProductName, UnitPrice, UnitsInStockfrom NORTHWIND..ProductsWHERE UnitPrice BETWEEN 10 AND 50 AND UnitsInStock>20;GO-- Pregunta 24-- Andrea Pierina Bravo Ormeño 21:08

SELECT ProductID, ProductName, UnitPrice, CategoryIDFROM NORTHWIND..ProductsWHERE UnitPrice>30 AND CategoryID IN (1,2);GO-- Gino Farfan 21:09

SELECT ProductID, ProductName, UnitPrice, CategoryIDFROM NORTHWIND.dbo.ProductsWHERE UnitPrice > 30   AND CategoryID IN (1, 2);GO-- Ejercicio 25-- Gino Farfan 21:13
SELECT OrderID, CustomerID, OrderDate, ShipCountryFROM NORTHWIND.dbo.OrdersWHERE ShipCountry = 'Brazil'   AND YEAR(OrderDate) <> 1997;GO

-- Andrea Pierina Bravo Ormeño 21:14
SELECT  OrderID, CustomerID, OrderDate, ShipCountry FROM NORTHWIND..OrdersWHERE ShipCountry='BRAZIL' AND YEAR(OrderDate) <> 1997;GO

-- ISMAEL ALEJANDRO MANTA MONTOYA 21:14
select OrderID, CustomerID, OrderDate, ShipCountryfrom Northwind..Orderswhere ShipCountry = 'Brazil'and year(OrderDate) <> 1997;-- Ejercicio 27select idempleado, apellido, nombre from RH..empleado where nombre like '%o'; goselect idempleado, apellido, nombre from RH..empleado where nombre like '[^G]%o'; goselect idempleado, apellido, nombre from RH..empleado where nombre like '[GS]%o'; go-- Investigar Expresiones Regulares-- Ejercicio 37SELECT CategoryID, ProductID, ProductName, UnitPrice FROM Northwind..Products ORDER BY CategoryID, UnitPrice ASC; GOSELECT TOP 5 CategoryID, ProductID, ProductName, UnitPrice FROM Northwind..Products ORDER BY UnitPrice ASC; GOSELECT CategoryID, ProductID, ProductName, UnitPrice FROM Northwind..Products ORDER BY UnitPrice ASC; GO-- VALORES NULOS-- Toda operacion con NULL es otro NULLselect 5 + 7 + null [DATO];go-- Ejercicio 42.
/*
Desarrollar una sentencia SELECT para consultar el ingreso total de cada empleado. Base de datos RH.*/select 	idempleado, apellido, nombre,	sueldo, ISNULL(comision,0) COMISION,	sueldo + ISNULL(comision,0) [Ingreso Total],	(sueldo + ISNULL(comision,0)) * 0.30 [Porcentaje]from RH..empleado;gowith t1 as (select 	idempleado, apellido, nombre,	sueldo, ISNULL(comision,0) COMISION,	sueldo + ISNULL(comision,0) IngresoTotalfrom RH..empleado)select t1.*, t1.IngresoTotal*0.30 Porcentajefrom t1;goSET LANGUAGE English;
SET DATEFORMAT ymd;goSELECT EmployeeID, FirstName, LastName, HireDate FROM Northwind..Employees WHERE HireDate > '01/01/1994';goSELECT EmployeeID, FirstName, LastName, HireDate FROM Northwind..Employees WHERE HireDate > CONVERT(DATE, '01/01/1994', 103);goselect 4655.67/34.56 dato1, cast(4655.67/34.56 as numeric(10,2)) dato2;go