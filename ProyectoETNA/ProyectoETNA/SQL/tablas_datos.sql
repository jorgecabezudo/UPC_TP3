GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tablaTipo] ON 

INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (1, N'NATURAL', N'PERSONA NATURAL', N'tipoPersona')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (2, N'JURIDICA', N'PERSONA JURIDICA', N'tipoPersona')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (3, N'DNI', N'DNI', N'tipoDocIdentidad')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (4, N'CE', N'CE', N'tipoDocIdentidad')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (5, N'MENSUAL', N'MENSUAL', N'tipoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (6, N'TERMINADO', N'PRODUCTO TERMINADO', N'tipoProducto')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (7, N'UTILES', N'UTILES DE OFICINA', N'tipoProducto')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (8, N'INSUMO', N'MATERIA PRIMA', N'tipoProducto')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (9, N'SEMITERMINADO', N'PRODUCTO SEMI-TERMINADO', N'tipoProducto')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (10, N'TRANSITO', N'ALMACEN DE TRANSITO', N'tipoAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (11, N'DISTRIBUCION', N'CENTRO DE DISTRIBUCION', N'tipoAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (12, N'INSUMO', N'ALMACEN DE MATERIA PRIMA', N'tipoAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (13, N'FABRICA', N'ALMACEN DE FABRICA', N'tipoAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (14, N'OFICINA', N'ALMACEN DE OFICINA', N'tipoAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (16, N'NOTA DE INGRESO', N'NOTA DE INGRESO A ALMACEN', N'tipoDocAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (17, N'NOTA DE SALIDA', N'NOTA DE SALIDA DE ALMACEN', N'tipoDocAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (18, N'NOTA DE TRANSFERENCIA', N'NOTA DE TRANSFERENCIA ENTRE ALMACENES', N'tipoDocAlmacen')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (19, N'ORDEN DE COMPRA', N'ORDEN DE COMPRA', N'tipoDocumentoPendiente')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (20, N'ORDEN DE PEDIDO', N'ORDEN DE PEDIDO', N'tipoDocumentoPendiente')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (21, N'ORDEN DE FABRICACION', N'ORDEN DE FABRICACION', N'tipoDocumentoPendiente')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (22, N'INGRESO', N'MOVIMIENTO DE INGRESO', N'tipoMovimiento')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (23, N'SALIDA', N'MOVIMIENTO DE SALIDA', N'tipoMovimiento')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (24, N'ETNA PROFESIONAL', N'LINEA ETNA PROFESIONAL', N'tipoBateria')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (25, N'ETNA ALTO DESEMPEÑO', N'LINEA ETNA DE ALTO DESEMPEÑO', N'tipoBateria')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (26, N'ETNA PLATINUM', N'LINEA ETNA PLATINUM', N'tipoBateria')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (27, N'ETNA BATERIAS INDUSTRIALES', N'LINEA ETNA BATERIAS INDUSTRIALES', N'tipoBateria')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (28, N'ACUMAXX BATERIAS PARA MINERIA', N'LINEA ETNA PARA MINERIA', N'tipoBateria')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (29, N'UND', N'UND', N'tipoUnidadMedida')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (30, N'CONTROL DE CALIDAD', N'CONTROL DE CALIDAD', N'tipoDocumentoPendiente')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (31, N'PENDIENTE', N'PENDIENTE', N'tipoEstadoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (32, N'INICIADO', N'INICIADO', N'tipoEstadoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (33, N'CONTABILIZADO', N'CONTABILIZADO', N'tipoEstadoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (34, N'FINALIZADO', N'FINALIZADO', N'tipoEstadoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (35, N'CANCELADO', N'CANCELADO', N'tipoEstadoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (36, N'ANUAL', N'ANUAL', N'tipoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (38, N'CICLICO', N'CICLICO', N'tipoInventario')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (78, N'TOTAL', N'TOTAL', N'estadoAtencion')
INSERT [dbo].[tablaTipo] ([idTipo], [nombre], [descripcion], [idTabla]) VALUES (79, N'PARCIAL', N'PARCIAL', N'estadoAtencion')
SET IDENTITY_INSERT [dbo].[tablaTipo] OFF

SET IDENTITY_INSERT [dbo].[almacen] ON 

INSERT [dbo].[almacen] ([idAlmacen], [descripcionAlmacen], [idSupervisorAlmacen], [direccion], [ubigeo], [telefono], [tipoAlmacen], [metraje], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (7, N'Almacén Poseidón', 2, N'', N'', N'', 13, 0, 1, N'4         ', CAST(0x0000A491014A9661 AS DateTime), NULL)
INSERT [dbo].[almacen] ([idAlmacen], [descripcionAlmacen], [idSupervisorAlmacen], [direccion], [ubigeo], [telefono], [tipoAlmacen], [metraje], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (8, N'Almacén Zeus', 2, N'', N'', N'', 12, 0, 1, N'5         ', CAST(0x0000A491014A9661 AS DateTime), NULL)
INSERT [dbo].[almacen] ([idAlmacen], [descripcionAlmacen], [idSupervisorAlmacen], [direccion], [ubigeo], [telefono], [tipoAlmacen], [metraje], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (9, N'Almacén Central', 2, N'', N'', N'', 13, 0, 1, N'4         ', CAST(0x0000A491015533FA AS DateTime), NULL)
INSERT [dbo].[almacen] ([idAlmacen], [descripcionAlmacen], [idSupervisorAlmacen], [direccion], [ubigeo], [telefono], [tipoAlmacen], [metraje], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (10, N'Almacén Distribución', 2, N'', N'', N'', 12, 0, 1, N'5         ', CAST(0x0000A491015533FB AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[almacen] OFF
INSERT [dbo].[detalleDocumentoPendiente] ([idDocPendiente], [idDetalleDocPendiente], [idProducto], [cantidadPedida], [cantidadAtendida]) VALUES (1, 1, 1, 20, 0)
INSERT [dbo].[detalleDocumentoPendiente] ([idDocPendiente], [idDetalleDocPendiente], [idProducto], [cantidadPedida], [cantidadAtendida]) VALUES (2, 1, 1, 100, 20)
INSERT [dbo].[detalleDocumentoPendiente] ([idDocPendiente], [idDetalleDocPendiente], [idProducto], [cantidadPedida], [cantidadAtendida]) VALUES (3, 1, 1, 30, 0)
INSERT [dbo].[detalleDocumentoPendiente] ([idDocPendiente], [idDetalleDocPendiente], [idProducto], [cantidadPedida], [cantidadAtendida]) VALUES (1, 2, 2, 10, 0)
INSERT [dbo].[detalleDocumentoPendiente] ([idDocPendiente], [idDetalleDocPendiente], [idProducto], [cantidadPedida], [cantidadAtendida]) VALUES (3, 2, 2, 40, 0)
SET IDENTITY_INSERT [dbo].[detalleInventario] ON 

INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (1, 4, 7, 1, 4, 100, 200, -100, CAST(0x0000A49F00264200 AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (2, 4, 7, 2, 4, 200, 200, 0, CAST(0x0000A49F00264200 AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (3, 6, 7, 1, 4, 100, NULL, NULL, CAST(0x0000A49F0027FC24 AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (4, 6, 7, 2, 4, 200, NULL, NULL, CAST(0x0000A49F0027FC24 AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (5, 7, 7, 1, 4, 100, NULL, NULL, CAST(0x0000A49F0132D15E AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (6, 7, 7, 2, 4, 200, NULL, NULL, CAST(0x0000A49F0132D167 AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (7, 8, 8, 1, 4, 100, NULL, NULL, CAST(0x0000A49F01356348 AS DateTime), NULL)
INSERT [dbo].[detalleInventario] ([idDetalleInventario], [idInventario], [idAlmacen], [idProducto], [idOperadorAlmacen], [cantidadActual], [cantidad], [cantidadAjuste], [fechaHoraToma], [numeroToma]) VALUES (8, 8, 8, 2, 4, 200, NULL, NULL, CAST(0x0000A49F01356348 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[detalleInventario] OFF
INSERT [dbo].[documentoAlmacen] ([correlativo], [idDocPendiente], [numeroDocAlmacen], [tipoMovimiento], [fechaDocumento], [idAlmacen], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (1, 1, N'0000000001', 23, CAST(0x0000A44400000000 AS DateTime), 7, 1, N'1         ', CAST(0x0000A444014AA656 AS DateTime))
INSERT [dbo].[documentoAlmacen] ([correlativo], [idDocPendiente], [numeroDocAlmacen], [tipoMovimiento], [fechaDocumento], [idAlmacen], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (2, 2, N'0000000002', 23, CAST(0x0000A44400000000 AS DateTime), 8, 1, N'1         ', CAST(0x0000A444014AF64A AS DateTime))
INSERT [dbo].[documentoAlmacen] ([correlativo], [idDocPendiente], [numeroDocAlmacen], [tipoMovimiento], [fechaDocumento], [idAlmacen], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (3, 1, N'0000000003', 22, CAST(0x0000A49100000000 AS DateTime), 7, 1, N'1         ', CAST(0x0000A4910160B326 AS DateTime))
INSERT [dbo].[documentoPendiente] ([idDocPendiente], [numeroDocPendiente], [tipoDocumentoPendiente], [idClienteProveedor], [fechaDocumento], [situacionatencion], [activo], [Cod_Usuario], [fechaCreacion], [tipoMovimiento], [idAlmacen], [areaSolicitante], [idUsuarioSolicitante]) VALUES (1, N'0000000001', 21, 6, CAST(0x0000A54400000000 AS DateTime), 2, 1, N'1         ', CAST(0x0000A491015403BB AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[documentoPendiente] ([idDocPendiente], [numeroDocPendiente], [tipoDocumentoPendiente], [idClienteProveedor], [fechaDocumento], [situacionatencion], [activo], [Cod_Usuario], [fechaCreacion], [tipoMovimiento], [idAlmacen], [areaSolicitante], [idUsuarioSolicitante]) VALUES (2, N'0000000002', 21, 4, CAST(0x0000A56200000000 AS DateTime), 1, 1, N'1         ', CAST(0x0000A491015403BB AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[documentoPendiente] ([idDocPendiente], [numeroDocPendiente], [tipoDocumentoPendiente], [idClienteProveedor], [fechaDocumento], [situacionatencion], [activo], [Cod_Usuario], [fechaCreacion], [tipoMovimiento], [idAlmacen], [areaSolicitante], [idUsuarioSolicitante]) VALUES (3, N'0000000003', 21, 5, CAST(0x0000A56200000000 AS DateTime), 1, 1, N'1         ', CAST(0x0000A491015403BB AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[inventario] ON 

INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (1, 10, 1, CAST(0x0000A49F00205844 AS DateTime), NULL, 5, 1, N'1         ', CAST(0x0000A49F00205844 AS DateTime), NULL)
INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (3, 8, 2, CAST(0x0000A49F00215A60 AS DateTime), CAST(0x0000A4A0013B6537 AS DateTime), 5, 0, N'1         ', CAST(0x0000A49F00215A60 AS DateTime), NULL)
INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (4, 7, 3, CAST(0x0000A49F002641F8 AS DateTime), CAST(0x0000A49F00C3F6F8 AS DateTime), 5, 0, N'1         ', CAST(0x0000A49F002641F8 AS DateTime), NULL)
INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (5, 10, 4, CAST(0x0000A49F0027976F AS DateTime), NULL, 36, 1, N'1         ', CAST(0x0000A49F0027976F AS DateTime), NULL)
INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (6, 7, 5, CAST(0x0000A49F0027FC23 AS DateTime), NULL, 36, 1, N'1         ', CAST(0x0000A49F0027FC23 AS DateTime), NULL)
INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (7, 7, 6, CAST(0x0000A49F0132D10A AS DateTime), NULL, 38, 1, N'1         ', CAST(0x0000A49F0132D10A AS DateTime), NULL)
INSERT [dbo].[inventario] ([idInventario], [idAlmacen], [idProgInventario], [fechaHoraInicio], [fechaHoraFin], [tipo], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (8, 8, 7, CAST(0x0000A49F01356343 AS DateTime), NULL, 36, 1, N'1         ', CAST(0x0000A49F01356343 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[inventario] OFF
SET IDENTITY_INSERT [dbo].[lote] ON 

INSERT [dbo].[lote] ([idLote], [fechaFabricacion], [ordenFabricacion], [fechaTomaMuestra], [bloqueado], [cantidadProducida], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (1, CAST(0x0000A491015DBA31 AS DateTime), 1, NULL, 0, 500, 1, N'1         ', CAST(0x0000A491015DBA31 AS DateTime), NULL)
INSERT [dbo].[lote] ([idLote], [fechaFabricacion], [ordenFabricacion], [fechaTomaMuestra], [bloqueado], [cantidadProducida], [activo], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (2, CAST(0x0000A491015DBA32 AS DateTime), 2, NULL, 0, 1000, 1, N'1         ', CAST(0x0000A491015DBA32 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[lote] OFF
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([idPersona], [tipoPersona], [nombres], [apellidoPaterno], [apellidoMaterno], [razonSocial], [tipoDocIdentidad], [numeroDocIdentidad], [direccion], [telefono], [correo], [paginaWeb], [fechaNacimiento], [cargo], [centrocosto], [activo], [fechaIngreso], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (4, 1, N'Administrador', N'Administrador', N'Administrador', N'', 3, N'', N'ETNA', N'', N'administrador@etna.com.pe', N'', NULL, N'SISTEMAS', N'CC-SISTEMAS', 1, CAST(0x0000A4910146C865 AS DateTime), N'1         ', CAST(0x0000A4910146C865 AS DateTime), NULL)
INSERT [dbo].[persona] ([idPersona], [tipoPersona], [nombres], [apellidoPaterno], [apellidoMaterno], [razonSocial], [tipoDocIdentidad], [numeroDocIdentidad], [direccion], [telefono], [correo], [paginaWeb], [fechaNacimiento], [cargo], [centrocosto], [activo], [fechaIngreso], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (5, 1, N'Jose Luis', N'Carrillo', N'Onairan', N'', 3, N'43814628', N'Jr los ciruelos 633', N'', N'jcarrillo@etna.com.pe', N'', NULL, N'SISTEMAS', N'CC-SISTEMAS', 1, CAST(0x0000A4910146C865 AS DateTime), N'2         ', CAST(0x0000A4910146C865 AS DateTime), NULL)
INSERT [dbo].[persona] ([idPersona], [tipoPersona], [nombres], [apellidoPaterno], [apellidoMaterno], [razonSocial], [tipoDocIdentidad], [numeroDocIdentidad], [direccion], [telefono], [correo], [paginaWeb], [fechaNacimiento], [cargo], [centrocosto], [activo], [fechaIngreso], [Cod_Usuario], [fechaCreacion], [fechaModificacion]) VALUES (6, 2, N'JRMSAC', N'JRMSAC', N'JRMSAC', N'20124545451', 3, N'43814628', N'Jr los ciruelos 633', N'', N'', N'', NULL, N'SISTEMAS', N'CC-SISTEMAS', 1, CAST(0x0000A4910146C865 AS DateTime), N'3         ', CAST(0x0000A4910146C865 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[persona] OFF
SET IDENTITY_INSERT [dbo].[producto] ON 

DECLARE @IN_TIPOUNIDADMEDIDA INTEGER
DECLARE @IN_TIPOPRODUCTO INTEGER
SET @IN_TIPOUNIDADMEDIDA = (SELECT IDTIPO FROM TABLATIPO WHERE IDTABLA='tipoUnidadMedida' AND NOMBRE='UND');
SET @IN_TIPOPRODUCTO = (SELECT IDTIPO FROM TABLATIPO WHERE IDTABLA='tipoProducto' AND NOMBRE='TERMINADO');
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT001','BATERIA ETNA PROFESIONAL HL-11',@IN_TIPOUNIDADMEDIDA,11,20.20,12.70,22.30,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT002','BATERIA ETNA W-49Z',@IN_TIPOUNIDADMEDIDA,9 ,239.0,175.0,174.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT003','BATERIA ETNA PROFESIONAL W-11 PRO',@IN_TIPOUNIDADMEDIDA,11,23.90,17.50,17.40,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT004','BATERIA ETNA PROFESIONAL W-13 PRO',@IN_TIPOUNIDADMEDIDA,13,23.90,17.50,17.40,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT005','BATERIA ETNA V-09Z',@IN_TIPOUNIDADMEDIDA,9 ,254.0,168.0,200.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT006','BATERIA ETNA PROFESIONAL V-11 PRO',@IN_TIPOUNIDADMEDIDA,11,26.80,16.80,22.20,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT007','BATERIA ETNA E-56Z',@IN_TIPOUNIDADMEDIDA,9 ,254.0,168.0,200.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT008','BATERIA ETNA V-56BZ',@IN_TIPOUNIDADMEDIDA,9 ,254.0,168.0,181.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT009','BATERIA ETNA V-70BZ',@IN_TIPOUNIDADMEDIDA,11,254.0,168.0,181.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT010','BATERIA ETNA V-84BZ',@IN_TIPOUNIDADMEDIDA,13,254.0,168.0,181.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT011','BATERIA ETNA PROFESIONAL S-11 PRO',@IN_TIPOUNIDADMEDIDA,11,31.40,16.80,22.20,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT012','BATERIA ETNA PROFESIONAL FH-1213 PRO',@IN_TIPOUNIDADMEDIDA,13,31.40,16.80,22.20,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT013','BATERIA ETNA PROFESIONAL FH-1215 PRO',@IN_TIPOUNIDADMEDIDA,15,31.40,16.80,22.20,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT014','BATERIA ETNA PROFESIONAL FF-11',@IN_TIPOUNIDADMEDIDA,11,22.70,13.30,21.80,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT015','BATERIA ETNA FF-53Z',@IN_TIPOUNIDADMEDIDA,11,227.0,133.0,198.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT016','BATERIA ETNA PROFESIONAL V-13 PRO',@IN_TIPOUNIDADMEDIDA,13,26.80,16.80,20.30,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT017','BATERIA ETNA E-09Z',@IN_TIPOUNIDADMEDIDA,9 ,254.0,168.0,203.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT018','BATERIA ETNA SU-84Z',@IN_TIPOUNIDADMEDIDA,13,32.80,170.0,23.80,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT019','BATERIA ETNA SU-98Z SU-1215 PRO',@IN_TIPOUNIDADMEDIDA,15,322.0,170.0,215.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT020','BATERIA ETNA SU-113Z',@IN_TIPOUNIDADMEDIDA,12,322.0,170.0,215.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT021','BATERIA ETNA SEM-73',@IN_TIPOUNIDADMEDIDA,12,276.0,175.0,173.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT022','BATERIA ETNA SEM-85',@IN_TIPOUNIDADMEDIDA,12,276.0,175.0,173.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT023','BATERIA ETNA SEM-109',@IN_TIPOUNIDADMEDIDA,12,353.0,175.0,190.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT024','BATERIA ETNA PROFESIONAL SU-1217 PRO',@IN_TIPOUNIDADMEDIDA,17,32.80,17.00,23.80,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT025','BATERIA ETNA PROFESIONAL N-100 PRO',@IN_TIPOUNIDADMEDIDA,19,44.00,22.70,17.20,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT026','BATERIA ETNA PROFESIONAL S-1221',@IN_TIPOUNIDADMEDIDA,21,500.0,21.90,23.10,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT027','BATERIA ETNA PROFESIONAL S-1223 PRO',@IN_TIPOUNIDADMEDIDA,23,500.0,21.90,23.10,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT028','BATERIA ETNA PROFESIONAL S-1225',@IN_TIPOUNIDADMEDIDA,25,500.0,21.90,23.10,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT029','BATERIA ETNA PROFESIONAL S-1227 PRO',@IN_TIPOUNIDADMEDIDA,27,51.80,27.80,24.50,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT030','BATERIA ETNA PROFESIONAL S-1229 PRO',@IN_TIPOUNIDADMEDIDA,29,51.80,27.80,24.50,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT031','BATERIA ETNA S-211Z',@IN_TIPOUNIDADMEDIDA,12,518.0,278.0,223.0,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT032','BATERIA ETNA PROFESIONAL S-1233',@IN_TIPOUNIDADMEDIDA,33,51.80,27.80,24.50,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT033','BATERIA ETNA PROFESIONAL MT-7 LBI PRO',@IN_TIPOUNIDADMEDIDA,7 ,20.70,17.50,17.40,0,1,CURRENT_TIMESTAMP)
INSERT INTO PRODUCTO(TIPOPRODUCTO, CODIGOPRODUCTO, DESCRIPCIONPRODUCTO, TIPOUNIDADMEDIDA, NUMEROPLACAS, LARGO, ANCHO, ALTO, PESO,COD_USUARIO,FECHACREACION) VALUES (@IN_TIPOPRODUCTO, 'PRBAT034','BATERIA ETNA PROFESIONAL MT-5 LBI PRO',@IN_TIPOUNIDADMEDIDA,5 ,20.70,17.50,17.40,0,1,CURRENT_TIMESTAMP)

SET IDENTITY_INSERT [dbo].[producto] OFF
SET IDENTITY_INSERT [dbo].[programacionInventario] ON 

INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (1, 5, CAST(0x0000A4A100000000 AS DateTime), 0, 10, 4, 32, 0, N'1         ', CAST(0x0000A49E01018EAB AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (2, 5, CAST(0x0000A4A100000000 AS DateTime), 0, 8, 4, 34, 0, N'1         ', CAST(0x0000A49E01018EB1 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (3, 5, CAST(0x0000A4A100000000 AS DateTime), NULL, 7, 4, 34, 0, N'1         ', CAST(0x0000A49E0171EE31 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (4, 36, CAST(0x0000A4A300000000 AS DateTime), NULL, 10, 4, 32, 0, N'1         ', CAST(0x0000A49E01731E53 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (5, 36, CAST(0x0000A4A300000000 AS DateTime), NULL, 7, 4, 32, 0, N'1         ', CAST(0x0000A49F0001BCFD AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (6, 38, CAST(0x0000A4A000000000 AS DateTime), NULL, 7, 4, 32, 1, N'1         ', CAST(0x0000A49F0132B363 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (7, 36, CAST(0x0000A4A100000000 AS DateTime), NULL, 8, 4, 32, 0, N'1         ', CAST(0x0000A49F0135523B AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (8, 36, CAST(0x0000A4A100000000 AS DateTime), NULL, 7, 4, 31, 0, N'1         ', CAST(0x0000A4A100203F38 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (9, 36, CAST(0x0000A4A100000000 AS DateTime), NULL, 7, 4, 31, 0, N'1         ', CAST(0x0000A4A100204C20 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (10, 36, CAST(0x0000A4A000000000 AS DateTime), NULL, 7, 4, 31, 0, N'1         ', CAST(0x0000A4A10021A9A5 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (11, 36, CAST(0x0000A4A000000000 AS DateTime), NULL, 7, 4, 31, 1, N'1         ', CAST(0x0000A4A1002238CC AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (12, 36, CAST(0x0000A4A100000000 AS DateTime), NULL, 7, 4, 31, 0, N'1         ', CAST(0x0000A4A1002A24D8 AS DateTime))
INSERT [dbo].[programacionInventario] ([idProgInventario], [tipoInventario], [fechaProgramada], [frecuencia], [idAlmacen], [idPersona], [idEstadoInventario], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (13, 36, CAST(0x0000A4A100000000 AS DateTime), NULL, 7, 4, 31, 1, N'1         ', CAST(0x0000A4A100344395 AS DateTime))
SET IDENTITY_INSERT [dbo].[programacionInventario] OFF
INSERT [dbo].[stock] ([idAlmacen], [idProducto], [idLote], [cantidad], [cantidadReservada], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (7, 1, 1, 100, 400, 1, N'1         ', CAST(0x0000A491015DC125 AS DateTime))
INSERT [dbo].[stock] ([idAlmacen], [idProducto], [idLote], [cantidad], [cantidadReservada], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (7, 2, 2, 200, 500, 1, N'1         ', CAST(0x0000A491015DC125 AS DateTime))
INSERT [dbo].[stock] ([idAlmacen], [idProducto], [idLote], [cantidad], [cantidadReservada], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (8, 1, 1, 100, 400, 1, N'1         ', CAST(0x0000A491015DC125 AS DateTime))
INSERT [dbo].[stock] ([idAlmacen], [idProducto], [idLote], [cantidad], [cantidadReservada], [activo], [Cod_Usuario], [fechaCreacion]) VALUES (8, 2, 2, 200, 500, 1, N'1         ', CAST(0x0000A491015DC125 AS DateTime))
INSERT [dbo].[Usuario] ([Cod_Usuario], [Pwd_Usuario], [Nom_Usuario], [Tipo_Usuario], [Estado_Usuario], [Filler1]) VALUES (N'1         ', N'1         ', N'admin', N'1', N'1', N'1')
INSERT [dbo].[Usuario] ([Cod_Usuario], [Pwd_Usuario], [Nom_Usuario], [Tipo_Usuario], [Estado_Usuario], [Filler1]) VALUES (N'2         ', N'2         ', N'Manuel', N'2', N'1', N'1')
INSERT [dbo].[Usuario] ([Cod_Usuario], [Pwd_Usuario], [Nom_Usuario], [Tipo_Usuario], [Estado_Usuario], [Filler1]) VALUES (N'3         ', N'3         ', N'Jorge Cabezudo', N'A', N'A', N'')
SET IDENTITY_INSERT [dbo].[usuarioAlmacen] ON 

INSERT [dbo].[usuarioAlmacen] ([idUsuarioAlmacen], [idUsuario], [idAlmacen]) VALUES (1, N'1         ', 7)
INSERT [dbo].[usuarioAlmacen] ([idUsuarioAlmacen], [idUsuario], [idAlmacen]) VALUES (2, N'1         ', 8)
INSERT [dbo].[usuarioAlmacen] ([idUsuarioAlmacen], [idUsuario], [idAlmacen]) VALUES (3, N'1         ', 9)
INSERT [dbo].[usuarioAlmacen] ([idUsuarioAlmacen], [idUsuario], [idAlmacen]) VALUES (4, N'1         ', 10)
SET IDENTITY_INSERT [dbo].[usuarioAlmacen] OFF
INSERT [dbo].[UsuMenu] ([Cod_Usu], [Cod_Men]) VALUES (N'JORGE     ', N'1     ')
INSERT [dbo].[UsuMenu] ([Cod_Usu], [Cod_Men]) VALUES (N'JORGE     ', N'2     ')
INSERT [dbo].[UsuMenu] ([Cod_Usu], [Cod_Men]) VALUES (N'JORGE     ', N'3     ')
INSERT [dbo].[UsuMenu] ([Cod_Usu], [Cod_Men]) VALUES (N'JORGE     ', N'4     ')
INSERT [dbo].[x_Cliente] ([Codigo], [Ruc], [Razon_Social], [Direccion], [CodPai], [Telefono], [Correo], [Observaciones], [Usuario], [Pasword]) VALUES (CAST(1 AS Numeric(9, 0)), N'54789612345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
