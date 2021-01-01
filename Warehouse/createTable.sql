CREATE DATABASE DataWarehouse
USE [DataWarehouse]
GO
CREATE TABLE [dbo].[Dim_Genre](
    [GenreId] INT PRIMARY KEY,
    [Name] NVARCHAR(130),
);

CREATE TABLE [dbo].[Dim_MediaType](
    [MediaTypeId] INT PRIMARY KEY,
    [Name] NVARCHAR(130),
);


CREATE TABLE [dbo].[Dim_Artist](
    [ArtistId] INT PRIMARY KEY,
    [Name] NVARCHAR(130),
);

CREATE TABLE [dbo].[Dim_Location]
(
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [City] NVARCHAR(50),
    [Country] NVARCHAR(50),
);


CREATE TABLE [dbo].[Dim_Album]
(
    [AlbumId] INT PRIMARY KEY NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [ArtistId] INT NOT NULL,
	[ArtistName] NVARCHAR(130)
);

CREATE TABLE DataWarehouse.[dbo].[Dim_Track]
(
	[Id] BIGINT PRIMARY KEY IDENTITY(1,1),  --Surrogate key for SCD2
    [TrackId] INT NOT NULL,
    [Name] NVARCHAR(210) NOT NULL,
    [AlbumId] INT,
	[AlbumTitle] NVARCHAR(160) NOT NULL,
    [ArtistId] INT NOT NULL,
	[ArtistName] NVARCHAR(130),
    [MediaTypeId] INT NOT NULL,
	[MediaTypeName] NVARCHAR(130),
    [GenreId] INT,
	[GenreName] NVARCHAR(130),
    [Composer] NVARCHAR(220),
    [Milliseconds] INT NOT NULL,
    [Bytes] INT,
    [UnitPrice] NUMERIC(20,2) NOT NULL,
	[AddDate] DATE,
	----SCD2
	[Start_Date_UnitPrice] DATE,
	[End_Date_UnitPrice] DATE,
	[Current_Flag_UnitPrice] bit
);
