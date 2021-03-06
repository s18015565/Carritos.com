USE [Carros]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarCarro]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarCarro]
@IdCarro int,
@Matricula varchar(10)=NULL,
@Anio int=NULL,
@Marca varchar(25)=NULL,
@Modelo varchar(25)=NULL,
@CostePorDia int=NULL,
@Disponibilidad int=null,
@UrlFoto varchar(max)=NULL

AS

BEGIN
	UPDATE Carros
	SET
	Matricula=ISNULL(@Matricula,Matricula),
	Anio=ISNULL(@Anio,Anio),
	Marca=ISNULL(@Marca,Marca),
	Modelo=ISNULL(@Modelo,Modelo),
	CostePorDia=ISNULL(@CostePordia,CostePorDia),
	Disponibilidad=ISNULL(@Disponibilidad,Disponibilidad)
	UrlFoto=ISNULL(@UrlFoto,UrlFoto)
	WHERE IdCarro=@IdCarro
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarPersona]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarPersona]
@IdPersona int,
@Nombre varchar(50)=null,
@Direccion varchar(100)=null,
@Telefono varchar(20)=null,
@Correo varchar(100)=null,
@UrlFoto varchar(max)=null

AS
BEGIN
	UPDATE Personas
	SET
	Nombre=ISNULL(@Nombre,Nombre),
	Direccion=ISNULL(@Direccion,Direccion),
	Telefono=ISNULL(@Telefono,Telefono),
	Correo=ISNULL(@Correo,Correo),
	UrlFoto=ISNULL(@UrlFoto,UrlFoto)
	WHERE IdPersona=@IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarCarroPorId]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarCarroPorId]
@IdCarro int

AS

BEGIN
	SELECT * FROM Carros
	WHERE IdCarro=@IdCarro
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarCarros]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarCarros]
@Disponibilidad bit=null
AS

BEGIN
	IF(@Disponibilidad is null)
		BEGIN
			SELECT * FROM Carros
		END
	ELSE
		BEGIN
			SELECT * FROM Carro
			WHERE Disponibilidad=@Disponibilidad
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPersonaPorId]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarPersonaPorId]
@IdPersona int

AS

BEGIN
	SELECT * FROM PERSONAS
	WHERE IdPersona=@IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPersonas]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarPersonas]
@Disponibilidad bit=null
AS

BEGIN
IF(@Disponibilidad is null)
		BEGIN
			SELECT * FROM PERSONAS
		END
	ELSE
		BEGIN
			SELECT * FROM PERSONAS
			WHERE Disponibilidad=@Disponibilidad
		END
END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarRentasPorEstado]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarRentasPorEstado]
@Estado varchar(25)

AS

BEGIN
	SELECT * FROM Rentas
	WHERE Estado=@Estado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarRentasPorEstadoExtendida]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarRentasPorEstadoExtendida]
@Estado varchar(25)

AS

BEGIN
	SELECT R.IdRenta,R.FechaHoraSalida,R.Estado,R.IdCarro,R.IdPersona,
	C.Modelo as ModeloCarro,C.UrlFoto as UrlFotoCarro,
	P.Nombre as Nombre, P.UrlFoto as UrlFoto
	 FROM Rentas R

	INNER JOIN Carros C ON R.IdCarro=C.IdCarro
	INNER JOIN Personas P ON R.IdPersona=P.IdPersona
	WHERE Estado=@Estado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarRentasPorId]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarRentasPorId]
@IdRenta int

AS

BEGIN
	SELECT * FROM Rentas
	WHERE IdRenta=@Idrenta
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarRentasPorIdExtendida]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarRentasPorIdExtendida]
@IdRenta int

AS

BEGIN
	SELECT R.IdRenta,R.FechaHoraSalida,R.Estado,R.IdCarro,R.IdPersona,
	C.Modelo as ModeloCarro,C.UrlFoto as UrlFoto,
	P.Nombre as NombrePersona, P.UrlFoto as UrlFotoPersona
	 FROM Rentas R

	INNER JOIN Carros C ON R.IdCarro=C.IdCarro
	INNER JOIN Personas P ON R.IdPersona=P.IdPersona
	WHERE IdRenta=@IdRenta
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarCarro]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarCarro]
@IdCarro int

AS

BEGIN
	DELETE Carros
	WHERE IdCarro=@IdCarro
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarPersona]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarPersona]
@IdPersona int

AS

BEGIN
	DELETE Personas
	WHERE IdPersona=@IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[SP_FinalizarRenta]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FinalizarRenta]
@IdRenta int,
@Estado varchar(25)

AS

BEGIN
DECLARE @IdCarro int
	SELECT @IdCarro=IdCarro, @IdPersona=IdPersona FROM Rentas
	WHERE IdRenta=@IdRenta

	UPDATE Rentas
	SET
	Estado=@Estado
	WHERE IdRentas=@IdRentas
	
	UPDATE Carros
	SET
	Disponibilidad=1
	WHERE IdCarro=@IdCarro

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarCarro]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarCarro]
@Matricula varchar(10),
@Anio int,
@Marca varchar(25),
@Modelo varchar(25),
@CostePorDia int,
@UrlFoto varchar(max)

AS

BEGIN
	INSERT INTO Carros(Matricula,Anio,Marca,Modelo,CostePorDia,Disponibilidad,UrlFoto)
	VALUES (@Matricula,@Anio,@Marca,@Modelo,@costePorDia,1,@UrlFoto)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarPersona]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarPersona]
@Nombre varchar(50),
@Direccion varchar(100),
@Telefono varchar(20),
@Correo varchar(100),
@UrlFoto varchar(max)

AS
BEGIN
INSERT INTO Personas(Nombre,Direccion,Telefono,Correo,UrlFoto,Disponibilidad)
VALUES (@Nombre,@Direccion,@Telefono,@Correo,@UrlFoto,1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarRenta]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarRenta]
@FechaHoraSalida DateTime,
@FechaHoraLlegada DateTime,
@Estado varchar(25),
@CosteTotal int,
@IdCarro int,
@IdPersona int

AS

BEGIN
	INSERT INTO Rentas(FechaHoraSalida,FechaHoraLlegada,Estado,CosteTotal,IdCarro,IdPersona)
	VALUES(@FechaHoraSalida,@FechaHoraLlegada,@Estado,@CosteTotal,@IdCarro,@IdPersona)
END
GO
/****** Object:  StoredProcedure [dbo].[WS_ConsultarRentasMes]    Script Date: 20/11/2020 08:55:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WS_ConsultarRentasMes]
@Mes Date,
@Num int

AS

BEGIN
	SELECT TOP(@Num) count(R.IdCarro) as NoRentas, C.Modelo as ModeloCarro
	FROM Carros C 
	INNER JOIN Rentas R ON R.IdCarro=C.IdCarro
	WHERE MONTH(FechaHoraSalida)=MONTH(@Mes) AND YEAR(FechaHoraSalida)=YEAR(GETDATE())
	GROUP BY R.IdCarro, C.Modelo
	ORDER BY NoRentas DESC
END
GO
