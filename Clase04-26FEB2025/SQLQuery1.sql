use educa2;
go

-- Entendiendo la Sentencia DELETE

select * from EDUCA2..CURSO;
go

delete from EDUCA2..CURSO
where cur_id = 8;
go

delete from EDUCA2..CURSO
where cur_id = 1;
go

select * from matricula;
go

update EDUCA2..CURSO
set cur_vacantes = -20
where cur_id = 7;
go

-- Entendiendo la Sentencia UPDATE

use EUREKABANK;
go

select * from Sucursal;
go

select @@TRANCOUNT;
go

update Sucursal
set chr_sucucodigo='666'
where chr_sucucodigo='777';
go

update Sucursal
set chr_sucucodigo='111'
where chr_sucucodigo='001';
go


-- Insertar claves foraneas que no existen

USE EDUCA2;
GO

select * from MATRICULA;
go

select * from curso;
go

insert into MATRICULA 
values(500,5,4,'REGULAR',GETDATE(),1000,1,NULL);
GO

select @@TRANCOUNT;
go





















