-- Procedimientos
USE AdventureWorks2008
GO

/* a) Crea un procedimiento almacenado que devuelva todos los 
empleados (nombre y apellidos), sus puestos y el nombre del 
departamento al que corresponden a partir de una vista. No 
utilices ningún parámetro de entrada.*/
CREATE PROCEDURE EmployeeBasicData
AS BEGIN
    SELECT e.BusinessEntityID AS ID, p.FirstName, p.MiddleName, p.LastName, e.JobTitle, d.Name AS Department 
    FROM HumanResources.Employee e
    JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
    JOIN HumanResources.EmployeeDepartmentHistory ed ON e.BusinessEntityID = ed.BusinessEntityID
    JOIN HumanResources.Department d ON ed.DepartmentID = d.DepartmentID
    ORDER BY Department ASC   	
   END
GO

/* b) Crea un procedimiento almacenado que sólo devuelva el 
empleado especificado (nombre y apellidos), su puesto y el 
nombre del departamento que corresponde a partir de una vista. 
Utiliza parámetros de entrada. */
CREATE PROCEDURE EmployeeBasicDataByID @BusinessEntityID INT
AS BEGIN
    SELECT e.BusinessEntityID AS ID, p.FirstName, p.MiddleName, p.LastName, e.JobTitle, d.Name AS Department 
    FROM HumanResources.Employee e
    JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
    JOIN HumanResources.EmployeeDepartmentHistory ed ON e.BusinessEntityID = ed.BusinessEntityID
    JOIN HumanResources.Department d ON ed.DepartmentID = d.DepartmentID
    WHERE e.BusinessEntityID = @BusinessEntityID
    ORDER BY Department ASC
   END
GO

/* c) Crea el procedimiento almacenado que devuelva una lista de 
productos con precios que no superen un importe especificado. */
CREATE PROCEDURE ProductsLessEquals @MaximunPrice MONEY
AS BEGIN
    SELECT * FROM Production.Product p WHERE p.ListPrice <= @MaximunPrice
   END
GO
