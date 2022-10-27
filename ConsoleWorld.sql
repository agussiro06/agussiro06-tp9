USE [master]
GO
/****** Object:  Database [ConsoleWorld]    Script Date: 27/10/2022 07:56:21 ******/
CREATE DATABASE [ConsoleWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsoleWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleWorld.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConsoleWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ConsoleWorld_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConsoleWorld] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsoleWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsoleWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsoleWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsoleWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsoleWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsoleWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsoleWorld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsoleWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsoleWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsoleWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsoleWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsoleWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsoleWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsoleWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsoleWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsoleWorld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConsoleWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsoleWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsoleWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsoleWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsoleWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsoleWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsoleWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsoleWorld] SET RECOVERY FULL 
GO
ALTER DATABASE [ConsoleWorld] SET  MULTI_USER 
GO
ALTER DATABASE [ConsoleWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsoleWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsoleWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsoleWorld] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConsoleWorld] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConsoleWorld', N'ON'
GO
ALTER DATABASE [ConsoleWorld] SET QUERY_STORE = OFF
GO
USE [ConsoleWorld]
GO
/****** Object:  User [alumno]    Script Date: 27/10/2022 07:56:21 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Consola]    Script Date: 27/10/2022 07:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consola](
	[idConsola] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
	[Informacion] [varchar](max) NOT NULL,
	[Portada] [varchar](50) NULL,
 CONSTRAINT [PK_Consola] PRIMARY KEY CLUSTERED 
(
	[idConsola] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juego]    Script Date: 27/10/2022 07:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juego](
	[idJuego] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[idConsola] [int] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[Desarrolladora] [varchar](50) NOT NULL,
	[Favorito] [bit] NULL,
	[Informacion] [varchar](max) NOT NULL,
	[Portada] [varchar](50) NULL,
 CONSTRAINT [PK_Juego] PRIMARY KEY CLUSTERED 
(
	[idJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/10/2022 07:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NOT NULL,
	[FechaCreacion] [varchar](50) NOT NULL,
	[Informacion] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (1, N'PlayStation 1', CAST(N'1994-12-03T00:00:00.000' AS DateTime), N'Sony', N'PlayStation es la primera videoconsola de Sony, y la primera de dicha compañía en ser diseñada por Ken Kutaragi, y es una videoconsola de sobremesa de 32 bits lanzada por Sony Computer Entertainment. Se considera la videoconsola más exitosa de la quinta generación tanto en ventas como en popularidad. Además de la original. Se estima que Sony pudo vender 102,4 millones de consolas en diez años. La consola fue retirada oficialmente del mercado el 23 de marzo de 2006', N'Play1.jpg')
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (2, N'PlayStation 2', CAST(N'2000-03-04T00:00:00.000' AS DateTime), N'Sony', N'La PlayStation 2 es la segunda videoconsola de sobremesa producida por Sony Computer Entertainment, y la tercera consola de Sony en ser diseñada por Ken Kutaragi. Además de ser la sucesora de la PlayStation. Es la videoconsola más vendida de la historia, con más de 155 millones de unidades vendidas.? Esta consola es también la que más juegos posee, aproximadamente 3870, seguida por su predecesora la PlayStation con unos 2500. Esta cantidad de juegos se debe a la extraordinaria acogida por parte del público en general hacia la misma, lo que incluso la consolidó como la consola con más tiempo en el mercado y a su vez la consola con más duración en el mismo, hasta que el 3 de enero del año 2013 se decide detener su fabricación tras 13 años de actividad.A pesar del anuncio, se continuaron produciendo nuevos juegos para la consola hasta finales de 2013.', N'Play2.jpg')
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (3, N'PlayStation 3', CAST(N'2006-11-11T00:00:00.000' AS DateTime), N'Sony', N'La PlayStation 3 fue lanzada al mercado el 11 de noviembre de 2006 en Japón,7? el 17 de noviembre de 2006 en Norteamérica8? y el 23 de marzo de 2007 en Europa y Australia.9?10? Dos variantes estaban disponibles en el momento del lanzamiento: un modelo básico con 20 GB de disco duro SATA 2,5" y un modelo profesional con disco duro de 60 GB y varias características adicionales como doble número de puertos USB y retrocompatibilidad con juegos de su antecesora PlayStation 2 y Playstation 1. El modelo de 20 GB no fue comercializado en Europa y Australia, en su lugar se lanzó el modelo de 40 GB, que fue el que se extendió, ya que eliminaba la retrocompatibilidad, pero abarataba los costes.11?12? Desde entonces, a todos los modelos se le han hecho varias revisiones en su hardware para la disminución de su costo de producción y su precio de venta.
La consola fue descontinuada en mayo del 2017.', N'Play3.jpg')
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (4, N'PlayStation 4', CAST(N'2013-11-15T00:00:00.000' AS DateTime), N'Sony', N'
PlayStation 4 es la cuarta videoconsola del modelo PlayStation. Es la segunda consola de Sony en ser diseñada por Mark Cerny y forma parte de las videoconsolas de octava generación. Fue anunciada oficialmente el 20 de febrero de 2013 en el evento PlayStation Meeting 2013,? aunque el diseño de la consola no fue presentado hasta el 10 de junio en el E3 2013.10? Es la sucesora de la PlayStation 3 y compite con Wii U, y Switch de Nintendo y Xbox One de Microsoft. Su lanzamiento fue el 15 de noviembre de 2013 en Estados Unidos y Canadá, el 29 de noviembre se produjo su lanzamiento en Europa y Sudamérica 11?9?, mientras que en Japón fue el 22 de febrero de 2014.', N'Play4.jpg')
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (5, N'Nintendo Entertainment System
', CAST(N'1983-07-15T00:00:00.000' AS DateTime), N'Nintendo', N'Nintendo Entertainment System? es una videoconsola de 8 bits perteneciente a la tercera generación en la industria de los videojuegos, la primera consola de sobremesa de Nintendo en emplear cartuchos. La Super Nintendo reemplazó a la NES en el mercado. Fue descontinuada en 1995 (en Japón fue en 2003),? y su último título fue Wario''s Woods. En el año 2013 Capcom lanzó una edición limitada de 150 unidades de un cartucho original de NES de color dorado, con el juego Ducktales.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (6, N'Super Nintendo', CAST(N'1990-11-21T00:00:00.000' AS DateTime), N'Nintendo', N'La Super Nintendo Entertainment System, conocida popularmente como la Super Nintendo, también llamada la Super Famicom en Japón(abreviada SFC) y la Hyundai Super Comboy en Corea del Sur,? también nombrada oficialmente de forma abreviada como la Super NES o SNES en América? y como la Super Nintendo en Europa, es la segunda videoconsola de sobremesa de Nintendo y la sucesora de Nintendo Entertainment System (NES) en América y Europa. Mantuvo una gran rivalidad en todo el mundo con la Sega Mega Drive (o Sega Genesis) durante la era de 16 bits. Fue descontinuada en el año 1999 (2003 en Japón) y años más tarde, fue relanzada virtualmente a través de la Consola Virtual en la Wii en 2006, Wii U en 2013, Nintendo 3DS (solo la versión New) en 2016 y Nintendo Switch en 2019 a través del servicio en línea Nintendo Switch Online.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (7, N'Game Boy', CAST(N'1989-04-21T00:00:00.000' AS DateTime), N'Nintendo', N'Fue diseñada por el mismo equipo que desarrolló la serie de videoconsolas portátiles Game & Watch y el Nintendo Entertainment System: Satoru Okada, Gunpei Yokoi y Nintendo Research & Development.? La segunda consola portátil de Nintendo combinó características del hardware del NES y de las Game & Watch, contando con una pantalla de matriz de puntos de color verde con un dial de contraste ajustable, cinco botones de control, un altavoz con dial de volumen ajustable y la salida de conector jack. Además, utilizó cartuchos como medio físico para juegos.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (8, N'Nintendo 64', CAST(N'1996-06-23T00:00:00.000' AS DateTime), N'Nintendo', N'
Nintendo 64 es la cuarta videoconsola de sobremesa producida por Nintendo, desarrollada para suceder a la Super Nintendo. Fue la primera consola concebida para dar el salto del 2D al 3D. Compitió en el mercado de la quinta generación con Saturn de Sega y PlayStation (consola) de Sony, esta última creada a partir de diseños descartados previamente por Nintendo.

Incorpora en su arquitectura un procesador principal de 64 bits. El soporte de almacenamiento de los juegos es en forma de cartuchos, la mayoría de ellos con memoria interna. El uso de este tipo de almacenamiento le supuso una seria desventaja comercial frente a sus competidores, ya que encarecía los costes de producción lo que aumentaba el precio final, y además, era de una capacidad de almacenamiento menor al de un CD-ROM.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (9, N'Game Boy Color
', CAST(N'1998-10-22T00:00:00.000' AS DateTime), N'Nintendo', N'
La Game Boy Color, abreviada GBC, es una videoconsola portátil de la quinta generación de la familia de sistemas de videojuegos de Game Boy, esta portátil es la competidora principal de la PocketStation de Sony y la Neo Geo Pocket Color de SNK.

Salió al mercado en Japón el 23 de octubre de 1998 por el retraso del lanzamiento de la futura Game Boy Advance que saldría a la venta en 1997, pero Nintendo decidió seguir mejorando la Game Boy Advance. Por el retraso de este lanzamiento sale una consola no pensada: Game Boy Color.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (10, N'Nintendo GameCube
', CAST(N'2001-04-06T00:00:00.000' AS DateTime), N'Nintendo', N'Sus principales características son su procesador central basado en un IBM PowerPC (tecnología previa utilizada en computadoras personales y portátiles), y su procesador gráfico desarrollado por ATI Technologies. Nintendo, por primera vez, prescinde del cartucho (ROM) como formato de almacenamiento, y adopta un formato óptico propio, el Nintendo Optical Disc. El nombre «GameCube» se debe a que el sistema tiene la forma parecida a la de un cubo. Es además la primera consola de Nintendo que no cuenta en su fecha de lanzamiento con un juego de Mario, mascota oficial de la compañía.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (11, N'Game Boy Advance
', CAST(N'2001-03-21T00:00:00.000' AS DateTime), N'Nintendo', N'La Game Boy Advance, abreviada como GBA, es una consola de videojuegos de la compañía Nintendo, fabricada desde marzo de 2001 hasta 2008. La GBA forma parte de la sexta generación de videoconsolas. El modelo original no tenía una pantalla con iluminación, lo que fue solucionado con la Game Boy Advance SP, un rediseño de la consola que incluía algunas mejoras como la pantalla con iluminación y el uso de baterías de litio. Finalmente sufrió dos últimos rediseños en el 2005, una versión de la SP con pantalla retroiluminada y la Game Boy Micro.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (12, N'Atari 2600', CAST(N'1977-09-11T00:00:00.000' AS DateTime), N'Atari', N'

La Atari 2600 es una videoconsola lanzada al mercado en 1977 bajo el nombre de Atari VCS (Video Computer System), convirtiéndose en el primer sistema de videojuegos en tener gran éxito, e hizo popular los cartuchos intercambiables. En 1982, tras el lanzamiento de la Atari 5200, adoptó su nombre final basado en el número de catálogo que la identificaba (CX2600). Esta consola fue un gran éxito y logró que durante los años 1980 «Atari» fuese sinónimo de videojuegos. Se vendía acompañada de dos joysticks, dos controles tipo paddle y el juego Combat desde 1977 hasta 1983, después, se comercializó con dos controles, y con o sin cartucho de juegos dependiendo del paquete.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (13, N'Atari 5200
', CAST(N'1982-11-01T00:00:00.000' AS DateTime), N'Atari', N'La Atari 5200 es una consola de videojuegos fabricada por Atari y lanzada al mercado en 1982. No tuvo tanto éxito como su predecesora, la Atari 2600, pero se trataba de una versión mejorada de la anterior. El chip de gráficos es mejorado, hasta el punto que es prácticamente igual que los arcades de la época. Se estima que las ventas superaron el 1 millón de unidades, contra las más de 30 millones de su predecesora. Por esto, al año 2022 es muy buscada entre los coleccionistas.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (14, N'Sega Megadrive', CAST(N'1988-10-29T00:00:00.000' AS DateTime), N'Sega', N'

La Sega Mega Drive, conocida como Sega Genesis en América, es una consola de videojuegos de sobremesa de cuarta generación de 16 bits desarrollada y vendida por Sega. La Mega Drive es la tercera consola de Sega y la sucesora de la Sega Master System. Sega la lanzó en Japón en 1988, y más tarde como Genesis en América en 1989. En 1990, Virgin Mastertronic la distribuyó en Europa, Ozisoft en Australasia y Tec Toy en Brasil. En Korea del Sur, Samsung la distribuyó como el Super Gam*Boy y más tarde el Super Aladdin Boy.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (15, N'Sega Saturn', CAST(N'1994-11-22T00:00:00.000' AS DateTime), N'Sega', N'Sega Saturn es la sexta consola de sobremesa producida por Sega, fue desarrollada para suceder a la Sega Genesis/Mega Drive y competir contra la 3DO de Panasonic, Goldstar y Sanyo, la Atari Jaguar de Atari, etc.; poco más adelante con la PlayStation de Sony y más adelante con la Nintendo 64 de Nintendo. Pertenece a la quita generación de videoconsolas. Es la sucesora de la Sega Genesis Y es la antecesora de la Sega Dreamcast. Se vendieron en total 8.82 millones de unidades.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (16, N'Sega Dreamcast', CAST(N'1998-11-27T00:00:00.000' AS DateTime), N'Sega', N'Dreamcast es la séptima y última videoconsola de sobremesa producida por Sega, fue desarrollada en cooperación con Hitachi y Microsoft. La Dreamcast es la sucesora de la Sega Saturn y fue lanzada al mercado para ganar terreno a la Playstation de Sony y la Nintendo 64 de Nintendo, y competir con los sistemas sucesores a estos. Pertenece a la sexta generación de consolas. Se detuvo su producción en marzo de 2002 tras la decisión de Sega de dedicarse en exclusiva a la programación de videojuegos. Sus principales características son: su lector óptico GD-ROM, su mando, la VMU (Visual Memory Unit) y su procesador de Hitachi. El sistema fue el segundo, después de su predecesora, Sega Saturn en tener un módem incorporado para jugar online. En esta version, el módem se mejoró y se pudo usar además en Latinoamérica.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (17, N'Xbox', CAST(N'2001-11-15T00:00:00.000' AS DateTime), N'Microsoft', N'Dicho dispositivo original fue la primera consola de videojuegos ofrecida por una empresa estadounidense después que de la Atari Jaguar detuvo ventas en 1996. La consola llegó a más de 24 millones de unidades vendidas hasta el 10 de mayo de 2006. La segunda consola de Microsoft, Xbox 360, fue lanzada en 2005 y ha vendido más de 85.6 millones de consolas en todo el mundo hasta junio del 2015.? La sucesora de Xbox 360, la consola Xbox One, fue revelada el 21 de mayo de 2013.? Xbox One ha sido lanzada en 21 mercados de todo el mundo el 22 de noviembre de 2013, ha vendido más de 60 millones de consolas,? siendo el Reino Unido el primer país, y el 10 de noviembre de 2020 Microsoft lanza sus más recientes consolas, la Xbox Series X y Series S, que ha vendido más de 16 millones de consolas hasta la fecha, y es una de las mejores consolas de videojuegos.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (18, N'Xbox 360', CAST(N'2005-11-22T00:00:00.000' AS DateTime), N'Microsoft', N'Xbox 360 es la segunda videoconsola de sobremesa de la marca Xbox producida por Microsoft. Fue desarrollada en colaboración con IBM y ATI (AMD) y lanzada en América del Sur, América del Norte, Japón, Europa y Australia entre 2005 y 2006. Su servicio Xbox Live (el cual es de pago y sigue activo) permite a los jugadores competir en línea y descargar contenidos como juegos arcade, demos, tráileres, programas de televisión y películas. La Xbox 360 es la sucesora directa de la Xbox, y compitió con la PlayStation 3 de Sony y Wii de Nintendo como parte de las videoconsolas de séptima generación.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (19, N'Xbox One', CAST(N'2013-11-22T00:00:00.000' AS DateTime), N'Microsoft', N'
Xbox One es la tercera videoconsola de sobremesa de la marca Xbox, producida por Microsoft. Forma parte de las videoconsolas de octava generación, fue presentada por Microsoft el 21 de mayo de 2013. Es la sucesora de la Xbox 360 y la predecesora de la Xbox Series X y Series S. Actualmente compite con PlayStation 4 de Sony y Nintendo Switch de Nintendo. Su salida a la venta fue el 22 de noviembre de 2013? a un precio de 499 dólares.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (20, N'Xbox series x y s', CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'Microsoft', N'Xbox Series X y Xbox Series S (colectivamente, Xbox Series X|S), es una línea de videoconsolas de sobremesa desarrolladas por Microsoft y la cuarta generación de la familia de consolas Xbox. La familia de consolas, conocida colectivamente como "Project Scarlett"1? y revelada por primera vez en el E3 2019, incluye la Xbox Series X de gama alta, revelada en The Game Awards 2019 y cuyo nombre en código es "Project Anaconda", y la Xbox Series S de menor costo, anunciada en septiembre de 2020 y cuyo nombre en código es "Project Lockhart". Ambas consolas se lanzaron el 10 de noviembre de 2020 y compiten actualmente con la PlayStation 5 de Sony.', NULL)
INSERT [dbo].[Consola] ([idConsola], [Nombre], [FechaSalida], [Empresa], [Informacion], [Portada]) VALUES (21, N'Playstation 5', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'Sony', N'es una consola de videojuegos de sobremesa desarrollada por la empresa Sony Interactive Entertainment. Fue anunciada en el año 2019 como la sucesora de la PlayStation 4, la PS5 se lanzó el 12 de noviembre de 2020 en Australia, Japón, Nueva Zelanda, América del Norte, Singapur y Corea del Sur, y en el resto de países el 19 de noviembre de 2020. La PlayStation 5 junto con la Xbox Series X|S de Microsoft, lanzada el mismo mes, son parte de la novena generación de consolas de videojuegos.

La plataforma se lanzó en dos variantes: un modelo base con una unidad de disco óptico compatible con Ultra HD Blu-ray y una edición digital que carece de esta unidad, que sirve como modelo de menor costo para quienes prefieren comprar videojuegos mediante descarga digital.', NULL)
GO
SET IDENTITY_INSERT [dbo].[Juego] ON 

INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (1, N'Crash Bandicoot', 1, CAST(N'1996-09-09T00:00:00.000' AS DateTime), N' Naughty Dog', 0, N'Crash Bandicoot es un videojuego de plataformas de 1996 desarrollado por Naughty Dog y publicado por Sony Computer Entertainment para PlayStation. La premisa del juego narra la creación de un titular Crash, un bandicoot que ha sido elevado por el Científico loco Doctor Neo Cortex. La historia sigue a Crash en su objetivo de evitar los planes de Cortex para dominar el mundo y rescatar a su novia Tawna, una bandicoot femenina también creada por Cortex. El juego se juega desde una perspectiva en tercera persona en la que la cámara sigue a Crash, aunque algunos niveles muestran desplazamiento hacia adelante y perspectivas de desplazamiento lateral.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (2, N'Crash Bandicoot 2: Cortex Strikes Back', 1, CAST(N'1997-10-31T00:00:00.000' AS DateTime), N'Naughty Dog', 0, N'Crash Bandicoot 2: Cortex Strikes Back (En español Crash Bandicoot 2: Cortex ataca de nuevo) es un videojuego de plataformas desarrollado por la empresa Naughty Dog y publicado por Sony Computer Entertainment y por Universal Interactive Studios para la consola PlayStation. Es el segundo videojuego de la serie de Crash Bandicoot y la continuación del videojuego original. También es el primer videojuego de Crash Bandicoot en estar localizado al idioma español, y el tercer, y penúltimo videojuego que Naughty Dog hace para Universal Interactive Studios.

Crash Bandicoot 2 sigue las aventuras de Crash, un bandicoot antropomórfico, a través de un grupo ficticio de islas cerca de Australia. Crash es secuestrado por el villano de la serie, el Doctor Neo Cortex, quien lo engaña haciéndole creer que quiere salvar el mundo. Crash es enviado a varias partes de N. Sanity Island para juntar Cristales que permitirán que Cortex contenga el poder de una próxima alineación planetaria y evite que el planeta sea destruido. La hermana de Crash, Coco y el antiguo ayudante de Cortex, el doctor Nitrus Brio, intentan advertirle sobre Cortex, y este último insta a Crash a recoger gemas en lugar de cristales.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (3, N'Crash Bandicoot 3: Warped
', 1, CAST(N'1998-12-17T00:00:00.000' AS DateTime), N'Naughty Dog', 0, N'Crash Bandicoot 3: Warped es un videojuego de plataformas desarrollado por Naughty Dog para PlayStation. El juego sirve como una secuela de Crash Bandicoot 2: Cortex Strikes Back. Fue la penúltima entrega de la serie desarrollada por Naughty Dog, que posteriormente desarrolló Crash Team Racing.

La historia se centra en Crash y Coco Bandicoot y su misión es recoger los cristales dispersos a través del tiempo antes de que sus enemigos lo consigan. Warped fue el primer juego de la serie Crash en tener la función de desbloquear una demo de Insomniac Games, Spyro the Dragon. Esta función se prolongaría hasta el videojuego Crash Bash.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (4, N'Silent Hill', 1, CAST(N'1999-01-31T00:00:00.000' AS DateTime), N'Konami', 0, N'El juego sigue a Harry Mason mientras busca a su hija en el pueblo de Silent Hill. Al avanzar la trama, Harry descubrirá la verdad acerca de la ciudad y de un culto que desea llevar a cabo un ritual para traer a una deidad a la tierra. El juego posee cinco finales, que se obtienen según las acciones tomadas por el jugador, incluyendo un final de broma.

Tras su lanzamiento, Silent Hill recibió críticas positivas y fue un éxito comercial. Es considerado un título definitorio del survival horror, pues alejó al género de elementos característicos del cine B en pos a una atmósfera de terror psicológico.1? Además, el juego ha vendido más de dos millones de copias hasta la fecha. Por otro lado, la obra posee varias adaptaciones, incluyendo una novela visual, una película de imagen real y una re-imaginación, llamado Silent Hill: Shattered Memories. La secuela directa del juego, Silent Hill 3, salió en 2003 mientras que su precuela Silent Hill: Origins, salió en 2007.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (5, N'Silent Hill 2', 2, CAST(N'2001-09-24T00:00:00.000' AS DateTime), N'Konami', 0, N'Silent Hill 2 ocurre en un universo ficticio que se asemeja parcialmente al mundo real, donde todos los días se cruza con otro mundo alternativo, los cuales están llenos de monstruos. El protagonista es James Sunderland, quien recibe una carta de su esposa Mary, que murió algún tiempo antes de los eventos del juego. En la misma, ella le pide que vaya a la ciudad turística de Silent Hill. Al llegar a su destino, James se encuentra con una misteriosa mujer llamada María, una copia casi exacta de su esposa. Al final, se da cuenta de que parte de sus recuerdos fue un autoengaño. La jugabilidad consiste en resolver acertijos, buscar los elementos necesarios, explorar ubicaciones, confrontar al personaje principal y los monstruos.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (6, N'Dragon Ball Z: Budokai Tenkaichi 3
', 2, CAST(N'2007-11-09T00:00:00.000' AS DateTime), N'Spike', 0, N'Dragon Ball Z: Budokai Tenkaichi 3 (???????Z Sparking! METEOR, Dragon Ball Z: Sparking! METEOR) es la última entrega de la saga Budokai Tenkaichi. El videojuego salió para las consolas PlayStation 2 y Wii en 2007 siendo la secuela de Dragon Ball Z: Budokai Tenkaichi 2.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (7, N'Sonic Heroes
', 2, CAST(N'2004-01-27T00:00:00.000' AS DateTime), N'Sega', 0, N'Sonic Heroes es un videojuego de la serie de Sonic the Hedgehog. Es el primer juego multiplataforma en los juegos de Sonic, siendo lanzado para la Nintendo Gamecube, Sony PlayStation 2, Microsoft Xbox y PC CD-ROM. La frase "Sonic Heroes" se refiere al trabajo en equipo de los protagonistas de los juegos de Sonic the Hedgehog. El juego introduce varios elementos novedosos. A diferencia de juegos de Sonic anteriores, que solo se podía controlar a un personaje, el jugador puede controlar tres personajes al mismo tiempo, cambiando al líder del grupo.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (8, N'Devil May Cry 3: Dante''s Awakening', 2, CAST(N'2005-02-17T00:00:00.000' AS DateTime), N'Capcom', 0, N'Devil May Cry 3: Dante''s Awakening (en español: Devil May Cry 3: El despertar de Dante), conocido en Japón simplemente como Devil May Cry 3, es un videojuego hack n'' slash de acción y aventura perteneciente a la franquicia de Devil May Cry. El juego fue publicado por Capcom en el año 2005 para PlayStation 2 y luego portado para PC en 2006. Se hizo un remaster del juego en el año 2012, que está disponible en el pack de Devil May Cry: HD Collection para la PlayStation 3 y Xbox 360.

La historia sirve como precuela del primer Devil May Cry, Dante es un joven arrogante y compulsivo, que se ve envuelto en una misión de derrotar a su hermano gemelo Vergil, que planea abrir las puertas del infierno para obtener el poder de su padre Sparda.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (9, N'Uncharted: El tesoro de Drake', 3, CAST(N'2007-11-19T00:00:00.000' AS DateTime), N'Naughty Dog', 0, N'Uncharted: El tesoro de Drake (en inglés Uncharted: Drake''s Fortune), es un videojuego de acción y aventura. Desarrollado por la empresa Naughty Dog, y publicado por Sony Computer Entertainment para la consola PlayStation 3. Una continuación para el juego fue lanzada el 8 de noviembre de 2007, en PlayStation Network. Aunque en EE. UU. se fijó fecha para el 19 de noviembre, fue lanzado el día 16 en unas áreas seleccionadas.

El subtítulo El Tesoro de Drake es una referencia al famoso explorador y pirata Sir Francis Drake y el mito sobre su tesoro. En el juego, los jugadores asumen el papel de Nathan Drake, un cazador de tesoros al más puro estilo de Indiana Jones que afirma ser el descendiente del famoso corsario.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (10, N'Uncharted 2: El reino de los ladrones
', 3, CAST(N'2009-10-13T00:00:00.000' AS DateTime), N'Naughty Dog', 0, N'Uncharted 2: El reino de los ladrones, titulado originalmente Uncharted 2: Among Thieves, es un videojuego de acción-aventura en tercera persona para PlayStation 3 y PlayStation 4 desarrollado por Naughty Dog y publicado por Sony Computer Entertainment.? Es la secuela del juego de 2007, de la misma saga, Uncharted: El tesoro de Drake y la continuación prevista del mismo es Uncharted 3: La traición de Drake.

Oficialmente presentado en una de las ediciones de Game Informer, el juego salió a la venta el 13 de octubre de 2009 en Norteamérica. La fecha de salida para Europa fue el 16 de octubre de 2009.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (11, N'Uncharted 3: La traición de Drake
', 3, CAST(N'2011-11-02T00:00:00.000' AS DateTime), N'Naughty Dog', 0, N'Uncharted 3: La traición de Drake, titulado originalmente Uncharted 3: Drake''s Deception, es el tercer videojuego de acción-aventura de la serie Uncharted; al igual que sus anteriores entregas es de uso exclusivo para la PlayStation 3. Es un videojuego desarrollado por Naughty Dog y publicado por Sony Computer Entertainment. Lanzado al mercado estadounidense el 1 de noviembre de 2011. La historia se centra alrededor de Nathan Drake y su mentor Victor Sullivan que viajan alrededor del mundo buscando una legendaria ciudad perdida que finalmente les llevará a la península arábiga y el vasto desierto de Rub al-Jali. La legendaria ciudad perdida ha sido conocida por varios nombres, incluyendo Iram de los Pilares o la Atlántida de las Arenas. El juego coge como inspiración al personaje de T. E. Lawrence.

Es la secuela de Uncharted 2: El reino de los ladrones y Uncharted: El tesoro de Drake.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (12, N'Infamous', 3, CAST(N'2009-05-26T00:00:00.000' AS DateTime), N'	Sucker Punch Productions', 0, N'Infamous, también escrito inFAMOUS, es un videojuego de acción-aventura y shooter en tercera persona, de estructura no lineal, de mundo abierto desarrollado por Sucker Punch Productions en 2009 para la plataforma PlayStation 3. El juego fue lanzado el 26 de mayo de 2009 en Norteamérica, el 29 de mayo de 2009 en Europa y el 4 de junio de 2009 en Australia.

Infamous ofrece la posibilidad de jugar con un superhéroe en el gigantesco entorno de Empire City, con electrizantes superpoderes de alto voltaje y piruetas mortales. Cole McGrath deberá decidir si quiere utilizar sus poderes para hacer el bien o el mal.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (13, N'Spider-Man
', 4, CAST(N'2018-09-07T00:00:00.000' AS DateTime), N'	Insomniac Games', 0, N'
Marvel''s Spider-Man es un videojuego de acción y aventura basado en el popular superhéroe hómonimo de la editorial Marvel Comics.? Fue desarrollado por Insomniac Games y publicado por Sony Interactive Entertainment en exclusiva para la consola PlayStation 4.? Se trata del primer videojuego licenciado desarrollado por Insomniac. Su lanzamiento internacional se produjo el 7 de septiembre de 2018.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (14, N'Ghost of Tsushima
', 4, CAST(N'2020-07-17T00:00:00.000' AS DateTime), N'Sucker Punch Productions', 0, N'Ghost of Tsushima es un videojuego de acción-aventura desarrollado por Sucker Punch Productions y publicado por Sony Interactive Entertainment para PlayStation 4 y PlayStation 5. Con un mundo abierto para que los jugadores exploren, el juego gira en torno al último samurái en la isla de Tsushima durante la primera invasión mongola de Japón. El lanzamiento del juego se produjo el 17 de julio de 2020.

El 25 de marzo de 2021 en la cuenta oficial de instagram de Sucker Punch Productions anunciaron que tendrá su propia película, la fecha aun esta indefinida y estará producida por Sony Pictures y PlayStation Productions. El director será Chad Stashelski (Director de la saga de John Wick) junto con la productora 7Eleven Entertainment y estará bajo la supervision de Sucker Punch, que a su vez será la productora ejecutiva.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (15, N'Red Dead Redemption 2
', 4, CAST(N'2018-10-26T00:00:00.000' AS DateTime), N'	Rockstar Games', 0, N'Red Dead Redemption 2, estilizado Red Dead Redemption II, es un videojuego de acción-aventura western basado en el drama, en un mundo abierto y en perspectiva de primera y tercera persona,1? con componentes para un jugador y multijugador.? Fue desarrollado por Rockstar Games. Es la precuela de Red Dead Redemption y el tercer juego de la saga Red Dead. Su fecha de lanzamiento fue el 26 de octubre de 2018 en las consolas PlayStation 4 y Xbox One.5? Fue lanzado en Microsoft Windows el 5 de noviembre de 2019, y el 19 de ese mismo mes en Google Stadia.

El 20 de octubre de 2016 se publicó el primer tráiler mostrando cinemáticas del juego, pero sin enseñar nada referente al sistema de juego.? El juego está ambientado doce años antes de los sucesos del primer título presentando la historia de la Banda de Dutch Van Der Linde y cómo esta organización cayó en la decadencia.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (16, N'Sekiro : Shadows Die Twice
', 4, CAST(N'2019-03-29T00:00:00.000' AS DateTime), N'FromSoftware', 0, N'Sekiro: Shadows Die Twice es un videojuego de acción y aventura desarrollado por From Software y distribuido por Activision.? El juego fue lanzado el 22 de marzo de 2019 en las plataformas PlayStation 4, Xbox One y Microsoft Windows. El juego sigue a un shinobi del Período Sengoku, conocido como Lobo, que intenta vengarse de un clan de samuráis que atacó y secuestró a su maestro.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (17, N'Super Mario Bros.', 5, CAST(N'1985-09-13T00:00:00.000' AS DateTime), N'Nintendo Entertainment Analysis and Development', 0, N'
Super Mario Bros. o Super Mario Brothers  es un videojuego de plataformas, diseñado por Shigeru Miyamoto, lanzado el 13 de septiembre de 1985 y producido por la empresa japonesa Nintendo, para la consola Nintendo Entertainment System (NES). El juego describe las aventuras de los hermanos Mario y Luigi, personajes que ya protagonizaron el arcade Mario Bros. de 1983. En esta ocasión ambos deben rescatar a la Princesa Peach del Reino Champiñón que fue secuestrada por el rey de los Koopas, Bowser. A través de ocho diferentes mundos, los jugadores pueden controlar a alguno de los dos hermanos y deben enfrentarse finalmente tras los niveles correspondientes de cada mundo a los monstruos de cada castillo para rescatar a la Princesa Peach.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (19, N'The Legend of Zelda', 5, CAST(N'1986-02-21T00:00:00.000' AS DateTime), N'Nintendo EAD', 0, N'The Legend of Zelda? es un videojuego japonés desarrollado y publicado por Nintendo en 1986, y diseñado por Shigeru Miyamoto y Takashi Tezuka para la consola Nintendo Entertainment System. Situado en la tierra de fantasía de Hyrule, el argumento se centra en un joven llamado Link —el personaje jugador—, quien tiene por objetivo recolectar las ocho piezas de la Trifuerza de la Sabiduría para rescatar a la Princesa Zelda, quien está aprisionada en la Montaña de la Muerte en manos del malvado príncipe Ganon. En el transcurso del juego, el jugador puede controlar a Link desde una perspectiva aérea, y tiene que aventurarse a lo largo de un vasto territorio conocido como Hyrule, el cual posee a su vez diversos calabozos, dentro de los cuales debe derrotar a múltiples enemigos y resolver acertijos y así avanzar a lo largo del juego', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (20, N'Mega Man', 5, CAST(N'1987-12-17T00:00:00.000' AS DateTime), N'Capcom', 0, N'Mega Man, conocido como Rockman en Japón, es un videojuego de acción-plataformas de 1987 desarrollado y publicado por Capcom para la Nintendo Entertainment System. Fue dirigida por Akira Kitamura, con Nobuyuki Matsushima como programador principal, y es el primer juego de la franquicia Mega Man y la serie original de videojuegos. Mega Man fue producido por un pequeño equipo específicamente para el mercado de consolas domésticas, por primera vez para Capcom, que anteriormente se centraba en los títulos arcade.

El juego da inicio a la lucha del robot humanoide y el personaje jugador Mega Man contra el científico loco Dr. Wily y los seis Robot Masters bajo su control. El juego no lineal de Mega Man le permite al jugador elegir el orden en el que completará sus seis etapas iniciales. Cada uno culmina en una batalla contra jefes "Robot Master" que otorga al personaje jugador un arma única. Parte de la estrategia del juego consiste en elegir el orden para abordar las etapas con el fin de ganar las armas que serán más útiles en futuros niveles.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (21, N'Metroid', 5, CAST(N'1986-08-06T00:00:00.000' AS DateTime), N'Nintendo Research & Development ', 0, N'Metroid es un videojuego del género acción y aventura y la primera entrega de la serie de videojuegos de Metroid. Desarrollado en cooperación por Nintendo Research & Development 1 e Intelligent Systems, y distribuido internacionalmente por Nintendo, el juego fue lanzado inicialmente en 1986 para la Family Computer Disk System en Japón y para la Nintendo Entertainment System en Norteamérica? y Europa en 1987. Fue relanzado para el Game Boy Advance en octubre de 2004, como parte de la serie NES Classics y tiempo después, apareció en la Consola Virtual de Wii para su descarga digital, a mediados de julio de 2007. Continuando el éxito comercial alcanzado por varios otros juegos que Nintendo publicó a inicios de la década de los 1980, la compañía comenzó a desarrollar Metroid junto a su «juego hermano»: Kid Icarus. La producción corrió a cargo de Gunpei Yokoi, y la dirección por Yoshio Sakamoto, mientras la composición de la banda sonora fue obra de Hirokazu Tanaka. Asimismo, durante 2004, el juego tuvo un remake titulado Metroid: Zero Mission, y salió a la venta para la Game Boy Advance; igualmente, durante ese mismo año, el juego fue relanzado para la ya mencionada portátil, junto con otros juegos como parte de la serie de juegos NES Classics. Cabe mencionar que el nombre del juego proviene de una contracción entre las palabras «metro» y «android», así como de las criaturas homónimas que aparecen en él.', NULL)
INSERT [dbo].[Juego] ([idJuego], [Nombre], [idConsola], [FechaSalida], [Desarrolladora], [Favorito], [Informacion], [Portada]) VALUES (22, N'Super Mario World
', 6, CAST(N'1990-11-21T00:00:00.000' AS DateTime), N'Nintendo Entertainment Analysis and Development', 0, N'Super Mario World —conocido inicialmente en Japón como Super Mario World: Super Mario Bros. 4—, es un videojuego de plataformas desarrollado y publicado por Nintendo. Este fue lanzado para la videoconsola Super Nintendo Entertainment System en Japón en 1990, América del Norte en 1991 y Europa y Australia en 1992. El jugador controla a Mario en su búsqueda para salvar a Princess Toadstool y Dinosaur Land del antagonista de la serie Bowser y sus secuaces, los Koopalings. El modo de juego es similar al de los juegos anteriores de Super Mario: los jugadores controlan a Mario y a su hermano Luigi a través de una serie de niveles en los que el objetivo es llegar al poste de la portería al final. Super Mario World presentó a Yoshi, un dinosaurio que puede comerse a los enemigos, así como adquirir habilidades al comerse los caparazones de Koopa Troopas.', NULL)
SET IDENTITY_INSERT [dbo].[Juego] OFF
GO
USE [master]
GO
ALTER DATABASE [ConsoleWorld] SET  READ_WRITE 
GO
