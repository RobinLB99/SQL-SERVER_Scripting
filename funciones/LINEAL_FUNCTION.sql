/* Funciones en linea */

CREATE FUNCTION CiudadClientes (@Ciudad NVARCHAR(25)) RETURNS TABLE
RETURN (
	SELECT Nombres, Apellidos, Ciudad
	FROM Clientes
	WHERE Ciudad = @Ciudad
)
GO