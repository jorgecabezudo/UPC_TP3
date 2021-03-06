USE [ETNA]
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_INVENTARIO_PROGRAMADO]    Script Date: 06/04/2015 10:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_ACTUALIZAR_INVENTARIO_PROGRAMADO]
(
	@IN_idProgInventario INTEGER,
	@DT_FechaProgramada DATETIME,
	@IN_TipoInventario INTEGER,
	@IN_idAlmacen INTEGER
)
AS
BEGIN
	DECLARE @IN_CONT INTEGER
	
	DECLARE @IN_MENSUAL INTEGER
	DECLARE @IN_ANUAL INTEGER
	DECLARE @IN_CICLICO INTEGER
	
	DECLARE @IN_ESTADO INTEGER
	
	SET @IN_ESTADO = (SELECT idTipo FROM tablaTipo WHERE UPPER(idTabla) = UPPER('tipoEstadoInventario') AND UPPER(nombre) = UPPER('PENDIENTE'))
	
	SET @IN_MENSUAL = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = 'MENSUAL' AND UPPER(idTabla) = 'tipoInventario')
	SET @IN_ANUAL = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = 'ANUAL' AND UPPER(idTabla) = 'tipoInventario')
	SET @IN_CICLICO = (SELECT idTipo FROM tablaTipo WHERE UPPER(nombre) = 'CICLICO' AND UPPER(idTabla) = 'tipoInventario')
	
	IF @IN_MENSUAL = @IN_TipoInventario
	BEGIN
		SET @IN_CONT = ISNULL((SELECT COUNT(*) FROM programacionInventario WHERE tipoInventario = @IN_TipoInventario 
																AND	idAlmacen = @IN_idAlmacen
																AND MONTH(@DT_FechaProgramada) = MONTH(GETDATE())
																AND idEstadoInventario = @IN_ESTADO
																AND activo = 1
																AND idProgInventario <> @IN_idProgInventario),0)
	END
	
	IF @IN_ANUAL = @IN_TipoInventario
	BEGIN
		SET @IN_CONT = ISNULL((SELECT COUNT(*) FROM programacionInventario WHERE tipoInventario = @IN_TipoInventario 
																AND	idAlmacen = @IN_idAlmacen
																AND YEAR(@DT_FechaProgramada) = YEAR(GETDATE())
																AND idEstadoInventario = @IN_ESTADO
																AND activo = 1
																AND idProgInventario <> @IN_idProgInventario),0)
	END
	
	IF @IN_CICLICO = @IN_TipoInventario
	BEGIN
		SET @IN_CONT = ISNULL((SELECT COUNT(*) FROM programacionInventario WHERE tipoInventario = @IN_TipoInventario 
																AND	idAlmacen = @IN_idAlmacen
																AND MONTH(@DT_FechaProgramada) <= (MONTH(GETDATE())+ 3)
																AND idEstadoInventario = @IN_ESTADO
																AND activo = 1
																AND idProgInventario <> @IN_idProgInventario),0)
	END
	
	IF @IN_CONT = 0
	BEGIN
		UPDATE programacionInventario 
		SET tipoInventario = @IN_TipoInventario, fechaProgramada = @DT_FechaProgramada,
			idAlmacen = @IN_idAlmacen
		WHERE idProgInventario = @IN_idProgInventario
		
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END	
END