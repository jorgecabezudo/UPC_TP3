USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_REALIZARPEDIDO]    Script Date: 05/29/2015 17:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_REALIZARPEDIDO]
(
	@VC_COD_DESCRIP_PRODUCTO VARCHAR(200),
	@IN_IDALMACEN INTEGER
)
AS
BEGIN

	DECLARE @IN_codRequerimiento INTEGER
	DECLARE @IN_idProducto INTEGER
	DECLARE @IN_cantidad INTEGER

	BEGIN
	
		INSERT INTO RequerimientoCompras (codPersonal, codEstado, codCategoria, fechaRegistro, observacion)
		VALUES (1, 1, 1, GETDATE(), 'REPOSICION DE STOCK')
		
		SELECT @IN_codRequerimiento = SCOPE_IDENTITY()
	END

	DECLARE stock_cursor CURSOR FOR
	SELECT  p.idProducto idProducto, s.cantidadReservada cantidadReservada
	FROM	producto p INNER JOIN stock s ON p.idProducto = s.idProducto
	WHERE	p.activo = 1 AND s.idAlmacen = @IN_IDALMACEN AND s.cantidad <= p.stockMinimo AND s.estado = 1 AND 
			isnull(s.cantidadReservada,0) > 0 AND
			UPPER(p.codigoProducto) + ' ' + UPPER(p.descripcionProducto) LIKE '%'+UPPER(@VC_COD_DESCRIP_PRODUCTO)+'%'

	OPEN stock_cursor
	
	FETCH NEXT FROM stock_cursor 
	INTO @IN_idProducto, @IN_cantidad
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		INSERT INTO RequerimientoDetalle (codRequerimiento, idProducto, cantidad)
		VALUES (@IN_codRequerimiento, @IN_idProducto, @IN_cantidad)
		
		UPDATE stock SET estado = 0 WHERE idAlmacen = @IN_IDALMACEN AND idProducto = @IN_idProducto
		
		FETCH NEXT FROM stock_cursor 
		INTO @IN_idProducto, @IN_cantidad
	END
	CLOSE stock_cursor
	DEALLOCATE stock_cursor
	
	SELECT 0
	
END
GO


USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_EDITAR_STOCKPRODUCTO]    Script Date: 05/29/2015 16:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_EDITAR_STOCKPRODUCTO]
(
	@IN_IDALMACEN INTEGER,
	@IN_IDPRODUCTO INTEGER,
	@IN_CANTIDADRESERVADA INTEGER
)
AS
BEGIN

	UPDATE stock 
	SET cantidadReservada = @IN_CANTIDADRESERVADA
	WHERE idAlmacen = @IN_IDALMACEN
	AND idProducto = @IN_IDPRODUCTO
	
	SELECT 0
END
GO

USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_STOCKPRODUCTOS]    Script Date: 05/29/2015 14:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_OBTENER_STOCKPRODUCTOS]
(
	@VC_COD_DESCRIP_PRODUCTO VARCHAR(200),
	@IN_IDALMACEN INTEGER
)
AS
BEGIN

	SELECT  p.idProducto idProducto, p.codigoProducto codigoProducto, p.descripcionProducto descripcionProducto, s.cantidad cantidad, isnull(s.cantidadReservada,0) cantidadReservada
	FROM	producto p INNER JOIN stock s ON p.idProducto = s.idProducto
	WHERE	p.activo = 1 AND s.idAlmacen = @IN_IDALMACEN AND s.cantidad <= p.stockMinimo AND s.estado = 1 AND
			UPPER(p.codigoProducto) + ' ' + UPPER(p.descripcionProducto) LIKE '%'+UPPER(@VC_COD_DESCRIP_PRODUCTO)+'%'
END
GO

USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTINFOUSUARIOLOGIN]    Script Date: 05/29/2015 12:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SP_OBTINFOUSUARIOLOGIN]
(
	@CH_Cod_Usuario char(10)
)
as
begin
	DECLARE @VC_TIPOUSUARIO VARCHAR(50)
	
	SET @VC_TIPOUSUARIO = (SELECT t.nombre FROM Usuario u INNER JOIN tablaTipo t ON u.Tipo_Usuario = t.idTipo WHERE u.Cod_Usuario = @CH_Cod_Usuario)

	select idPersona, nombres, apellidoPaterno, @VC_TIPOUSUARIO tipoUsuario from persona
	WHERE Cod_Usuario = @CH_Cod_Usuario and activo = 1
end
GO

USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_USUARIOALMACEN]    Script Date: 05/29/2015 12:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_OBTENER_USUARIOALMACEN]
(
	@CH_COD_USUARIO CHAR(10)
)
AS
BEGIN
	SELECT	UsuarioAlmacen.idAlmacen,
			(select almacen.descripcionAlmacen from almacen where almacen.idAlmacen = UsuarioAlmacen.idAlmacen) descripcionAlmacen
	FROM UsuarioAlmacen
	WHERE UsuarioAlmacen.Cod_Usuario = @CH_COD_USUARIO and UsuarioAlmacen.activo = 1
	ORDER BY descripcionAlmacen
END
GO

USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDARUSUARIO]    Script Date: 05/29/2015 11:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_VALIDARUSUARIO] 
(  
	@usuario varchar(50),  
	@password varchar(50)
)
AS
BEGIN
	DECLARE @cod_usuario CHAR(10)
	
	SET @cod_usuario = (SELECT u.Cod_Usuario FROM Usuario u 
							WHERE u.Nom_Usuario = @usuario 
							AND u.Pwd_Usuario = @password
							AND u.Estado_Usuario = 1)
   
	IF (ISNULL(@cod_usuario,0) > 0)
    BEGIN
		select @cod_usuario
	END
	ELSE
	BEGIN
		select 0
	END
END
GO