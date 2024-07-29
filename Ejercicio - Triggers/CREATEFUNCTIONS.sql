/* CREACION DE FUNCIONES */

USE db_tienda2
GO

/* Funciones */
CREATE FUNCTION CalcularPrecioConIVA15 (@PrecioUnidad DECIMAL(5, 2))
RETURNS DECIMAL(5, 2)
AS
BEGIN
  DECLARE @PrecioFinal DECIMAL(5, 2)
  SET @PrecioFinal = @PrecioUnidad * 0.15
  RETURN @PrecioUnidad
END
GO