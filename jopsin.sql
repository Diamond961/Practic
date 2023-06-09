USE [master]
GO
/****** Object:  Database [College]    Script Date: 15.05.2023 16:26:30 ******/
CREATE DATABASE [College]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'College', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\College.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'College_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\College_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [College] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [College].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [College] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [College] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [College] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [College] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [College] SET ARITHABORT OFF 
GO
ALTER DATABASE [College] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [College] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [College] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [College] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [College] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [College] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [College] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [College] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [College] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [College] SET  ENABLE_BROKER 
GO
ALTER DATABASE [College] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [College] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [College] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [College] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [College] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [College] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [College] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [College] SET RECOVERY FULL 
GO
ALTER DATABASE [College] SET  MULTI_USER 
GO
ALTER DATABASE [College] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [College] SET DB_CHAINING OFF 
GO
ALTER DATABASE [College] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [College] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [College] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'College', N'ON'
GO
ALTER DATABASE [College] SET QUERY_STORE = OFF
GO
USE [College]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] NOT NULL,
	[semestr] [varchar](50) NULL,
	[date] [date] NULL,
	[Grade] [int] NULL,
	[id_RUP] [int] NULL,
	[idStud] [int] NULL,
 CONSTRAINT [PK__Grade__54F87A57058C27B0] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student2]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student2](
	[idstud] [int] NOT NULL,
	[ФИО] [varchar](50) NULL,
	[_Электронная почта] [varchar](50) NULL,
	[_Телефон] [varchar](50) NULL,
	[адрес_] [varchar](50) NULL,
	[_Дата рождения_] [varchar](50) NULL,
	[Группа#6] [varchar](50) NULL,
	[sred_znach] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Student2] PRIMARY KEY CLUSTERED 
(
	[idstud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.Student2.Группа#6, dbo.Grade.Grade, dbo.Student2.sred_znach
FROM            dbo.Student2 INNER JOIN
                         dbo.Grade ON dbo.Student2.idstud = dbo.Grade.idStud
GO
/****** Object:  Table [dbo].[spec]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spec](
	[id_spec] [int] NOT NULL,
	[spec] [nvarchar](50) NULL,
 CONSTRAINT [PK_spec] PRIMARY KEY CLUSTERED 
(
	[id_spec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyId] [int] NOT NULL,
	[FacultyTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[TrainerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateFrom] [date] NULL,
	[DateTo] [date] NULL,
	[Kat] [nvarchar](50) NULL,
	[stazh] [int] NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[TrainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Учебная_нагрузка]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Учебная_нагрузка]
AS
SELECT        dbo.Faculty.*, dbo.Trainer.*, dbo.spec.*, dbo.Faculty.FacultyId AS Expr1, dbo.Faculty.FacultyTitle AS Expr2, dbo.Trainer.TrainerId AS Expr3, dbo.Trainer.LastName AS Expr4, dbo.Trainer.DateFrom AS Expr5, 
                         dbo.Trainer.FirstName AS Expr6, dbo.Trainer.DateTo AS Expr7, dbo.Trainer.Kat AS Expr8, dbo.Trainer.stazh AS Expr9, dbo.spec.id_spec AS Expr10, dbo.spec.spec AS Expr11
FROM            dbo.Faculty CROSS JOIN
                         dbo.Trainer CROSS JOIN
                         dbo.spec
GO
/****** Object:  Table [dbo].[RUP]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RUP](
	[RUPId] [int] IDENTITY(1,1) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[semestr] [int] NULL,
	[vid_atestacii] [nvarchar](255) NULL,
	[Kol_chasov] [int] NULL,
	[СпециальностьId] [int] NULL,
	[КДId] [int] NULL,
	[TrainerId] [int] NULL,
 CONSTRAINT [PK__RUP__894FD8E2FD8EE8D7] PRIMARY KEY CLUSTERED 
(
	[RUPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Преподаватели_семестр]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Преподаватели_семестр]
AS
SELECT        dbo.Trainer.TrainerId, dbo.Trainer.FirstName, dbo.Trainer.LastName, dbo.Trainer.DateFrom, dbo.Trainer.DateTo, dbo.Trainer.Kat, dbo.Trainer.stazh, dbo.RUP.semestr
FROM            dbo.Trainer INNER JOIN
                         dbo.RUP ON dbo.Trainer.TrainerId = dbo.RUP.TrainerId
GO
/****** Object:  View [dbo].[Студенты_группа_специальность]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Студенты_группа_специальность]
AS
SELECT        dbo.Student2.ФИО, dbo.Student2.Группа#6, dbo.spec.spec
FROM            dbo.Student2 CROSS JOIN
                         dbo.spec
GO
/****** Object:  View [dbo].[Ведомость_оценок]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ведомость_оценок]
AS
SELECT        dbo.Faculty.FacultyTitle, dbo.Student2.ФИО, dbo.Student2.Группа#6, dbo.Grade.Grade
FROM            dbo.Faculty CROSS JOIN
                         dbo.Student2 CROSS JOIN
                         dbo.Grade
GO
/****** Object:  View [dbo].[Двоечники]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Двоечники]
AS
SELECT        dbo.Faculty.FacultyTitle, dbo.Grade.Grade, dbo.Student2.ФИО, dbo.Student2.Группа#6
FROM            dbo.Faculty CROSS JOIN
                         dbo.Grade CROSS JOIN
                         dbo.Student2
WHERE        (dbo.Grade.Grade = '2')
GO
/****** Object:  View [dbo].[Рейтинг_химия]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Рейтинг_химия]
AS
SELECT        TOP (100) PERCENT dbo.Faculty.FacultyTitle, dbo.Grade.Grade, dbo.Student2.ФИО, dbo.Student2.Группа#6
FROM            dbo.Faculty CROSS JOIN
                         dbo.Grade CROSS JOIN
                         dbo.Student2
WHERE        (dbo.Faculty.FacultyTitle = N'Химия')
ORDER BY dbo.Grade.Grade, dbo.Student2.ФИО, dbo.Faculty.FacultyTitle, dbo.Student2.Группа#6
GO
/****** Object:  View [dbo].[View_1]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT DISTINCT dbo.RUP.RUPId, dbo.Faculty.FacultyTitle, dbo.spec.spec
FROM            dbo.RUP INNER JOIN
                         dbo.Faculty ON dbo.RUP.FacultyId = dbo.Faculty.FacultyId INNER JOIN
                         dbo.spec ON dbo.RUP.СпециальностьId = dbo.spec.id_spec INNER JOIN
                         dbo.Grade ON dbo.Faculty.FacultyTitle = dbo.Grade.disciplina AND dbo.spec.spec = dbo.Grade.spec
GO
/****** Object:  Table [dbo].[Kategoria]    Script Date: 15.05.2023 16:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoria](
	[id_кат] [int] NOT NULL,
	[категория] [nvarchar](255) NULL,
 CONSTRAINT [PK_Лист2$] PRIMARY KEY CLUSTERED 
(
	[id_кат] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (1, N'Администрирование серверов')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (2, N'Базы данных')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (3, N'Иностранный язык')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (4, N'Интерфейс информационных систем')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (5, N'Информатика')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (6, N'История')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (7, N'Компьютерные сети')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (8, N'Мультимедийные приложения')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (9, N'Основы алгоритмизации и программирования')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (10, N'Основы безопасности жизнедеятельности')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (11, N'Основы программирования')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (12, N'Основы проектирования баз данных')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (13, N'Право')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (14, N'Русский язык')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (15, N'Физическая культура')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (16, N'Химия')
INSERT [dbo].[Faculty] ([FacultyId], [FacultyTitle]) VALUES (17, N'Численные методы')
GO
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (1, N'6', CAST(N'2021-06-25' AS Date), 5, 3, 1)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (2, N'6', CAST(N'2021-06-25' AS Date), 4, 3, 2)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (3, N'6', CAST(N'2021-06-25' AS Date), 3, 3, 3)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (4, N'6', CAST(N'2021-06-25' AS Date), 3, 3, 4)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (5, N'6', CAST(N'2021-06-25' AS Date), 4, 3, 5)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (6, N'6', CAST(N'2021-06-25' AS Date), 4, 3, 6)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (7, N'6', CAST(N'2021-06-25' AS Date), 5, 3, 7)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (8, N'6', CAST(N'2021-06-25' AS Date), 3, 3, 8)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (9, N'6', CAST(N'2021-06-25' AS Date), 5, 3, 9)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (10, N'6', CAST(N'2021-06-25' AS Date), 5, 3, 10)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (11, N'6', CAST(N'2021-06-25' AS Date), 4, 3, 11)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (12, N'6', CAST(N'2021-06-25' AS Date), 4, 3, 12)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (13, N'4', CAST(N'2021-06-25' AS Date), 4, 3, 13)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (14, N'4', CAST(N'2019-12-27' AS Date), 5, 4, 14)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (15, N'4', CAST(N'2019-12-27' AS Date), 3, 4, 15)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (16, N'4', CAST(N'2019-12-27' AS Date), 3, 4, 1)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (17, N'4', CAST(N'2019-12-27' AS Date), 2, 4, 2)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (18, N'4', CAST(N'2019-12-27' AS Date), 4, 4, 3)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (19, N'4', CAST(N'2019-12-27' AS Date), 3, 4, 4)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (20, N'4', CAST(N'2019-12-27' AS Date), 5, 4, 5)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (21, N'4', CAST(N'2019-12-27' AS Date), 4, 4, 6)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (22, N'4', CAST(N'2019-12-27' AS Date), 4, 4, 7)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (23, N'4', CAST(N'2019-12-27' AS Date), 3, 4, 8)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (24, N'4', CAST(N'2019-12-27' AS Date), 4, 4, 9)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (25, N'4', CAST(N'2019-12-27' AS Date), 5, 4, 10)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (26, N'4', CAST(N'2019-12-27' AS Date), 3, 4, 11)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (27, N'4', CAST(N'2019-12-27' AS Date), 3, 4, 12)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (28, N'4', CAST(N'2019-12-27' AS Date), 2, 4, 13)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (29, N'4', CAST(N'2019-12-27' AS Date), 4, 4, 14)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (30, N'4', CAST(N'2019-12-27' AS Date), 5, 4, 15)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (31, N'4', CAST(N'2020-06-13' AS Date), 5, 17, 16)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (32, N'4', CAST(N'2020-06-13' AS Date), 4, 17, 17)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (33, N'4', CAST(N'2020-06-13' AS Date), 4, 17, 18)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (34, N'4', CAST(N'2020-06-13' AS Date), 3, 17, 19)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (35, N'4', CAST(N'2020-06-13' AS Date), 4, 17, 20)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (36, N'4', CAST(N'2020-06-13' AS Date), 5, 17, 21)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (37, N'4', CAST(N'2020-06-13' AS Date), 4, 17, 22)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (38, N'4', CAST(N'2020-06-13' AS Date), 3, 17, 23)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (39, N'4', CAST(N'2020-06-13' AS Date), 2, 17, 24)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (40, N'4', CAST(N'2020-06-13' AS Date), 17, 17, 25)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (41, N'4', CAST(N'2020-06-13' AS Date), 7, 17, 26)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (42, N'4', CAST(N'2020-06-13' AS Date), 13, 17, 27)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (43, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 44)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (44, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 45)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (45, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 46)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (46, N'6', CAST(N'2021-12-11' AS Date), 3, 31, 47)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (47, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 48)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (48, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 49)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (49, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 50)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (50, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 51)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (51, N'6', CAST(N'2021-12-11' AS Date), 13, 31, 52)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (52, N'6', CAST(N'2021-12-11' AS Date), 3, 31, 53)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (53, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 54)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (54, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 55)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (55, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 56)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (56, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 57)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (57, N'6', CAST(N'2021-12-11' AS Date), 3, 31, 58)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (58, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 59)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (59, N'6', CAST(N'2021-12-11' AS Date), 2, 31, 37)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (60, N'6', CAST(N'2021-12-11' AS Date), 3, 31, 38)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (61, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 39)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (62, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 40)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (63, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 41)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (64, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 42)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (65, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 43)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (66, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 44)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (67, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 45)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (68, N'6', CAST(N'2021-12-11' AS Date), 5, 31, 46)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (69, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 47)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (70, N'6', CAST(N'2021-12-11' AS Date), 4, 31, 48)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (71, N'6', CAST(N'2021-12-11' AS Date), 3, 31, 49)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (72, N'6', CAST(N'2021-12-11' AS Date), 3, 31, 50)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (73, N'6', CAST(N'2019-12-21' AS Date), 5, 35, 51)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (74, N'6', CAST(N'2019-12-21' AS Date), 3, 35, 52)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (75, N'6', CAST(N'2019-12-21' AS Date), 3, 35, 53)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (76, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 54)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (77, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 55)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (78, N'6', CAST(N'2019-12-21' AS Date), 5, 35, 56)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (79, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 57)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (80, N'6', CAST(N'2019-12-21' AS Date), 3, 35, 58)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (81, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 59)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (82, N'6', CAST(N'2019-12-21' AS Date), 2, 35, 1)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (83, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 2)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (84, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 3)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (85, N'6', CAST(N'2019-12-21' AS Date), 5, 35, 4)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (86, N'6', CAST(N'2019-12-21' AS Date), 5, 35, 5)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (87, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 6)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (88, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 7)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (89, N'6', CAST(N'2019-12-21' AS Date), 3, 35, 8)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (90, N'6', CAST(N'2019-12-21' AS Date), 5, 35, 9)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (91, N'6', CAST(N'2019-12-21' AS Date), 3, 35, 10)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (92, N'6', CAST(N'2019-12-21' AS Date), 5, 35, 11)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (93, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 12)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (94, N'6', CAST(N'2019-12-21' AS Date), 4, 35, 13)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (95, N'6', CAST(N'2019-12-21' AS Date), 2, 35, 14)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (96, N'6', CAST(N'2019-12-21' AS Date), 3, 23, 20)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (97, N'6', CAST(N'2019-12-21' AS Date), 5, 23, 21)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (98, N'6', CAST(N'2019-12-21' AS Date), 4, 23, 22)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (99, N'6', CAST(N'2019-12-21' AS Date), 5, 23, 23)
INSERT [dbo].[Grade] ([GradeId], [semestr], [date], [Grade], [id_RUP], [idStud]) VALUES (100, N'6', CAST(N'2019-12-21' AS Date), 4, 23, 24)
GO
INSERT [dbo].[Kategoria] ([id_кат], [категория]) VALUES (1, N' ЕГСН')
INSERT [dbo].[Kategoria] ([id_кат], [категория]) VALUES (2, N' ОП')
INSERT [dbo].[Kategoria] ([id_кат], [категория]) VALUES (3, N' ПМ')
GO
SET IDENTITY_INSERT [dbo].[RUP] ON 

INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (1, 6, 2, N' зачет', 32, 3, 1, 6)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (2, 6, 1, N' ТУ', 32, 3, 1, 12)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (3, 12, 6, N' дифференцированный зачет', 96, 3, 2, 3)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (4, 9, 3, N' зачет', 64, 3, 2, 3)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (5, 9, 4, N' Экзамен', 112, 3, 2, 8)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (6, 17, 6, N' Экзамен', 112, 3, 3, 13)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (7, 16, 6, N' Экзамен', 112, 3, 1, 9)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (8, 5, 6, N' Экзамен', 112, 3, 1, 15)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (9, 10, 6, N' Экзамен', 112, 3, 1, 11)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (10, 13, 6, N' Экзамен', 112, 3, 1, 4)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (11, 15, 6, N' Экзамен', 112, 3, 1, 11)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (12, 3, 6, N' Экзамен', 112, 3, 1, 10)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (13, 14, 6, N' Экзамен', 112, 3, 1, 1)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (14, 6, 1, N' дифференцированный зачет', 48, 2, 1, 6)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (15, 2, 5, N'  ТУ', 96, 2, 2, 3)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (16, 2, 6, N'  дифференцированный зачет', 96, 2, 2, 13)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (17, 11, 3, N' ТУ', 112, 2, 2, 8)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (18, 11, 4, N' Экзамен', 112, 2, 2, 8)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (19, 17, 6, N' дифференцированный зачет', 112, 2, 2, 13)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (20, 16, 2, N' Экзамен', 112, 2, 1, 9)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (21, 5, 3, N' дифференцированный зачет', 112, 2, 1, 15)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (22, 10, 4, N' зачет', 112, 2, 1, 11)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (23, 13, 5, N' Экзамен', 112, 2, 1, 12)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (24, 15, 8, N' дифференцированный зачет', 112, 2, 1, 14)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (25, 3, 6, N' дифференцированный зачет', 112, 2, 1, 10)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (26, 14, 2, N' Экзамен', 112, 2, 1, 1)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (27, 14, 1, N' ТУ', 112, 2, 1, 1)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (28, 8, 7, N' зачет', 48, 1, 3, 2)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (29, 5, 7, N' зачет', 48, 1, 2, 15)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (30, 7, 7, N' зачет', 48, 1, 3, 2)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (31, 1, 7, N' дифференцированный зачет', 48, 1, 3, 3)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (32, 2, 7, N' зачет', 48, 1, 2, 15)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (33, 2, 7, N' экзамен', 64, 1, 2, 2)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (34, 4, 7, N' дифференцированный зачет', 96, 3, 3, 2)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (35, 13, 6, N' Экзамен', 68, 1, 1, 4)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (36, 15, 8, N' дифференцированный зачет', 132, 1, 1, 14)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (37, 3, 6, N' дифференцированный зачет', 152, 1, 1, 10)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (38, 15, 7, N' ТУ', 64, 1, 1, 11)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (39, 3, 5, N' ТУ', 32, 1, 1, 10)
INSERT [dbo].[RUP] ([RUPId], [FacultyId], [semestr], [vid_atestacii], [Kol_chasov], [СпециальностьId], [КДId], [TrainerId]) VALUES (40, 14, 2, N' Экзамен', 112, 3, 1, 10)
SET IDENTITY_INSERT [dbo].[RUP] OFF
GO
INSERT [dbo].[spec] ([id_spec], [spec]) VALUES (1, N'Информационные системы')
INSERT [dbo].[spec] ([id_spec], [spec]) VALUES (2, N'Информационные системы и Программирование')
INSERT [dbo].[spec] ([id_spec], [spec]) VALUES (3, N'Программирование в компьютерных системах')
GO
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (1, N'Бревнов', N'email: znosov@vasilev.ru', N'+7 (922) 325-12-93', N'840377, Рязанская область, город Щёлково, пл. Буха', N'сен  2 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (2, N'Башаров', N'email: pgorbacev@vasilev.net', N'(812) 214-73-94', N'606990, Новосибирская область, город Павловский По', N'сен  3 2003 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (3, N'Кузнецов', N'email: anfisa.fedotova@tvetkov.ru', N'phone: (495) 513-93-16', N'594365, Ярославская область, город Павловский Поса', N'сен  4 2003 12:00AM', N'ПР420', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (4, N'Демин', N'diana.gorbunov@gromov.ru', N'phone: (35222) 46-54-74', N'278792, Воронежская область, город Люберцы, ул. Ко', N'сен  5 2003 12:00AM', N'ПР420', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (5, N'Кукушкина', N'vzimina@zdanova.com', N'phone: (35222) 92-28-68', N'429540, Мурманская область, город Воскресенск, пл.', N'сен  6 2003 12:00AM', N'ПР420', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (6, N'Крылов', N'gblokin@orlov.net', N'(812) 819-51-58', N'960726, Томская область, город Орехово-Зуево, въез', N'сен  7 2003 12:00AM', N'ПР420', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (7, N'Левченко', N'osimonova@andreeva.com', N'+7 (922) 936-37-67', N'231891, Челябинская область, город Шатура, бульвар', N'сен  8 2003 12:00AM', N'ПР420', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (8, N'Моргунов', N'dgulyev@krasilnikov.ru', N'phone: (812) 375-59-29', N'873144, Курская область, город Талдом, проезд Домо', N'сен  9 2003 12:00AM', N'ПР420', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (9, N'Петров', N'kabanov.valentina@subbotina.ru', N'(35222) 24-98-18', N'282009, Вологодская область, город Красногорск, пл', N'сен 10 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (10, N'Козлов', N'rtretykova@kozlov.ru', N'(35222) 84-44-92', N'798718, Ленинградская область, город Пушкино, буль', N'сен 11 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (11, N'Крайнов', N'email: varvara15@belousov.ru', N'(495) 223-67-97', N'775051, Иркутская область, город Серебряные Пруды,', N'сен 12 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (12, N'Сорокина', N'savina.dominika@belousova.com', N'(495) 315-25-86', N'336489, Калининградская область, город Можайск, на', N'сен 13 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (13, N'Егер', N'lnikitina@kulikova.com', N'8-800-692-72-18', N'170549, Сахалинская область, город Видное, проезд ', N'сен 14 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (14, N'Петрова', N'email: antonin19@panfilov.ru', N'phone: (812) 152-28-78', N'030119, Курганская область, город Дмитров, пер. Сл', N'сен 15 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (15, N'Жернова', N'email: rafail22@orlov.ru', N'phone: (495) 532-54-42', N'273144, Калужская область, город Наро-Фоминск, бул', N'сен 16 2003 12:00AM', N'ПР418', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (16, N'Листьев', N'hkononova@pavlova.ru', N'(495) 418-67-55', N'028936, Магаданская область, город Видное, ул. Гаг', N'сен 17 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (17, N'Башкиров', N'iskra.sergeev@zykov.com', N'8-800-656-63-99', N'513065, Рязанская область, город Одинцово, шоссе С', N'сен 18 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (18, N'Гордон', N'maiy12@koklov.net', N'(812) 364-46-64', N'376483, Калужская область, город Сергиев Посад, ул', N'сен 19 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (19, N'Энгельс', N'email: odenisov@knyzeva.ru', N'phone: (35222) 32-99-94', N'479740, Оренбургская область, город Наро-Фоминск, ', N'сен 20 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (20, N'Южный', N'tgavrilov@frolov.ru', N'phone: (35222) 24-85-54', N'393450, Тульская область, город Кашира, пр. 1905 г', N'сен 21 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (21, N'Бондаренко', N'smukina@evseev.com', N'(812) 973-88-81', N'509479, Орловская область, город Павловский Посад,', N'сен 22 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (22, N'Цветкова', N'irina.gusina@vlasova.ru', N'phone: +7 (922) 692-21-57', N'848810, Кемеровская область, город Лотошино, пер. ', N'сен 23 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (23, N'Жилкин', N'igulyeva@kostina.ru', N'(495) 979-36-66', N'221534, Орловская область, город Серебряные Пруды,', N'сен 24 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (24, N'Митин', N'blokin.sofiy@terentev.ru', N'(35222) 63-92-83', N'183744, Рязанская область, город Клин, въезд Косио', N'сен 25 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (25, N'Озерова', N'email: dyckov.veniamin@kotova.ru', N'phone: (812) 395-91-75', N'035268, Сахалинская область, город Волоколамск, пр', N'сен 26 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (26, N'Притин', N'email: subbotin.rostislav@zueva.org', N'+7 (922) 456-59-29', N'138159, Свердловская область, город Подольск, спус', N'сен 27 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (27, N'Росс', N'potapov.abram@trofimova.org', N'+7 (922) 822-88-76', N'412597, Калужская область, город Клин, пр. Гагарин', N'сен 28 2004 12:00AM', N'ИС427', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (28, N'Веселова', N'efimova.timofei@tretykova.ru', N'+7 (922) 767-84-15', N'680394, Оренбургская область, город Павловский Пос', N'сен 29 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (29, N'Ремезов', N'novikova.gleb@sestakov.ru', N'phone: (35222) 18-85-61', N'048715, Ивановская область, город Люберцы, проезд ', N'сен 30 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (30, N'Шинкаренко', N'email: sofiy.bolsakov@isakova.ru', N'phone: 8-800-153-74-46', N'244290, Астраханская область, город Талдом, проезд', N'окт  1 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (31, N'Шилкин', N'email: asiryeva@andreeva.com', N'phone: (35222) 22-47-12', N'395101, Белгородская область, город Балашиха, буль', N'окт  2 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (32, N'Монтаж', N'zakar.sazonova@gavrilov.ru', N'(495) 783-36-97', N'066594, Магаданская область, город Шаховская, спус', N'окт  3 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (33, N'Демичев', N'pmaslov@fomiceva.com', N'phone: (35222) 11-75-66', N'988899, Саратовская область, город Раменское, пр. ', N'окт  4 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (34, N'Компаниец', N'vasileva.tatyna@lebedeva.net', N'phone: (35222) 99-39-28', N'908229, Иркутская область, город Истра, бульвар Бу', N'окт  5 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (35, N'Бисс', N'email: belova.vikentii@konstantinova.net', N'phone: +7 (922) 282-82-91', N'409600, Новгородская область, город Ногинск, пл. Г', N'окт  6 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (36, N'Глинка', N'rostislav.savelev@dmitrieva.ru', N'(812) 327-52-23', N'245009, Белгородская область, город Коломна, шоссе', N'окт  7 2004 12:00AM', N'ИС428', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (37, N'Мясников', N'bkozlov@volkov.ru', N'phone: (812) 256-74-95', N'903648, Калужская область, город Воскресенск, пр. ', N'окт  8 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (38, N'Тренин', N'email: vlad.sokolov@andreev.org', N'phone: (495) 489-75-57', N'765320, Ивановская область, город Шатура, спуск Го', N'окт  9 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (39, N'Томский', N'qkolesnikova@kalinina.ru', N'phone: 8-800-617-13-37', N'126668, Ростовская область, город Зарайск, наб. Га', N'окт 10 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (40, N'Фзаров', N'anastasiy.gromov@samsonova.com', N'8-800-192-74-77', N'713016, Брянская область, город Подольск, пл. Домо', N'окт 11 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (41, N'Азаров', N'lapin.inessa@isaeva.com', N'phone: 8-800-468-91-51', N'331914, Курская область, город Ногинск, спуск Лады', N'окт 12 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (42, N'Шульгин', N'iturova@isakova.ru', N'phone: 8-800-971-62-32', N'415525, Воронежская область, город Орехово-Зуево, ', N'окт 13 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (43, N'Утюганов', N'vasilev.svetlana@saskov.org', N'phone: (35222) 89-78-68', N'481781, Астраханская область, город Орехово-Зуево,', N'окт 14 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (44, N'Суровцев', N'email: bzykov@baranov.com', N'phone: (812) 425-28-46', N'255489, Самарская область, город Озёры, ул. Ломоно', N'окт 15 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (45, N'Смирнов', N'vasilisa99@belyev.ru', N'phone: +7 (922) 113-94-49', N'731935, Калининградская область, город Павловский ', N'окт 16 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (46, N'Смирнова', N'email: savva.rybov@kolobov.ru', N'(35222) 33-48-16', N'447811, Мурманская область, город Егорьевск, ул. Л', N'окт 17 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (47, N'Гудков', N'nsitnikova@tikonova.org', N'(495) 227-66-48', N'284236, Воронежская область, город Павловский Поса', N'окт 18 2004 12:00AM', N'ИС429', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (48, N'Гудожникова', N'kulikov.adrian@zuravlev.org', N'(812) 798-33-53', N'959793, Курская область, город Егорьевск, бульвар ', N'окт 19 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (49, N'Дакаева', N'pavel.davydova@tretykov.net', N'(495) 566-98-62', N'094869, Ленинградская область, город Ступино, наб.', N'окт 20 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (50, N'Дзвинок', N'gordei95@kirillov.ru', N'+7 (922) 329-34-28', N'217022, Ростовская область, город Озёры, ул. Домод', N'окт 21 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (51, N'Семенов', N'email: rusakov.efim@nikiforov.ru', N'8-800-628-79-67', N'423477, Мурманская область, город Кашира, бульвар ', N'окт 22 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (52, N'Соловье', N'email: karitonova.fedosy@vasileva.net', N'(35222) 26-55-64', N'860124, Иркутская область, город Егорьевск, пер. Г', N'окт 23 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (53, N'Рудопвсов', N'email: ermakov.mark@isakova.ru', N'(35222) 27-19-66', N'889757, Новосибирская область, город Раменское, бу', N'окт 24 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (54, N'Данилова', N'email: panova.klementina@bobrov.ru', N'phone: +7 (922) 859-19-97', N'084315, Амурская область, город Шаховская, наб. Че', N'окт 25 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (55, N'Серый', N'frolov.artem@zuravlev.ru', N'phone: (35222) 96-34-97', N'737175, Ростовская область, город Одинцово, ул. Ко', N'окт 26 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (56, N'Гуржий', N'email: ypotapov@kolesnikova.ru', N'phone: 8-800-234-93-22', N'672492, Калининградская область, город Москва, про', N'окт 27 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (57, N'Цируль', N'tkrylov@baranova.net', N'phone: (495) 756-36-72', N'145030, Сахалинская область, город Шатура, въезд Г', N'окт 28 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (58, N'Дибаева', N'nsitnikov@kovaleva.ru', N'+7 (922) 619-91-52', N'062489, Челябинская область, город Пушкино, въезд ', N'окт 29 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (59, N'Дрягин', N'email: vlad.molcanov@fomicev.ru', N'+7 (922) 495-46-18', N'191420, Новосибирская область, город Ногинск, пер.', N'окт 30 2004 12:00AM', N'ИС430', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (60, N'Косов', N'dorofeev.milan@vorobeva.net', N'(35222) 22-74-12', N'818676, Томская область, город Павловский Посад, у', N'окт 31 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (61, N'Лавров', N'koseleva.ylii@potapov.ru', N'phone: (35222) 66-26-65', N'046300, Орловская область, город Ступино, бульвар ', N'ноя  1 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (62, N'Леванов', N'evorontova@potapova.ru', N'phone: (812) 743-49-87', N'816260, Ивановская область, город Москва, ул. Гага', N'ноя  2 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (63, N'Пономарев', N'email: rybov.tatyna@merkuseva.com', N'(812) 421-59-75', N'078797, Мурманская область, город Коломна, пр. Гог', N'ноя  3 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (64, N'Портнов', N'larkipova@gorbunov.ru', N'(812) 229-34-18', N'339507, Московская область, город Видное, ул. Косм', N'ноя  4 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (65, N'Морозов', N'lev.efremov@frolov.ru', N'phone: +7 (922) 258-96-16', N'034623, Белгородская область, город Павловский Пос', N'ноя  5 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (66, N'Цируль', N'email: robert.serbakov@safonova.ru', N'phone: 8-800-358-54-99', N'841700, Брянская область, город Серпухов, спуск До', N'ноя  6 2004 12:00AM', N'ПР419', NULL)
INSERT [dbo].[Student2] ([idstud], [ФИО], [_Электронная почта], [_Телефон], [адрес_], [_Дата рождения_], [Группа#6], [sred_znach]) VALUES (67, N'Ненайденко', N'email: mersova@rodionova.ru', N'phone: (35222) 81-78-92', N'455463, Ярославская область, город Серпухов, пер. ', N'ноя  7 2004 12:00AM', N'ПР419', NULL)
GO
SET IDENTITY_INSERT [dbo].[Trainer] ON 

INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (1, NULL, N'Бабина', NULL, NULL, N'1', 12)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (2, NULL, N'Беляева', NULL, NULL, N'1', 6)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (3, NULL, N'Ващенко', NULL, NULL, N'2', 5)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (4, NULL, N'Журкин', NULL, NULL, N' высшая', 25)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (5, NULL, N'Иванова', NULL, NULL, N'2', 25)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (6, NULL, N'Иванова', NULL, NULL, N'2', 25)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (7, NULL, N'Кияко', NULL, NULL, N' высшая', 15)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (8, NULL, N'Кияко', NULL, NULL, N' высшая', 15)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (9, NULL, N'Краснова', NULL, NULL, N'высшая', 21)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (10, NULL, N'Мокина', NULL, NULL, N'2', 4)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (11, NULL, N'Сенин', NULL, NULL, N'1', 8)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (12, NULL, N'Сидорова', NULL, NULL, N'высшая', 20)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (13, NULL, N'Смирнова', NULL, NULL, N' высшая', 20)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (14, NULL, N'Урванцев', NULL, NULL, N' высшая', 35)
INSERT [dbo].[Trainer] ([TrainerId], [FirstName], [LastName], [DateFrom], [DateTo], [Kat], [stazh]) VALUES (15, NULL, N'Фадеева', NULL, NULL, N' высшая', 17)
SET IDENTITY_INSERT [dbo].[Trainer] OFF
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_RUP] FOREIGN KEY([id_RUP])
REFERENCES [dbo].[RUP] ([RUPId])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_RUP]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student2] FOREIGN KEY([idStud])
REFERENCES [dbo].[Student2] ([idstud])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student2]
GO
ALTER TABLE [dbo].[RUP]  WITH CHECK ADD  CONSTRAINT [FK_RUP_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([FacultyId])
GO
ALTER TABLE [dbo].[RUP] CHECK CONSTRAINT [FK_RUP_Faculty]
GO
ALTER TABLE [dbo].[RUP]  WITH CHECK ADD  CONSTRAINT [FK_RUP_Kategoria] FOREIGN KEY([КДId])
REFERENCES [dbo].[Kategoria] ([id_кат])
GO
ALTER TABLE [dbo].[RUP] CHECK CONSTRAINT [FK_RUP_Kategoria]
GO
ALTER TABLE [dbo].[RUP]  WITH CHECK ADD  CONSTRAINT [FK_RUP_spec] FOREIGN KEY([СпециальностьId])
REFERENCES [dbo].[spec] ([id_spec])
GO
ALTER TABLE [dbo].[RUP] CHECK CONSTRAINT [FK_RUP_spec]
GO
ALTER TABLE [dbo].[RUP]  WITH CHECK ADD  CONSTRAINT [FK_RUP_Trainer] FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Trainer] ([TrainerId])
GO
ALTER TABLE [dbo].[RUP] CHECK CONSTRAINT [FK_RUP_Trainer]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RUP"
            Begin Extent = 
               Top = 32
               Left = 266
               Bottom = 162
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 75
               Left = 39
               Bottom = 251
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "spec"
            Begin Extent = 
               Top = 31
               Left = 508
               Bottom = 127
               Right = 682
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Grade"
            Begin Extent = 
               Top = 155
               Left = 741
               Bottom = 407
               Right = 915
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 4080
         Width = 3195
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Student2"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Grade"
            Begin Extent = 
               Top = 6
               Left = 276
               Bottom = 136
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student2"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Grade"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 136
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ведомость_оценок'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ведомость_оценок'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Grade"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Student2"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Двоечники'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Двоечники'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Trainer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "RUP"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Преподаватели_семестр'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Преподаватели_семестр'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Grade"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Student2"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Рейтинг_химия'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Рейтинг_химия'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Student2"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "spec"
            Begin Extent = 
               Top = 6
               Left = 276
               Bottom = 102
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Студенты_группа_специальность'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Студенты_группа_специальность'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Faculty"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Trainer"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "spec"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 102
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Учебная_нагрузка'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Учебная_нагрузка'
GO
USE [master]
GO
ALTER DATABASE [College] SET  READ_WRITE 
GO
