CREATE DATABASE BDCarros
GO
USE [BDCarros]
GO
/****** Object:  Table [dbo].[Carros]    Script Date: 19/11/2020 11:25:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carros](
	[IdCarro] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [varchar](10) NOT NULL,
	[Anio] [int] NOT NULL,
	[Marca] [varchar](25) NOT NULL,
	[Modelo] [varchar](25) NOT NULL,
	[CostePorDia] [int] NOT NULL,
	[Disponibilidad] [bit] NOT NULL,
	[UrlFoto] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Carros] PRIMARY KEY CLUSTERED 
(
	[IdCarro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 19/11/2020 11:25:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[UrlFoto] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentas]    Script Date: 19/11/2020 11:25:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentas](
	[IdRenta] [int] IDENTITY(1,1) NOT NULL,
	[FechaHoraSalida] [datetime] NOT NULL,
	[FechaHoraLlegada] [datetime] NOT NULL,
	[Estado] [varchar](25) NOT NULL,
	[CosteTotal] [int] NOT NULL,
	[IdCarro] [int] NULL,
	[IdPersona] [int] NULL,
 CONSTRAINT [PK_Rentas] PRIMARY KEY CLUSTERED 
(
	[IdRenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rentas]  WITH CHECK ADD  CONSTRAINT [FK_Rentas_Carros] FOREIGN KEY([IdCarro])
REFERENCES [dbo].[Carro] ([IdCarro])
GO
ALTER TABLE [dbo].[Rentas] CHECK CONSTRAINT [FK_Rentas_Carros]
GO
ALTER TABLE [dbo].[Rentas]  WITH CHECK ADD  CONSTRAINT [FK_Rentas_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Rentas] CHECK CONSTRAINT [FK_Rentas_Personas]
GO
