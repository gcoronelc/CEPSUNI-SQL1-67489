-- Base de Datos: NORTHWIND
/*
REPORTE SOLICITADO
AÑO: 1997
PRODUCTO         T1        T2     T3     T4       TOTAL
-------------------------------------------------------------
aaaaa            50        60     40     80      230
....
....
....
-------------------------------------------------------------
*/

SELECT * FROM Northwind..Products;
GO

SELECT * FROM Northwind..[Order Details];
GO

SELECT * FROM Northwind..Orders;
GO

-- Paso 1: Los Datos 

SELECT * 
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
JOIN Northwind..Products P ON OD.ProductID = P.ProductID
WHERE YEAR(O.OrderDate) = 1997;
GO


-- Paso 2: Los calculos - Parte 1

SELECT 
	P.ProductName,
	SUM(OD.Quantity) [TOTAL]
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
JOIN Northwind..Products P ON OD.ProductID = P.ProductID
WHERE YEAR(O.OrderDate) = 1997
GROUP BY P.ProductName
ORDER BY 1;
GO


-- Paso 3: Los calculos - Parte 2 T1 Y T2

SELECT 
	P.ProductName,
	SUM(CASE WHEN DATEPART(qq,o.OrderDate) = 1 THEN OD.Quantity ELSE 0 END) [T1],
	SUM(IIF(DATEPART(qq,o.OrderDate) = 2,OD.Quantity,0)) [T2],
	SUM(OD.Quantity) [TOTAL]
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
JOIN Northwind..Products P ON OD.ProductID = P.ProductID
WHERE YEAR(O.OrderDate) = 1997
GROUP BY P.ProductName
ORDER BY 1;
GO

-- Paso 4: Solucion completa

SELECT 
	P.ProductName,
	SUM(CASE WHEN DATEPART(qq,o.OrderDate) = 1 THEN OD.Quantity ELSE 0 END) [T1],
	SUM(IIF(DATEPART(qq,o.OrderDate) = 2,OD.Quantity,0)) [T2],
	SUM(IIF(DATEPART(qq,o.OrderDate) = 3,OD.Quantity,0)) [T3],
	SUM(IIF(DATEPART(qq,o.OrderDate) = 4,OD.Quantity,0)) [T4],
	SUM(OD.Quantity) [TOTAL]
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
JOIN Northwind..Products P ON OD.ProductID = P.ProductID
WHERE YEAR(O.OrderDate) = 1997
GROUP BY P.ProductName
ORDER BY 1;
GO


-- ChatGPT

SELECT 
    p.ProductName AS Producto,
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 1 THEN od.Quantity ELSE 0 END) AS T1,
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 2 THEN od.Quantity ELSE 0 END) AS T2,
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 3 THEN od.Quantity ELSE 0 END) AS T3,
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 4 THEN od.Quantity ELSE 0 END) AS T4,
    SUM(od.Quantity) AS TOTAL
FROM Northwind..[Order Details] od
JOIN Northwind..Orders o ON od.OrderID = o.OrderID
JOIN Northwind..Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY p.ProductName
ORDER BY TOTAL DESC;



