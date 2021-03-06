USE [ETNA]
GO
/****** Object:  Table [dbo].[docProdTEMP]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docProdTEMP](
	[Doc_Prod] [numeric](7, 0) NOT NULL,
	[Doc_Siicex] [char](3) NOT NULL,
 CONSTRAINT [PK_docProdTEMP] PRIMARY KEY CLUSTERED 
(
	[Doc_Prod] ASC,
	[Doc_Siicex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Temporal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'docProdTEMP'
GO
/****** Object:  Table [dbo].[DocProdReq]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocProdReq](
	[Doc_Req] [decimal](10, 0) NOT NULL,
	[Doc_Prod] [numeric](7, 0) NOT NULL,
	[Doc_Siicex] [char](3) NOT NULL,
 CONSTRAINT [PK_DocProdReq] PRIMARY KEY CLUSTERED 
(
	[Doc_Req] ASC,
	[Doc_Prod] ASC,
	[Doc_Siicex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documento Producto Requisicion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocProdReq'
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
	[Cod_Pais] [char](3) NOT NULL,
	[Nom_Pais] [varchar](50) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[Cod_Pais] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pais'
GO
/****** Object:  Table [dbo].[OpcMenu]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OpcMenu](
	[Cod_OpcionMenu] [char](6) NOT NULL,
	[Des_opcionMenu] [varchar](100) NULL,
 CONSTRAINT [PK_OpcMenu] PRIMARY KEY CLUSTERED 
(
	[Cod_OpcionMenu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opciones Menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpcMenu'
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[codMarca] [int] NOT NULL,
	[desMarca] [varchar](30) NOT NULL,
 CONSTRAINT [pk_marca] PRIMARY KEY CLUSTERED 
(
	[codMarca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto_expo]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto_expo](
	[Cod_Prod] [numeric](7, 0) NOT NULL,
	[Des_Prod] [varchar](150) NULL,
	[Cod_Unidad] [char](3) NULL,
	[Pre_Prod] [decimal](18, 3) NULL,
	[Pes_Prod] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Cod_Prod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Productos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto_expo'
GO
/****** Object:  Table [dbo].[almacen]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[almacen](
	[idAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[descripcionAlmacen] [varchar](100) NOT NULL,
	[idSupervisorAlmacen] [int] NOT NULL,
	[direccion] [varchar](50) NULL,
	[ubigeo] [varchar](10) NULL,
	[telefono] [varchar](20) NULL,
	[tipoAlmacen] [int] NULL,
	[metraje] [float] NULL,
	[activo] [int] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlmacen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codigo] [numeric](9, 0) NOT NULL,
	[Ruc] [char](11) NULL,
	[Razon_Social] [varchar](60) NULL,
	[Direccion] [varchar](100) NULL,
	[CodPai] [char](3) NULL,
	[Telefono] [varchar](max) NULL,
	[Correo] [varchar](max) NULL,
	[Observaciones] [varchar](max) NULL,
	[Usuario] [char](11) NULL,
	[Pasword] [varchar](max) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Clientes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente'
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[codCategoria] [int] NOT NULL,
	[desCategoria] [varchar](30) NOT NULL,
 CONSTRAINT [pk_categoria] PRIMARY KEY CLUSTERED 
(
	[codCategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cargo](
	[codCargo] [int] NOT NULL,
	[desCargo] [varchar](20) NOT NULL,
 CONSTRAINT [pk_cargo] PRIMARY KEY CLUSTERED 
(
	[codCargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IATA]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IATA](
	[IATA_COD] [char](3) NOT NULL,
	[IATA_PAIS] [char](3) NOT NULL,
	[IATA_DES] [varchar](50) NULL,
 CONSTRAINT [PK_IATA] PRIMARY KEY CLUSTERED 
(
	[IATA_COD] ASC,
	[IATA_PAIS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TABLA IATA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IATA'
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[codEstado] [int] NOT NULL,
	[desEstado] [varchar](30) NOT NULL,
 CONSTRAINT [pk_estado] PRIMARY KEY CLUSTERED 
(
	[codEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DosSIICEX]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DosSIICEX](
	[Cod_SIICEX] [char](3) NOT NULL,
	[Des_SIICEX] [varchar](50) NULL,
 CONSTRAINT [PK_DosSIICEX] PRIMARY KEY CLUSTERED 
(
	[Cod_SIICEX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documentos SIICEX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DosSIICEX'
GO
/****** Object:  Table [dbo].[documentoPendiente]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[documentoPendiente](
	[idDocPendiente] [int] NOT NULL,
	[numeroDocPendiente] [varchar](10) NOT NULL,
	[tipoDocumentoPendiente] [int] NULL,
	[idClienteProveedor] [int] NOT NULL,
	[fechaDocumento] [datetime] NULL,
	[situacionatencion] [int] NULL,
	[activo] [int] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[tipoMovimiento] [int] NULL,
	[idAlmacen] [int] NULL,
	[areaSolicitante] [varchar](100) NULL,
	[idUsuarioSolicitante] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDocPendiente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuMenu]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuMenu](
	[Cod_Usu] [char](10) NOT NULL,
	[Cod_Men] [char](6) NOT NULL,
 CONSTRAINT [PK_UsuMenu] PRIMARY KEY CLUSTERED 
(
	[Cod_Usu] ASC,
	[Cod_Men] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opciones Menu Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsuMenu'
GO
/****** Object:  Table [dbo].[UsuarioAlmacen]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioAlmacen](
	[Cod_Usuario] [char](10) NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[activo] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Cod_Usuario] [char](10) NOT NULL,
	[Pwd_Usuario] [varchar](50) NOT NULL,
	[Nom_Usuario] [varchar](50) NULL,
	[Tipo_Usuario] [int] NOT NULL,
	[Estado_Usuario] [int] NOT NULL,
	[Filler1] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Usuarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario'
GO
/****** Object:  Table [dbo].[tablaTipo]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tablaTipo](
	[idTipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [varchar](200) NULL,
	[idTabla] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SolicitudAtencion]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SolicitudAtencion](
	[Cod_Solicitud] [decimal](10, 0) NOT NULL,
	[Cod_Cab_Req_Solicitud] [decimal](10, 0) NULL,
	[Res_Solicitud] [char](10) NULL,
	[Fec_Reg_Solicitud] [decimal](8, 0) NULL,
	[Fec_Res_Esp_Solicitud] [decimal](8, 0) NULL,
	[Fec_Desp_Solicitud] [decimal](8, 0) NULL,
	[Estado_Solicitud] [char](1) NULL,
	[Observacion_Solicitud] [varchar](max) NULL,
 CONSTRAINT [PK_SolicitudAtencion] PRIMARY KEY CLUSTERED 
(
	[Cod_Solicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de solicitud de Atencion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SolicitudAtencion'
GO
/****** Object:  Table [dbo].[Requerimiento_Detalle]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requerimiento_Detalle](
	[Cod_Det_Req] [decimal](10, 0) NOT NULL,
	[Cod_Prod_Det_Req] [decimal](7, 0) NOT NULL,
	[Cantidad] [int] NULL,
	[Precio_Unit] [decimal](18, 3) NULL,
	[CIF] [decimal](18, 3) NULL,
	[FOB] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Requerimiento_Detalle] PRIMARY KEY CLUSTERED 
(
	[Cod_Det_Req] ASC,
	[Cod_Prod_Det_Req] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla Detalle de Requerimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requerimiento_Detalle'
GO
/****** Object:  Table [dbo].[Requerimiento]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Requerimiento](
	[Cod_Cab_Req] [decimal](10, 0) NOT NULL,
	[Cli_Cab_Req] [numeric](9, 0) NULL,
	[Pais_Cab_Req] [char](3) NULL,
	[Destino_Cab_Req] [varchar](100) NULL,
	[IATA_Cab_Req] [char](5) NULL,
	[Fec_Reg_Cab_Req] [decimal](8, 0) NULL,
	[Fec_Esp_Cab_Req] [decimal](8, 0) NULL,
	[Pre_Tot_Cab_Req] [decimal](18, 3) NULL,
	[Est_Cab_Req] [char](1) NULL,
	[Obs_Cab_Req] [varchar](max) NULL,
 CONSTRAINT [PK_Requerimiento] PRIMARY KEY CLUSTERED 
(
	[Cod_Cab_Req] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Requerimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requerimiento'
GO
/****** Object:  Table [dbo].[zona]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zona](
	[idZona] [int] IDENTITY(1,1) NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[fila] [int] NULL,
	[columna] [int] NULL,
	[nivel] [int] NULL,
	[posicion] [int] NULL,
	[metraje] [int] NULL,
	[capacidad] [int] NULL,
	[disponibilidad] [int] NULL,
	[observacion] [varchar](250) NULL,
	[activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idZona] ASC,
	[idAlmacen] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[documentoAlmacen]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[documentoAlmacen](
	[correlativo] [int] NOT NULL,
	[idDocPendiente] [int] NOT NULL,
	[numeroDocAlmacen] [varchar](20) NOT NULL,
	[tipoMovimiento] [int] NULL,
	[fechaDocumento] [datetime] NULL,
	[idAlmacen] [int] NULL,
	[activo] [int] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[correlativo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 06/03/2015 18:19:12 ******/
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
/****** Object:  Table [dbo].[Personal]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[codPersonal] [int] NOT NULL,
	[codCargo] [int] NOT NULL,
	[nomPersonal] [varchar](30) NULL,
	[telefono] [numeric](9, 0) NULL,
	[direccion] [varchar](30) NULL,
	[usuario] [varchar](15) NULL,
	[clave] [varchar](15) NULL,
 CONSTRAINT [pk_personal] PRIMARY KEY CLUSTERED 
(
	[codPersonal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[persona]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[tipoPersona] [int] NULL,
	[nombres] [varchar](40) NULL,
	[apellidoPaterno] [varchar](40) NULL,
	[apellidoMaterno] [varchar](40) NULL,
	[razonSocial] [varchar](60) NULL,
	[tipoDocIdentidad] [int] NULL,
	[numeroDocIdentidad] [varchar](15) NULL,
	[direccion] [varchar](60) NULL,
	[telefono] [varchar](20) NULL,
	[correo] [varchar](40) NULL,
	[paginaWeb] [varchar](60) NULL,
	[fechaNacimiento] [datetime] NULL,
	[cargo] [varchar](50) NULL,
	[centrocosto] [varchar](50) NULL,
	[activo] [tinyint] NULL,
	[fechaIngreso] [datetime] NULL,
	[Cod_Usuario] [char](10) NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lote]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lote](
	[idLote] [int] IDENTITY(1,1) NOT NULL,
	[fechaFabricacion] [datetime] NULL,
	[ordenFabricacion] [int] NULL,
	[fechaTomaMuestra] [datetime] NULL,
	[bloqueado] [int] NULL,
	[cantidadProducida] [int] NULL,
	[activo] [tinyint] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLote] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalleDocumentoPendiente]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleDocumentoPendiente](
	[idDocPendiente] [int] NOT NULL,
	[idDetalleDocPendiente] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidadPedida] [int] NULL,
	[cantidadAtendida] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleDocPendiente] ASC,
	[idDocPendiente] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleDocumentoAlmacen]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleDocumentoAlmacen](
	[correlativo] [int] NOT NULL,
	[idDetalleDocAlmacen] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleDocAlmacen] ASC,
	[correlativo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 06/03/2015 18:19:12 ******/
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
	[estado] [int] NOT NULL,
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
/****** Object:  Table [dbo].[programacionInventario]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[programacionInventario](
	[idProgInventario] [int] IDENTITY(1,1) NOT NULL,
	[tipoInventario] [int] NULL,
	[fechaProgramada] [datetime] NULL,
	[frecuencia] [int] NULL,
	[idAlmacen] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idEstadoInventario] [int] NOT NULL,
	[activo] [tinyint] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProgInventario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequerimientoCompras]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequerimientoCompras](
	[codRequerimiento] [int] IDENTITY(1,1) NOT NULL,
	[codPersonal] [int] NOT NULL,
	[codEstado] [int] NOT NULL,
	[codCategoria] [int] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[observacion] [varchar](150) NULL,
 CONSTRAINT [pk_requerimientoCompras] PRIMARY KEY CLUSTERED 
(
	[codRequerimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequerimientoDetalle]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequerimientoDetalle](
	[codRequerimiento] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [pk_requerimientoDetalle] PRIMARY KEY CLUSTERED 
(
	[codRequerimiento] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aprobacion]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aprobacion](
	[codRequerimiento] [int] NOT NULL,
	[codEstado] [int] NOT NULL,
	[codPersonal] [int] NOT NULL,
 CONSTRAINT [pk_aprobacion] PRIMARY KEY CLUSTERED 
(
	[codRequerimiento] ASC,
	[codEstado] ASC,
	[codPersonal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inventario](
	[idInventario] [int] IDENTITY(1,1) NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[idProgInventario] [int] NOT NULL,
	[fechaHoraInicio] [datetime] NULL,
	[fechaHoraFin] [datetime] NULL,
	[tipo] [int] NULL,
	[activo] [int] NULL,
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idInventario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalleInventario]    Script Date: 06/03/2015 18:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleInventario](
	[idDetalleInventario] [int] IDENTITY(1,1) NOT NULL,
	[idInventario] [int] NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[idOperadorAlmacen] [int] NOT NULL,
	[cantidadActual] [int] NULL,
	[cantidad] [int] NULL,
	[cantidadAjuste] [int] NULL,
	[fechaHoraToma] [datetime] NULL,
	[numeroToma] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleInventario] ASC,
	[idInventario] ASC,
	[idAlmacen] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [fk_estado_aprobacion]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[Aprobacion]  WITH CHECK ADD  CONSTRAINT [fk_estado_aprobacion] FOREIGN KEY([codEstado])
REFERENCES [dbo].[Estado] ([codEstado])
GO
ALTER TABLE [dbo].[Aprobacion] CHECK CONSTRAINT [fk_estado_aprobacion]
GO
/****** Object:  ForeignKey [fk_personal_aprobacion]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[Aprobacion]  WITH CHECK ADD  CONSTRAINT [fk_personal_aprobacion] FOREIGN KEY([codPersonal])
REFERENCES [dbo].[Personal] ([codPersonal])
GO
ALTER TABLE [dbo].[Aprobacion] CHECK CONSTRAINT [fk_personal_aprobacion]
GO
/****** Object:  ForeignKey [fk_requerimiento_aprobacion]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[Aprobacion]  WITH CHECK ADD  CONSTRAINT [fk_requerimiento_aprobacion] FOREIGN KEY([codRequerimiento])
REFERENCES [dbo].[RequerimientoCompras] ([codRequerimiento])
GO
ALTER TABLE [dbo].[Aprobacion] CHECK CONSTRAINT [fk_requerimiento_aprobacion]
GO
/****** Object:  ForeignKey [FK_Cliente_Cliente]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Cliente] FOREIGN KEY([Codigo])
REFERENCES [dbo].[Cliente] ([Codigo])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Cliente]
GO
/****** Object:  ForeignKey [detalleDocumentoAlmacen_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[detalleDocumentoAlmacen]  WITH CHECK ADD  CONSTRAINT [detalleDocumentoAlmacen_FKCONSTRAINT1] FOREIGN KEY([correlativo])
REFERENCES [dbo].[documentoAlmacen] ([correlativo])
GO
ALTER TABLE [dbo].[detalleDocumentoAlmacen] CHECK CONSTRAINT [detalleDocumentoAlmacen_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [detalleDocumentoPendiente_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[detalleDocumentoPendiente]  WITH CHECK ADD  CONSTRAINT [detalleDocumentoPendiente_FKCONSTRAINT2] FOREIGN KEY([idDocPendiente])
REFERENCES [dbo].[documentoPendiente] ([idDocPendiente])
GO
ALTER TABLE [dbo].[detalleDocumentoPendiente] CHECK CONSTRAINT [detalleDocumentoPendiente_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [detalleInventario_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[detalleInventario]  WITH CHECK ADD  CONSTRAINT [detalleInventario_FKCONSTRAINT1] FOREIGN KEY([idInventario])
REFERENCES [dbo].[inventario] ([idInventario])
GO
ALTER TABLE [dbo].[detalleInventario] CHECK CONSTRAINT [detalleInventario_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [detalleInventario_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[detalleInventario]  WITH CHECK ADD  CONSTRAINT [detalleInventario_FKCONSTRAINT2] FOREIGN KEY([idOperadorAlmacen])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[detalleInventario] CHECK CONSTRAINT [detalleInventario_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [detalleInventario_FKCONSTRAINT3]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[detalleInventario]  WITH CHECK ADD  CONSTRAINT [detalleInventario_FKCONSTRAINT3] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[detalleInventario] CHECK CONSTRAINT [detalleInventario_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [documentoAlmacen_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT1] FOREIGN KEY([idDocPendiente])
REFERENCES [dbo].[documentoPendiente] ([idDocPendiente])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [documentoAlmacen_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT2] FOREIGN KEY([tipoMovimiento])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [documentoAlmacen_FKCONSTRAINT3]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT3] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [documentoAlmacen_FKCONSTRAINT4]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[documentoAlmacen]  WITH CHECK ADD  CONSTRAINT [documentoAlmacen_FKCONSTRAINT4] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[documentoAlmacen] CHECK CONSTRAINT [documentoAlmacen_FKCONSTRAINT4]
GO
/****** Object:  ForeignKey [inventario_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [inventario_FKCONSTRAINT1] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [inventario_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [inventario_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [inventario_FKCONSTRAINT2] FOREIGN KEY([idProgInventario])
REFERENCES [dbo].[programacionInventario] ([idProgInventario])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [inventario_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [inventario_FKCONSTRAINT3]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [inventario_FKCONSTRAINT3] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [inventario_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [lote_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[lote]  WITH CHECK ADD  CONSTRAINT [lote_FKCONSTRAINT1] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[lote] CHECK CONSTRAINT [lote_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [persona_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_FKCONSTRAINT1] FOREIGN KEY([tipoPersona])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [persona_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_FKCONSTRAINT2] FOREIGN KEY([tipoDocIdentidad])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [persona_FKCONSTRAINT3]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_FKCONSTRAINT3] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [fk_cargo]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [fk_cargo] FOREIGN KEY([codCargo])
REFERENCES [dbo].[Cargo] ([codCargo])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [fk_cargo]
GO
/****** Object:  ForeignKey [producto_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [producto_FKCONSTRAINT1] FOREIGN KEY([tipoProducto])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [producto_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [producto_FKCONSTRAINT2] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [programacionInventario_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT1] FOREIGN KEY([tipoInventario])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT1]
GO
/****** Object:  ForeignKey [programacionInventario_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT2] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [programacionInventario_FKCONSTRAINT3]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT3] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [programacionInventario_FKCONSTRAINT4]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT4] FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT4]
GO
/****** Object:  ForeignKey [programacionInventario_FKCONSTRAINT5]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[programacionInventario]  WITH CHECK ADD  CONSTRAINT [programacionInventario_FKCONSTRAINT5] FOREIGN KEY([idEstadoInventario])
REFERENCES [dbo].[tablaTipo] ([idTipo])
GO
ALTER TABLE [dbo].[programacionInventario] CHECK CONSTRAINT [programacionInventario_FKCONSTRAINT5]
GO
/****** Object:  ForeignKey [fk_categoria_req]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[RequerimientoCompras]  WITH CHECK ADD  CONSTRAINT [fk_categoria_req] FOREIGN KEY([codCategoria])
REFERENCES [dbo].[Categoria] ([codCategoria])
GO
ALTER TABLE [dbo].[RequerimientoCompras] CHECK CONSTRAINT [fk_categoria_req]
GO
/****** Object:  ForeignKey [fk_personal_req]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[RequerimientoCompras]  WITH CHECK ADD  CONSTRAINT [fk_personal_req] FOREIGN KEY([codPersonal])
REFERENCES [dbo].[Personal] ([codPersonal])
GO
ALTER TABLE [dbo].[RequerimientoCompras] CHECK CONSTRAINT [fk_personal_req]
GO
/****** Object:  ForeignKey [fk_articulo]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[RequerimientoDetalle]  WITH CHECK ADD  CONSTRAINT [fk_articulo] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[RequerimientoDetalle] CHECK CONSTRAINT [fk_articulo]
GO
/****** Object:  ForeignKey [fk_requerimientoCompras]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[RequerimientoDetalle]  WITH CHECK ADD  CONSTRAINT [fk_requerimientoCompras] FOREIGN KEY([codRequerimiento])
REFERENCES [dbo].[RequerimientoCompras] ([codRequerimiento])
GO
ALTER TABLE [dbo].[RequerimientoDetalle] CHECK CONSTRAINT [fk_requerimientoCompras]
GO
/****** Object:  ForeignKey [stock_FKCONSTRAINT2]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT2] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT2]
GO
/****** Object:  ForeignKey [stock_FKCONSTRAINT3]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT3] FOREIGN KEY([idLote])
REFERENCES [dbo].[lote] ([idLote])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT3]
GO
/****** Object:  ForeignKey [stock_FKCONSTRAINT4]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [stock_FKCONSTRAINT4] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [stock_FKCONSTRAINT4]
GO
/****** Object:  ForeignKey [zona_FKCONSTRAINT1]    Script Date: 06/03/2015 18:19:12 ******/
ALTER TABLE [dbo].[zona]  WITH CHECK ADD  CONSTRAINT [zona_FKCONSTRAINT1] FOREIGN KEY([idAlmacen])
REFERENCES [dbo].[almacen] ([idAlmacen])
GO
ALTER TABLE [dbo].[zona] CHECK CONSTRAINT [zona_FKCONSTRAINT1]
GO
