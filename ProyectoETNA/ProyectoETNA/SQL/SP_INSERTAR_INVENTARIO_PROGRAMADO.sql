USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_INVENTARIO_PROGRAMADO]    Script Date: 06/04/2015 10:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_INSERTAR_INVENTARIO_PROGRAMADO]
(
	@DT_FechaProgramada DATETIME,
	@IN_TipoInventario INTEGER,
	@CH_Cod_Usuario CHAR(10),
	@IN_idAlmacen INTEGER
)
AS
BEGIN

	DECLARE @IN_IDPROGRAMACION INTEGER

	DECLARE @IN_idPersona INTEGER
	DECLARE @IN_CONT INTEGER
	
	DECLARE @IN_MENSUAL INTEGER
	DECLARE @IN_ANUAL INTEGER
	DECLARE @IN_CICLICO INTEGER
	
	DECLARE @IN_ESTADO INTEGER
	
	SET @IN_ESTADO = (SELECT idTipo FROM tablaTipo WHERE UPPER(idTabla) = UPPER('tipoEstadoInventario') AND UPPER(nombre) = UPPER('PENDIENTE'))
	
	SET @IN_MENSUAL = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = 'MENSUAL' AND UPPER(idTabla) = UPPER('tipoInventario'))
	SET @IN_ANUAL = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = 'ANUAL' AND UPPER(idTabla) = UPPER('tipoInventario'))
	SET @IN_CICLICO = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = 'CICLICO' AND UPPER(idTabla) = UPPER('tipoInventario'))
	
	IF @IN_MENSUAL = @IN_TipoInventario
	BEGIN
		SET @IN_CONT = ISNULL((SELECT COUNT(*) FROM programacionInventario WHERE tipoInventario = @IN_TipoInventario 
																AND	idAlmacen = @IN_idAlmacen
																AND idEstadoInventario = @IN_ESTADO
																AND MONTH(@DT_FechaProgramada) = MONTH(GETDATE())
																AND activo = 1),0)
	END
	
	IF @IN_ANUAL = @IN_TipoInventario
	BEGIN
		SET @IN_CONT = ISNULL((SELECT COUNT(*) FROM programacionInventario WHERE tipoInventario = @IN_TipoInventario 
																AND	idAlmacen = @IN_idAlmacen
																AND idEstadoInventario = @IN_ESTADO
																AND YEAR(@DT_FechaProgramada) = YEAR(GETDATE())
																AND activo = 1),0)
	END
	
	IF @IN_CICLICO = @IN_TipoInventario
	BEGIN
		SET @IN_CONT = ISNULL((SELECT COUNT(*) FROM programacionInventario WHERE tipoInventario = @IN_TipoInventario 
																AND	idAlmacen = @IN_idAlmacen
																AND idEstadoInventario = @IN_ESTADO
																AND MONTH(@DT_FechaProgramada) <= (MONTH(GETDATE())+ 3)
																AND activo = 1),0)
	END
	
	IF @IN_CONT = 0
	BEGIN
		SET @IN_idPersona = (SELECT idPersona FROM persona WHERE Cod_Usuario = @CH_Cod_Usuario)

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
			@IN_ESTADO,
			1,
			@CH_Cod_Usuario,
			GETDATE()
		)
		
		SELECT @IN_IDPROGRAMACION = ISNULL(SCOPE_IDENTITY(),0)
		
		IF @IN_IDPROGRAMACION = 0
		BEGIN
			SELECT 1
		END
		ELSE
		BEGIN
			SELECT 0
		END
	END
	ELSE
	BEGIN
		SELECT 2
	END
END