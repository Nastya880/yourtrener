USE [master]
GO
/****** Object:  Database [TrariningsBase]    Script Date: 17.11.2020 13:02:00 ******/
CREATE DATABASE [TrariningsBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrariningsBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TrariningsBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrariningsBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TrariningsBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TrariningsBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrariningsBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrariningsBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrariningsBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrariningsBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrariningsBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrariningsBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrariningsBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrariningsBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrariningsBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrariningsBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrariningsBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrariningsBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrariningsBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrariningsBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrariningsBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrariningsBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrariningsBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrariningsBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrariningsBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrariningsBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrariningsBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrariningsBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrariningsBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrariningsBase] SET RECOVERY FULL 
GO
ALTER DATABASE [TrariningsBase] SET  MULTI_USER 
GO
ALTER DATABASE [TrariningsBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrariningsBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrariningsBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrariningsBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrariningsBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrariningsBase', N'ON'
GO
ALTER DATABASE [TrariningsBase] SET QUERY_STORE = OFF
GO
USE [TrariningsBase]
GO
/****** Object:  Table [dbo].[SettingsUser]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettingsUser](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Sounds] [bit] NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [nchar](2) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Zametka] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SettingsUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatisticUser]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatisticUser](
	[Id] [int] NOT NULL,
	[UserId] [int] NULL,
	[Time] [time](7) NULL,
	[TrainingCount] [int] NULL,
 CONSTRAINT [PK_StatisticUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Training]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[Id] [int] NOT NULL,
	[TrainingCount] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NOT NULL,
	[Price] [money] NULL,
	[IsActual] [bit] NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[Time] [time](7) NULL,
	[CountLook] [int] NULL,
 CONSTRAINT [PK_Training] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingComment]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingComment](
	[Id] [int] NULL,
	[TrainingId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[CreationDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingCount]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingCount](
	[TrainingCount] [int] NOT NULL,
 CONSTRAINT [PK_TrainingCount] PRIMARY KEY CLUSTERED 
(
	[TrainingCount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingImage]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingImage](
	[Id] [int] NOT NULL,
	[TrainingId] [int] NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_TrainingImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTraining]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTraining](
	[TrainingId] [int] NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TypeOfTraining] PRIMARY KEY CLUSTERED 
(
	[TrainingId] ASC,
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeTraining]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTraining](
	[Description] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TrainingLevel] [nvarchar](50) NULL,
	[IsActual] [bit] NULL,
	[TrainingId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TypeTraining] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[surname] [nchar](10) NOT NULL,
	[name] [nvarchar](100) NULL,
	[birthday] [date] NOT NULL,
	[gender] [nchar](2) NOT NULL,
	[Id] [int] NOT NULL,
	[TrainingCountUser] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImage]    Script Date: 17.11.2020 13:02:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImage](
	[Id] [int] NOT NULL,
	[UserId] [int] NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_UserImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TypeTraining] ON 

INSERT [dbo].[TypeTraining] ([Description], [Name], [TrainingLevel], [IsActual], [TrainingId]) VALUES (N'Отличная тренировка', N'Training1', N'lite', 1, 1)
INSERT [dbo].[TypeTraining] ([Description], [Name], [TrainingLevel], [IsActual], [TrainingId]) VALUES (N'goood', N'Training2', N'medium', 0, 2)
INSERT [dbo].[TypeTraining] ([Description], [Name], [TrainingLevel], [IsActual], [TrainingId]) VALUES (N'yeeeee', N'Training3', N'hard', 1, 3)
SET IDENTITY_INSERT [dbo].[TypeTraining] OFF
GO
ALTER TABLE [dbo].[SettingsUser]  WITH CHECK ADD  CONSTRAINT [FK_SettingsUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SettingsUser] CHECK CONSTRAINT [FK_SettingsUser_User]
GO
ALTER TABLE [dbo].[StatisticUser]  WITH CHECK ADD  CONSTRAINT [FK_StatisticUser_TrainingCount] FOREIGN KEY([TrainingCount])
REFERENCES [dbo].[TrainingCount] ([TrainingCount])
GO
ALTER TABLE [dbo].[StatisticUser] CHECK CONSTRAINT [FK_StatisticUser_TrainingCount]
GO
ALTER TABLE [dbo].[StatisticUser]  WITH CHECK ADD  CONSTRAINT [FK_StatisticUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StatisticUser] CHECK CONSTRAINT [FK_StatisticUser_User]
GO
ALTER TABLE [dbo].[StatisticUser]  WITH CHECK ADD  CONSTRAINT [FK_StatisticUser_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StatisticUser] CHECK CONSTRAINT [FK_StatisticUser_User1]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [FK_Training_TrainingCount] FOREIGN KEY([TrainingCount])
REFERENCES [dbo].[TrainingCount] ([TrainingCount])
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [FK_Training_TrainingCount]
GO
ALTER TABLE [dbo].[TrainingComment]  WITH CHECK ADD  CONSTRAINT [FK_TrainingComment_Training] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training] ([Id])
GO
ALTER TABLE [dbo].[TrainingComment] CHECK CONSTRAINT [FK_TrainingComment_Training]
GO
ALTER TABLE [dbo].[TrainingImage]  WITH CHECK ADD  CONSTRAINT [FK_TrainingImage_Training] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training] ([Id])
GO
ALTER TABLE [dbo].[TrainingImage] CHECK CONSTRAINT [FK_TrainingImage_Training]
GO
ALTER TABLE [dbo].[TypeOfTraining]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTraining_Training] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTraining] CHECK CONSTRAINT [FK_TypeOfTraining_Training]
GO
ALTER TABLE [dbo].[TypeOfTraining]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTraining_TypeTraining] FOREIGN KEY([TypeName])
REFERENCES [dbo].[TypeTraining] ([Name])
GO
ALTER TABLE [dbo].[TypeOfTraining] CHECK CONSTRAINT [FK_TypeOfTraining_TypeTraining]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TrainingCount] FOREIGN KEY([TrainingCountUser])
REFERENCES [dbo].[TrainingCount] ([TrainingCount])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TrainingCount]
GO
ALTER TABLE [dbo].[UserImage]  WITH CHECK ADD  CONSTRAINT [FK_UserImage_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserImage] CHECK CONSTRAINT [FK_UserImage_User]
GO
USE [master]
GO
ALTER DATABASE [TrariningsBase] SET  READ_WRITE 
GO
