USE [master]
GO
/****** Object:  Database [onlineShop]    Script Date: 10/14/2022 1:45:08 AM ******/
CREATE DATABASE [onlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\onlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\onlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [onlineShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [onlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [onlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [onlineShop] SET QUERY_STORE = OFF
GO
USE [onlineShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/14/2022 1:45:09 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](100) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keywords]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keywords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Keywords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFeatures]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFeatures](
	[ProductId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
 CONSTRAINT [PK_ProductFeatures] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductKeywords]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductKeywords](
	[ProductId] [int] NOT NULL,
	[KeywordId] [int] NOT NULL,
 CONSTRAINT [PK_ProductKeywords] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[KeywordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProdId] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 10/14/2022 1:45:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221012155456_InitialData', N'5.0.17')
GO
INSERT [dbo].[Carts] ([UserId], [ProductId], [Quantity], [Id]) VALUES (1, 5, 3, 1)
INSERT [dbo].[Carts] ([UserId], [ProductId], [Quantity], [Id]) VALUES (1, 11, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (29, N'accessories', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (30, N'apparel', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (31, N'drinkware', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (32, N'headgear', 29)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (33, N'kid''s', 30)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (34, N'lifestyle', 30)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([Id], [Text]) VALUES (17, N'8 Android stickers')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (18, N'White colored sticker sheet')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (19, N'Made of wood')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (20, N'2.5 x 2.5 inch cube')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (21, N'6.75 inch tall')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (22, N'Recommended for Ages 3+')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (23, N'Pack contains two sticker sheets')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (24, N'Each Sheet has different emojis')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (25, N'Heavy weight brushed twill')
INSERT [dbo].[Features] ([Id], [Text]) VALUES (26, N'Adjustable velcro closure')
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Url], [ProductId]) VALUES (3, N'https://picsum.photos/640/360', 5)
INSERT [dbo].[Images] ([Id], [Url], [ProductId]) VALUES (4, N'https://picsum.photos/640/360', 5)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Keywords] ON 

INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (73, N'Android Small Removable Sticker Sheet')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (74, N'android stickers')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (75, N'sticker sheets')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (76, N'removable sticker sheets')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (77, N'small sticker sheet')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (78, N'android small sticker sheets')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (79, N'Android Sheet')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (80, N'Android Large Removable Sticker Sheet')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (81, N'large sticker sheet')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (82, N'Google Bot')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (83, N'google bot')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (84, N'bots')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (85, N'natural bots')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (86, N'wood bot')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (87, N'google wood bot')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (88, N'Google Emoji Sticker Pack')
INSERT [dbo].[Keywords] ([Id], [Text]) VALUES (89, N'Google sticker pack')
SET IDENTITY_INSERT [dbo].[Keywords] OFF
GO
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (5, 17)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (5, 18)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (5, 19)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (11, 20)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (11, 21)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (11, 22)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (15, 23)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (15, 24)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureId]) VALUES (15, 25)
GO
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (5, 73)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (5, 74)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (5, 75)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (5, 76)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (5, 77)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (5, 78)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (11, 80)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (11, 81)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (15, 82)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (15, 83)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (15, 84)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (15, 85)
INSERT [dbo].[ProductKeywords] ([ProductId], [KeywordId]) VALUES (15, 86)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProdId], [Name], [Description], [Url], [Price], [CategoryId]) VALUES (5, N'GGOEAFKA087599', N'Android Small Removable Sticker Sheet', N'Show your Android pride by placing these 8 fun stickers on your technology products or accessories!', N'Android+Small+Removable+Sticker+Sheet', CAST(2.99 AS Decimal(18, 2)), 30)
INSERT [dbo].[Products] ([Id], [ProdId], [Name], [Description], [Url], [Price], [CategoryId]) VALUES (11, N'GGOEGHPB071610', N'Android Large Removable Sticker Sheet', N'Show your quirky side by placing these fun Android stickers on your personal belongings.', N'Android+Large+Removable+Sticker+Sheet', CAST(2.99 AS Decimal(18, 2)), 31)
INSERT [dbo].[Products] ([Id], [ProdId], [Name], [Description], [Url], [Price], [CategoryId]) VALUES (15, N'GGOEGEBK094499', N'Google Bot', N'This Google Bot can hold multiple poses making it a fun toy for all. Fold the Google Bot', N'Google+Bot', CAST(9.99 AS Decimal(18, 2)), 32)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [Password]) VALUES (1, N'jovanabosnic@gmail.com', N'Jovana', N'Bosnic', N'sifra123')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 5)
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_ParentId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_ParentId] ON [dbo].[Categories]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Images_ProductId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Images_ProductId] ON [dbo].[Images]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductFeatures_FeatureId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductFeatures_FeatureId] ON [dbo].[ProductFeatures]
(
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductKeywords_KeywordId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductKeywords_KeywordId] ON [dbo].[ProductKeywords]
(
	[KeywordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_ProdId]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_ProdId] ON [dbo].[Products]
(
	[ProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 10/14/2022 1:45:09 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_Features_FeatureId] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Features] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_Features_FeatureId]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductKeywords]  WITH CHECK ADD  CONSTRAINT [FK_ProductKeywords_Keywords_KeywordId] FOREIGN KEY([KeywordId])
REFERENCES [dbo].[Keywords] ([Id])
GO
ALTER TABLE [dbo].[ProductKeywords] CHECK CONSTRAINT [FK_ProductKeywords_Keywords_KeywordId]
GO
ALTER TABLE [dbo].[ProductKeywords]  WITH CHECK ADD  CONSTRAINT [FK_ProductKeywords_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductKeywords] CHECK CONSTRAINT [FK_ProductKeywords_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [onlineShop] SET  READ_WRITE 
GO
