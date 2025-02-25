select * from RH..empleado;
go

select * 
from RH..empleado
where idcargo='C02'
go

select * from RH..cargo;
go

INSERT INTO dbo.cargo VALUES('C15','Jefe',7500.0,9000.0);
go


SELECT * INTO dbo.emp_c02
FROM dbo.empleado WHERE idcargo = 'C02'
GO

SELECT * FROM dbo.emp_c02
GO

TRUNCATE TABLE dbo.emp_c02
GO

SELECT * FROM dbo.emp_c02
GO

select * from RH..cargo;
go

DELETE FROM rh.dbo.cargo
WHERE idcargo = 'C15'
GO


UPDATE dbo.cargo SET sueldo_min = 7000.0
WHERE idcargo = 'C15'
GO