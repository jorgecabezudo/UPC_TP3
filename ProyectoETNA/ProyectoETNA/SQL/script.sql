USE [master]
GO
/****** Object:  Database [ETNA]    Script Date: 23/05/2015 09:11:43 p.m. ******/
CREATE DATABASE [ETNA] ON  PRIMARY 
( NAME = N'ETNATP3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Etna\ETNA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ETNATP3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Etna\ETNA_1.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ETNA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ETNA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ETNA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ETNA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ETNA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ETNA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ETNA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ETNA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ETNA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ETNA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ETNA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ETNA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ETNA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ETNA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ETNA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ETNA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ETNA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ETNA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ETNA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ETNA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ETNA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ETNA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ETNA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ETNA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ETNA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ETNA] SET RECOVERY FULL 
GO
ALTER DATABASE [ETNA] SET  MULTI_USER 
GO
ALTER DATABASE [ETNA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ETNA] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ETNA', N'ON'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Usuarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opciones Menu Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsuMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Clientes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_Cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documento Producto Requisicion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_DocProdReq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Temporal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_docProdTEMP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documentos SIICEX' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_DosSIICEX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TABLA IATA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_IATA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opciones Menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_OpcMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_Pais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Productos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_Producto_expo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de Requerimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_Requerimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla Detalle de Requerimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_Requerimiento_Detalle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de solicitud de Atencion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'x_SolicitudAtencion'
GO
USE [master]
GO
ALTER DATABASE [ETNA] SET  READ_WRITE 
GO
