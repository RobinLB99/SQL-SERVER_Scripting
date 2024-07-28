/*CREACION DE BASE DE DATOS Y TABLAS*/

CREATE DATABASE [db_tienda]
GO

USE [db_tienda]
GO

CREATE TABLE [Productos] (
	[ProductoID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[NombreProducto] VARCHAR(30) NOT NULL,
	[PrecioProducto] DECIMAL(5,2) NOT NULL
)
GO

CREATE TABLE [Clientes] (
	[ClienteID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[Nombres] NVARCHAR(25) NOT NULL,
	[Apellidos] NVARCHAR(25) NOT NULL,
	[Ciudad] NVARCHAR(25) NOT NULL
)
GO

INSERT INTO [Productos] (NombreProducto, PrecioProducto)
VALUES
('Shampoo 1L', 10.57),
('Jabon 300g', 2.25),
('Pasta dental 300g', 1.32)
GO

INSERT INTO [Clientes] (Nombres, Apellidos, Ciudad)
VALUES
('Robin Joel', 'Lugo Boero', 'Guayaquil'),
('Maria Eugenia', 'Boero Collahuazo', 'Guayaquil'),
('Mario Manuel', 'Boero Sotomayor', 'Quito'),
('Cristina Andreina', 'Boero Sotomayor', 'Cuenca')
GO

SELECT * FROM [Clientes]
GO

SELECT * FROM [Productos]
GO