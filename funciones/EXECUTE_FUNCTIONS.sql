/* Ejecucion de funciones */

/*Escalar*/
SELECT NombreProducto, 
		PrecioProducto, 
		dbo.CalcularIVA(PrecioProducto) AS IVA, 
		dbo.PrecioFinal(PrecioProducto) AS PrecioFinal
FROM Productos
GO

/*Lineal*/
SELECT * FROM dbo.CiudadClientes('Cuenca')
GO

/*Lineal de multiple sentencias*/
SELECT * FROM dbo.CiudadCliente2('Guayaquil')
GO