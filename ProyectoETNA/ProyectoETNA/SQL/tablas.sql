/****** Object:  Table [dbo].[almacen]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalleDocumentoAlmacen]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalleDocumentoPendiente]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalleInventario]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[documentoAlmacen]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[documentoPendiente]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lote]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[persona]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
	[Cod_Usuario] [char](10) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[programacionInventario]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stock]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tablaTipo]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Cod_Usuario] [char](10) NOT NULL,
	[Pwd_Usuario] [char](10) NULL,
	[Nom_Usuario] [varchar](50) NULL,
	[Tipo_Usuario] [char](1) NULL,
	[Estado_Usuario] [char](1) NULL,
	[Filler1] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarioAlmacen]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarioAlmacen](
	[idUsuarioAlmacen] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [char](10) NOT NULL,
	[idAlmacen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuarioAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuMenu]    Script Date: 23/05/2015 09:11:45 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Aprobacion]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_Aprobacion](
	[codRequerimiento] [int] NOT NULL,
	[codEstado] [int] NOT NULL,
	[codPersonal] [int] NOT NULL,
 CONSTRAINT [pk_aprobacion] PRIMARY KEY CLUSTERED 
(
	[codRequerimiento] ASC,
	[codEstado] ASC,
	[codPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[x_Cargo]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Cargo](
	[codCargo] [int] NOT NULL,
	[desCargo] [varchar](20) NOT NULL,
 CONSTRAINT [pk_cargo] PRIMARY KEY CLUSTERED 
(
	[codCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Categoria]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Categoria](
	[codCategoria] [int] NOT NULL,
	[desCategoria] [varchar](30) NOT NULL,
 CONSTRAINT [pk_categoria] PRIMARY KEY CLUSTERED 
(
	[codCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Cliente]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Cliente](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_DocProdReq]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_DocProdReq](
	[Doc_Req] [decimal](10, 0) NOT NULL,
	[Doc_Prod] [numeric](7, 0) NOT NULL,
	[Doc_Siicex] [char](3) NOT NULL,
 CONSTRAINT [PK_DocProdReq] PRIMARY KEY CLUSTERED 
(
	[Doc_Req] ASC,
	[Doc_Prod] ASC,
	[Doc_Siicex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_docProdTEMP]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_docProdTEMP](
	[Doc_Prod] [numeric](7, 0) NOT NULL,
	[Doc_Siicex] [char](3) NOT NULL,
 CONSTRAINT [PK_docProdTEMP] PRIMARY KEY CLUSTERED 
(
	[Doc_Prod] ASC,
	[Doc_Siicex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_DosSIICEX]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_DosSIICEX](
	[Cod_SIICEX] [char](3) NOT NULL,
	[Des_SIICEX] [varchar](50) NULL,
 CONSTRAINT [PK_DosSIICEX] PRIMARY KEY CLUSTERED 
(
	[Cod_SIICEX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[X_Estado]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[X_Estado](
	[codEstado] [int] NOT NULL,
	[desEstado] [varchar](30) NOT NULL,
 CONSTRAINT [pk_estado] PRIMARY KEY CLUSTERED 
(
	[codEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_IATA]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_IATA](
	[IATA_COD] [char](3) NOT NULL,
	[IATA_PAIS] [char](3) NOT NULL,
	[IATA_DES] [varchar](50) NULL,
 CONSTRAINT [PK_IATA] PRIMARY KEY CLUSTERED 
(
	[IATA_COD] ASC,
	[IATA_PAIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Marca]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Marca](
	[codMarca] [int] NOT NULL,
	[desMarca] [varchar](30) NOT NULL,
 CONSTRAINT [pk_marca] PRIMARY KEY CLUSTERED 
(
	[codMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_OpcMenu]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_OpcMenu](
	[Cod_OpcionMenu] [char](6) NOT NULL,
	[Des_opcionMenu] [varchar](100) NULL,
 CONSTRAINT [PK_OpcMenu] PRIMARY KEY CLUSTERED 
(
	[Cod_OpcionMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Pais]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Pais](
	[Cod_Pais] [char](3) NOT NULL,
	[Nom_Pais] [varchar](50) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[Cod_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Personal]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Personal](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Producto_expo]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Producto_expo](
	[Cod_Prod] [numeric](7, 0) NOT NULL,
	[Des_Prod] [varchar](150) NULL,
	[Cod_Unidad] [char](3) NULL,
	[Pre_Prod] [decimal](18, 3) NULL,
	[Pes_Prod] [decimal](18, 3) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Cod_Prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Requerimiento]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_Requerimiento](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_Requerimiento_Detalle]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_Requerimiento_Detalle](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[x_RequerimientoCompras]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_RequerimientoCompras](
	[codRequerimiento] [int] IDENTITY(1,1) NOT NULL,
	[codPersonal] [int] NOT NULL,
	[codEstado] [int] NOT NULL,
	[codCategoria] [int] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[observacion] [varchar](150) NULL,
 CONSTRAINT [pk_requerimientoCompras] PRIMARY KEY CLUSTERED 
(
	[codRequerimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_RequerimientoDetalle]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[x_RequerimientoDetalle](
	[codRequerimiento] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [pk_requerimientoDetalle] PRIMARY KEY CLUSTERED 
(
	[codRequerimiento] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[x_SolicitudAtencion]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_SolicitudAtencion](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[x_zona]    Script Date: 23/05/2015 09:11:45 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[x_zona](
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
