-- BASE DE DATOS: NORTHWIND
/*

AÑO: 1997
MODELO DEL REPORTE
PRODUCTO      VENTAS      PROCENTAJE
--------------------------------------
aaaaaaa        200         20
bbbbbbb        300         30
ccccccc        250         25
ddddddd         80          8
eeeeeee        170         17
--------------------------------------

*/

-- Parte 1

SELECT 
	P.ProductName PRODUCTO,
	SUM(OD.Quantity) VENTAS
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
JOIN Northwind..Products P ON OD.ProductID = P.ProductID
WHERE YEAR(O.OrderDate) = 1997
GROUP BY P.ProductName;
GO


-- Parte 2

SELECT 
	SUM(OD.Quantity) [TOTAL]
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
JOIN Northwind..Products P ON OD.ProductID = P.ProductID
WHERE YEAR(O.OrderDate) = 1997;
GO


-- Parte 3: Combinando

SELECT 
	T1.PRODUCTO, T1.VENTAS,
	CAST(T1.VENTAS * 100.0 / T2.TOTAL AS NUMERIC(10,2)) [PORCENTAJE]
FROM 
(
	SELECT 
		P.ProductName PRODUCTO,
		SUM(OD.Quantity) VENTAS
	FROM Northwind..[Order Details] OD
	JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
	JOIN Northwind..Products P ON OD.ProductID = P.ProductID
	WHERE YEAR(O.OrderDate) = 1997
	GROUP BY P.ProductName
) AS T1
CROSS JOIN 
(
	SELECT 
		SUM(OD.Quantity) [TOTAL]
	FROM Northwind..[Order Details] OD
	JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
	JOIN Northwind..Products P ON OD.ProductID = P.ProductID
	WHERE YEAR(O.OrderDate) = 1997
) AS T2
ORDER BY 1;
GO



