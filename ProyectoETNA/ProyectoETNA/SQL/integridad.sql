ALTER TABLE [dbo].[detalleDocumentoAlmacen]  WITH CHECK ADD  CONSTRAINT [detalleDocumentoAlmacen_FKCONSTRAINT1] FOREIGN KEY([correlativo])
REFERENCES [dbo].[documentoAlmacen] ([correlativo])
GO
ALTER TABLE [dbo].[detalleDocumentoAlmacen] CHECK CONSTRAINT [detalleDocumentoAlmacen_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[detalleDocumentoPendiente]  WITH CHECK ADD  CONSTRAINT [detalleDocumentoPendiente_FKCONSTRAINT2] FOREIGN KEY([idDocPendiente])
REFERENCES [dbo].[documentoPendiente] ([idDocPendiente])
GO
ALTER TABLE [dbo].[detalleDocumentoPendiente] CHECK CONSTRAINT [detalleDocumentoPendiente_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[detalleInventario]  WITH CHECK ADD  CONSTRAINT [detalleInventario_FKCONSTRAINT1] FOREIGN KEY([idInventario])
REFERENCES [dbo].[inventario] ([idInventario])
GO
ALTER TABLE [dbo].[detalleInventario] CHECK CONSTRAINT [detalleInventario_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[detalleInventario]  WITH CHECK ADD  CONSTRAINT [detalleInventario_FKCONSTRAINT2] FOREIGN KEY([idOperadorAlmacen])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[detalleInventario] CHECK CONSTRAINT [detalleInventario_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[detalleInventario]  WITH CHECK ADD  CONSTRAINT [detalleInventario_FKCONSTRAINT3] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[detalleInventario] CHECK CONSTRAINT [detalleInventario_FKCONSTRAINT3]
GO
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT1] FOREIGN KEY([idDocPendiente])
REFERENCES [dbo].[documentoPendiente] ([idDocPendiente])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT2] FOREIGN KEY([tipoMovimiento])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT3] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT3]
GO
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT4] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT4]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [inventario_FKCONSTRAINT1] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [inventario_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [inventario_FKCONSTRAINT2] FOREIGN KEY([idProgInventario])
REFERENCES [dbo].[programacionInventario] ([idProgInventario])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [inventario_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [inventario_FKCONSTRAINT3] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [inventario_FKCONSTRAINT3]
GO
ALTER TABLE [dbo].[lote]  WITH CHECK ADD  CONSTRAINT [lote_FKCONSTRAINT1] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[lote] CHECK CONSTRAINT [lote_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_FKCONSTRAINT1] FOREIGN KEY([tipoPersona])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_FKCONSTRAINT2] FOREIGN KEY([tipoDocIdentidad])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_FKCONSTRAINT3] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_FKCONSTRAINT3]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [producto_FKCONSTRAINT1] FOREIGN KEY([tipoProducto])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [producto_FKCONSTRAINT2] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT1] FOREIGN KEY([tipoInventario])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT1]
GO
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT2] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT3] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT3]
GO
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT4] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT4]
GO
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT5] FOREIGN KEY([idEstadoInventario])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT5]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT2] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT2]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT3] FOREIGN KEY([idLote])
REFERENCES [dbo].[lote] ([idLote])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT3]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT4] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT4]
GO
ALTER TABLE [dbo].[usuarioAlmacen]  WITH CHECK ADD FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[usuarioAlmacen]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[x_Aprobacion]  WITH CHECK ADD  CONSTRAINT [fk_estado_aprobacion] FOREIGN KEY([codEstado])
REFERENCES [dbo].[X_Estado] ([codEstado])
GO
ALTER TABLE [dbo].[x_Aprobacion] CHECK CONSTRAINT [fk_estado_aprobacion]
GO
ALTER TABLE [dbo].[x_Aprobacion]  WITH CHECK ADD  CONSTRAINT [fk_personal_aprobacion] FOREIGN KEY([codPersonal])
REFERENCES [dbo].[x_Personal] ([codPersonal])
GO
ALTER TABLE [dbo].[x_Aprobacion] CHECK CONSTRAINT [fk_personal_aprobacion]
GO
ALTER TABLE [dbo].[x_Aprobacion]  WITH CHECK ADD  CONSTRAINT [fk_requerimiento_aprobacion] FOREIGN KEY([codRequerimiento])
REFERENCES [dbo].[x_RequerimientoCompras] ([codRequerimiento])
GO
ALTER TABLE [dbo].[x_Aprobacion] CHECK CONSTRAINT [fk_requerimiento_aprobacion]
GO
ALTER TABLE [dbo].[x_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Cliente] FOREIGN KEY([Codigo])
REFERENCES [dbo].[x_Cliente] ([Codigo])
GO
ALTER TABLE [dbo].[x_Cliente] CHECK CONSTRAINT [FK_Cliente_Cliente]
GO
ALTER TABLE [dbo].[x_Personal]  WITH CHECK ADD  CONSTRAINT [fk_cargo] FOREIGN KEY([codCargo])
REFERENCES [dbo].[x_Cargo] ([codCargo])
GO
ALTER TABLE [dbo].[x_Personal] CHECK CONSTRAINT [fk_cargo]
GO
ALTER TABLE [dbo].[x_RequerimientoCompras]  WITH CHECK ADD  CONSTRAINT [fk_categoria_req] FOREIGN KEY([codCategoria])
REFERENCES [dbo].[x_Categoria] ([codCategoria])
GO
ALTER TABLE [dbo].[x_RequerimientoCompras] CHECK CONSTRAINT [fk_categoria_req]
GO
ALTER TABLE [dbo].[x_RequerimientoCompras]  WITH CHECK ADD  CONSTRAINT [fk_personal_req] FOREIGN KEY([codPersonal])
REFERENCES [dbo].[x_Personal] ([codPersonal])
GO
ALTER TABLE [dbo].[x_RequerimientoCompras] CHECK CONSTRAINT [fk_personal_req]
GO
ALTER TABLE [dbo].[x_RequerimientoDetalle]  WITH CHECK ADD  CONSTRAINT [fk_articulo] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[x_RequerimientoDetalle] CHECK CONSTRAINT [fk_articulo]
GO
ALTER TABLE [dbo].[x_RequerimientoDetalle]  WITH CHECK ADD  CONSTRAINT [fk_requerimientoCompras] FOREIGN KEY([codRequerimiento])
REFERENCES [dbo].[x_RequerimientoCompras] ([codRequerimiento])
GO
ALTER TABLE [dbo].[x_RequerimientoDetalle] CHECK CONSTRAINT [fk_requerimientoCompras]
GO
ALTER TABLE [dbo].[x_zona]  WITH CHECK ADD  CONSTRAINT [zona_FKCONSTRAINT1] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[x_zona] CHECK CONSTRAINT [zona_FKCONSTRAINT1]
GO
