/****** Object:  StoredProcedure [dbo].[sp_detalleDocumentoAlmacen_Insertar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_detalleDocumentoAlmacen_Insertar]
(
@correlativo	int ,
@idDetalleDocAlmacen	int ,
@idProducto	int ,
@cantidad	int ,
@idDocPendiente int
)		
AS
BEGIN
	INSERT 
	INTO detalleDocumentoAlmacen
	(
		correlativo,
		idDetalleDocAlmacen,
		idProducto,
		cantidad		
	)
	VALUES
	(
		@correlativo,
		@idDetalleDocAlmacen,
		@idProducto,
		@cantidad	
	)
	
	--ACTUALIZAR EL DETALLE DEL DOCUMENTO PENDIENTE
	UPDATE	detalleDocumentoPendiente
	SET		cantidadAtendida = cantidadAtendida + @cantidad
	WHERE	idProducto = @idProducto
			AND idDetalleDocPendiente = @idDetalleDocAlmacen
			AND idDocPendiente = @idDocPendiente
		
END

GO
/****** Object:  StoredProcedure [dbo].[sp_detalledocumentoAlmacen_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_detalledocumentoAlmacen_Listar]
(
@correlativo INT
)
AS
BEGIN
	SELECT  detalleDocumentoPendiente.idDocPendiente, detalleDocumentoPendiente.idDetalleDocPendiente, 
			detalleDocumentoPendiente.cantidadPedida, detalleDocumentoPendiente.cantidadAtendida,
			producto.idProducto,producto.codigoProducto, producto.descripcionProducto , producto.tipounidadMedida,
			TipoUnidadMedida.descripcion as descripcionUnidadMedida
	FROM	detalleDocumentoAlmacen INNER JOIN documentoAlmacen ON detalleDocumentoAlmacen.correlativo = documentoAlmacen.correlativo				
			INNER JOIN detalleDocumentoPendiente ON detalleDocumentoPendiente.idDetalleDocPendiente = detalleDocumentoAlmacen.idDetalleDocAlmacen
				AND detalleDocumentoPendiente.idProducto = detalleDocumentoAlmacen.idProducto 
				AND detalleDocumentoPendiente.idDocPendiente = documentoAlmacen.idDocPendiente			
			INNER JOIN producto ON detalleDocumentoAlmacen.idProducto = producto.idProducto
			INNER JOIN tablaTipo TipoUnidadMedida on TipoUnidadMedida.idTipo = producto.tipounidadMedida
	WHERE	documentoAlmacen.correlativo = @correlativo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DetalleDocumentoPendiente_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DetalleDocumentoPendiente_Listar]
(
@idDocPendiente INT
)
AS
BEGIN
	SELECT  detalleDocumentoPendiente.idDocPendiente, detalleDocumentoPendiente.idDetalleDocPendiente, 
			detalleDocumentoPendiente.cantidadPedida, detalleDocumentoPendiente.cantidadAtendida,
			producto.idProducto,producto.codigoProducto, producto.descripcionProducto , producto.tipounidadMedida,
			TipoUnidadMedida.descripcion as descripcionUnidadMedida
	FROM	detalleDocumentoPendiente INNER JOIN documentoPendiente ON detalleDocumentoPendiente.idDocPendiente = documentoPendiente.idDocPendiente				
			INNER JOIN producto ON detalleDocumentoPendiente.idProducto = producto.idProducto
			INNER JOIN tablaTipo TipoUnidadMedida on TipoUnidadMedida.idTipo = producto.tipounidadMedida
	WHERE	documentoPendiente.idDocPendiente = @idDocPendiente
END

GO
/****** Object:  StoredProcedure [dbo].[sp_documentoAlmacen_Insertar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_documentoAlmacen_Insertar]
(
@correlativo int output ,
@idDocPendiente	int,
@tipoMovimiento	int ,
@fechaDocumento	datetime,
@idAlmacen	int,
@idUsuario	int
)
AS
BEGIN
	DECLARE @numeroDocAlmacen	varchar(20)
	
	SELECT @correlativo = MAX(correlativo) FROM documentoAlmacen
	
	IF(@correlativo IS NULL)
		SET @correlativo = 1
	ELSE
		SET @correlativo = @correlativo + 1
		
	SET @numeroDocAlmacen = (right('0000000000'+convert(varchar(10), @correlativo), 10))
	
	INSERT 
	INTO documentoAlmacen
	(
		correlativo,
		idDocPendiente,
		numeroDocAlmacen,
		tipoMovimiento,
		fechaDocumento,
		idAlmacen,
		activo,
		Cod_Usuario,
		fechaCreacion
	)
	VALUES 
	(
		@correlativo,
		@idDocPendiente,
		@numeroDocAlmacen,
		@tipoMovimiento,
		@fechaDocumento,
		@idAlmacen,
		1,
		@idUsuario,
		GETDATE()
	)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_documentoAlmacen_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_documentoAlmacen_Listar]
(
@tipoMovimiento INT = NULL ,
@correlativo INT = NULL
)
AS
BEGIN
	SELECT	documentoAlmacen.correlativo,documentoAlmacen.idDocPendiente,documentoAlmacen.numeroDocAlmacen,
			documentoAlmacen.tipoMovimiento,documentoAlmacen.fechaDocumento,documentoAlmacen.idAlmacen,documentoAlmacen.activo,
			almacen.descripcionAlmacen,
			TipoMovimiento.descripcion as descripcionTipoMovimiento,
			documentoPendiente.numeroDocPendiente,
			TipoDocumentoPendiente.descripcion as descripcionDocumentoPendiente,
			persona.nombres + ' ' + persona.apellidoPaterno + ' ' + persona.apellidoMaterno  as Origen , persona.centrocosto
	FROM	documentoAlmacen 
			INNER JOIN almacen ON documentoAlmacen.idAlmacen = almacen.idAlmacen
			INNER JOIN tablaTipo TipoMovimiento ON documentoAlmacen.tipoMovimiento = TipoMovimiento.idTipo
			INNER JOIN documentoPendiente ON documentoAlmacen.idDocPendiente = documentoPendiente.idDocPendiente
			INNER JOIN tablaTipo TipoDocumentoPendiente ON documentoPendiente.tipoDocumentoPendiente = TipoDocumentoPendiente.idTipo
			INNER JOIN persona ON documentoPendiente.idClienteProveedor = persona.idPersona
	WHERE	(@tipoMovimiento IS NULL OR documentoAlmacen.tipoMovimiento = @tipoMovimiento)
			AND (@correlativo IS NULL OR documentoAlmacen.correlativo = @correlativo)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_documentoPendiente_ActualizarSituacion]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_documentoPendiente_ActualizarSituacion]
(
@idDocPendiente INT,
@situacionatencion INT
)
AS
BEGIN
	UPDATE documentoPendiente
	SET situacionatencion = @situacionatencion
	WHERE idDocPendiente = @idDocPendiente
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DocumentoPendiente_Listar]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DocumentoPendiente_Listar]
(
@IN_SITUACIONATENCION INT = 0,
@IN_IDALMACEN INT = 0,
@IN_TIPOMOVIMIENTO INT = 0
)
AS
BEGIN
	SELECT	documentoPendiente.idDocPendiente,
			documentoPendiente.numeroDocPendiente,
			documentoPendiente.idClienteProveedor,
			documentoPendiente.tipoDocumentoPendiente,
			(select nombre
			 from tablaTipo
			  where tablaTipo.idTabla = 'tipoDocumentoPendiente'
			   and tablaTipo.idTipo = documentoPendiente.tipoDocumentoPendiente)
			 as descripcionDocumentoPendiente,
			documentoPendiente.fechaDocumento,
			documentoPendiente.activo,
			documentoPendiente.situacionatencion,
			(select nombre
			 from tablaTipo
			  where tablaTipo.idTabla = 'estadoAtencion'
			   and tablaTipo.idTipo = documentoPendiente.situacionatencion)
			 as descripcionSituacionAtencion,
			persona.nombres + ' ' + persona.apellidoPaterno + ' ' + persona.apellidoMaterno  as Origen ,
			persona.centrocosto,
			ISNULL(documentoPendiente.idAlmacen,0) idAlmacen,
			ISNULL(almacen.descripcionAlmacen,'') descripcionAlmacen,
			documentoPendiente.tipoMovimiento,
			(select nombre
			 from tablaTipo
			  where tablaTipo.idTabla = 'tipoMovimiento'
			   and tablaTipo.idTipo = documentoPendiente.tipoMovimiento)
			 as descripcionTipoMovimiento
	FROM	documentoPendiente 
			inner join persona persona on documentoPendiente.idClienteProveedor = persona.idPersona
			left outer join almacen on almacen.idAlmacen = documentoPendiente.idAlmacen
	WHERE	documentoPendiente.activo = 1
			AND (@IN_SITUACIONATENCION = 0 or documentoPendiente.situacionatencion = @IN_SITUACIONATENCION)
			AND (@IN_TIPOMOVIMIENTO = 0 OR documentoPendiente.tipoMovimiento = @IN_TIPOMOVIMIENTO)
			AND (@IN_IDALMACEN = 0 OR documentoPendiente.idAlmacen = @IN_IDALMACEN)
END

GO
