USE [master]
GO
/****** Object:  Database [dbColegio]    Script Date: 12/12/2020 17:41:33 ******/
CREATE DATABASE [dbColegio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbColegio', FILENAME = N'D:\DATA\dbColegio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbColegio_log', FILENAME = N'D:\DATA\dbColegio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbColegio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbColegio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbColegio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbColegio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbColegio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbColegio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbColegio] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbColegio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbColegio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbColegio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbColegio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbColegio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbColegio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbColegio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbColegio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbColegio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbColegio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbColegio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbColegio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbColegio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbColegio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbColegio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbColegio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbColegio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbColegio] SET RECOVERY FULL 
GO
ALTER DATABASE [dbColegio] SET  MULTI_USER 
GO
ALTER DATABASE [dbColegio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbColegio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbColegio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbColegio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbColegio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbColegio', N'ON'
GO
ALTER DATABASE [dbColegio] SET QUERY_STORE = OFF
GO
USE [dbColegio]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwUsuarios]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwUsuarios]
AS
SELECT
	u.Id,
	u.IdPerfil,
	p.Nombre AS PerfilNombre,
	u.Nombre,
	u.Email,
	u.Telefono,
	u.Usuario,
	u.Clave,
	u.Activo
FROM
	Usuario AS u
	INNER JOIN Perfil AS p ON p.Id = u.IdPerfil
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NroDocumento] [varchar](20) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IdCurso] [int] NOT NULL,
	[FechaReg] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Docente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwDocentes]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDocentes]
AS
SELECT
	d.Id,
	d.NroDocumento,
	d.Nombres,
	d.ApPaterno,
	d.ApMaterno,
	d.Telefono,
	d.Sexo,
	d.FechaNac,
	d.Direccion,
	d.Email,
	d.IdCurso,
	c.Nombre AS [Curso],
	d.FechaReg,
	d.Activo
FROM
	Docente AS d
	INNER JOIN Curso AS c ON c.Id = d.IdCurso
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAlumno] [int] NOT NULL,
	[Grado] [int] NOT NULL,
	[Seccion] [char](1) NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Saldo] [decimal](10, 2) NOT NULL,
	[FechaReg] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NroDocumento] [varchar](20) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FechaReg] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwMatriculas]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwMatriculas]
AS
SELECT
	m.Id,
	m.IdAlumno,
	a.Nombres + ' ' + a.ApPaterno + ' ' + a.ApMaterno AS Alumno,
	m.Grado,
	m.Seccion,
	m.Monto,
	m.Saldo,
	m.FechaReg,
	m.Activo
FROM
	Matricula AS m
	INNER JOIN Alumno AS a ON a.Id = m.IdAlumno
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[NombreAspx] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[IdPerfil] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
	[Ver] [bit] NOT NULL,
	[Crear] [bit] NOT NULL,
	[Editar] [bit] NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC,
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPermisos]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPermisos]
AS
SELECT
	p.IdPerfil,
	p2.Nombre AS Perfil,
	p.IdMenu,
	m.Nombre AS Menu,
	p.Ver,
	p.Crear,
	p.Editar
FROM
	Permiso AS p
	INNER JOIN Perfil AS p2 ON p2.Id = p.IdPerfil
	INNER JOIN Menu AS m ON m.Id = p.IdMenu
GO
/****** Object:  Table [dbo].[CursoMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoMatricula](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMatricula] [int] NOT NULL,
	[IdCurso] [int] NOT NULL,
	[Nota] [int] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_DetalleMatricula_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMatricula] [int] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 
GO
INSERT [dbo].[Alumno] ([Id], [NroDocumento], [Nombres], [ApPaterno], [ApMaterno], [Telefono], [Sexo], [FechaNac], [Direccion], [Email], [FechaReg], [Activo]) VALUES (2, N'44491144', N'Barny', N'Cespedez', N'', N'', N'M', CAST(N'1990-01-01' AS Date), N'', N'', CAST(N'2020-12-08T13:32:07.543' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 
GO
INSERT [dbo].[Curso] ([Id], [Nombre], [Activo]) VALUES (1, N'Matematicas', 1)
GO
INSERT [dbo].[Curso] ([Id], [Nombre], [Activo]) VALUES (2, N'Comunicacion', 1)
GO
INSERT [dbo].[Curso] ([Id], [Nombre], [Activo]) VALUES (6, N'Fisica', 1)
GO
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Docente] ON 
GO
INSERT [dbo].[Docente] ([Id], [NroDocumento], [Nombres], [ApPaterno], [ApMaterno], [Telefono], [Sexo], [FechaNac], [Direccion], [Email], [IdCurso], [FechaReg], [Activo]) VALUES (13, N'44491144', N'Juan', N'Perez', N'', N'+51948066659', N' ', CAST(N'1980-01-01' AS Date), N'', N'', 1, CAST(N'2020-12-08T16:26:58.333' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Docente] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (2, N'Usuarios', N'Usuarios.aspx', 1)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (3, N'Permisos', N'Permisos.aspx', 1)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (4, N'Docentes', N'Docentes.aspx', 1)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (5, N'Alumnos', N'Alumnos.aspx', 1)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (6, N'Cursos', N'Cursos.aspx', 1)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (7, N'Matriculas', N'Matriculas.aspx', 1)
GO
INSERT [dbo].[Menu] ([Id], [Nombre], [NombreAspx], [Activo]) VALUES (8, N'Reportes', N'Reportes.aspx', 1)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (1, N'Administrador del sistema', 1)
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (2, N'Director de escuela', 1)
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (3, N'Decano', 1)
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (4, N'Secretario Académico', 1)
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (5, N'Secretaria de escuela ', 1)
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (6, N'Estudiante', 1)
GO
INSERT [dbo].[Perfil] ([Id], [Nombre], [Activo]) VALUES (7, N'Docente', 1)
GO
INSERT [dbo].[Permiso] ([IdPerfil], [IdMenu], [Ver], [Crear], [Editar]) VALUES (1, 2, 1, 1, 1)
GO
INSERT [dbo].[Permiso] ([IdPerfil], [IdMenu], [Ver], [Crear], [Editar]) VALUES (7, 5, 1, 0, 0)
GO
INSERT [dbo].[Permiso] ([IdPerfil], [IdMenu], [Ver], [Crear], [Editar]) VALUES (7, 6, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([Id], [IdPerfil], [Nombre], [Email], [Telefono], [Usuario], [Clave], [Activo]) VALUES (1, 1, N'Administrador', N'', N'', N'admin', N'1234', 1)
GO
INSERT [dbo].[Usuario] ([Id], [IdPerfil], [Nombre], [Email], [Telefono], [Usuario], [Clave], [Activo]) VALUES (2, 7, N'Docente 01', N'', N'', N'docente1', N'1234', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[CursoMatricula]  WITH CHECK ADD  CONSTRAINT [FK_DetalleMatricula_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[CursoMatricula] CHECK CONSTRAINT [FK_DetalleMatricula_Curso]
GO
ALTER TABLE [dbo].[CursoMatricula]  WITH CHECK ADD  CONSTRAINT [FK_DetalleMatricula_Matricula] FOREIGN KEY([IdMatricula])
REFERENCES [dbo].[Matricula] ([Id])
GO
ALTER TABLE [dbo].[CursoMatricula] CHECK CONSTRAINT [FK_DetalleMatricula_Matricula]
GO
ALTER TABLE [dbo].[Docente]  WITH CHECK ADD  CONSTRAINT [FK_Docente_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Docente] CHECK CONSTRAINT [FK_Docente_Curso]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumno] ([Id])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Matricula] FOREIGN KEY([IdMatricula])
REFERENCES [dbo].[Matricula] ([Id])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Matricula]
GO
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Menu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Permiso] CHECK CONSTRAINT [FK_Permiso_Menu]
GO
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK_Permiso_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([Id])
GO
ALTER TABLE [dbo].[Permiso] CHECK CONSTRAINT [FK_Permiso_Perfil]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[spAccesoSistema]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAccesoSistema]
(
	@User VARCHAR(20),
	@Pass VARCHAR(20)
)
AS
SELECT
	u.Id,
	u.IdPerfil,
	u.Nombre,
	u.Email,
	u.Telefono,
	u.Usuario,
	u.Clave,
	u.Activo
FROM
	Usuario AS u
WHERE u.Usuario = @User
  AND u.Clave = @Pass
GO
/****** Object:  StoredProcedure [dbo].[spActualizarAlumno]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarAlumno]
(
	@Id INT,
	@NroDoc VARCHAR(20),
	@Nombres VARCHAR(50),
	@ApPaterno VARCHAR(50),
	@ApMaterno VARCHAR(50),
	@Telefono VARCHAR(20),
	@Sexo CHAR(1),
	@FechaNac DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(50),
	@Activo BIT
)
AS
UPDATE Alumno
SET
	NroDocumento = @NroDoc,
	Nombres = @Nombres,
	ApPaterno = @ApPaterno,
	ApMaterno = @ApMaterno,
	Telefono = @Telefono,
	Sexo = @Sexo,
	FechaNac = @FechaNac,
	Direccion = @Direccion,
	Email = @Email,
	Activo = @Activo
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCurso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarCurso]
(
	@Id INT,
	@Nombre VARCHAR(50),
	@Activo BIT
)
AS
UPDATE Curso
SET
	Nombre = @Nombre,
	Activo = @Activo
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDocente]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDocente]
(
	@Id INT,
	@NroDoc VARCHAR(20),
	@Nombres VARCHAR(50),
	@ApPaterno VARCHAR(50),
	@ApMaterno VARCHAR(50),
	@Telefono VARCHAR(20),
	@Sexo CHAR(1),
	@FechaNac DATE,
	@Direccion VARCHAR(100),
	@IdCurso INT,
	@Email VARCHAR(50),
	@Activo BIT
)
AS
UPDATE Docente
SET
	NroDocumento = @NroDoc,
	Nombres = @Nombres,
	ApPaterno = @ApPaterno,
	ApMaterno = @ApMaterno,
	Telefono = @Telefono,
	Sexo = @Sexo,
	FechaNac = @FechaNac,
	Direccion = @Direccion,
	Email = @Email,
	IdCurso = @IdCurso,
	Activo = @Activo
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarMatricula]
(
	@Id INT,
	@IdAlumno INT,
	@Grado INT,
	@Seccion CHAR(1),
	@Monto DECIMAL(10,2),
	@Saldo DECIMAL(10,2),
	@Activo BIT
)
AS
UPDATE Matricula
SET
	IdAlumno = @IdAlumno,
	Grado = @Grado,
	Seccion = @Seccion,
	Monto = @Monto,
	Saldo = @Saldo,
	Activo = @Activo
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarUsuario]
(
	@Id INT,
	@IdPerfil INT,
	@Nombre VARCHAR(50),
	@Email VARCHAR(50),
	@Telefono VARCHAR(20),
	@Usuario VARCHAR(50),
	@Clave VARCHAR(50),
	@Activo BIT
)
AS
UPDATE Usuario
SET
	IdPerfil = @IdPerfil,
	Nombre = @Nombre,
	Email = @Email,
	Telefono = @Telefono,
	Usuario = @Usuario,
	Clave = @Clave,
	Activo = @Activo
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCursosMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCursosMatricula]
(
	@IdMatricula INT
)
AS
DELETE FROM CursoMatricula
WHERE IdMatricula = @IdMatricula
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPagosMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPagosMatricula]
(
	@IdMatricula INT
)
AS
DELETE FROM Pago
WHERE IdMatricula = @IdMatricula
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPermiso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPermiso]
(
	@IdPerfil INT,
	@IdMenu INT
)
AS
DELETE FROM Permiso
WHERE IdPerfil = @IdPerfil
  AND IdMenu = @IdMenu
GO
/****** Object:  StoredProcedure [dbo].[spGetUsuario]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUsuario]
(
	@Id INT
)
AS
SELECT
	u.Id,
	u.IdPerfil,
	u.Nombre,
	u.Email,
	u.Telefono,
	u.Usuario,
	u.Clave,
	u.Activo
FROM
	Usuario AS u
WHERE u.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spListarAlumno]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarAlumno]
AS
SELECT
	a.Id,
	a.NroDocumento,
	a.Nombres,
	a.ApPaterno,
	a.ApMaterno,
	a.Telefono,
	a.Sexo,
	a.FechaNac,
	a.Direccion,
	a.Email,
	a.FechaReg,
	a.Activo
FROM
	Alumno AS a
GO
/****** Object:  StoredProcedure [dbo].[spListarCurso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCurso]
AS
SELECT
	c.Id,
	c.Nombre,
	c.Activo
FROM
	Curso AS c
GO
/****** Object:  StoredProcedure [dbo].[spListarCursosMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarCursosMatricula]
(
	@IdMatricula INT
)
AS
SELECT
	cm.Id,
	cm.IdMatricula,
	cm.IdCurso,
	ISNULL(cm.Nota,0) AS Nota,
	cm.Activo
FROM
	CursoMatricula AS cm
WHERE
	cm.IdMatricula = @IdMatricula
GO
/****** Object:  StoredProcedure [dbo].[spListarDocente]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarDocente]
AS
SELECT
	d.Id,
	d.NroDocumento,
	d.Nombres,
	d.ApPaterno,
	d.ApMaterno,
	d.Telefono,
	d.Sexo,
	d.FechaNac,
	d.Direccion,
	d.Email,
	d.IdCurso,
	d.FechaReg,
	d.Activo
FROM
	Docente AS d
GO
/****** Object:  StoredProcedure [dbo].[spListarMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMatricula]
AS
SELECT
	m.Id,
	m.IdAlumno,
	m.Grado,
	m.Seccion,
	m.Monto,
	m.Saldo,
	m.FechaReg,
	m.Activo
FROM
	Matricula AS m
ORDER BY 
	m.FechaReg DESC
GO
/****** Object:  StoredProcedure [dbo].[spListarMenu]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMenu]
AS
SELECT
	m.Id,
	m.Nombre,
	m.NombreAspx,
	m.Activo
FROM
	Menu AS m
GO
/****** Object:  StoredProcedure [dbo].[spListarPagosMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarPagosMatricula]
(
	@IdMatricula INT
)
AS
SELECT
	p.Id,
	p.IdMatricula,
	p.Monto,
	p.Fecha,
	p.Activo
FROM
	Pago AS p
WHERE
	p.IdMatricula = @IdMatricula
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuario]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarUsuario]
AS
SELECT
	u.Id,
	u.IdPerfil,
	u.Nombre,
	u.Email,
	u.Telefono,
	u.Usuario,
	u.Clave,
	u.Activo
FROM
	Usuario AS u
GO
/****** Object:  StoredProcedure [dbo].[spObtenerAlumno]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerAlumno]
(
	@Id INT
)
AS
SELECT
	a.Id,
	a.NroDocumento,
	a.Nombres,
	a.ApPaterno,
	a.ApMaterno,
	a.Telefono,
	a.Sexo,
	a.FechaNac,
	a.Direccion,
	a.Email,
	a.FechaReg,
	a.Activo
FROM
	Alumno AS a
WHERE a.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCurso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerCurso]
(
	@Id INT
)
AS
SELECT
	c.Id,
	c.Nombre,
	c.Activo
FROM
	Curso AS c
WHERE c.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spObtenerDocente]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerDocente]
(
	@Id INT
)
AS
SELECT
	d.Id,
	d.NroDocumento,
	d.Nombres,
	d.ApPaterno,
	d.ApMaterno,
	d.Telefono,
	d.Sexo,
	d.FechaNac,
	d.Direccion,
	d.Email,
	d.IdCurso,
	d.FechaReg,
	d.Activo
FROM
	Docente AS d
WHERE d.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerMatricula]
(
	@Id INT
)
AS
SELECT
	m.Id,
	m.IdAlumno,
	m.Grado,
	m.Seccion,
	m.Monto,
	m.Saldo,
	m.FechaReg,
	m.Activo
FROM
	Matricula AS m
WHERE m.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPermiso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerPermiso]
(
	@IdPerfil INT,
	@IdMenu INT
)
AS
SELECT
	p.IdPerfil,
	p.IdMenu,
	p.Ver,
	p.Crear,
	p.Editar
FROM
	Permiso AS p
WHERE
	p.IdPerfil = @IdPerfil
AND p.IdMenu = @IdMenu
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuario]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerUsuario]
(
	@Id INT
)
AS
SELECT
	u.Id,
	u.IdPerfil,
	u.Nombre,
	u.Email,
	u.Telefono,
	u.Usuario,
	u.Clave,
	u.Activo
FROM
	Usuario AS u
WHERE u.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarAlumno]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarAlumno]
(
	@NroDoc VARCHAR(20),
	@Nombres VARCHAR(50),
	@ApPaterno VARCHAR(50),
	@ApMaterno VARCHAR(50),
	@Telefono VARCHAR(20),
	@Sexo CHAR(1),
	@FechaNac DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(50),
	@Activo BIT
)
AS
INSERT INTO Alumno
(
	NroDocumento,
	Nombres,
	ApPaterno,
	ApMaterno,
	Telefono,
	Sexo,
	FechaNac,
	Direccion,
	Email,
	FechaReg,
	Activo
)
VALUES
(
	@NroDoc,
	@Nombres,
	@ApPaterno,
	@ApMaterno,
	@Telefono,
	@Sexo,
	@FechaNac,
	@Direccion,
	@Email,
	GETDATE(),
	@Activo
)
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCurso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarCurso]
(
	@Nombre VARCHAR(50),
	@Activo BIT
)
AS
INSERT INTO Curso
(
	Nombre,
	Activo
)
VALUES
(
	@Nombre,
	@Activo
)
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCursoMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarCursoMatricula]
(
	@IdMatricula INT,
	@IdCurso INT,
	@Activo BIT
)
AS
INSERT INTO CursoMatricula
(
	IdMatricula,
	IdCurso,
	Nota,
	Activo
)
VALUES
(
	@IdMatricula,
	@IdCurso,
	NULL,
	@Activo
)
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarDocente]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarDocente]
(
	@NroDoc VARCHAR(20),
	@Nombres VARCHAR(50),
	@ApPaterno VARCHAR(50),
	@ApMaterno VARCHAR(50),
	@Telefono VARCHAR(20),
	@Sexo CHAR(1),
	@FechaNac DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(50),
	@IdCurso INT,
	@Activo BIT
)
AS
INSERT INTO Docente
(
	NroDocumento,
	Nombres,
	ApPaterno,
	ApMaterno,
	Telefono,
	Sexo,
	FechaNac,
	Direccion,
	Email,
	IdCurso,
	FechaReg,
	Activo
)
VALUES
(
	@NroDoc,
	@Nombres,
	@ApPaterno,
	@ApMaterno,
	@Telefono,
	@Sexo,
	@FechaNac,
	@Direccion,
	@Email,
	@IdCurso,
	GETDATE(),
	@Activo
)
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMatricula]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMatricula]
(
	@IdAlumno INT,
	@Grado INT,
	@Seccion CHAR(1),
	@Monto DECIMAL(10,2),
	@Saldo DECIMAL(10,2),
	@Activo BIT,
	@Id INT OUT
)
AS
INSERT INTO Matricula
(
	IdAlumno,
	Grado,
	Seccion,
	Monto,
	Saldo,
	FechaReg,
	Activo
)
VALUES
(
	@IdAlumno,
	@Grado,
	@Seccion,
	@Monto,
	@Saldo,
	GETDATE(),
	@Activo
)

SET @Id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPago]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarPago]
(
	@IdMatricula INT,
	@Monto DECIMAL(10,2),
	@Fecha DATETIME,
	@Activo BIT
)
AS
INSERT INTO Pago
(
	IdMatricula,
	Monto,
	Fecha,
	Activo
)
VALUES
(
	@IdMatricula,
	@Monto,
	@Fecha,
	@Activo
)
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPermiso]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarPermiso]
(
	@IdPerfil INT,
	@IdMenu INT,
	@Ver BIT,
	@Crear BIT,
	@Editar BIT
)
AS
IF EXISTS(SELECT * FROM Permiso WHERE IdPerfil=@IdPerfil AND IdMenu=@IdMenu)
BEGIN
	UPDATE Permiso
	SET	Ver = @Ver,
		Crear = @Crear,
		Editar = @Editar
	WHERE 
		IdPerfil = @IdPerfil 
	AND IdMenu = @IdMenu
END
ELSE
BEGIN
	INSERT INTO Permiso
	(
		IdPerfil,
		IdMenu,
		Ver,
		Crear,
		Editar
	)
	VALUES
	(
		@IdPerfil,
		@IdMenu,
		@Ver,
		@Crear,
		@Editar
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 12/12/2020 17:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
(
	@IdPerfil INT,
	@Nombre VARCHAR(50),
	@Email VARCHAR(50),
	@Telefono VARCHAR(20),
	@Usuario VARCHAR(50),
	@Clave VARCHAR(50),
	@Activo BIT
)
AS
INSERT INTO Usuario
(
	IdPerfil,
	Nombre,
	Email,
	Telefono,
	Usuario,
	Clave,
	Activo
)
VALUES
(
	@IdPerfil,
	@Nombre,
	@Email,
	@Telefono,
	@Usuario,
	@Clave,
	@Activo
)
GO
USE [master]
GO
ALTER DATABASE [dbColegio] SET  READ_WRITE 
GO
