-- Crear base de datos "db_prueba"
CREATE DATABASE db_prueba;

--Crear tabla "GROUP-BY_HAVING"
CREATE TABLE db_prueba.dbo.[GROUP-BY_HAVING] (
	[ID] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[Nombres] VARCHAR(255) NOT NULL,
	[Apellidos] VARCHAR(255) NOT NULL,
	[Cedula] VARCHAR(10) NOT NULL,
	[Deuda] DECIMAL NOT NULL
);

-- Seleccionar registros en la tabla
SELECT * FROM db_prueba.dbo.[GROUP-BY_HAVING] gbh;

-- Insertar datos a la tabla
INSERT INTO db_prueba.dbo.[GROUP-BY_HAVING] (Nombres, Apellidos, Cedula, Deuda)
VALUES
('Nombre1', 'Apellido1', '0123456789', 100),
('Nombre2', 'Apellido2', '0456789012', 150),
('Nombre3', 'Apellido3', '0345678901', 200),
('Nombre4', 'Apellido4', '0456789012', 250),
('Nombre5', 'Apellido5', '0567890123', 300),
('Nombre6', 'Apellido6', '0678901234', 250),
('Nombre7', 'Apellido7', '0789012345', 400),
('Nombre8', 'Apellido8', '0890123456', 450),
('Nombre9', 'Apellido9', '0901234567', 500),
('Nombre10', 'Apellido10', '0123456789', 250),
('Nombre11', 'Apellido11', '0456789012', 600),
('Nombre12', 'Apellido12', '0345678901', 650),
('Nombre13', 'Apellido13', '0456789012', 700),
('Nombre14', 'Apellido14', '0567890123', 750),
('Nombre15', 'Apellido15', '0678901234', 250),
('Nombre16', 'Apellido16', '0456789012', 850),
('Nombre17', 'Apellido17', '0890123456', 900),
('Nombre18', 'Apellido18', '0901234567', 950),
('Nombre19', 'Apellido19', '0123456789', 1000),
('Nombre20', 'Apellido20', '0234567890', 1050);

-- Enlista y cuenta el numero de veces que un se repite un
-- numero de cedula en la tabla. Para ser contado, el numero de cedula
-- debe aparecer por lo menos una sola vez. (Se enlistan y cuentan todos)
SELECT [Cedula]  , COUNT(*) AS Repetidos
FROM db_prueba.dbo.[GROUP-BY_HAVING]
GROUP BY [Cedula]
HAVING COUNT(*) > 0;

-- Enlista y cuenta el numero de veces que un se repite un
-- numero de cedula en la tabla. Para ser contado, el numero de cedula
-- debe aparecer por lo menos 3 veces.
SELECT [Cedula]  , COUNT(*) AS Repetidos
FROM db_prueba.dbo.[GROUP-BY_HAVING]
GROUP BY [Cedula]
HAVING COUNT(*) >= 3;

-- Enlista y cuenta el numero de veces que un se repite un
-- numero de cedula en la tabla. Para ser enlistado, el numero de cedula
-- debe repetirse solamente 5 veces.
SELECT [Cedula]  , COUNT(*) AS Repetidos
FROM db_prueba.dbo.[GROUP-BY_HAVING]
GROUP BY [Cedula]
HAVING COUNT(*) = 5;

