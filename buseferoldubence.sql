USE [master]
GO

IF DB_ID('proje_odevi') IS NOT NULL
BEGIN
    ALTER DATABASE [proje_odevi] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [proje_odevi];
END
GO

CREATE DATABASE [proje_odevi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proje_odevi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proje_odevi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proje_odevi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proje_odevi_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT;
GO

ALTER DATABASE [proje_odevi] SET COMPATIBILITY_LEVEL = 150;
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
    EXEC [proje_odevi].[dbo].[sp_fulltext_database] @action = 'enable';
END;
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
EXEC sys.sp_db_vardecimal_storage_format N'proje_odevi', N'ON'
GO
ALTER DATABASE [proje_odevi] SET QUERY_STORE = OFF
GO
USE [proje_odevi]
GO
/****** Object:  Table [dbo].[cinsiyet]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cinsiyet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nchar](10) NOT NULL,
 CONSTRAINT [PK_cinsiyet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategori]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_kategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteri]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NOT NULL,
	[soyadi] [nvarchar](50) NOT NULL,
	[telno] [varchar](10) NOT NULL,
	[email] [nvarchar](50) NULL,
	[adres] [nvarchar](max) NULL,
	[cinsiyetID] [int] NULL,
 CONSTRAINT [PK_musteri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personel]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NOT NULL,
	[soyadi] [nvarchar](50) NOT NULL,
	[telno] [varchar](10) NOT NULL,
	[adres] [nvarchar](max) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[cinsiyetID] [int] NOT NULL,
	[hizmet_alaniID] [int] NULL,
 CONSTRAINT [PK_personel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personel_hizmet_alani]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personel_hizmet_alani](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[hizmet_alani] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_personel_hizmet_alani] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personel_satis]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personel_satis](
	[personelID] [int] NOT NULL,
	[satisID] [int] NOT NULL,
 CONSTRAINT [PK_personel_satis] PRIMARY KEY CLUSTERED 
(
	[personelID] ASC,
	[satisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satis]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[musteriID] [int] NOT NULL,
	[tarih] [datetime] NOT NULL,
	[tutar] [money] NOT NULL,
 CONSTRAINT [PK_satis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satis_detay]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satis_detay](
	[satisID] [int] IDENTITY(1,1) NOT NULL,
	[urunID] [int] NOT NULL,
	[miktar] [tinyint] NOT NULL,
	[birim_fiyat] [money] NOT NULL,
	[toplam_fiyat] [money] NOT NULL,
	[musteriID] [int] NOT NULL,
	[personelID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urunler]    Script Date: 10.05.2023 18:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nchar](10) NOT NULL,
	[kategoriID] [int] NOT NULL,
	[fiyat] [smallmoney] NOT NULL,
	[stok] [int] NOT NULL,
	[cinsiyetID] [int] NOT NULL,
	[aciklama] [nvarchar](max) NULL,
	[urun_resmi] [image] NULL,
 CONSTRAINT [PK_urunler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cinsiyet] ON 

INSERT [dbo].[cinsiyet] ([ID], [ad]) VALUES (1, N'Kadýn     ')
INSERT [dbo].[cinsiyet] ([ID], [ad]) VALUES (2, N'Erkek     ')
INSERT [dbo].[cinsiyet] ([ID], [ad]) VALUES (3, N'Unisex    ')
SET IDENTITY_INSERT [dbo].[cinsiyet] OFF
GO
SET IDENTITY_INSERT [dbo].[kategori] ON 

INSERT [dbo].[kategori] ([ID], [adi]) VALUES (1, N'jean')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (2, N'pantolon')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (3, N'tiþört')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (4, N'elbise')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (5, N'etek')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (6, N'þort')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (7, N'gömlek')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (8, N'sweatshirt')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (9, N'eþofman altý')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (10, N'triko')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (11, N'ceket')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (12, N'çanta')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (13, N'aksesuar')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (14, N'bluz')
INSERT [dbo].[kategori] ([ID], [adi]) VALUES (15, N'çocuk')
SET IDENTITY_INSERT [dbo].[kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[personel] ON 

INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (1, N'Selin ', N'Aydýn', N'5522266226', N'Beþiktaþ, Yýldýz Mahallesi, Balmumcu Caddesi, No: 25', N'selinaydin@gmail.com', 1, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (2, N'Eren ', N'Aksoy', N'5546287859', N'Kadýköy, Moda Mahallesi, Moda Caddesi, No: 46/1', N'erenaksoyy@gmail.com', 2, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (3, N'Deniz', N'Yýldýrým', N'5034138945', N'Þiþli, Harbiye Mahallesi, Cumhuriyet Caddesi, No: 123', N'denizzyldrm@gmail.com', 2, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (4, N'Esra ', N'Kaya', N'5324569834', N'Üsküdar, Kuzguncuk Mahallesi, Kuzguncuk Caddesi, No: 67/2', N'kayaesra@gmail.com', 1, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (5, N'Arda', N'Aydýn', N'5546814430', N'Beyoðlu, Ýstiklal Mahallesi, Ýstiklal Caddesi, No: 45', N'ardaaydýn@gmail.com', 2, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (6, N'Ceren', N'Demir', N'5068739672', N'Fatih, Sultanahmet Mahallesi, Divanyolu Caddesi, No: 76/3', N'dmrcrn@gmail.com', 1, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (7, N'Emre', N'Þimþek', N'5547839834', N'Bakýrköy, Zeytinlik Mahallesi, Zeytinlik Caddesi, No: 12/5
', N'smskemre@gmail.com', 2, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (8, N'Gizem', N'Öztürk', N'5967236394', N'Beykoz, Anadolu Kavaðý Mahallesi, Anadolu Kavaðý Yolu, No: 34
', N'gizemozturk@gmail.com', 1, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (9, N'Burak', N'Yýlmaz', N'5327839676', N'Sarýyer, Rumeli Kavaðý Mahallesi, Rumeli Kavaðý Yolu, No: 56/2', N'ylmzburakk@gmail.com', 2, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (10, N'Elif ', N'Özdemir', N'5562389647', N'Kartal, Yakacýk Mahallesi, Yakacýk Caddesi, No: 98/1', N'elfozdemr@gmail.com', 1, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (12, N'Alper', N'Doðan', N'5328946573', N'Maltepe, Baþýbüyük Mahallesi, Baþýbüyük Caddesi, No: 23/4', N'alperdogan@gmail.com', 2, NULL)
INSERT [dbo].[personel] ([ID], [adi], [soyadi], [telno], [adres], [email], [cinsiyetID], [hizmet_alaniID]) VALUES (13, N'Seda', N'Demirci', N'5547820952', N'Ümraniye, Çakmak Mahallesi, Çakmak Caddesi, No: 78/2', N'demircisedaa@gmail.com', 1, NULL)
SET IDENTITY_INSERT [dbo].[personel] OFF
GO
SET IDENTITY_INSERT [dbo].[personel_hizmet_alani] ON 

INSERT [dbo].[personel_hizmet_alani] ([ID], [hizmet_alani]) VALUES (1, N'1. Maðaza Müdürü')
INSERT [dbo].[personel_hizmet_alani] ([ID], [hizmet_alani]) VALUES (2, N'2. Maðaza Müdürü')
INSERT [dbo].[personel_hizmet_alani] ([ID], [hizmet_alani]) VALUES (3, N'Müdür Yardýmcýsý')
INSERT [dbo].[personel_hizmet_alani] ([ID], [hizmet_alani]) VALUES (4, N'Kasiyer')
INSERT [dbo].[personel_hizmet_alani] ([ID], [hizmet_alani]) VALUES (5, N'Depo Görevlisi')
INSERT [dbo].[personel_hizmet_alani] ([ID], [hizmet_alani]) VALUES (6, N'Satýþ Danýþmaný')
SET IDENTITY_INSERT [dbo].[personel_hizmet_alani] OFF
GO
SET IDENTITY_INSERT [dbo].[urunler] ON 

INSERT [dbo].[urunler] ([ID], [adi], [kategoriID], [fiyat], [stok], [cinsiyetID], [aciklama], [urun_resmi]) VALUES (3, N'tisort    ', 3, 299.0000, 50, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[urunler] OFF
GO
ALTER TABLE [dbo].[satis] ADD  CONSTRAINT [DF_satis_tarih]  DEFAULT (getdate()) FOR [tarih]
GO
ALTER TABLE [dbo].[musteri]  WITH CHECK ADD  CONSTRAINT [FK_musteri_cinsiyet] FOREIGN KEY([cinsiyetID])
REFERENCES [dbo].[cinsiyet] ([ID])
GO
ALTER TABLE [dbo].[musteri] CHECK CONSTRAINT [FK_musteri_cinsiyet]
GO
ALTER TABLE [dbo].[personel]  WITH CHECK ADD  CONSTRAINT [FK_personel_cinsiyet] FOREIGN KEY([cinsiyetID])
REFERENCES [dbo].[cinsiyet] ([ID])
GO
ALTER TABLE [dbo].[personel] CHECK CONSTRAINT [FK_personel_cinsiyet]
GO
ALTER TABLE [dbo].[personel]  WITH CHECK ADD  CONSTRAINT [FK_personel_personel_hizmet_alani] FOREIGN KEY([hizmet_alaniID])
REFERENCES [dbo].[personel_hizmet_alani] ([ID])
GO
ALTER TABLE [dbo].[personel] CHECK CONSTRAINT [FK_personel_personel_hizmet_alani]
GO
ALTER TABLE [dbo].[personel_satis]  WITH CHECK ADD  CONSTRAINT [FK_personel_satis_personel] FOREIGN KEY([personelID])
REFERENCES [dbo].[personel] ([ID])
GO
ALTER TABLE [dbo].[personel_satis] CHECK CONSTRAINT [FK_personel_satis_personel]
GO
ALTER TABLE [dbo].[personel_satis]  WITH CHECK ADD  CONSTRAINT [FK_personel_satis_satis] FOREIGN KEY([satisID])
REFERENCES [dbo].[satis] ([ID])
GO
ALTER TABLE [dbo].[personel_satis] CHECK CONSTRAINT [FK_personel_satis_satis]
GO
ALTER TABLE [dbo].[satis]  WITH CHECK ADD  CONSTRAINT [FK_satis_musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[musteri] ([ID])
GO
ALTER TABLE [dbo].[satis] CHECK CONSTRAINT [FK_satis_musteri]
GO
ALTER TABLE [dbo].[satis_detay]  WITH CHECK ADD  CONSTRAINT [FK_satis_detay_musteri] FOREIGN KEY([musteriID])
REFERENCES [dbo].[musteri] ([ID])
GO
ALTER TABLE [dbo].[satis_detay] CHECK CONSTRAINT [FK_satis_detay_musteri]
GO
ALTER TABLE [dbo].[satis_detay]  WITH CHECK ADD  CONSTRAINT [FK_satis_detay_personel] FOREIGN KEY([personelID])
REFERENCES [dbo].[personel] ([ID])
GO
ALTER TABLE [dbo].[satis_detay] CHECK CONSTRAINT [FK_satis_detay_personel]
GO
ALTER TABLE [dbo].[satis_detay]  WITH CHECK ADD  CONSTRAINT [FK_satis_detay_satis] FOREIGN KEY([satisID])
REFERENCES [dbo].[satis] ([ID])
GO
ALTER TABLE [dbo].[satis_detay] CHECK CONSTRAINT [FK_satis_detay_satis]
GO
ALTER TABLE [dbo].[satis_detay]  WITH CHECK ADD  CONSTRAINT [FK_satis_detay_urunler] FOREIGN KEY([urunID])
REFERENCES [dbo].[urunler] ([ID])
GO
ALTER TABLE [dbo].[satis_detay] CHECK CONSTRAINT [FK_satis_detay_urunler]
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD  CONSTRAINT [FK_urunler_cinsiyet] FOREIGN KEY([cinsiyetID])
REFERENCES [dbo].[cinsiyet] ([ID])
GO
ALTER TABLE [dbo].[urunler] CHECK CONSTRAINT [FK_urunler_cinsiyet]
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD  CONSTRAINT [FK_urunler_kategori] FOREIGN KEY([kategoriID])
REFERENCES [dbo].[kategori] ([ID])
GO
ALTER TABLE [dbo].[urunler] CHECK CONSTRAINT [FK_urunler_kategori]
GO
USE [master]
GO
ALTER DATABASE [proje_odevi] SET  READ_WRITE 
GO