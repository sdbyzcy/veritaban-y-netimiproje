USE [master]
GO

/****** Object:  Database [proje_odevi]    Script Date: 10.05.2023 17:29:13 ******/
DROP DATABASE [proje_odevi]
GO

/****** Object:  Database [proje_odevi]    Script Date: 10.05.2023 17:29:13 ******/
CREATE DATABASE [proje_odevi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proje_odevi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proje_odevi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proje_odevi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proje_odevi_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proje_odevi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [proje_odevi] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [proje_odevi] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [proje_odevi] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [proje_odevi] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [proje_odevi] SET ARITHABORT OFF 
GO

ALTER DATABASE [proje_odevi] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [proje_odevi] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [proje_odevi] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [proje_odevi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [proje_odevi] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [proje_odevi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [proje_odevi] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [proje_odevi] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [proje_odevi] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [proje_odevi] SET  DISABLE_BROKER 
GO

ALTER DATABASE [proje_odevi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [proje_odevi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [proje_odevi] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [proje_odevi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [proje_odevi] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [proje_odevi] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [proje_odevi] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [proje_odevi] SET RECOVERY FULL 
GO

ALTER DATABASE [proje_odevi] SET  MULTI_USER 
GO

ALTER DATABASE [proje_odevi] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [proje_odevi] SET DB_CHAINING OFF 
GO

ALTER DATABASE [proje_odevi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [proje_odevi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [proje_odevi] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [proje_odevi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [proje_odevi] SET QUERY_STORE = OFF
GO

ALTER DATABASE [proje_odevi] SET  READ_WRITE 
GO

