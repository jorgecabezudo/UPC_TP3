USE [ETNA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_OBTENER_DOCUMENTOPENDIENTE]
(
	@IN_IDDOCPENDIENTE INTEGER
)
AS
BEGIN

	SELECT ISNULL((select nombre from tablaTipo where tablaTipo.idTabla = 'tipoMovimiento' and tablaTipo.idTipo = d.tipoMovimiento),'') tipoMovimiento,
			ISNULL((select nombre from tablaTipo where tablaTipo.idTabla = 'estadoAtencion' and tablaTipo.idTipo = d.situacionatencion),'') situacionAtencion,
			ISNULL((select descripcionAlmacen from almacen where almacen.idAlmacen = d.idAlmacen),'') almacen,
			fechaDocumento
	FROM documentoPendiente d WHERE d.idDocPendiente = ISNULL(@IN_IDDOCPENDIENTE,0)
END	