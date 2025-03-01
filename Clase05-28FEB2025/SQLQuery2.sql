

CREATE TABLE EjemploCodificacion (
    Col1 VARCHAR(100) COLLATE Latin1_General_100_CI_AS_SC_UTF8, -- Colación con soporte UTF-8
    Col2 VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CI_AS       -- Colación tradicional (ISO-8859-1)
);

insert into EjemploCodificacion values('Dato 1','Dato 2');
go

select * from EjemploCodificacion;
go

select concat(col1,col2) from EjemploCodificacion;
go






