USE [master]
GO
/****** Object:  Database [BlogDemo]    Script Date: 03/04/2017 17:16:01 ******/
CREATE DATABASE [BlogDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogDemo', FILENAME = N'D:\SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BlogDemo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogDemo_log', FILENAME = N'D:\SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BlogDemo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogDemo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogDemo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BlogDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogDemo] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogDemo] SET  MULTI_USER 
GO
ALTER DATABASE [BlogDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlogDemo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlogDemo', N'ON'
GO
USE [BlogDemo]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 03/04/2017 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](50) NOT NULL,
	[BlogContain] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-d38b2ddf-663e-4625-9d8a-7e561795e9f3]    Script Date: 03/04/2017 17:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-d38b2ddf-663e-4625-9d8a-7e561795e9f3] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-d38b2ddf-663e-4625-9d8a-7e561795e9f3]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-d38b2ddf-663e-4625-9d8a-7e561795e9f3] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-d38b2ddf-663e-4625-9d8a-7e561795e9f3') > 0)   DROP SERVICE [SqlQueryNotificationService-d38b2ddf-663e-4625-9d8a-7e561795e9f3]; if (OBJECT_ID('SqlQueryNotificationService-d38b2ddf-663e-4625-9d8a-7e561795e9f3', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-d38b2ddf-663e-4625-9d8a-7e561795e9f3]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-d38b2ddf-663e-4625-9d8a-7e561795e9f3]; END COMMIT TRANSACTION; END
GO
USE [master]
GO
ALTER DATABASE [BlogDemo] SET  READ_WRITE 
GO
