/* Funciones en linea de multiples sentencias */

CREATE FUNCTION CiudadCliente2 (@Ciudad NVARCHAR(25))
RETURNS @TablaCiudad TABLE(ClienteID BIGINT, 
							NombresCliente NVARCHAR(25), 
							ApellidosCliente NVARCHAR(25), 
							CiudadCliente NVARCHAR(25) )
BEGIN
	INSERT INTO @TablaCiudad
	SELECT ClienteID, Nombres, Apellidos, Ciudad FROM Clientes
	WHERE Ciudad = @Ciudad
	RETURN
END
GO