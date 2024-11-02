/* 1. Crea una función que reciba el Id de un empleado (Employee) y que 
regrese el total de órdenes que ha generado.*/
CREATE FUNCTION NumOrdersByEmployees (@ID_Employee INT)
RETURNS INT
AS BEGIN
  DECLARE @NumOrders INT
  SELECT @NumOrders = COUNT(*) FROM Orders o WHERE o.EmployeeID = @ID_Employee
  RETURN @NumOrders
END
GO

/* 2. Crea una función que reciba el Id de orden (Order) y regrese el costo 
total de la orden. */
CREATE FUNCTION TotalCostOrder (@ID_Order INT)
RETURNS MONEY
AS BEGIN
  DECLARE @TotalCost MONEY
  SELECT
      @TotalCost = SUM(UnitPrice * Quantity * (1 - Discount))
  FROM [Order Details]
  WHERE OrderID = @ID_Order
  GROUP BY OrderID;
  RETURN @TotalCost
END
GO


/* 3. Crea una función que regrese el estado que vendió más productos. */
CREATE FUNCTION EstadoConMayorVentas() 
RETURNS TABLE
RETURN (
  SELECT TOP 1 Territories.TerritoryDescription AS Estado
  FROM EmployeeTerritories
  JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
  JOIN Orders ON EmployeeTerritories.EmployeeID = Orders.EmployeeID
  JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
  GROUP BY Territories.TerritoryDescription
  ORDER BY SUM([Order Details].Quantity) DESC	
)
GO


/* Investiga cuál es la sintaxis y como utilizarás la función MAX () y con ella 
crea una función que muestre el registro del empleado que haya 
sacado más dinero por sus órdenes de venta. */




/* Crea una función que reciba un Id de cliente (Customer) y regrese
todas las órdenes que ha hecho. */
CREATE FUNCTION OrdenesPorCliente(@ClienteID NCHAR(5)) 
RETURNS TABLE
RETURN (
  SELECT od.OrderID, o.OrderDate, p.ProductID, p.UnitPrice
  FROM [Order Details] od
  JOIN Products p ON od.ProductID = p.ProductID
  JOIN Orders o ON od.OrderID = o.OrderID
  JOIN Customers c ON o.CustomerID = c.CustomerID
  WHERE c.CustomerID = @ClienteID
)
GO

/* Crea una función que reciba un Id de empleado y regrese los registros 
de clientes que ha atendido. */
CREATE FUNCTION ClientesAtendidos (@EmpleadoID INT)
RETURNS TABLE
RETURN (
  SELECT c.* 
  FROM Customers c
  JOIN Orders o ON c.CustomerID = o.CustomerID
  JOIN Employees e ON o.EmployeeID = e.EmployeeID
  WHERE e.EmployeeID = @EmpleadoID
)
GO

/*  Agrega en la tabla de empleado un campo nuevo llamado 
N_Productos de tipo INT, esta se utilizará para guardar el número de 
productos que lleva vendidos. */
ALTER TABLE Employees
	ADD N_Productos INT NULL
GO

/* Crea un trigger que se dispare al insertar una nueva orden y haga un 
Update a la tabla empleados al campo N_Productos donde lleve el 
total de productos vendidos. */
CREATE TRIGGER RegistrarN_Productos
	ON [Order Details]
	INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	
END
GO
