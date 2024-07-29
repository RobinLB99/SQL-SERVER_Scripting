/* CREACION DE BASE DE DATOS Y TABLAS */

CREATE DATABASE db_tienda2
GO

USE db_tienda2
GO

CREATE TABLE Empleados (
	[EmpleadoID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[Nombres] NVARCHAR(50) NOT NULL,
	[Apellidos] NVARCHAR(50) NOT NULL,
	[Cedula] NVARCHAR(10) NOT NULL,
	[Fecha_Nacimiento] DATE NOT NULL
)
GO

CREATE TABLE Clientes (
	[ClienteID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[Nombres] NVARCHAR(50) NOT NULL,
	[Apellidos] NVARCHAR(50) NOT NULL,
	[Cedula] NVARCHAR(10) NOT NULL
)
GO

CREATE TABLE Productos (
	[ProductoID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[NombreProducto] NVARCHAR(50) NOT NULL,
	[PrecioUnidad] DECIMAL(5,2) NOT NULL,
	[StockProducto] INT NOT NULL
)
GO

CREATE TABLE OrderDetails (
	[OrderID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[ProductoID] BIGINT,
	[Unidades_Adquiridas] INT NOT NULL,
	[SubTotal] DECIMAL(5,2) NOT NULL
)
GO

CREATE TABLE Invoices (
	[InvoiceID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[ClienteID] BIGINT,
	[EmpleadoID] BIGINT,
	[OrderDetailsID] BIGINT,
	[ValueTotal] DECIMAL(5,2) NOT NULL
)
GO

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_Producto_OrderDetails
FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
GO

ALTER TABLE Invoices
ADD CONSTRAINT FK_Cliente_Factura
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
GO

ALTER TABLE Invoices
ADD CONSTRAINT FK_Empleado_Factura
FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
GO

ALTER TABLE Invoices
ADD CONSTRAINT FK_Factura_OrderDetails
FOREIGN KEY (OrderDetailsID) REFERENCES OrderDetails(OrderID)
GO

