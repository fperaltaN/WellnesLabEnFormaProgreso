USE [master]
GO
/****** Object:  Database [EnForma]    Script Date: 13/04/2018 06:48:54 p. m. ******/
CREATE DATABASE [EnForma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnForma', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EnForma.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnForma_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EnForma_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EnForma] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnForma].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnForma] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnForma] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnForma] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnForma] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnForma] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnForma] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnForma] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnForma] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnForma] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnForma] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnForma] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnForma] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnForma] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnForma] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnForma] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EnForma] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnForma] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnForma] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnForma] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnForma] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnForma] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnForma] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnForma] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnForma] SET  MULTI_USER 
GO
ALTER DATABASE [EnForma] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnForma] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnForma] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnForma] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnForma] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnForma] SET QUERY_STORE = OFF
GO
USE [EnForma]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EnForma]
GO
/****** Object:  Table [dbo].[TBL_MODULOS]    Script Date: 13/04/2018 06:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_MODULOS](
	[ID_MODULO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TC_MODULOS] PRIMARY KEY CLUSTERED 
(
	[ID_MODULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_PERFILES]    Script Date: 13/04/2018 06:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_PERFILES](
	[ID_PERFIL] [int] IDENTITY(1,1) NOT NULL,
	[PERFIL] [varchar](50) NOT NULL,
	[ACTIVO] [bit] NOT NULL,
	[CREADO] [datetime] NOT NULL,
	[CREADOPOR] [varchar](50) NOT NULL,
	[ACTUALIZADO] [datetime] NOT NULL,
	[ACTUALIZADOPOR] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_PERFILES] PRIMARY KEY CLUSTERED 
(
	[ID_PERFIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_REL_PERFIL_MODULO]    Script Date: 13/04/2018 06:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_REL_PERFIL_MODULO](
	[ID_REL] [int] IDENTITY(1,1) NOT NULL,
	[ID_PERFIL] [int] NOT NULL,
	[ID_MODULO] [int] NOT NULL,
	[CONTROL_TOTAL] [bit] NOT NULL,
	[ACTIVO] [bit] NOT NULL,
	[CREADO] [datetime] NOT NULL,
	[CREADOPOR] [varchar](50) NOT NULL,
	[ACTUALIZADO] [datetime] NOT NULL,
	[ACTUALIZADOPOR] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_REL_PERFIL_MODULO] PRIMARY KEY CLUSTERED 
(
	[ID_REL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_USUARIOS]    Script Date: 13/04/2018 06:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_USUARIOS](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[APELLIDO_PAT] [varchar](100) NULL,
	[APELLIDO_MAT] [varchar](100) NULL,
	[ID_AREA] [int] NOT NULL,
	[USUARIO] [varchar](50) NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[ID_PERFIL] [int] NOT NULL,
	[ACTIVO] [bit] NOT NULL,
	[CREADO] [datetime] NOT NULL,
	[CREADOPOR] [varchar](50) NOT NULL,
	[ACTUALIZADO] [datetime] NOT NULL,
	[ACTUALIZADOPOR] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblAsignacion]    Script Date: 13/04/2018 06:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblAsignacion](
	[id_asignacion] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[id_paquete] [int] NOT NULL,
	[fecha_asignacion] [datetime] NOT NULL,
	[fecha_vigencia] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
 CONSTRAINT [PK__TblAsign__C3F7F9662DC3BF0D] PRIMARY KEY CLUSTERED 
(
	[id_asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblChecador]    Script Date: 13/04/2018 06:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblChecador](
	[id_entrada_salida] [int] IDENTITY(1,1) NOT NULL,
	[id_empleado] [int] NOT NULL,
	[entrada] [datetime] NOT NULL,
	[salida] [datetime] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblCheca__F23389AE571DA169] PRIMARY KEY CLUSTERED 
(
	[id_entrada_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblChecadorSocio]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblChecadorSocio](
	[id_entrada_salida] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[entrada] [datetime] NOT NULL,
	[salida] [datetime] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblChecaSocio__F23389AE571DA169] PRIMARY KEY CLUSTERED 
(
	[id_entrada_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmpleado]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmpleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[num_empleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ap_paterno] [varchar](50) NOT NULL,
	[ap_materno] [varchar](50) NOT NULL,
	[direccion] [text] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[fecha_baja] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[id_perfil] [int] NOT NULL,
	[telefono] [varchar](20) NULL,
 CONSTRAINT [PK__TblEmple__88B513945010C962] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblHistorialFisico]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblHistorialFisico](
	[id_historial_fisico] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblHisto__5432EB6090D1B0A4] PRIMARY KEY CLUSTERED 
(
	[id_historial_fisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblHistorialMedico]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblHistorialMedico](
	[id_historial_medico] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblHisto__FA1C62073B3AB819] PRIMARY KEY CLUSTERED 
(
	[id_historial_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblHistorialPeso]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblHistorialPeso](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[prev_peso] [decimal](18, 2) NOT NULL,
	[prev_alto] [decimal](18, 2) NOT NULL,
	[prev_bajo] [decimal](18, 2) NOT NULL,
	[prev_cadera] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TblHistorialPeso] PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMembresia]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMembresia](
	[id_membresia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](1) NOT NULL,
	[descripcion] [text] NOT NULL,
	[costo] [decimal](5, 2) NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblMembr__2EB820E13410AED2] PRIMARY KEY CLUSTERED 
(
	[id_membresia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblModulo]    Script Date: 13/04/2018 06:48:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblModulo](
	[id_modulo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPago]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPago](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[id_paquete] [int] NOT NULL,
	[id_socio] [int] NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[importe] [decimal](10, 2) NULL,
	[fecha_pago] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[fecha_pago_vence] [datetime] NOT NULL,
	[pendiente] [decimal](10, 2) NULL,
 CONSTRAINT [PK__TblPago__0941B074FFF048B6] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPagoRecargo]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPagoRecargo](
	[id_pago_recargo] [int] IDENTITY(1,1) NOT NULL,
	[id_pago] [int] NOT NULL,
	[id_recargo] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblPagoR__3607D45F38BD622A] PRIMARY KEY CLUSTERED 
(
	[id_pago_recargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPaquete]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPaquete](
	[id_paquete] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[costo] [decimal](18, 2) NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[diaspaquetes] [int] NOT NULL,
 CONSTRAINT [PK__paquete__609C3BCB912CD0D5] PRIMARY KEY CLUSTERED 
(
	[id_paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPaqueteServicio]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPaqueteServicio](
	[id_paquete] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblPaque__B6613C3699942D56] PRIMARY KEY CLUSTERED 
(
	[id_paquete] ASC,
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProducto]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProducto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[costo] [decimal](18, 2) NOT NULL,
	[existencia] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[clave] [varchar](10) NOT NULL,
 CONSTRAINT [PK__TblProdu__FF341C0D2265516E] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRecargo]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRecargo](
	[id_recargo] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[id_paquete] [int] NOT NULL,
	[fecha_recargo] [datetime] NOT NULL,
	[importe] [decimal](18, 2) NOT NULL,
	[liberacion] [bit] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblRecar__EAE53A7DEABF2A96] PRIMARY KEY CLUSTERED 
(
	[id_recargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRecord]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRecord](
	[id_record] [int] IDENTITY(1,1) NOT NULL,
	[peso] [decimal](18, 2) NULL,
	[pesoi] [decimal](18, 2) NULL,
	[pesob] [decimal](18, 2) NULL,
	[abdai] [decimal](18, 2) NULL,
	[abda] [decimal](18, 2) NULL,
	[abdab] [decimal](18, 2) NULL,
	[abdbi] [decimal](18, 2) NULL,
	[abdb] [decimal](18, 2) NULL,
	[abdbb] [decimal](18, 2) NULL,
	[caderai] [decimal](18, 2) NULL,
	[cadera] [decimal](18, 2) NULL,
	[caderatb] [decimal](18, 2) NULL,
	[altura] [decimal](18, 2) NULL,
	[talla] [varchar](50) NULL,
	[grasac] [decimal](18, 2) NULL,
	[imc] [decimal](18, 2) NULL,
	[ta] [decimal](18, 2) NULL,
	[guia] [decimal](18, 2) NULL,
	[observaciones] [varchar](50) NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[id_record] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRecordsSocio]    Script Date: 13/04/2018 06:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRecordsSocio](
	[id_relation] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[id_record] [int] NOT NULL,
 CONSTRAINT [PK_TblRecordsSocio] PRIMARY KEY CLUSTERED 
(
	[id_relation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRegistroVisita]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRegistroVisita](
	[id_vigencia] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[dias_vigentes] [int] NOT NULL,
	[fecha_entrada] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblVigen__4F6EB5DCE75BC47F] PRIMARY KEY CLUSTERED 
(
	[id_vigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblServicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblServicio](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__servicio__6FD07FDCE96A2E25] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSocio](
	[id_socio] [int] IDENTITY(1,1) NOT NULL,
	[num_socio] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ap_paterno] [varchar](50) NOT NULL,
	[ap_materno] [varchar](50) NOT NULL,
	[direccion] [text] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[fecha_baja] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[telefono] [varchar](18) NULL,
	[fecha_nacimiento] [datetime] NOT NULL,
	[compEstudios] [bit] NULL,
	[mail] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TblSocio] PRIMARY KEY CLUSTERED 
(
	[id_socio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSocioMembresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSocioMembresia](
	[id_socio_membresia] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[id_paquete] [int] NOT NULL,
	[fecha_vinculacion] [datetime] NOT NULL,
	[fecha_renovacion] [datetime] NOT NULL,
	[fecha_expiracion] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblSocio__1FBBEA743AF98D43] PRIMARY KEY CLUSTERED 
(
	[id_socio_membresia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVenta]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVenta](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[folio_diario] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[total] [decimal](6, 2) NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK__TblVenta__459533BF8BA2C101] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVentaProducto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVentaProducto](
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[costo] [decimal](18, 2) NOT NULL,
	[activo] [bit] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK__TblVenta__8A66727F67B3C720] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [uniqueEmpleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [uniqueEmpleado] ON [dbo].[TblEmpleado]
(
	[num_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_PERFILES] ADD  CONSTRAINT [DF_TBL_PERFILES_ACTIVO]  DEFAULT ((1)) FOR [ACTIVO]
GO
ALTER TABLE [dbo].[TBL_PERFILES] ADD  CONSTRAINT [DF_TBL_PERFILES_CREADO]  DEFAULT (getdate()) FOR [CREADO]
GO
ALTER TABLE [dbo].[TBL_PERFILES] ADD  CONSTRAINT [DF_TBL_PERFILES_CREADOPOR]  DEFAULT ('SISTEMA') FOR [CREADOPOR]
GO
ALTER TABLE [dbo].[TBL_PERFILES] ADD  CONSTRAINT [DF_TBL_PERFILES_ACTUALIZADO]  DEFAULT (getdate()) FOR [ACTUALIZADO]
GO
ALTER TABLE [dbo].[TBL_PERFILES] ADD  CONSTRAINT [DF_TBL_PERFILES_ACTUALIZADOPOR]  DEFAULT ('SISTEMA') FOR [ACTUALIZADOPOR]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD  CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_CONTROL_TOTAL]  DEFAULT ((0)) FOR [CONTROL_TOTAL]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD  CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_ACTIVO]  DEFAULT ((1)) FOR [ACTIVO]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD  CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_CREADO]  DEFAULT (getdate()) FOR [CREADO]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD  CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_CREADOPOR]  DEFAULT ('SISTEMA') FOR [CREADOPOR]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD  CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_ACTUALIZADO]  DEFAULT (getdate()) FOR [ACTUALIZADO]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] ADD  CONSTRAINT [DF_TBL_REL_PERFIL_MODULO_ACTUALIZADOPOR]  DEFAULT ('SISTEMA') FOR [ACTUALIZADOPOR]
GO
ALTER TABLE [dbo].[TBL_USUARIOS] ADD  CONSTRAINT [DF_TBL_USUARIOS_ACTIVO]  DEFAULT ((1)) FOR [ACTIVO]
GO
ALTER TABLE [dbo].[TBL_USUARIOS] ADD  CONSTRAINT [DF_TBL_USUARIOS_CREADO]  DEFAULT (getdate()) FOR [CREADO]
GO
ALTER TABLE [dbo].[TBL_USUARIOS] ADD  CONSTRAINT [DF_TBL_USUARIOS_CREADOPOR]  DEFAULT ('SISTEMA') FOR [CREADOPOR]
GO
ALTER TABLE [dbo].[TBL_USUARIOS] ADD  CONSTRAINT [DF_TBL_USUARIOS_ACTUALIZADO]  DEFAULT (getdate()) FOR [ACTUALIZADO]
GO
ALTER TABLE [dbo].[TBL_USUARIOS] ADD  CONSTRAINT [DF_TBL_USUARIOS_ACTUALIZADOPOR]  DEFAULT ('SISTEMA') FOR [ACTUALIZADOPOR]
GO
ALTER TABLE [dbo].[TblAsignacion] ADD  CONSTRAINT [DF_TblAsignacion_Asigna]  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[TblAsignacion] ADD  CONSTRAINT [DF_TblAsignacion_VigenciA]  DEFAULT (getdate()) FOR [fecha_vigencia]
GO
ALTER TABLE [dbo].[TblAsignacion] ADD  CONSTRAINT [DF_TblAsignacion_MOdificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblAsignacion] ADD  CONSTRAINT [DF_TblAsignacion_cancelacion]  DEFAULT (getdate()) FOR [fecha_cancelacion]
GO
ALTER TABLE [dbo].[TblChecador] ADD  CONSTRAINT [DF_TblChecador_Vigencia]  DEFAULT (getdate()) FOR [entrada]
GO
ALTER TABLE [dbo].[TblChecador] ADD  CONSTRAINT [DF_TblChecador_Salida]  DEFAULT (getdate()) FOR [salida]
GO
ALTER TABLE [dbo].[TblChecador] ADD  CONSTRAINT [DF_TblChecador_Registro]  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[TblChecador] ADD  CONSTRAINT [DF_TblChecador_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblChecadorSocio] ADD  CONSTRAINT [DF_TblChecadorSocio_Vigencia]  DEFAULT (getdate()) FOR [entrada]
GO
ALTER TABLE [dbo].[TblChecadorSocio] ADD  CONSTRAINT [DF_TblChecadorSocio_Salida]  DEFAULT (getdate()) FOR [salida]
GO
ALTER TABLE [dbo].[TblChecadorSocio] ADD  CONSTRAINT [DF_TblChecadorSocio_Registro]  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[TblChecadorSocio] ADD  CONSTRAINT [DF_TblChecadorSocio_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_Registro]  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_baja]  DEFAULT (getdate()) FOR [fecha_baja]
GO
ALTER TABLE [dbo].[TblEmpleado] ADD  CONSTRAINT [DF_TblEmpleado_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblHistorialFisico] ADD  CONSTRAINT [DF_TblHistorialFisico_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblHistorialMedico] ADD  CONSTRAINT [DF_TblHistorialMedico_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblMembresia] ADD  CONSTRAINT [DF_TblMembresia_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblPago] ADD  CONSTRAINT [DF_TblPago_pago]  DEFAULT (getdate()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[TblPago] ADD  CONSTRAINT [DF_TblPago_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblPago] ADD  CONSTRAINT [DF__TblPago__fecha_p__0697FACD]  DEFAULT (getdate()) FOR [fecha_pago_vence]
GO
ALTER TABLE [dbo].[TblPago] ADD  CONSTRAINT [Constraint_name]  DEFAULT ((0)) FOR [pendiente]
GO
ALTER TABLE [dbo].[TblPagoRecargo] ADD  CONSTRAINT [DF_TblPagoRecargo_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblPaquete] ADD  CONSTRAINT [DF_TblPaquete_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblPaquete] ADD  CONSTRAINT [DF__TblPaquet__diasp__6BAEFA67]  DEFAULT ((30)) FOR [diaspaquetes]
GO
ALTER TABLE [dbo].[TblPaqueteServicio] ADD  CONSTRAINT [DF_TblPaqueteServicio_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblProducto] ADD  CONSTRAINT [DF_TblProducto_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblRecargo] ADD  CONSTRAINT [DF_TblRecargo_Recargo]  DEFAULT (getdate()) FOR [fecha_recargo]
GO
ALTER TABLE [dbo].[TblRecargo] ADD  CONSTRAINT [DF_TblRecargo_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblRegistroVisita] ADD  CONSTRAINT [DF_TblRegistroVisita_baja]  DEFAULT (getdate()) FOR [fecha_entrada]
GO
ALTER TABLE [dbo].[TblRegistroVisita] ADD  CONSTRAINT [DF_TblRegistroVisita_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblServicio] ADD  CONSTRAINT [DF_TblSocio_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblSocio] ADD  CONSTRAINT [DF_TblSocio_nacimiento]  DEFAULT (getdate()) FOR [fecha_nacimiento]
GO
ALTER TABLE [dbo].[TblSocio] ADD  CONSTRAINT [DF__TblSocio__mail__0697FACD]  DEFAULT ('') FOR [mail]
GO
ALTER TABLE [dbo].[TblSocioMembresia] ADD  CONSTRAINT [DF_TblSocioMembresia_vinculacion]  DEFAULT (getdate()) FOR [fecha_vinculacion]
GO
ALTER TABLE [dbo].[TblSocioMembresia] ADD  CONSTRAINT [DF_TblSocioMembresia_renovacion]  DEFAULT (getdate()) FOR [fecha_renovacion]
GO
ALTER TABLE [dbo].[TblSocioMembresia] ADD  CONSTRAINT [DF_TblSocioMembresia_expiracion]  DEFAULT (getdate()) FOR [fecha_expiracion]
GO
ALTER TABLE [dbo].[TblSocioMembresia] ADD  CONSTRAINT [DF_TblSocioMembresia_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblVenta] ADD  CONSTRAINT [DF_TblVenta_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[TblVenta] ADD  CONSTRAINT [DF_TblVenta_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TblVentaProducto] ADD  CONSTRAINT [DF_TblVentaProducto_Modificacion]  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TBL_PERFILES] FOREIGN KEY([ID_PERFIL])
REFERENCES [dbo].[TBL_PERFILES] ([ID_PERFIL])
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] CHECK CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TBL_PERFILES]
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO]  WITH CHECK ADD  CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TC_MODULOS] FOREIGN KEY([ID_MODULO])
REFERENCES [dbo].[TBL_MODULOS] ([ID_MODULO])
GO
ALTER TABLE [dbo].[TBL_REL_PERFIL_MODULO] CHECK CONSTRAINT [FK_TBL_REL_PERFIL_MODULO_TC_MODULOS]
GO
ALTER TABLE [dbo].[TBL_USUARIOS]  WITH NOCHECK ADD  CONSTRAINT [FK_TBL_USUARIOS_TBL_PERFILES] FOREIGN KEY([ID_PERFIL])
REFERENCES [dbo].[TBL_PERFILES] ([ID_PERFIL])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TBL_USUARIOS] CHECK CONSTRAINT [FK_TBL_USUARIOS_TBL_PERFILES]
GO
ALTER TABLE [dbo].[TblAsignacion]  WITH CHECK ADD  CONSTRAINT [FK__TblAsigna__id_pa__6B24EA82] FOREIGN KEY([id_paquete])
REFERENCES [dbo].[TblPaquete] ([id_paquete])
GO
ALTER TABLE [dbo].[TblAsignacion] CHECK CONSTRAINT [FK__TblAsigna__id_pa__6B24EA82]
GO
ALTER TABLE [dbo].[TblChecador]  WITH CHECK ADD  CONSTRAINT [FK_TblChecador_TblEmpleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[TblEmpleado] ([id_empleado])
GO
ALTER TABLE [dbo].[TblChecador] CHECK CONSTRAINT [FK_TblChecador_TblEmpleado]
GO
ALTER TABLE [dbo].[TblChecadorSocio]  WITH CHECK ADD  CONSTRAINT [FK_TblChecador_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblChecadorSocio] CHECK CONSTRAINT [FK_TblChecador_TblSocio]
GO
ALTER TABLE [dbo].[TblHistorialFisico]  WITH CHECK ADD  CONSTRAINT [FK_TblHistorialFisico_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblHistorialFisico] CHECK CONSTRAINT [FK_TblHistorialFisico_TblSocio]
GO
ALTER TABLE [dbo].[TblHistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_TblHistorialMedico_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblHistorialMedico] CHECK CONSTRAINT [FK_TblHistorialMedico_TblSocio]
GO
ALTER TABLE [dbo].[TblHistorialPeso]  WITH CHECK ADD  CONSTRAINT [FK_TblHistorialPeso_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblHistorialPeso] CHECK CONSTRAINT [FK_TblHistorialPeso_TblSocio]
GO
ALTER TABLE [dbo].[TblPago]  WITH CHECK ADD  CONSTRAINT [FK__TblPago__id_empl__75A278F5] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[TBL_USUARIOS] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK__TblPago__id_empl__75A278F5]
GO
ALTER TABLE [dbo].[TblPago]  WITH CHECK ADD  CONSTRAINT [FK__TblPago__id_paqu__6FE99F9F] FOREIGN KEY([id_paquete])
REFERENCES [dbo].[TblPaquete] ([id_paquete])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK__TblPago__id_paqu__6FE99F9F]
GO
ALTER TABLE [dbo].[TblPago]  WITH CHECK ADD  CONSTRAINT [FK_TblPago_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblPago] CHECK CONSTRAINT [FK_TblPago_TblSocio]
GO
ALTER TABLE [dbo].[TblPagoRecargo]  WITH CHECK ADD  CONSTRAINT [FK__TblPagoRe__id_re__797309D9] FOREIGN KEY([id_recargo])
REFERENCES [dbo].[TblRecargo] ([id_recargo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblPagoRecargo] CHECK CONSTRAINT [FK__TblPagoRe__id_re__797309D9]
GO
ALTER TABLE [dbo].[TblPagoRecargo]  WITH CHECK ADD  CONSTRAINT [FK_TblPagoRecargo_TblPago] FOREIGN KEY([id_pago])
REFERENCES [dbo].[TblPago] ([id_pago])
GO
ALTER TABLE [dbo].[TblPagoRecargo] CHECK CONSTRAINT [FK_TblPagoRecargo_TblPago]
GO
ALTER TABLE [dbo].[TblPaquete]  WITH CHECK ADD  CONSTRAINT [FK__TblPaquet__id_em__5441852A] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[TBL_USUARIOS] ([ID_USUARIO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblPaquete] CHECK CONSTRAINT [FK__TblPaquet__id_em__5441852A]
GO
ALTER TABLE [dbo].[TblPaqueteServicio]  WITH CHECK ADD  CONSTRAINT [FK__TblPaquet__id_pa__164452B1] FOREIGN KEY([id_paquete])
REFERENCES [dbo].[TblPaquete] ([id_paquete])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblPaqueteServicio] CHECK CONSTRAINT [FK__TblPaquet__id_pa__164452B1]
GO
ALTER TABLE [dbo].[TblPaqueteServicio]  WITH CHECK ADD  CONSTRAINT [FK__TblPaquet__id_se__173876EA] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[TblServicio] ([id_servicio])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblPaqueteServicio] CHECK CONSTRAINT [FK__TblPaquet__id_se__173876EA]
GO
ALTER TABLE [dbo].[TblRecordsSocio]  WITH CHECK ADD  CONSTRAINT [FK_TblRecordsSocio_TblRecord] FOREIGN KEY([id_record])
REFERENCES [dbo].[TblRecord] ([id_record])
GO
ALTER TABLE [dbo].[TblRecordsSocio] CHECK CONSTRAINT [FK_TblRecordsSocio_TblRecord]
GO
ALTER TABLE [dbo].[TblRecordsSocio]  WITH CHECK ADD  CONSTRAINT [FK_TblRecordsSocio_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblRecordsSocio] CHECK CONSTRAINT [FK_TblRecordsSocio_TblSocio]
GO
ALTER TABLE [dbo].[TblSocioMembresia]  WITH CHECK ADD  CONSTRAINT [FK_TblSocioMembresia_TblPaquete] FOREIGN KEY([id_paquete])
REFERENCES [dbo].[TblPaquete] ([id_paquete])
GO
ALTER TABLE [dbo].[TblSocioMembresia] CHECK CONSTRAINT [FK_TblSocioMembresia_TblPaquete]
GO
ALTER TABLE [dbo].[TblSocioMembresia]  WITH CHECK ADD  CONSTRAINT [FK_TblSocioMembresia_TblSocio] FOREIGN KEY([id_socio])
REFERENCES [dbo].[TblSocio] ([id_socio])
GO
ALTER TABLE [dbo].[TblSocioMembresia] CHECK CONSTRAINT [FK_TblSocioMembresia_TblSocio]
GO
ALTER TABLE [dbo].[TblVenta]  WITH CHECK ADD  CONSTRAINT [FK__TblVenta__id_emp__5165187F] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[TBL_USUARIOS] ([ID_USUARIO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblVenta] CHECK CONSTRAINT [FK__TblVenta__id_emp__5165187F]
GO
ALTER TABLE [dbo].[TblVentaProducto]  WITH CHECK ADD  CONSTRAINT [FK__TblVentaP__id_pr__22AA2996] FOREIGN KEY([id_producto])
REFERENCES [dbo].[TblProducto] ([id_producto])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblVentaProducto] CHECK CONSTRAINT [FK__TblVentaP__id_pr__22AA2996]
GO
ALTER TABLE [dbo].[TblVentaProducto]  WITH CHECK ADD  CONSTRAINT [FK__TblVentaP__id_ve__21B6055D] FOREIGN KEY([id_venta])
REFERENCES [dbo].[TblVenta] ([id_venta])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TblVentaProducto] CHECK CONSTRAINT [FK__TblVentaP__id_ve__21B6055D]
GO
/****** Object:  StoredProcedure [dbo].[add_asignacion]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_asignacion]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int,
	@fecha_asignacion datetime,
	@fecha_vigencia datetime,
	@fecha_cancelacion datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblAsignacion(id_socio, 
							  id_paquete, 
							  fecha_asignacion,
							  fecha_vigencia,
							  activo,
							  fecha_modificacion,
							  fecha_cancelacion
	) VALUES (@id_socio,
			  @id_paquete,
			  @fecha_asignacion,
			  @fecha_vigencia,
			  1,
			  getdate(),
			  @fecha_cancelacion
	)
END







GO
/****** Object:  StoredProcedure [dbo].[add_checador]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_checador]--2
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_empleado int 
	set @id_empleado = ( SELECT [id_empleado] FROM TblEmpleado WHERE num_empleado = @num_empleado  )

    -- Insert statements for procedure here
	INSERT INTO TblChecador (id_empleado,
							 entrada,
							 salida,
							 fecha_registro,
							 activo,
							 fecha_modificacion
	) VALUES (@id_empleado,
			  getdate(),
			  '',
			  getdate(),
			  1,
			  getdate()
	)
END







GO
/****** Object:  StoredProcedure [dbo].[add_checadorSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_checadorSocio]
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_socio int 
	set @id_socio = ( SELECT [id_socio] FROM TblSocio WHERE num_socio = @num_empleado  )

    -- Insert statements for procedure here
	INSERT INTO TblChecadorSocio (id_Socio,
							 entrada,
							 salida,
							 fecha_registro,
							 activo,
							 fecha_modificacion
	) VALUES (@id_socio,
			  getdate(),
			  '',
			  getdate(),
			  1,
			  getdate()
	)
END







GO
/****** Object:  StoredProcedure [dbo].[add_empleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_empleado]
	-- Add the parameters for the stored procedure here
	@num_empleado int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50), 
	@telefono varchar(20), 
	@direccion text,
	@id_perfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblEmpleado (num_empleado,
							 nombre,
							 ap_paterno,
							 ap_materno,
							 telefono,
							 direccion,
							 fecha_registro,
							 fecha_baja,
							 activo,
							 fecha_modificacion,
							 id_perfil
	) VALUES (@num_empleado,
			  @nombre,
			  @ap_paterno,
			  @ap_materno,
			  @telefono,
			  @direccion,
			  getdate(),
			  getdate(),--obener algo para calcular una fecha
			  1,
			  getdate(),
			  @id_perfil
	)
END







GO
/****** Object:  StoredProcedure [dbo].[add_historial_fisico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblHistorialFisico (id_socio, descripcion, activo,fecha_modificacion)
	VALUES (@id_socio, @descripcion, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_historial_medico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblHistorialMedico (id_socio, descripcion, activo,fecha_modificacion)
	VALUES (@id_socio, @descripcion, 1,getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_HistorialPesoSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_HistorialPesoSocio]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@peso decimal(18,2),
           @pesoi decimal(18,2),
           @pesob decimal(18,2),
           @abdai decimal(18,2),
           @abda decimal(18,2),
           @abdab decimal(18,2),
           @abdbi decimal(18,2),
           @abdb decimal(18,2),
           @abdbb decimal(18,2),
           @caderai decimal(18,2),
           @cadera decimal(18,2),
           @caderatb decimal(18,2),
           @altura decimal(18,2),
           @talla varchar(250),
           @grasac decimal(18,2),
           @imc decimal(18,2),
           @ta decimal(18,2),
           @guia decimal(18,2),
           @observaciones varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO [dbo].[TblRecord]
           ([peso]
           ,[pesoi]
           ,[pesob]
           ,[abdai]
           ,[abda]
           ,[abdab]
           ,[abdbi]
           ,[abdb]
           ,[abdbb]
           ,[caderai]
           ,[cadera]
           ,[caderatb]
           ,[altura]
           ,[talla]
           ,[grasac]
           ,[imc]
           ,[ta]
           ,[guia]
           ,[observaciones])
     VALUES
         (@peso,
			@pesoi,
			@pesob,
			@abdai,
			@abda,
			@abdab,
			@abdbi,
			@abdb,
			@abdbb,
			@caderai,
			@cadera,
			@caderatb,
			@altura,
			@talla,
			@grasac,
			@imc,
			@ta,
			@guia,
			@observaciones);  

	Declare @id_relation int ;
	set @id_relation = (SELECT IDENT_CURRENT('TblRecord'));

	INSERT INTO [dbo].[TblRecordsSocio]
           ([id_socio]
           ,[id_record])
     VALUES(
			@id_socio,@id_relation);

	INSERT INTO [dbo].[TblHistorialPeso]
           ([id_socio]
           ,[prev_peso]
           ,[prev_alto]
           ,[prev_bajo]
           ,[prev_cadera])
     VALUES
           (@id_socio,
		   @peso,
		   @abda,
		   @abdb,
			@cadera);

END
GO
/****** Object:  StoredProcedure [dbo].[add_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_membresia]
	-- Add the parameters for the stored procedure here
	@nombre varchar (25),
	@descripcion text,
	@costo decimal(5,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblMembresia (nombre, descripcion, costo,activo ,fecha_modificacion)
	VALUES (@nombre, @descripcion, @costo, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@descripcion varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblModulo(DESCRIPCION, activo, fecha_modificacion)
	values (@descripcion, 1, getdate() )
END







GO
/****** Object:  StoredProcedure [dbo].[add_pago]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_pago]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_socio int,
	@ID_USUARIO int,
	@importe decimal(18,2),
	@pendiente decimal(18,2),
	@fecha_pago datetime,
	@fecha_pago_vence datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPago (id_paquete, id_socio, ID_USUARIO, importe,pendiente, fecha_pago,fecha_pago_vence, activo, fecha_modificacion)
	 OUTPUT INSERTED.id_pago
	VALUES(@id_paquete, @id_socio, @ID_USUARIO, @importe,@pendiente, @fecha_pago,@fecha_pago_vence, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_pago_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago int,
	@id_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPagoRecargo (id_pago, id_recargo, activo, fecha_modificacion)
	VALUES (@id_pago, @id_recargo, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_paquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_paquete]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@descripcion text,
	@costo decimal(18,2),
	@diasPaquete Int,
	@ID_USUARIO int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--select @costo
    -- Insert statements for procedure here
	INSERT INTO TblPaquete (nombre, descripcion, costo, diaspaquetes, ID_USUARIO, activo, fecha_modificacion)
	VALUES (@nombre, @descripcion, @costo, @diasPaquete, @ID_USUARIO, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_paquete_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPaqueteServicio (id_paquete, id_servicio, activo, fecha_modificacion)
	VALUES (@id_paquete, @id_servicio, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_perfil]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@perfil varchar(50),
	@creado_por varchar(50),
	@actualizado_por varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblPerfil(PERFIL, ACTIVO, creado, creado_por,actualizado_por, actualizado)
	values (@perfil, 1, GETDATE(), @creado_por, @actualizado_por, GETDATE() )
END







GO
/****** Object:  StoredProcedure [dbo].[add_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_producto]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50), 
	@descripcion text,
	@costo decimal(18,2),
	@existencia int,
	@clave varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblProducto (nombre, descripcion, costo, existencia, clave, activo, fecha_modificacion)
	VALUES (@nombre, @descripcion, @costo,@existencia,@clave, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_recargo]
	-- Add the parameters for the stored procedure here
	
	@id_paquete int,
	@id_socio int,
	@importe decimal (18,2),
	@liberacion bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblRecargo (id_socio, id_paquete, fecha_recargo, importe, liberacion, activo, fecha_modificacion)
	 OUTPUT INSERTED.id_recargo
	VALUES (@id_socio, @id_paquete, GETDATE(), @importe, @liberacion, 1, GETDATE())
						  
END






GO
/****** Object:  StoredProcedure [dbo].[add_registro_visita]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@dias_vigentes int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblRegistroVisita(id_socio, dias_vigentes, fecha_entrada, activo, fecha_modificacion)
	VALUES(@id_socio, @dias_vigentes, getdate(), 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_rel_perfil_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_perfil int, 
	@id_modulo int,
	@control_total bit,
	@activo bit,
	@creado_por varchar (50),
	@actualizado_por varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblRelPerfilModulo(id_perfil, id_modulo, control_total, activo, creado, creado_por, actualizado, actualizado_por)
	VALUES(@id_perfil, @id_modulo, @control_total, @activo, GETDATE(),@creado_por, GETDATE(), @actualizado_por)
END







GO
/****** Object:  StoredProcedure [dbo].[add_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_servicio]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@descripcion text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblServicio(nombre, descripcion, activo, fecha_modificacion)
	VALUES(@nombre, @descripcion, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_socio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_socio] --1,'1','1','1','1','01/01/1987','1'
	-- Add the parameters for the stored procedure here
	@num_socio int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50),
	@telefono varchar(20),
	@fecha_nacimiento datetime,
	@direccion text,
	@compEstudio bit,
	@mail varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Tblsocio (num_socio,
							 nombre,
							 ap_paterno,
							 ap_materno,
							 telefono,
							 direccion,
							 fecha_nacimiento,
							 fecha_registro,
							 fecha_baja,
							 activo,
							 fecha_modificacion,
							 compEstudios,
							 mail
	) OUTPUT INSERTED.id_socio VALUES (@num_socio,
			  @nombre,
			  @ap_paterno,
			  @ap_materno,
			  @telefono,
			  @direccion,
			  @fecha_nacimiento,			  
			  getdate(),
			  getdate(),--obener algo para calcular una fecha
			  1,
			  getdate(),
			  @compEstudio,
			  @mail
	)

	--SELECT SCOPE_IDENTITY()
END







GO
/****** Object:  StoredProcedure [dbo].[add_socio_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int
AS
BEGIN
	DECLARE @dias int
	set @dias = (SELECT diaspaquetes FROM [dbo].[TblPaquete] WHERE id_paquete =@id_paquete)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblSocioMembresia(id_socio, id_paquete, fecha_vinculacion, fecha_renovacion, fecha_expiracion, activo, fecha_modificacion)
	VALUES(@id_socio, @id_paquete, getdate(), getdate() + @dias + 1, getdate() + @dias, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_usuario]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_usuario] 
	-- Add the parameters for the stored procedure here

	@nombre varchar(100),
	@apellido_pat varchar(100),
	@apellido_mat varchar(100),
	@id_area int,
	@usuario varchar(50),
	@password varchar(50),
	@id_perfil int,
	@creado_por varchar(50),
	@actualizado_por varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into TBL_USUARIOS(NOMBRE, APELLIDO_PAT, APELLIDO_MAT, ID_AREA, USUARIO, PASSWORD, ID_PERFIL, ACTIVO, creado, CREADOPOR, actualizado, actualizadopor) 
	values (@nombre, @apellido_pat, @apellido_mat, @id_area, @usuario, @password, @id_perfil, 1, getdate(), @creado_por, getdate(), @actualizado_por)

END







GO
/****** Object:  StoredProcedure [dbo].[add_venta]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_venta]
	-- Add the parameters for the stored procedure here
	@folio_diario int,
	@total decimal(18,2),
	@ID_USUARIO int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblVenta(folio_diario,fecha, total, [ID_USUARIO], activo,fecha_modificacion)
	OUTPUT INSERTED.id_venta
	VALUES(@folio_diario, getdate(), @total, @ID_USUARIO, 1, getdate())
END







GO
/****** Object:  StoredProcedure [dbo].[add_venta_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int, 
	@id_producto int,
	@cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TblVentaProducto(id_venta, id_producto, costo, cantidad, activo, fecha_modificacion)
	VALUES (@id_venta, @id_producto, 0, @cantidad, 1, GETDATE())
END







GO
/****** Object:  StoredProcedure [dbo].[del_asignacion]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_asignacion]
	-- Add the parameters for the stored procedure here
	@id_asignacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	DELETE FROM TblAsignacion
	WHERE id_asignacion=@id_asignacion

END







GO
/****** Object:  StoredProcedure [dbo].[del_checador]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_checador]
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblChecador 
	WHERE id_entrada_salida=@id_entrada_salida
END







GO
/****** Object:  StoredProcedure [dbo].[del_checadorSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_checadorSocio]
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblChecadorSocio
	WHERE id_entrada_salida=@id_entrada_salida
END




GO
/****** Object:  StoredProcedure [dbo].[del_empleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_empleado]
	-- Add the parameters for the stored procedure here
	@id_empleado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblEmpleado 
	WHERE id_empleado=@id_empleado

END







GO
/****** Object:  StoredProcedure [dbo].[del_historial_fisico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblHistorialFisico 
	WHERE id_socio=@id_socio
END







GO
/****** Object:  StoredProcedure [dbo].[del_historial_medico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblHistorialMedico 
	WHERE id_socio=@id_socio
END






GO
/****** Object:  StoredProcedure [dbo].[del_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_membresia]
	-- Add the parameters for the stored procedure here
	@id_membresia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblMembresia
	WHERE id_membresia=@id_membresia
END







GO
/****** Object:  StoredProcedure [dbo].[del_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@id_modulo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblModulo 
	WHERE id_modulo=@id_modulo
END







GO
/****** Object:  StoredProcedure [dbo].[del_pago]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_pago]
	-- Add the parameters for the stored procedure here
	@id_pago int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPagoRecargo
		WHERE id_pago=@id_pago
	DELETE FROM TblPago
		WHERE id_pago=@id_pago
END







GO
/****** Object:  StoredProcedure [dbo].[del_pago_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPagoRecargo
	WHERE id_pago_recargo=@id_pago_recargo
END







GO
/****** Object:  StoredProcedure [dbo].[del_paquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_paquete]
	-- Add the parameters for the stored procedure here
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPaquete
	where id_paquete=@id_paquete
END







GO
/****** Object:  StoredProcedure [dbo].[del_paquete_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPaqueteServicio
	where ((id_paquete=@id_paquete)and (id_servicio=@id_servicio))
END







GO
/****** Object:  StoredProcedure [dbo].[del_perfil]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@id_perfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblPerfil 
	WHERE id_perfil=@id_perfil
END







GO
/****** Object:  StoredProcedure [dbo].[del_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_producto]
	-- Add the parameters for the stored procedure here
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblProducto
	WHERE id_producto=@id_producto
END







GO
/****** Object:  StoredProcedure [dbo].[del_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_recargo]
	-- Add the parameters for the stored procedure here
	@id_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblRecargo
	WHERE id_recargo=@id_recargo
END







GO
/****** Object:  StoredProcedure [dbo].[del_registro_visita]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_vigencia int,
	@id_socio int,
	@dias_vigentes int,
	@fecha_entrada datetime,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblRegistroVisita
	where id_vigencia=@id_vigencia
END







GO
/****** Object:  StoredProcedure [dbo].[del_rel_perfil_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_rel int,
	@id_perfil int, 
	@id_modulo int,
	@control_total bit,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblRelPerfilModulo
	WHERE id_rel=@id_rel
END







GO
/****** Object:  StoredProcedure [dbo].[del_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_servicio]
	-- Add the parameters for the stored procedure here
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblServicio
	where id_servicio=@id_servicio
END







GO
/****** Object:  StoredProcedure [dbo].[del_socio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_socio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Tblsocio 
	WHERE id_socio=@id_socio

END






GO
/****** Object:  StoredProcedure [dbo].[del_socio_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblSocioMembresia 
	WHERE id_socio=@id_socio AND id_paquete =@id_paquete
END







GO
/****** Object:  StoredProcedure [dbo].[del_usuario]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_usuario] 
	-- Add the parameters for the stored procedure here
	@id_usuario int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblUsuario
	WHERE id_usuario=@id_usuario

END







GO
/****** Object:  StoredProcedure [dbo].[del_venta]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_venta]
	-- Add the parameters for the stored procedure here
	@id_venta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblVenta
	WHERE id_venta=@id_venta
END







GO
/****** Object:  StoredProcedure [dbo].[del_venta_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int,
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM TblVentaProducto
	where ((id_venta=@id_venta)and (id_producto=@id_producto))
END







GO
/****** Object:  StoredProcedure [dbo].[sel_Allpaquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_Allpaquete]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_paquete,nombre + '-' + CONVERT(VARCHAR,descripcion) as Nombre FROM TblPaquete WHERE activo = 1
END






GO
/****** Object:  StoredProcedure [dbo].[sel_Allproducto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_Allproducto]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_producto,nombre FROM TblProducto WHERE activo = 1
END






GO
/****** Object:  StoredProcedure [dbo].[sel_AllSocios]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_AllSocios]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_socio,Convert(varchar,Num_socio) + ' - ' + nombre + ' ' + ap_paterno As nombre FROM TblSocio WHERE activo = 1 order by num_socio Asc
END






GO
/****** Object:  StoredProcedure [dbo].[sel_asignacion]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_asignacion]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT* FROM TblAsignacion

END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_asignacion]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_asignacion]
	-- Add the parameters for the stored procedure here
	@id_asignacion int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT* FROM TblAsignacion
	WHERE id_asignacion=@id_asignacion

END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_checador]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_checador]
	-- Add the parameters for the stored procedure here
	@id_empleado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblChecador 
	WHERE id_empleado=@id_empleado
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_checadorSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_checadorSocio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblChecadorSocio 
	WHERE id_Socio=@id_socio
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_empleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_empleado]
	-- Add the parameters for the stored procedure here
	@id_empleado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_empleado],
			e.num_empleado,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.telefono,
			e.direccion,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			e.id_perfil,
			P.PERFIL
				FROM TblEmpleado As E
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = E.id_perfil
	WHERE id_empleado=@id_empleado

END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_historial_fisico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialFisico 
	WHERE id_socio=@id_socio
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_historial_medico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialMedico 
	WHERE id_socio=@id_socio
END






GO
/****** Object:  StoredProcedure [dbo].[sel_byId_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_membresia]
	-- Add the parameters for the stored procedure here
	@id_membresia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblMembresia
	WHERE id_membresia=@id_membresia
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@id_modulo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblModulo 
	WHERE id_modulo=@id_modulo
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_pago]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_pago]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.id_pago as id_pago,
			pa.id_paquete as id_paquete,
			p.id_socio  as id_socio,
			p.ID_USUARIO as ID_USUARIO,
			p.importe AS TotalRecibido,
			pa.costo As TotalPagar,
			p.fecha_pago As fecha_pago,
			p.fecha_pago_vence As fecha_pago_vence,
			sm.fecha_expiracion AS fecha_expiracion,
			r.importe as Adeudos,
			p.pendiente as Pendiente,
			S.NOMBRE as Nombre,
			S.ap_paterno as Ap_Paterno,
			S.ap_materno as Ap_Materno,
			s.activo as Activo
	 FROM TblPago p
		join TblPaquete pa on pa.id_paquete = p.id_paquete
		join TblSocio as S on s.id_socio = p.id_socio
		join TBL_USUARIOS U on U.ID_USUARIO = p.ID_USUARIO
		join TblPagoRecargo pr on pr.id_pago =p.id_pago
		join TblRecargo r on r.id_recargo = pr.id_recargo
		join TblSocioMembresia As SM On SM.id_socio = p.id_socio
	WHERE p.id_pago=@id_socio
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_pago_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPagoRecargo
	WHERE id_pago_recargo=@id_pago_recargo
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_pagoSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_pagoSocio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 p.id_pago as id_pago,
			pa.id_paquete as id_paquete,
			p.id_socio  as id_socio,
			p.ID_USUARIO as ID_USUARIO,
			p.importe AS TotalRecibido,
			p.pendiente As Pendiente,
			pa.costo As TotalPagar,
			p.fecha_pago As fecha_pago,
			p.fecha_pago_vence As fecha_pago_vence,
			sm.fecha_expiracion AS fecha_expiracion,
			r.importe as Adeudos,
			S.NOMBRE as Nombre,
			S.ap_paterno as Ap_Paterno,
			S.ap_materno as Ap_Materno,
			s.activo as Activo
	 FROM TblPago p
		join TblPaquete pa on pa.id_paquete = p.id_paquete
		join TblSocio as S on s.id_socio = p.id_socio
		join TBL_USUARIOS U on U.ID_USUARIO = p.ID_USUARIO
		join TblPagoRecargo pr on pr.id_pago =p.id_pago
		join TblRecargo r on r.id_recargo = pr.id_recargo
		join TblSocioMembresia As SM On SM.id_socio = p.id_socio
	WHERE p.id_socio=@id_socio Order by id_pago desc
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_pagosSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_pagosSocio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  p.id_pago as id_pago,
			pa.id_paquete as id_paquete,
			p.id_socio  as id_socio,
			p.ID_USUARIO as ID_USUARIO,
			p.importe AS TotalRecibido,
			p.pendiente As Pendiente,
			pa.costo As TotalPagar,
			p.fecha_pago As fecha_pago,
			p.fecha_pago_vence As fecha_pago_vence,
			sm.fecha_expiracion AS fecha_expiracion,
			r.importe as Adeudos,
			S.NOMBRE as Nombre,
			S.ap_paterno as Ap_Paterno,
			S.ap_materno as Ap_Materno,
			s.activo as Activo
	 FROM TblPago p
		join TblPaquete pa on pa.id_paquete = p.id_paquete
		join TblSocio as S on s.id_socio = p.id_socio
		join TBL_USUARIOS U on U.ID_USUARIO = p.ID_USUARIO
		join TblPagoRecargo pr on pr.id_pago =p.id_pago
		join TblRecargo r on r.id_recargo = pr.id_recargo
		join TblSocioMembresia As SM On SM.id_socio = p.id_socio
	WHERE p.id_socio=@id_socio Order by id_pago desc
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_paquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_paquete]
	-- Add the parameters for the stored procedure here
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaquete
	where id_paquete=@id_paquete
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_paquete_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaqueteServicio
	where ((id_paquete=@id_paquete)and (id_servicio=@id_servicio))
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_perfil]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@id_perfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPerfil 
	WHERE id_perfil=@id_perfil
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_producto]
	-- Add the parameters for the stored procedure here
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblProducto
	WHERE id_producto=@id_producto
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_recargo]
	-- Add the parameters for the stored procedure here
	@id_recargo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRecargo
	WHERE id_recargo=@id_recargo
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_registro_visita]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_vigencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRegistroVisita
	where id_vigencia=@id_vigencia
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_rel_perfil_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_rel int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRelPerfilModulo
	WHERE id_rel=@id_rel
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_servicio]
	-- Add the parameters for the stored procedure here
	@id_servicio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblServicio
	where id_servicio=@id_servicio
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_socio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_socio]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_socio],
			e.num_socio,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.telefono,
			e.direccion,
			e.fecha_nacimiento,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			SM.id_paquete,
			sm.fecha_vinculacion,
			sm.fecha_expiracion,
			sm.fecha_renovacion,
			sm.fecha_modificacion,
			e.mail
			--p.fecha_pago
				FROM Tblsocio As E
				join TblSocioMembresia As SM On SM.id_socio = e.id_socio
				--join TblPago p On p.id_socio = e.id_socio
	WHERE e.id_socio=@id_socio

END





GO
/****** Object:  StoredProcedure [dbo].[sel_byId_socio_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_socio_membresia]
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblSocioMembresia 
	WHERE id_socio=@id_socio AND id_paquete =@id_paquete
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_socio_membresia_paquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_socio_membresia_paquete]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 * FROM TblSocioMembresia
		WHERE id_socio = @id_socio
		 ORDER BY id_socio_membresia desc
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_usuario]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_usuario] 
	-- Add the parameters for the stored procedure here
	@id_usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.[ID_USUARIO]
      ,U.[NOMBRE]
      ,U.[APELLIDO_PAT]
      ,U.[APELLIDO_MAT]
      ,U.[ID_AREA]
      ,U.[USUARIO]
      ,U.[PASSWORD]
      ,U.[ID_PERFIL]
      ,U.[ACTIVO]
      ,U.[CREADO]
      ,U.[CREADOPOR]
      ,U.[ACTUALIZADO]
      ,U.[ACTUALIZADOPOR] 
	  ,P.PERFIL 
		FROM TBL_USUARIOS U
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = U.id_perfil
	WHERE id_usuario=@id_usuario

END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_venta]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_venta]
	-- Add the parameters for the stored procedure here
	@id_venta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVenta
	WHERE id_venta=@id_venta
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byId_venta_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byId_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int,
	@id_producto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVentaProducto
	where ((id_venta=@id_venta)and (id_producto=@id_producto))
END







GO
/****** Object:  StoredProcedure [dbo].[sel_byNumero_Checador]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byNumero_Checador] --2
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_empleado int 
	set @id_empleado = ( SELECT [id_empleado] FROM TblEmpleado WHERE num_empleado =  @num_empleado  ) 

    -- Insert statements for procedure here
	SELECT TOP 1 id_entrada_salida,id_empleado,entrada, salida,activo
		 FROM TblChecador ch
			 WHERE id_empleado = @id_empleado AND (entrada >=  CONVERT (date, GETDATE()) OR entrada <=  CONVERT (date, GETDATE()))
			 ORDER BY id_entrada_salida DESC
END



GO
/****** Object:  StoredProcedure [dbo].[sel_byNumero_ChecadorSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_byNumero_ChecadorSocio] --1
	-- Add the parameters for the stored procedure here
	@num_empleado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @id_socio int 
	set @id_socio = ( SELECT [id_socio] FROM TblSocio WHERE num_socio = @num_empleado  ) 

    -- Insert statements for procedure here
	SELECT TOP 1 id_entrada_salida,id_Socio,entrada, salida,activo
		 FROM TblChecadorSocio ch
			 WHERE id_Socio = @id_socio AND (entrada >=  CONVERT (date, GETDATE()) OR entrada <=  CONVERT (date, GETDATE()))
			 ORDER BY id_entrada_salida DESC
END



GO
/****** Object:  StoredProcedure [dbo].[sel_checador]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_checador]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblChecador 
END







GO
/****** Object:  StoredProcedure [dbo].[sel_empleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_empleado]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_empleado],
			e.num_empleado,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.direccion,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			e.id_perfil,
			P.Perfil,
			e.telefono
				FROM TblEmpleado As E
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = E.id_perfil
				Order by e.num_empleado
END







GO
/****** Object:  StoredProcedure [dbo].[sel_historial_fisico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_historial_fisico]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialFisico 
END







GO
/****** Object:  StoredProcedure [dbo].[sel_historial_medico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_historial_medico]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblHistorialMedico 
END






GO
/****** Object:  StoredProcedure [dbo].[sel_HistorialPeso]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_HistorialPeso]
	-- Add the parameters for the stored procedure here
	@id_socio int
AS
BEGIN
	SELECT top 5 [id_historial]
      ,[id_socio]
      ,[prev_peso]
      ,[prev_alto]
      ,[prev_bajo]
      ,[prev_cadera]
  FROM [dbo].[TblHistorialPeso]
	where id_socio=@id_socio
	order by id_historial desc;
END
GO
/****** Object:  StoredProcedure [dbo].[sel_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_membresia]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblMembresia
END







GO
/****** Object:  StoredProcedure [dbo].[sel_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblModulo 
END







GO
/****** Object:  StoredProcedure [dbo].[sel_pago]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_pago]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.id_pago as id_pago,
		p.id_socio as id_socio,
		s.nombre + ' ' +s.ap_paterno AS Socio,
		p.ID_USUARIO as ID_USUARIO,
		u.NOMBRE + ' ' + u.APELLIDO_PAT Registro_Pago,
		p.id_paquete as id_paquete,
		pa.descripcion paquete,
		p.importe as importe,
		p.activo as activo
	FROM TblPago p
	join TblSocio s on p.id_socio = s.id_socio
	join TblPaquete pa on pa.id_paquete = p.id_paquete
	join TBL_USUARIOS U on U.ID_USUARIO = p.ID_USUARIO
END







GO
/****** Object:  StoredProcedure [dbo].[sel_pago_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_pago_recargo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPagoRecargo
END







GO
/****** Object:  StoredProcedure [dbo].[sel_paquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_paquete]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaquete
END







GO
/****** Object:  StoredProcedure [dbo].[sel_paquete_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_paquete_servicio]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblPaqueteServicio
END







GO
/****** Object:  StoredProcedure [dbo].[sel_perfil]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID_PERFIL,PERFIL FROM TBL_PERFILES 
END







GO
/****** Object:  StoredProcedure [dbo].[sel_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_producto]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblProducto
END







GO
/****** Object:  StoredProcedure [dbo].[sel_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_recargo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRecargo
END







GO
/****** Object:  StoredProcedure [dbo].[sel_registro_visita]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_registro_visita]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRegistroVisita
END







GO
/****** Object:  StoredProcedure [dbo].[sel_rel_perfil_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblRelPerfilModulo
END







GO
/****** Object:  StoredProcedure [dbo].[sel_ReportePagoDia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_ReportePagoDia]
@opcion int,
@fecha1 datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	SELECT  id_pago,num_socio,importe,fecha_pago ,GETDATE() AS FECHAHOY 
		FROM TblPago as p
			JOIN TblSocio as S on s.id_socio = p.id_socio
			WHERE YEAR (fecha_pago) = YEAR (@fecha1)
			AND MONTH (fecha_pago) = MONTH (@fecha1)  
			AND DAY(fecha_pago) = DAY(@fecha1)
	--CASE @opcion
	--	WHEN 1 --dia
	--		THEN 
	--		 DAY(fecha_pago) = DAY(@fecha1)
	--	WHEN 2 --Semana
	--		THEN 
	--			DATEPART(WEEK,(@fecha1))
	--	WHEN 3 --Mes Actual
	--		THEN 
	--			MONTH(@fecha1) 
	--	WHEN 4 --Bimestre
	--		THEN 
	--			YEAR(@fecha1) 
	--	WHEN 5 --Trimestre
	--		THEN 
	--			YEAR(@fecha1) 
	--	WHEN 6 --Semestre
	--		THEN 
	--			YEAR(@fecha1)  
	--	WHEN 7 --Año Actual
	--		THEN 
	--			YEAR(@fecha1) 
	--  ELSE 
	--	YEAR(@fecha1)
	--END 
	--)
	ORDER BY fecha_pago ASC;


END

GO
/****** Object:  StoredProcedure [dbo].[sel_ReportePagoMes]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_ReportePagoMes]
@opcion int,
@fecha1 datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	SELECT  id_pago,num_socio,importe,fecha_pago ,GETDATE() AS FECHAHOY 
		FROM TblPago as p
			JOIN TblSocio as S on s.id_socio = p.id_socio
			WHERE YEAR (fecha_pago) = YEAR (@fecha1)
			AND MONTH (fecha_pago) = MONTH (@fecha1)  
			--AND DAY(fecha_pago) = DAY(@fecha1)
	--CASE @opcion
	--	WHEN 1 --dia
	--		THEN 
	--		 DAY(fecha_pago) = DAY(@fecha1)
	--	WHEN 2 --Semana
	--		THEN 
	--			DATEPART(WEEK,(@fecha1))
	--	WHEN 3 --Mes Actual
	--		THEN 
	--			MONTH(@fecha1) 
	--	WHEN 4 --Bimestre
	--		THEN 
	--			YEAR(@fecha1) 
	--	WHEN 5 --Trimestre
	--		THEN 
	--			YEAR(@fecha1) 
	--	WHEN 6 --Semestre
	--		THEN 
	--			YEAR(@fecha1)  
	--	WHEN 7 --Año Actual
	--		THEN 
	--			YEAR(@fecha1) 
	--  ELSE 
	--	YEAR(@fecha1)
	--END 
	--)
	ORDER BY fecha_pago ASC;


END

GO
/****** Object:  StoredProcedure [dbo].[sel_ReportePagoSemana]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_ReportePagoSemana]
@opcion int,
@fecha1 datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	SELECT  id_pago,num_socio,importe,fecha_pago ,GETDATE() AS FECHAHOY 
		FROM TblPago as p
			JOIN TblSocio as S on s.id_socio = p.id_socio
			WHERE YEAR (fecha_pago) = YEAR (@fecha1)
			AND MONTH (fecha_pago) = MONTH (@fecha1)  
			AND DATEPART(WEEK,(fecha_pago)) = DATEPART(WEEK,(@fecha1))
	--CASE @opcion
	--	WHEN 1 --dia
	--		THEN 
	--		 DAY(fecha_pago) = DAY(@fecha1)
	--	WHEN 2 --Semana
	--		THEN 
	--			DATEPART(WEEK,(@fecha1))
	--	WHEN 3 --Mes Actual
	--		THEN 
	--			MONTH(@fecha1) 
	--	WHEN 4 --Bimestre
	--		THEN 
	--			YEAR(@fecha1) 
	--	WHEN 5 --Trimestre
	--		THEN 
	--			YEAR(@fecha1) 
	--	WHEN 6 --Semestre
	--		THEN 
	--			YEAR(@fecha1)  
	--	WHEN 7 --Año Actual
	--		THEN 
	--			YEAR(@fecha1) 
	--  ELSE 
	--	YEAR(@fecha1)
	--END 
	--)
	ORDER BY fecha_pago ASC;


END

GO
/****** Object:  StoredProcedure [dbo].[sel_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_servicio]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblServicio
END







GO
/****** Object:  StoredProcedure [dbo].[sel_socio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_socio]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_socio],
			e.num_socio,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.direccion,
			e.fecha_registro,
			e.fecha_baja,
			e.activo,
			e.fecha_modificacion,
			e.mail
				FROM TblSocio As E
END





GO
/****** Object:  StoredProcedure [dbo].[sel_socio_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_socio_membresia]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_socio_membresia,
			id_socio,
			id_paquete,
			fecha_vinculacion,
			fecha_renovacion,
			fecha_expiracion,
			activo,
			fecha_modificacion
		 FROM TblSocioMembresia 
END







GO
/****** Object:  StoredProcedure [dbo].[sel_socio_new]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_socio_new]
	AS
BEGIN
	select id_socio, num_socio, nombre, ap_paterno, ap_materno from [dbo].[TblSocio] 
	--order by nombre
	;
END
GO
/****** Object:  StoredProcedure [dbo].[sel_SocioCumpleaños]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_SocioCumpleaños]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.[id_socio],
			e.num_socio,
			e.nombre,
			e.ap_paterno,
			e.ap_materno,
			e.direccion,
			e.mail
				FROM TblSocio As E
				 WHERE DAY(E.fecha_nacimiento)=DAY(GETDATE()) and MONTH(E.fecha_nacimiento)=MONTH(GETDATE())
END

--UPDATE  TblSocio SET MAIL = 'iscfperalta@gmail.com' where id_socio= 10749 


GO
/****** Object:  StoredProcedure [dbo].[sel_usuario]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_usuario] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.[ID_USUARIO]
      ,U.[NOMBRE]
      ,U.[APELLIDO_PAT]
      ,U.[APELLIDO_MAT]
      ,U.[ID_AREA]
      ,U.[USUARIO]
      ,U.[PASSWORD]
      ,U.[ID_PERFIL]
      ,U.[ACTIVO]
      ,U.[CREADO]
      ,U.[CREADOPOR]
      ,U.[ACTUALIZADO]
      ,U.[ACTUALIZADOPOR] 
	  ,P.PERFIL 
		FROM TBL_USUARIOS U
				JOIN TBL_PERFILES AS P ON P.ID_PERFIL = U.id_perfil
END







GO
/****** Object:  StoredProcedure [dbo].[sel_venta]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_venta]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVenta
END







GO
/****** Object:  StoredProcedure [dbo].[sel_venta_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sel_venta_producto]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* FROM TblVentaProducto
END







GO
/****** Object:  StoredProcedure [dbo].[upd_asignacion]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_asignacion]
	-- Add the parameters for the stored procedure here
	@id_asignacion int,
	@id_socio int,
	@id_paquete int,
	@fecha_vigencia datetime,
	@fecha_cancelacion datetime,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblAsignacion SET id_socio = @id_socio,
							 id_paquete =@id_paquete,
							 fecha_vigencia=@fecha_vigencia,
							 activo=@activo,
							 fecha_modificacion=getdate(),
							 fecha_cancelacion=@fecha_cancelacion
	WHERE id_asignacion=@id_asignacion

END







GO
/****** Object:  StoredProcedure [dbo].[upd_checador]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_checador]
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int,
	@id_empleado int,
	@entrada datetime, 
	@salida datetime, 
	@activo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblChecador SET id_empleado=@id_empleado,
							 entrada=@entrada,
							 salida=@salida,
							 activo=@activo,
							 fecha_modificacion=getdate()
	WHERE id_entrada_salida=@id_entrada_salida
END







GO
/****** Object:  StoredProcedure [dbo].[upd_ChecadorSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_ChecadorSocio] --1,1,'2016-04-19','2016-04-19',	1
	-- Add the parameters for the stored procedure here
	@id_entrada_salida int,
	@id_socio int,
	@entrada datetime, 
	@salida datetime, 
	@activo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblChecadorSocio SET id_socio=@id_socio,
							 entrada=@entrada,
							 salida=@salida,
							 activo=@activo,
							 fecha_modificacion=getdate()
	WHERE id_entrada_salida=@id_entrada_salida
END



GO
/****** Object:  StoredProcedure [dbo].[upd_empleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_empleado]
	-- Add the parameters for the stored procedure here
	@id_empleado int,
	@num_empleado int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50), 
	@telefono varchar(20), 
	@direccion text,
	@id_perfil int,
	@fecha_baja datetime, 
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblEmpleado SET num_empleado=@num_empleado,
							 nombre=@nombre,
							 ap_paterno=@ap_paterno,
							 ap_materno=@ap_materno,
							 telefono=@telefono , 
							 direccion=@direccion,
							 id_perfil=@id_perfil,
							 fecha_baja =@fecha_baja,
							 activo= @activo,
							 fecha_modificacion= getdate()
	WHERE id_empleado=@id_empleado

END







GO
/****** Object:  StoredProcedure [dbo].[upd_historial_fisico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_historial_fisico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion text,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblHistorialFisico SET  descripcion=@descripcion, 
								  activo=@activo, 
								  fecha_modificacion=getdate()
	WHERE id_socio=@id_socio
END







GO
/****** Object:  StoredProcedure [dbo].[upd_historial_medico]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_historial_medico]
	-- Add the parameters for the stored procedure here
	@id_socio int, 
	@descripcion varchar(50),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblHistorialMedico set descripcion=@descripcion, 
								  activo=@activo, 
								  fecha_modificacion=getdate()
	WHERE id_socio=@id_socio
END






GO
/****** Object:  StoredProcedure [dbo].[upd_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_membresia]
	-- Add the parameters for the stored procedure here
	@id_membresia int,
	@nombre varchar (25),
	@descripcion text,
	@costo decimal(5,2),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblMembresia SET nombre=@nombre, descripcion=@descripcion, costo=@costo, activo=@activo, fecha_modificacion=getdate()
	WHERE id_membresia=@id_membresia
END







GO
/****** Object:  StoredProcedure [dbo].[upd_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_modulo] --'Descripción Modulo'
	-- Add the parameters for the stored procedure here
	@id_modulo int,
	@descripcion varchar(50),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblModulo SET DESCRIPCION=@descripcion, 
						 activo=@activo, 
						 fecha_modificacion=getdate()
	WHERE id_modulo=@id_modulo
END







GO
/****** Object:  StoredProcedure [dbo].[upd_pago]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_pago]
	-- Add the parameters for the stored procedure here
	@id_pago int,
	@id_paquete int,
	@id_socio int,
	@ID_USUARIO int,
	@importe decimal(18,2),
	@activo bit,
	@fecha_pago datetime,
	@fecha_pago_vence datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPago SET id_paquete=@id_paquete, 
					   id_socio=@id_socio, 
					   ID_USUARIO=@ID_USUARIO, 
					   importe=@importe, 
					   fecha_pago=@fecha_pago, 
					   fecha_pago_vence=@fecha_pago_vence, 
					   activo= @activo, 
					   fecha_modificacion=getdate()
	WHERE id_pago=@id_pago
END







GO
/****** Object:  StoredProcedure [dbo].[upd_pago_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_pago_recargo]
	-- Add the parameters for the stored procedure here
	@id_pago_recargo int,
	@id_pago int,
	@id_recargo int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPagoRecargo SET id_pago=@id_pago, 
							  id_recargo = @id_recargo, 
							  activo=@activo, 
							  fecha_modificacion=getdate()
	WHERE id_pago_recargo=@id_pago_recargo
END







GO
/****** Object:  StoredProcedure [dbo].[upd_paquete]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_paquete]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@nombre varchar(50),
	@descripcion text,
	@costo decimal(18,2),
	@diasPaquete int,
	@ID_USUARIO int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPaquete SET nombre=@nombre, 
						  descripcion=@descripcion, 
						  costo=@costo, 
						  diaspaquetes=@diasPaquete,
						  ID_USUARIO=@ID_USUARIO, 
						  activo=@activo, 
						  fecha_modificacion=getdate()
	where id_paquete=@id_paquete
END







GO
/****** Object:  StoredProcedure [dbo].[upd_paquete_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_paquete_servicio]
	-- Add the parameters for the stored procedure here
	@id_paquete int,
	@id_servicio int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPaqueteServicio SET id_paquete=@id_paquete, 
								  id_servicio=@id_servicio, 
								  activo=@activo, 
								  fecha_modificacion=getdate()
	where ((id_paquete=@id_paquete)and (id_servicio=@id_servicio))
END







GO
/****** Object:  StoredProcedure [dbo].[upd_perfil]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_perfil] --'Administrador', 1,'Luis', 'Angel'
	-- Add the parameters for the stored procedure here
	@id_perfil int,
	@perfil varchar(50),
	@activo bit,
	@actualizado_por varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblPerfil SET PERFIL=@perfil, 
						 ACTIVO=@activo, 
						 actualizado_por=@actualizado_por,
						 actualizado=getdate()
	WHERE id_perfil=@id_perfil
END







GO
/****** Object:  StoredProcedure [dbo].[upd_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_producto]
	-- Add the parameters for the stored procedure here
	@id_producto int,
	@nombre varchar(50), 
	@descripcion text,
	@costo decimal(18,2),
	@existencia int,
	@clave varchar(10),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblProducto SET nombre=@nombre, 
						   descripcion=@descripcion, 
						   costo=@costo, 
						   existencia=@existencia,
						   clave=@clave,
						   activo=@activo, 
						   fecha_modificacion=getdate()
	WHERE id_producto=@id_producto
END







GO
/****** Object:  StoredProcedure [dbo].[upd_recargo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_recargo]
	-- Add the parameters for the stored procedure here
	@id_recargo int,	
	@id_paquete int,
	@id_socio int,
	@fecha_recargo datetime,
	@importe decimal (18,2),
	@liberacion bit,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblRecargo SET id_socio=@id_socio, 
						  id_paquete=@id_paquete, 
						  fecha_recargo=@fecha_recargo, 
						  importe=@importe, 
						  liberacion=@liberacion, 
						  activo=@activo, 
						  fecha_modificacion=getdate()
	WHERE id_recargo=@id_recargo
END







GO
/****** Object:  StoredProcedure [dbo].[upd_registro_visita]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_registro_visita]
	-- Add the parameters for the stored procedure here
	@id_vigencia int,
	@id_socio int,
	@dias_vigentes int,
	@fecha_entrada datetime,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblRegistroVisita SET id_socio=@id_socio, 
								 dias_vigentes=@dias_vigentes, 
								 fecha_entrada=@fecha_entrada, 
								 activo=@activo, 
								 fecha_modificacion=getdate()
	where id_vigencia=@id_vigencia
END







GO
/****** Object:  StoredProcedure [dbo].[upd_rel_perfil_modulo]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_rel_perfil_modulo]
	-- Add the parameters for the stored procedure here
	@id_rel int,
	@id_perfil int, 
	@id_modulo int,
	@control_total bit,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblRelPerfilModulo SET id_perfil=@id_perfil, 
								  id_modulo=@id_modulo, 
								  control_total=@control_total, 
								  activo=@activo, 
								  actualizado=GETDATE()
	WHERE id_rel=@id_rel
END







GO
/****** Object:  StoredProcedure [dbo].[upd_servicio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_servicio]
	-- Add the parameters for the stored procedure here
	@id_servicio int,
	@nombre varchar(50),
	@descripcion text,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblServicio SET nombre=@nombre, 
						   descripcion=@descripcion, 
						   activo=@activo, 
						   fecha_modificacion=getdate()
	where id_servicio=@id_servicio
END







GO
/****** Object:  StoredProcedure [dbo].[upd_socio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_socio] 
	-- Add the parameters for the stored procedure here
	@id_socio  int,
	@num_socio int,
	@nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50),
	@telefono varchar(20),
	@fecha_nacimiento datetime,
	@direccion text,
	@activo int,
	@compEstudio int,
	@mail varchar(50) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Tblsocio SET num_socio=@num_socio, 
						  nombre=@nombre, 
						  ap_paterno=@ap_paterno, 
						  ap_materno=@ap_materno, 
						  telefono=@telefono, 
						  direccion=@direccion, 
						  fecha_nacimiento=@fecha_nacimiento, 
						  fecha_baja=getdate(),
						  activo=@activo, 
						  compEstudios = @compEstudio,
						  mail = @mail , 
						  fecha_modificacion= getdate()
	WHERE id_socio=@id_socio

END







GO
/****** Object:  StoredProcedure [dbo].[upd_socio_membresia]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_socio_membresia] --3,31,1
	-- Add the parameters for the stored procedure here
	@id_socio int,
	@id_paquete int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @dias int, @fechaRenovacion datetime
	set @dias = (SELECT diaspaquetes FROM [dbo].[TblPaquete] WHERE id_paquete =@id_paquete)
	set @fechaRenovacion = (SELECT fecha_vinculacion FROM [dbo].[TblSocioMembresia] WHERE id_socio=@id_socio /*AND id_paquete =31*/)
    -- Insert statements for procedure here
UPDATE TblSocioMembresia SET id_socio=@id_socio, 
							 id_paquete=@id_paquete,
								fecha_renovacion=@fechaRenovacion + @dias + 1, 
								fecha_expiracion=@fechaRenovacion + @dias , 
								 activo=@activo, 
								 fecha_modificacion=getdate()
	WHERE id_socio=@id_socio --AND id_paquete =@id_paquete
END







GO
/****** Object:  StoredProcedure [dbo].[upd_usuario]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_usuario] 
	-- Add the parameters for the stored procedure here
	@id_usuario int,
	@nombre varchar(100),
	@apellido_pat varchar(100),
	@apellido_mat varchar(100),
	@id_area int,
	@usuario varchar(50),
	@password varchar(50),
	@id_perfil int,
	@activo bit,
	@actualizado_por varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TBL_USUARIOS SET NOMBRE=@nombre, 
						  APELLIDO_PAT=@apellido_pat, 
						  APELLIDO_MAT=@apellido_mat, 
						  ID_AREA=@id_area, 
						  USUARIO=@usuario, 
						  PASSWORD=@password, 
						  ID_PERFIL=@id_perfil, 
						  ACTIVO=@activo, 
						  actualizado=getdate(),
						  actualizadopor=@actualizado_por
	WHERE id_usuario=@id_usuario

END







GO
/****** Object:  StoredProcedure [dbo].[upd_venta]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_venta]
	-- Add the parameters for the stored procedure here
	@id_venta int,
	@folio_diario int,
	@fecha datetime,
	@total decimal(18,2),
	@ID_USUARIO int,
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblVenta SET folio_diario=@folio_diario,
						fecha=@fecha, 
						total=@total, 
						ID_USUARIO=@ID_USUARIO, 
						activo=@activo,
						fecha_modificacion=getdate()
	WHERE id_venta=@id_venta
END







GO
/****** Object:  StoredProcedure [dbo].[upd_venta_producto]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_venta_producto]
	-- Add the parameters for the stored procedure here
	@id_venta int, 
	@id_producto int,
	@costo decimal(18,2),
	@activo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TblVentaProducto SET id_venta=@id_venta, 
								id_producto=@id_producto, 
								costo=@costo, 
								activo=@activo, 
								fecha_modificacion=GETDATE()
	where ((id_venta=@id_venta)and (id_producto=@id_producto))
END







GO
/****** Object:  StoredProcedure [dbo].[Usu_Login]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Faleg A. Peralta
-- Create date: 25.09.2015
-- Description:	Valida el Inicio de Session
-- =============================================
CREATE PROCEDURE [dbo].[Usu_Login] --'admin' ,  'admin'
	-- Add the parameters for the stored procedure here
	@usuario varchar(50), 
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM TBL_USUARIOS
		WHERE USUARIO = @usuario AND PASSWORD = @password
END






GO
/****** Object:  StoredProcedure [dbo].[ValidaEmpleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Checa que el nombre, ap paterno, ap materno no se repitan en la TblEmpleado>
-- =============================================
CREATE PROCEDURE [dbo].[ValidaEmpleado]
    @nombre varchar(50), 
	@ap_paterno varchar(50), 
	@ap_materno varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	if (select Count (*) From TblEmpleado WHERE nombre = @nombre and ap_paterno = @ap_paterno and ap_materno = @ap_materno)>0
	BEGIN
	
RAISERROR('Este Emplado ya existe', 16, 1)
	END
END







GO
/****** Object:  StoredProcedure [dbo].[ValidaNumEmpleado]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Valida que no exista un numero de empleado igual
-- =============================================
CREATE PROCEDURE [dbo].[ValidaNumEmpleado]
	@num_empleado int
AS
BEGIN
	SET NOCOUNT ON;

	IF( Select COUNT(*) FROM TblEmpleado  where num_empleado = @num_empleado)>0

	BEGIN
	RAISERROR('Este Número de Empleado no esta  disponible  ', 16, 1)
	End
	
END







GO
/****** Object:  StoredProcedure [dbo].[ValidaNumSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Valida que no exista un numero de socio igual
-- =============================================
CREATE PROCEDURE [dbo].[ValidaNumSocio] 
@num_socio int

AS
BEGIN
	SET NOCOUNT ON;

	IF( Select COUNT(*) FROM TblSocio  where num_socio = @num_socio)>0

	BEGIN
	RAISERROR('Este Número de Socio no esta disponible  ', 16, 1)
	END
END







GO
/****** Object:  StoredProcedure [dbo].[ValidaSocio]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidaSocio]
@nombre varchar(50),
@ap_paterno varchar(50),
@ap_materno varchar(50),
@fechaNacimiento varchar(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	
	if (Select Count(*) From TblSocio 
			where nombre COLLATE Latin1_General_CI_AI like '%' + @nombre+ '%' 
				and ap_paterno COLLATE Latin1_General_CI_AI like '%' + @ap_paterno + '%'   
				and ap_materno COLLATE Latin1_General_CI_AI like '%' + @ap_materno + '%' 
				/*and cast(fecha_nacimiento as date)  like '%' + @fechaNacimiento + '%'*/  ) > 0

	-- Remplazada por que omitia los acentos
	--if (Select Count(*) From TblSocio where nombre =@nombre and ap_paterno = @ap_paterno  and ap_materno = @ap_materno )>0
		
BEGIN

RAISERROR('Este Socio ya existe ', 16, 1)
	END
	
END







GO
/****** Object:  StoredProcedure [dbo].[ValidaUsuario]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Valida que el Nombre de usuario no exista
-- =============================================
CREATE PROCEDURE [dbo].[ValidaUsuario]
@nombre varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	if (Select Count(*) From TBL_USUARIOS where nombre =@nombre )>0
	BEGIN
	RAISERROR('Este Nombre de Usuario ya existe ', 16, 1)
	END
END







GO
/****** Object:  StoredProcedure [dbo].[VerificaVisitas]    Script Date: 13/04/2018 06:48:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VerificaVisitas] --1
@num_empleado INT

AS
BEGIN
	
	SET NOCOUNT ON;
	Declare @id_socio int 
	set @id_socio = ( SELECT [id_socio] FROM TblSocio WHERE num_socio = @num_empleado  ) 
	Declare @id_paquete int 
	set @id_paquete = (Select id_paquete FROM TblSocioMembresia where id_socio = @id_socio ) 

    -- Insert statements for procedure here
	SELECT CONVERT(int,(Select diaspaquetes FROM TblPaquete where id_paquete= @id_paquete )) -  CONVERT(int,(Select COUNT(*) FROM TblChecadorSocio  WHERE id_socio = @id_socio )) AS DiasRestantes
		
END

--Select  * FROM TblPaquete
--Select * FROM TblSocioMembresia
--Select * FROM TblSocio



GO
USE [master]
GO
ALTER DATABASE [EnForma] SET  READ_WRITE 
GO
