/****** Object:  StoredProcedure [dbo].[sp_almacen_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_almacen_Listar]
AS
BEGIN
	SELECT  *
	FROM	almacen
	WHERE	activo = 1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_producto]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<JCP Software>
-- Create date: <14/05/2015>
-- Description:	<Listar productos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_producto]
AS
BEGIN
	SELECT  p.idProducto id, p.codigoProducto codigo, p.descripcionProducto descripcion, SUM(s.cantidad) cantidad, p.activo activo
	FROM	producto p INNER JOIN stock s ON p.idProducto = s.idProducto
	WHERE	p.activo = 1
	GROUP BY p.idProducto, p.codigoProducto, p.descripcionProducto, p.activo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_listar_producto_reponer]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<JCP Software>
-- Create date: <14/05/2015>
-- Description:	<Listar productos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_listar_producto_reponer]
(
	@IN_idProducto integer
)
AS
BEGIN
	SELECT  p.idProducto id, p.codigoProducto codigo, p.descripcionProducto descripcion, p.activo activo
	FROM	producto p
	WHERE	p.activo = 1 AND p.idProducto = @IN_idProducto
END

GO
/****** Object:  StoredProcedure [dbo].[sp_lote_ActualizarBloqueo]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_lote_ActualizarBloqueo]
(
@idLote INT,
@bloqueado INT
)
AS
BEGIN

	UPDATE	lote 
	SET		bloqueado = @bloqueado ,
			fechaModificacion = GETDATE(),
			fechaTomaMuestra = GETDATE()
	WHERE	idLote = @idLote

END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_TIPO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_TIPO] 
	@IN_TIPOTABLA NVARCHAR(100)
AS
BEGIN
	SELECT	idTipo,
			nombre
	FROM tablaTipo
	WHERE idTabla = @IN_TIPOTABLA
	ORDER BY nombre
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_TIPOALMACEN]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_TIPOALMACEN]
AS
BEGIN
	SELECT	idTipo,
			nombre
	FROM tablaTipo
	WHERE idTabla = 'tipoAlmacen'
	ORDER BY nombre
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_TIPOINVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_TIPOINVENTARIO]
AS
BEGIN
	SELECT	idTipo,
			nombre
	FROM tablaTipo
	WHERE idTabla = 'tipoInventario'
	ORDER BY nombre
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_USUARIOALMACEN]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_USUARIOALMACEN]
AS
BEGIN
	SELECT	u.idAlmacen,
			a.descripcionAlmacen
	FROM usuarioAlmacen u
	INNER JOIN almacen a
	ON u.idAlmacen = a.idAlmacen
	WHERE u.idUsuario = '1'
	ORDER BY a.descripcionAlmacen
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Persona_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Persona_Listar]
AS
BEGIN
	SELECT * FROM persona
END

GO

/****** Object:  StoredProcedure [dbo].[sp_reponer_producto]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<JCP Software>
-- Create date: <14/05/2015>
-- Description:	<Reponer productos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_reponer_producto]
(
	@IN_idProducto INTEGER,
	@IN_cantidad INTEGER
)
AS
BEGIN

	UPDATE stock SET cantidadReservada = @IN_cantidad
	WHERE idProducto = @IN_idProducto
END

GO
/****** Object:  StoredProcedure [dbo].[sp_stock_Actualizar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_stock_Actualizar]
(
@idAlmacen INT,
@idProducto INT,
@cantidadIngreso INT,
@cantidadSalida INT
)
AS
BEGIN
	UPDATE	stock
	SET		cantidad = cantidad + @cantidadIngreso - @cantidadSalida
	WHERE	idAlmacen = @idAlmacen
			AND idProducto = @idProducto
END

GO
/****** Object:  StoredProcedure [dbo].[sp_stock_Consultar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_stock_Consultar]
(
@idAlmacen INT,
@idProducto INT
)
AS
BEGIN
	SELECT	TOP 1 stock.* 
	FROM	stock
			inner join lote on stock.idLote = lote.idLote
	WHERE	idAlmacen = @idAlmacen
			AND idProducto = @idProducto
			AND lote.bloqueado = 0
	ORDER BY fechaCreacion ASC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDARUSUARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VALIDARUSUARIO] 
(  
	@usuario varchar(50),  
	@password varchar(50)
)
AS
BEGIN
	DECLARE @tipo_Usuario CHAR(1)
	
	SET @tipo_Usuario = (SELECT u.Tipo_Usuario FROM Usuario u 
							WHERE u.Nom_Usuario = @usuario 
							AND u.Pwd_Usuario = @password
							AND u.Estado_Usuario = '1')
   
	IF (ISNULL(@tipo_Usuario,0) > 0)
    BEGIN
		select @tipo_Usuario
	END
	ELSE
	BEGIN
		select 0
	END
END

GO