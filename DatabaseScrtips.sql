USE [master]
GO
/****** Object:  Database [inspectionapidb]    Script Date: 24/08/2022 12:30:48 ******/
CREATE DATABASE [inspectionapidb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inspectionapidb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\inspectionapidb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'inspectionapidb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\inspectionapidb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [inspectionapidb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inspectionapidb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inspectionapidb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inspectionapidb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inspectionapidb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inspectionapidb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inspectionapidb] SET ARITHABORT OFF 
GO
ALTER DATABASE [inspectionapidb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inspectionapidb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inspectionapidb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inspectionapidb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inspectionapidb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inspectionapidb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inspectionapidb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inspectionapidb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inspectionapidb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inspectionapidb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [inspectionapidb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inspectionapidb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inspectionapidb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inspectionapidb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inspectionapidb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inspectionapidb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [inspectionapidb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inspectionapidb] SET RECOVERY FULL 
GO
ALTER DATABASE [inspectionapidb] SET  MULTI_USER 
GO
ALTER DATABASE [inspectionapidb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inspectionapidb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inspectionapidb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inspectionapidb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [inspectionapidb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [inspectionapidb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'inspectionapidb', N'ON'
GO
ALTER DATABASE [inspectionapidb] SET QUERY_STORE = OFF
GO
USE [inspectionapidb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24/08/2022 12:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspections]    Script Date: 24/08/2022 12:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Comments] [nvarchar](20) NOT NULL,
	[InspectionTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Inspections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionType]    Script Date: 24/08/2022 12:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InspectionName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_InspectionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 24/08/2022 12:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusOption] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inspections_InspectionTypeId]    Script Date: 24/08/2022 12:30:52 ******/
CREATE NONCLUSTERED INDEX [IX_Inspections_InspectionTypeId] ON [dbo].[Inspections]
(
	[InspectionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inspections]  WITH CHECK ADD  CONSTRAINT [FK_Inspections_InspectionType_InspectionTypeId] FOREIGN KEY([InspectionTypeId])
REFERENCES [dbo].[InspectionType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inspections] CHECK CONSTRAINT [FK_Inspections_InspectionType_InspectionTypeId]
GO
USE [master]
GO
ALTER DATABASE [inspectionapidb] SET  READ_WRITE 
GO
