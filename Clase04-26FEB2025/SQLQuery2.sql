
use EUREKABANK;
go

select * from Sucursal;
go

select @@TRANCOUNT;
go

BEGIN TRANSACTION
go

select @@TRANCOUNT;
go

select * from Sucursal;
go

update Sucursal
set chr_sucucodigo='888'
where chr_sucucodigo='666';
go

select * from movimiento;
go

delete from Movimiento;
go

ROLLBACK TRANSACTION;
go


