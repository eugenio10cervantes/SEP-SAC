USE [master]
GO
/****** Object:  Database [SAC]    Script Date: 04/03/2017 12:58:28 p. m. ******/
CREATE DATABASE [SAC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SAC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SAC.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SAC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SAC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SAC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SAC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SAC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SAC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SAC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SAC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SAC] SET ARITHABORT OFF 
GO
ALTER DATABASE [SAC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SAC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SAC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SAC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SAC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SAC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SAC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SAC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SAC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SAC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SAC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SAC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SAC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SAC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SAC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SAC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SAC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SAC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SAC] SET  MULTI_USER 
GO
ALTER DATABASE [SAC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SAC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SAC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SAC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SAC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SAC]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 04/03/2017 12:58:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Adjuntos]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adjuntos](
	[archivo_id] [int] NOT NULL,
	[solicitud_id] [int] NOT NULL,
	[requerimiento_id] [int] NOT NULL,
 CONSTRAINT [PK_Adjuntos_1] PRIMARY KEY CLUSTERED 
(
	[archivo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Archivos]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archivos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_archivo] [nvarchar](255) NOT NULL,
	[mime] [nvarchar](255) NOT NULL,
	[path] [nvarchar](255) NOT NULL,
	[created] [datetime] NOT NULL,
	[modified] [datetime] NOT NULL,
 CONSTRAINT [PK_adjuntos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colegios]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colegios](
	[id] [nvarchar](128) NOT NULL,
	[nombre] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Colegios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ColegiosAsignados]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColegiosAsignados](
	[id] [int] NOT NULL,
	[colegio_id] [nvarchar](128) NOT NULL,
	[jefe_departamento] [nvarchar](255) NOT NULL,
	[cargo] [nvarchar](255) NOT NULL,
	[antecedente] [nvarchar](255) NOT NULL,
	[periodo] [nvarchar](255) NOT NULL,
	[destinatario] [nvarchar](255) NOT NULL,
	[puesto] [nvarchar](255) NOT NULL,
	[universidad] [nvarchar](255) NOT NULL,
	[created]  AS (getdate()),
	[modified]  AS (getdate()),
 CONSTRAINT [PK_ColegiosAsignados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Datos]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos](
	[usuario_id] [nvarchar](128) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[primer_apellido] [nvarchar](100) NOT NULL,
	[segundo_apellido] [nvarchar](100) NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[genero] [nvarchar](50) NOT NULL,
	[nacionalidad] [nvarchar](150) NOT NULL,
	[curp] [nvarchar](50) NOT NULL,
	[domicilio] [nvarchar](150) NOT NULL,
	[colonia] [nvarchar](100) NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[delegacion] [nvarchar](100) NOT NULL,
	[localidad] [nvarchar](100) NOT NULL,
	[codigo_postal] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[telefono_movil] [nvarchar](50) NOT NULL,
	[medio] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Datos] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Evaluadores]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluadores](
	[id] [nvarchar](128) NOT NULL,
	[nombre] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Evaluadores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EvaluadoresAsignados]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluadoresAsignados](
	[id] [int] NOT NULL,
	[evaluador_id] [nvarchar](128) NOT NULL,
	[created]  AS (getdate()),
	[modified]  AS (getdate()),
 CONSTRAINT [PK_EvaluadoresAsignados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Niveles]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Niveles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[procedimiento_id] [int] NOT NULL,
	[creacion] [datetime] NOT NULL,
	[modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Niveles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[nivel_id] [int] NOT NULL,
	[creacion] [datetime] NOT NULL,
	[modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrimerasEvaluaciones]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimerasEvaluaciones](
	[solicitud_id] [int] NOT NULL,
	[archivo_id] [int] NOT NULL,
	[resultado] [nvarchar](50) NOT NULL,
	[created]  AS (getdate()),
	[modified]  AS (getdate()),
 CONSTRAINT [PK_PrimerasEvaluaciones] PRIMARY KEY CLUSTERED 
(
	[solicitud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Procedimientos]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedimientos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[creacion] [datetime] NULL,
	[modificacion] [datetime] NULL,
 CONSTRAINT [PK_Procedimientos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requerimientos]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requerimientos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[perfil_id] [int] NOT NULL,
	[tipo_requerimiento] [nvarchar](50) NOT NULL,
	[creacion] [datetime] NULL,
	[modificacion] [datetime] NULL,
 CONSTRAINT [PK_Requerimientos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SegundasEvaluaciones]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SegundasEvaluaciones](
	[solicitud_id] [int] NOT NULL,
	[archivo_id] [int] NOT NULL,
	[resultado] [nvarchar](50) NOT NULL,
	[created]  AS (getdate()),
	[modified]  AS (getdate()),
 CONSTRAINT [PK_SegundasEvaluaciones] PRIMARY KEY CLUSTERED 
(
	[solicitud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[solicitante_id] [nvarchar](128) NOT NULL,
	[numero_solicitud] [nvarchar](50) NULL,
	[perfil_id] [int] NOT NULL,
	[resolucion_final] [nvarchar](50) NULL,
	[entidad_federativa] [nvarchar](50) NOT NULL,
	[estatus] [varchar](50) NOT NULL,
	[created] [datetime] NOT NULL,
	[modified] [datetime] NOT NULL,
	[evaluador_id] [nvarchar](128) NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SolicitudesDeshechadas]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudesDeshechadas](
	[solicitud_id] [int] NOT NULL,
	[jefe_departamento] [nvarchar](255) NOT NULL,
	[cargo] [nvarchar](255) NOT NULL,
	[documentos] [text] NULL,
	[created]  AS (getdate()),
	[modified]  AS (getdate()),
 CONSTRAINT [PK_SolicitudesDeshechadas] PRIMARY KEY CLUSTERED 
(
	[solicitud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TercerasEvaluaciones]    Script Date: 04/03/2017 12:58:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TercerasEvaluaciones](
	[solicitud_id] [int] NOT NULL,
	[archivo_id] [int] NOT NULL,
	[resultado] [nvarchar](50) NOT NULL,
	[created]  AS (getdate()),
	[modified]  AS (getdate()),
 CONSTRAINT [PK_TercerasEvaluaciones] PRIMARY KEY CLUSTERED 
(
	[solicitud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 04/03/2017 12:58:30 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 04/03/2017 12:58:30 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 04/03/2017 12:58:30 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 04/03/2017 12:58:30 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 04/03/2017 12:58:30 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 04/03/2017 12:58:30 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adjuntos]  WITH CHECK ADD  CONSTRAINT [FK_Adjunto_Requerimiento] FOREIGN KEY([requerimiento_id])
REFERENCES [dbo].[Requerimientos] ([id])
GO
ALTER TABLE [dbo].[Adjuntos] CHECK CONSTRAINT [FK_Adjunto_Requerimiento]
GO
ALTER TABLE [dbo].[Adjuntos]  WITH CHECK ADD  CONSTRAINT [FK_Adjunto_Solicitud] FOREIGN KEY([solicitud_id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[Adjuntos] CHECK CONSTRAINT [FK_Adjunto_Solicitud]
GO
ALTER TABLE [dbo].[Adjuntos]  WITH CHECK ADD  CONSTRAINT [FK_Archivo_Adjunto] FOREIGN KEY([archivo_id])
REFERENCES [dbo].[Archivos] ([id])
GO
ALTER TABLE [dbo].[Adjuntos] CHECK CONSTRAINT [FK_Archivo_Adjunto]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Colegios]  WITH CHECK ADD  CONSTRAINT [FK_Colegios] FOREIGN KEY([id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Colegios] CHECK CONSTRAINT [FK_Colegios]
GO
ALTER TABLE [dbo].[ColegiosAsignados]  WITH CHECK ADD  CONSTRAINT [FK_Colegio] FOREIGN KEY([colegio_id])
REFERENCES [dbo].[Colegios] ([id])
GO
ALTER TABLE [dbo].[ColegiosAsignados] CHECK CONSTRAINT [FK_Colegio]
GO
ALTER TABLE [dbo].[ColegiosAsignados]  WITH CHECK ADD  CONSTRAINT [FK_ColegiosAsignados] FOREIGN KEY([id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[ColegiosAsignados] CHECK CONSTRAINT [FK_ColegiosAsignados]
GO
ALTER TABLE [dbo].[Datos]  WITH CHECK ADD  CONSTRAINT [FK_Datos_Users] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Datos] CHECK CONSTRAINT [FK_Datos_Users]
GO
ALTER TABLE [dbo].[Evaluadores]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Evaluadores] FOREIGN KEY([id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Evaluadores] CHECK CONSTRAINT [FK_Usuarios_Evaluadores]
GO
ALTER TABLE [dbo].[EvaluadoresAsignados]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionSolicitud] FOREIGN KEY([id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[EvaluadoresAsignados] CHECK CONSTRAINT [FK_AsignacionSolicitud]
GO
ALTER TABLE [dbo].[Niveles]  WITH CHECK ADD  CONSTRAINT [FK_Procedimiento_Niveles] FOREIGN KEY([procedimiento_id])
REFERENCES [dbo].[Procedimientos] ([id])
GO
ALTER TABLE [dbo].[Niveles] CHECK CONSTRAINT [FK_Procedimiento_Niveles]
GO
ALTER TABLE [dbo].[Perfiles]  WITH CHECK ADD  CONSTRAINT [FK_Niveles_Perfiles] FOREIGN KEY([nivel_id])
REFERENCES [dbo].[Niveles] ([id])
GO
ALTER TABLE [dbo].[Perfiles] CHECK CONSTRAINT [FK_Niveles_Perfiles]
GO
ALTER TABLE [dbo].[PrimerasEvaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Archivo_PE] FOREIGN KEY([archivo_id])
REFERENCES [dbo].[Archivos] ([id])
GO
ALTER TABLE [dbo].[PrimerasEvaluaciones] CHECK CONSTRAINT [FK_Archivo_PE]
GO
ALTER TABLE [dbo].[PrimerasEvaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_PE] FOREIGN KEY([solicitud_id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[PrimerasEvaluaciones] CHECK CONSTRAINT [FK_Solicitud_PE]
GO
ALTER TABLE [dbo].[Requerimientos]  WITH CHECK ADD  CONSTRAINT [FK_Perfiles_Requerimientos] FOREIGN KEY([perfil_id])
REFERENCES [dbo].[Perfiles] ([id])
GO
ALTER TABLE [dbo].[Requerimientos] CHECK CONSTRAINT [FK_Perfiles_Requerimientos]
GO
ALTER TABLE [dbo].[SegundasEvaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Archivo_SE] FOREIGN KEY([archivo_id])
REFERENCES [dbo].[Archivos] ([id])
GO
ALTER TABLE [dbo].[SegundasEvaluaciones] CHECK CONSTRAINT [FK_Archivo_SE]
GO
ALTER TABLE [dbo].[SegundasEvaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_SE] FOREIGN KEY([solicitud_id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[SegundasEvaluaciones] CHECK CONSTRAINT [FK_Solicitud_SE]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_EvaluadorAsignado] FOREIGN KEY([evaluador_id])
REFERENCES [dbo].[Evaluadores] ([id])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_EvaluadorAsignado]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Perfil] FOREIGN KEY([perfil_id])
REFERENCES [dbo].[Perfiles] ([id])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Perfil]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitante] FOREIGN KEY([solicitante_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitante]
GO
ALTER TABLE [dbo].[SolicitudesDeshechadas]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudesDeshechadas] FOREIGN KEY([solicitud_id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[SolicitudesDeshechadas] CHECK CONSTRAINT [FK_SolicitudesDeshechadas]
GO
ALTER TABLE [dbo].[TercerasEvaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Archivo_TE] FOREIGN KEY([archivo_id])
REFERENCES [dbo].[Archivos] ([id])
GO
ALTER TABLE [dbo].[TercerasEvaluaciones] CHECK CONSTRAINT [FK_Archivo_TE]
GO
ALTER TABLE [dbo].[TercerasEvaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_TE] FOREIGN KEY([solicitud_id])
REFERENCES [dbo].[Solicitudes] ([id])
GO
ALTER TABLE [dbo].[TercerasEvaluaciones] CHECK CONSTRAINT [FK_Solicitud_TE]
GO
USE [master]
GO
ALTER DATABASE [SAC] SET  READ_WRITE 
GO
