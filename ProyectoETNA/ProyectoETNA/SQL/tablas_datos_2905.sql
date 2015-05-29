insert into tablaTipo (nombre,descripcion,idTabla) values('ADMINISTRADOR ALMACEN','ADMINISTRADOR ALMACEN','tipoUsuario')
insert into tablaTipo (nombre,descripcion,idTabla) values('SUPERVISOR ALMACEN','SUPERVISOR ALMACEN','tipoUsuario')
insert into tablaTipo (nombre,descripcion,idTabla) values('OPERADOR ALMACEN','OPERADOR ALMACEN','tipoUsuario')

ALTER TABLE Usuario 
alter column Pwd_Usuario varchar(50) not null;

ALTER TABLE Usuario 
alter column Tipo_Usuario int not null;

ALTER TABLE Usuario 
alter column estado_usuario int not null;

UPDATE Usuario set Pwd_Usuario = 'ricardo', Nom_Usuario = 'Ricardo', Tipo_Usuario = 80 where Cod_Usuario = 1
UPDATE Usuario set Pwd_Usuario = 'jorge', Nom_Usuario = 'Jorge', Tipo_Usuario = 81 where Cod_Usuario = 2
UPDATE Usuario set Pwd_Usuario = 'yuri', Nom_Usuario = 'Yuri', Tipo_Usuario = 82 where Cod_Usuario = 3

CREATE TABLE UsuarioAlmacen(
	Cod_Usuario CHAR(10) NOT NULL,
	idAlmacen INTEGER NOT NULL,
	activo INTEGER NOT NULL
)

INSERT INTO UsuarioAlmacen (Cod_Usuario, idAlmacen, activo) VALUES ('1', 11, 1)
INSERT INTO UsuarioAlmacen (Cod_Usuario, idAlmacen, activo) VALUES ('1', 12, 1)
INSERT INTO UsuarioAlmacen (Cod_Usuario, idAlmacen, activo) VALUES ('2', 11, 1)
INSERT INTO UsuarioAlmacen (Cod_Usuario, idAlmacen, activo) VALUES ('3', 12, 1)

ALTER TABLE persona 
alter column Cod_Usuario char(10) null;


ALTER TABLE stock 
ADD estado int NULL;

UPDATE stock SET estado = 1

ALTER TABLE stock
alter column estado int not null;

update producto set stockMinimo = 70

INSERT INTO Estado (codEstado, desEstado) VALUES (1,'Prueba')

INSERT INTO [ETNA].[dbo].[Cargo]
           ([codCargo]
           ,[desCargo])
     VALUES
           (1
           ,'Prueba')
           
INSERT INTO [ETNA].[dbo].[Personal]
           ([codPersonal]
           ,[codCargo]
           ,[nomPersonal])
     VALUES
           (1
           ,1
           ,'Prueba')

INSERT INTO [ETNA].[dbo].[Categoria]
           ([codCategoria]
           ,[desCategoria])
     VALUES
           (1
           ,'Prueba')