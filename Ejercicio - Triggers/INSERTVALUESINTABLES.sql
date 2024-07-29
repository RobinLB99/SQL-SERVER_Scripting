/* INSERSION DE VALORES EN TABLAS */

USE db_tienda2
GO

INSERT INTO Productos (NombreProducto, PrecioUnidad, StockProducto)
VALUES ('SHAMPU', 5.55, 20),
('JABON', 1.25, 20),
('PASTA DENTAL 300G', 2.25, 20),
('Cepillo Dental', 1.5, 30)
GO

INSERT INTO Empleados (Nombres, Apellidos, Cedula, Fecha_Nacimiento)
VALUES
('Robin Joel', 'Lugo Boero', '0944149020', '1999-11-02')
GO

INSERT INTO OrderDetails(ProductoID, Unidades_Adquiridas, SubTotal)
VALUES (4, 2, 0)
GO
