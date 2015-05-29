USE [ETNA]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 05/29/2015 00:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[tipoProducto] [int] NULL,
	[codigoProducto] [varchar](50) NULL,
	[descripcionProducto] [varchar](200) NULL,
	[tipounidadMedida] [char](3) NULL,
	[numeroPlacas] [int] NULL,
	[capacidadNominal] [int] NULL,
	[capacidadArranque] [int] NULL,
	[largo] [float] NULL,
	[ancho] [float] NULL,
	[alto] [float] NULL,
	[peso] [float] NULL,
	[periodoRecarga] [int] NULL,
	[tiempoMaxSinCarga] [int] NULL,
	[temperaturaMaxCarga] [int] NULL,
	[tipoDeUso] [int] NULL,
	[tiempoGarantia] [int] NULL,
	[stockMinimo] [int] NULL,
	[stockMaximo] [int] NULL,
	[activo] [int] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[pre_prod] [decimal](18, 3) NULL,
	[codCategoria] [int] NULL,
	[codMarca] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stock]    Script Date: 05/29/2015 00:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stock](
	[idAlmacen] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[idLote] [int] NOT NULL,
	[cantidad] [int] NULL,
	[cantidadReservada] [int] NULL,
	[activo] [int] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlmacen] ASC,
	[idProducto] ASC,
	[idLote] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [producto_FKCONSTRAINT1]    Script Date: 05/29/2015 00:23:21 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [producto_FKCONSTRAINT1] FOREIGN KEY([tipoProducto])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [producto_FKCONSTRAINT2]    Script Date: 05/29/2015 00:23:21 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [producto_FKCONSTRAINT2] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [stock_FKCONSTRAINT2]    Script Date: 05/29/2015 00:23:21 ******/
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT2] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [stock_FKCONSTRAINT3]    Script Date: 05/29/2015 00:23:21 ******/
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT3] FOREIGN KEY([idLote])
REFERENCES [dbo].[lote] ([idLote])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [stock_FKCONSTRAINT4]    Script Date: 05/29/2015 00:23:21 ******/
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT4] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT4]
GO
