USE Northwind;
GO

DECLARE @ID_Employee INT = 5
SELECT EmployeeID, FirstName, LastName, dbo.NumOrdersByEmployees(@ID_Employee) AS NumOrders 
FROM Employees 
WHERE EmployeeID = @ID_Employee
GO

DECLARE @ID_Order INT = 10248
SELECT OrderID, CustomerID, EmployeeID, OrderDate, dbo.TotalCostOrder(@ID_Order) AS Costo_Total 
FROM Orders
WHERE OrderID = @ID_Order
GO

SELECT * FROM dbo.EstadoConMayorVentas()
GO

SELECT * FROM dbo.OrdenesPorCliente()
GO

SELECT * FROM dbo.OrdenesPorCliente('BLAUS')
GO

SELECT * FROM dbo.ClientesAtendidos(3)
GO

