USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_INVENTARIO_PROGRAMADO]    Script Date: 23/05/2015 09:11:44 p.m. ******/
CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_INVENTARIO_PROGRAMADO]
(
	@IN_idProgInventario INTEGER,
	@DT_FechaProgramada DATETIME,
	@IN_TipoInventario INTEGER,
	@IN_idAlmacen INTEGER
)
AS
BEGIN

	UPDATE programacionInventario 
	SET tipoInventario = @IN_TipoInventario, fechaProgramada = @DT_FechaProgramada,
		idAlmacen = @IN_idAlmacen
	WHERE idProgInventario = @IN_idProgInventario
	
	SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AJUSTAR_INVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AJUSTAR_INVENTARIO]
(
	@IN_idProgInventario INTEGER
)
AS
BEGIN
	DECLARE @IN_idProducto INTEGER, @IN_cantidad INTEGER, @IN_cantidadActual INTEGER, @IN_idInventario INTEGER,
			@Ch_Cod_Usuario CHAR(10), @IN_idAlmacen INTEGER
			
	DECLARE @numeroDoc VARCHAR(10), @tipoDoc INTEGER, @situacion INTEGER, @tipoMovimiento INTEGER, @IN_idDoc INTEGER, @IN_cantidadAjuste INTEGER
	
	BEGIN
		SELECT @IN_idInventario = idInventario, @Ch_Cod_Usuario = Cod_Usuario, @IN_idAlmacen = idAlmacen
		FROM inventario WHERE idProgInventario = @IN_idProgInventario
	END
	
	DECLARE detalle_cursor CURSOR FOR 
	SELECT cantidadActual, cantidad, idProducto
	FROM detalleInventario
	WHERE idInventario = @IN_idInventario
	
	OPEN detalle_cursor
	
	FETCH NEXT FROM detalle_cursor 
	INTO @IN_cantidadActual, @IN_cantidad, @IN_idProducto
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE detalleInventario
		SET cantidadAjuste = @IN_cantidadActual - @IN_cantidad
		WHERE idProducto = @IN_idProducto AND idInventario = @IN_idInventario
		
		FETCH NEXT FROM detalle_cursor 
		INTO @IN_cantidadActual, @IN_cantidad, @IN_idProducto
	END 
	CLOSE detalle_cursor
	DEALLOCATE detalle_cursor
	
	
	BEGIN
		SET @numeroDoc = isnull((SELECT MAX(numeroDocPendiente) FROM documentoPendiente),0)
		
		SET @situacion = (SELECT idTipo FROM tablaTipo WHERE nombre = 'TOTAL')
		
		IF (SELECT SUM(cantidadAjuste) FROM detalleInventario WHERE idInventario = @IN_idInventario) > 0
		BEGIN
			SET @tipoDoc = (SELECT idTipo FROM tablaTipo WHERE nombre = 'SALIDA')
			
			INSERT INTO documentoPendiente (numeroDocPendiente, tipoDocumentoPendiente, idClienteProveedor, fechaDocumento, situacionatencion,
					activo, Cod_Usuario, fechaCreacion, tipoMovimiento, idAlmacen, areaSolicitante, idUsuarioSolicitante)
			VALUES (@numeroDoc, @tipoDoc, 1, GETDATE(), @situacion, 1, @Ch_Cod_Usuario, GETDATE(), @tipoDoc, @IN_idAlmacen, 'Sistema', @Ch_Cod_Usuario)
			
			SELECT @IN_idDoc = SCOPE_IDENTITY()
		END
		
		IF (SELECT SUM(cantidadAjuste) FROM detalleInventario WHERE idInventario = @IN_idInventario) < 0
		BEGIN
			SET @tipoDoc = (SELECT idTipo FROM tablaTipo WHERE nombre = 'INGRESO')
			
			INSERT INTO documentoPendiente (numeroDocPendiente, tipoDocumentoPendiente, idClienteProveedor, fechaDocumento, situacionatencion,
					activo, Cod_Usuario, fechaCreacion, tipoMovimiento, idAlmacen, areaSolicitante, idUsuarioSolicitante)
			VALUES (@numeroDoc, @tipoDoc, 1, GETDATE(), @situacion, 1, @Ch_Cod_Usuario, GETDATE(), @tipoDoc, @IN_idAlmacen, 'Sistema', @Ch_Cod_Usuario)
			
			SELECT @IN_idDoc = SCOPE_IDENTITY()
		END
	END
	
	DECLARE detalle_pendiente_cursor CURSOR FOR 
	SELECT cantidadAjuste, idProducto
	FROM detalleInventario
	WHERE idInventario = @IN_idInventario
	
	OPEN detalle_pendiente_cursor
	
	FETCH NEXT FROM detalle_pendiente_cursor 
	INTO @IN_cantidadAjuste, @IN_idProducto
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO detalleDocumentoPendiente (idDocPendiente, idProducto, cantidadPedida)
		VALUES (@IN_idDoc, @IN_idProducto, @IN_cantidadAjuste)
		
		FETCH NEXT FROM detalle_pendiente_cursor 
		INTO @IN_cantidadAjuste, @IN_idProducto
	END 
	CLOSE detalle_pendiente_cursor
	DEALLOCATE detalle_pendiente_cursor
	
	BEGIN
		UPDATE programacionInventario 
		SET idEstadoInventario = (SELECT idTipo FROM tablaTipo WHERE nombre = 'FINALIZADO')
		WHERE idProgInventario = @IN_idProgInventario
		
		UPDATE inventario
		SET activo = 0, fechaHoraFin = GETDATE()
		WHERE idInventario = @IN_idInventario
	END
	
	SELECT 0
END

GO

/****** Object:  StoredProcedure [dbo].[SP_EDITAR_TOMA_INVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EDITAR_TOMA_INVENTARIO]
(
	@IN_IDDETALLEINVENTARIO INTEGER,
	@IN_CANTIDAD INTEGER
)
AS
BEGIN

	UPDATE detalleInventario 
	SET cantidad = @IN_CANTIDAD
	WHERE idDetalleInventario = @IN_IDDETALLEINVENTARIO
	
	SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_INVENTARIO_PROGRAMADO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_INVENTARIO_PROGRAMADO]
(
	@IN_idProgInventario INTEGER
)
AS
BEGIN

	UPDATE programacionInventario 
	SET activo = 0
	WHERE idProgInventario = @IN_idProgInventario
	
	SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_FINALIZAR_TOMA_INVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FINALIZAR_TOMA_INVENTARIO]
(
	@IN_IDINVENTARIO INTEGER
)
AS
BEGIN

	DECLARE @IN_IDPROGINVENTARIO INTEGER
	
	SET @IN_IDPROGINVENTARIO = (SELECT idProgInventario FROM inventario WHERE idInventario = @IN_IDINVENTARIO)

	UPDATE programacionInventario 
	SET idEstadoInventario = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = UPPER('CONTABILIZADO'))
	WHERE idProgInventario = @IN_IDPROGINVENTARIO
	
	SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INICIAR_INVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INICIAR_INVENTARIO]
(
	@IN_idProgInventario INTEGER
)
AS
BEGIN

	BEGIN
		UPDATE programacionInventario 
		SET idEstadoInventario = (SELECT idTipo FROM tablaTipo WHERE nombre = 'INICIADO')
		WHERE idProgInventario = @IN_idProgInventario
	END
	
	DECLARE @IN_idAlmacen INTEGER, @CH_Cod_Usuario CHAR(10), @IN_tipoInventario INTEGER, @IN_idPersona INTEGER, 
			@IN_idProducto INTEGER, @IN_cantidad INTEGER, @IN_idInventario INTEGER
	
	BEGIN
		SELECT @IN_idAlmacen = idAlmacen, @CH_Cod_Usuario = Cod_Usuario, @IN_tipoInventario = tipoInventario, @IN_idPersona = idPersona
		FROM programacionInventario WHERE idProgInventario = @IN_idProgInventario
	END
	
	BEGIN
		INSERT INTO inventario (idAlmacen, idProgInventario, fechaHoraInicio, tipo, activo, Cod_Usuario, fechaCreacion)
		VALUES (@IN_idAlmacen, @IN_idProgInventario, GETDATE(), @IN_tipoInventario, 1, @CH_Cod_Usuario, GETDATE())
	
		SELECT @IN_idInventario = SCOPE_IDENTITY()
	END
	
	DECLARE inventario_cursor CURSOR FOR 
	SELECT idProducto, cantidad
	FROM stock
	WHERE idAlmacen = @IN_idAlmacen AND Cod_Usuario = @CH_Cod_Usuario
	
	OPEN inventario_cursor
	
	FETCH NEXT FROM inventario_cursor 
	INTO @IN_idProducto, @IN_cantidad
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		INSERT INTO detalleInventario (idInventario, idAlmacen, idProducto, idOperadorAlmacen, cantidadActual, fechaHoraToma)
		VALUES (@IN_idInventario, @IN_idAlmacen, @IN_idProducto, @IN_idPersona, @IN_cantidad, GETDATE())
		
		FETCH NEXT FROM inventario_cursor 
		INTO @IN_idProducto, @IN_cantidad
	END 
	CLOSE inventario_cursor;
	DEALLOCATE inventario_cursor;
	
	SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_INVENTARIO_PROGRAMADO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_INVENTARIO_PROGRAMADO]
(
	@DT_FechaProgramada DATETIME,
	@IN_TipoInventario INTEGER,
	@CH_Cod_Usuario CHAR(10),
	@IN_idAlmacen INTEGER
)
AS
BEGIN
	DECLARE @IN_idPersona INTEGER
	DECLARE @IN_idEstadoInventario INTEGER

	SET @IN_idPersona = (SELECT idPersona FROM persona WHERE Cod_Usuario = @CH_Cod_Usuario)
	SET @IN_idEstadoInventario = (SELECT idTipo FROM tablaTipo WHERE idTabla = 'tipoEstadoInventario' AND UPPER(nombre) = UPPER('PENDIENTE'))

	INSERT INTO programacionInventario
	(
		tipoInventario,
		fechaProgramada,
		idAlmacen,
		idPersona,
		idEstadoInventario,
		activo,
		Cod_Usuario,
		fechaCreacion
	)
	VALUES
	(
		@IN_TipoInventario,
		@DT_FechaProgramada,
		@IN_idAlmacen,
		@IN_idPersona,
		@IN_idEstadoInventario,
		1,
		@CH_Cod_Usuario,
		GETDATE()
	)
	
	SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_DETALLE_INVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_DETALLE_INVENTARIO]
(
	@IN_IDINVENTARIO INTEGER
)
AS
BEGIN
	SELECT	d.idDetalleInventario id, p.descripcionProducto producto, d.fechaHoraToma fecha, d.cantidad cantidad
	FROM detalleInventario d INNER JOIN producto p ON d.idProducto = p.idProducto
	WHERE d.idInventario = @IN_IDINVENTARIO
	ORDER BY p.descripcionProducto DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_INVENTARIO]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_INVENTARIO]
(
	@CH_CODUSUARIO CHAR(10),
	@IN_IDALMACEN INTEGER
)
AS
BEGIN
	SELECT	i.idInventario id, i.fechaHoraInicio fechaInicio, t.nombre tipo, p.nombres responsable
	FROM inventario i INNER JOIN tablaTipo t ON i.tipo = t.idTipo
	INNER JOIN persona p ON p.Cod_Usuario = i.Cod_Usuario
	WHERE i.Cod_Usuario = @CH_CODUSUARIO AND i.idAlmacen = @IN_IDALMACEN AND i.activo = 1
	ORDER BY i.fechaHoraInicio DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_INVENTARIOS]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_INVENTARIOS]
(
	@IN_ESTADOINVENTARIO INTEGER,
	@IN_IDALMACEN INTEGER
)
AS
BEGIN
	IF @IN_ESTADOINVENTARIO = 0 AND @IN_IDALMACEN = 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.activo = 1
		ORDER BY p.fechaProgramada
	END
	
	IF @IN_ESTADOINVENTARIO = 0 AND @IN_IDALMACEN > 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.idAlmacen = @IN_IDALMACEN AND p.activo = 1
		ORDER BY p.fechaProgramada
	END
	
	IF @IN_ESTADOINVENTARIO > 0 AND @IN_IDALMACEN = 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.idEstadoInventario = @IN_ESTADOINVENTARIO AND p.activo = 1
		ORDER BY p.fechaProgramada
	END
	
	IF @IN_ESTADOINVENTARIO > 0 AND @IN_IDALMACEN > 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.idEstadoInventario = @IN_ESTADOINVENTARIO AND p.idAlmacen = @IN_IDALMACEN AND p.activo = 1
		ORDER BY p.fechaProgramada
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_INVENTARIOS_PROGRAMADOS]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_INVENTARIOS_PROGRAMADOS]
(
	@IN_TIPOINVENTARIO INTEGER,
	@IN_IDALMACEN INTEGER
)
AS
BEGIN
	IF @IN_TIPOINVENTARIO = 0 AND @IN_IDALMACEN = 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.activo = 1
		ORDER BY p.fechaProgramada
	END
	
	IF @IN_TIPOINVENTARIO = 0 AND @IN_IDALMACEN > 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.idAlmacen = @IN_IDALMACEN AND p.activo = 1
		ORDER BY p.fechaProgramada
	END
	
	IF @IN_TIPOINVENTARIO > 0 AND @IN_IDALMACEN = 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.tipoInventario = @IN_TIPOINVENTARIO AND p.activo = 1
		ORDER BY p.fechaProgramada
	END
	
	IF @IN_TIPOINVENTARIO > 0 AND @IN_IDALMACEN > 0
	BEGIN
		SELECT	p.idProgInventario id, p.fechaProgramada fecha, p.tipoInventario idTipo, 
				t.nombre tipo, p.idAlmacen idAlmacen, a.descripcionAlmacen almacen, u.nombres usuario, e.nombre estado
		FROM programacionInventario p INNER JOIN tablaTipo t ON p.tipoInventario = t.idTipo
		INNER JOIN almacen a ON p.idAlmacen = a.idAlmacen
		INNER JOIN persona u ON p.Cod_Usuario = u.Cod_Usuario
		INNER JOIN tablaTipo e ON p.idEstadoInventario = e.idTipo
		WHERE p.tipoInventario = @IN_TIPOINVENTARIO AND p.idAlmacen = @IN_IDALMACEN AND p.activo = 1
		ORDER BY p.fechaProgramada
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_programacionInventario_Actualizar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_programacionInventario_Actualizar]
(
@idProgInventario	int,
@tipoInventario	int,
@fechaProgramada	datetime,
@idAlmacen	int,
@idPersona	int
)
AS
BEGIN
	UPDATE	programacionInventario
	SET		tipoInventario = @tipoInventario,
			fechaProgramada = @fechaProgramada,
			idAlmacen = @idAlmacen,
			idPersona = @idPersona
	WHERE	idProgInventario = @idProgInventario			
END

GO
/****** Object:  StoredProcedure [dbo].[sp_programacionInventario_ConsultarReferencia]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_programacionInventario_ConsultarReferencia]
(
@idProgInventario	int
)
AS
BEGIN
	select * from dbo.inventario WHERE idProgInventario = @idProgInventario
END

GO
/****** Object:  StoredProcedure [dbo].[sp_programacionInventario_Eliminar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_programacionInventario_Eliminar]
(
@idProgInventario	int
)
AS
BEGIN
	DELETE FROM programacionInventario WHERE idProgInventario = @idProgInventario
END

GO
/****** Object:  StoredProcedure [dbo].[sp_programacionInventario_Insertar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_programacionInventario_Insertar]
(
@tipoInventario	int,
@fechaProgramada	datetime,
@frecuencia	int,
@idAlmacen	int,
@idPersona	int,
@idEstadoInventario	int,
@idUsuario	int
)
AS
BEGIN
	INSERT INTO programacionInventario 
	(		
		tipoInventario,
		fechaProgramada,
		frecuencia,
		idAlmacen,
		idPersona,
		idEstadoInventario,
		activo,
		Cod_Usuario,
		fechaCreacion
	)
	VALUES
	(
		@tipoInventario,
		@fechaProgramada,
		@frecuencia,
		@idAlmacen,
		@idPersona,
		@idEstadoInventario,
		1,
		@idUsuario,
		GETDATE()
	)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_programacionInventario_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_programacionInventario_Listar]
(
@idProgInventario	int = NULL,
@tipoInventario	int = NULL
)
AS
BEGIN
	select	programacionInventario.* ,
			TipoInventario.nombre as descripcionTipoInventario,
			persona.nombres + ' ' + persona.apellidoPaterno + ' ' + persona.apellidoMaterno as Responsable,
			almacen.descripcionAlmacen,
			TipoEstadoInventario.nombre as descripcionEstadoInventario
	from 	programacionInventario
			INNER JOIN tablaTipo AS TipoInventario ON programacionInventario.tipoInventario = TipoInventario.idTipo
			INNER JOIN persona  ON persona.idPersona = programacionInventario.idPersona
			INNER JOIN almacen ON almacen.idAlmacen = programacionInventario.idAlmacen
			INNER JOIN tablaTipo AS TipoEstadoInventario ON programacionInventario.idEstadoInventario = TipoEstadoInventario.idTipo
	WHERE	programacionInventario.activo = 1
			and (@idProgInventario is null or programacionInventario.idProgInventario = @idProgInventario)
			and (@tipoInventario is null or programacionInventario.tipoInventario = @tipoInventario)
END

GO