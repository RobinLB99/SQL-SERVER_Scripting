-- Trasacciones
USE AdventureWorks2008
GO

/* a) Crea una transacción que haga un INSERT y un UPDATE a las tablas 
HumanResourses.Employee, agrega una condicional de error que 
entregue mensajes de ERROR o de BIEN si se hizo un ROLLBACK o un 
COMMIT respectivamente. */
BEGIN TRANSACTION
  INSERT INTO HumanResources.Employee (BusinessEntityID, NationalIDNumber, LoginID, OrganizationNode, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, SalariedFlag,VacationHours, SickLeaveHours, CurrentFlag, rowguid)
  VALUES (1, '295847284',	'adventure-works\ken0', '/',	'Executive Officer',	'1984-03-02',	'S',	'M',	'1999-02-20',	1,	99,	69,	1,	'f01251e5-96a3-448d-981e-0f99d789110d')
  IF (@@error <> 0) BEGIN
    ROLLBACK
    PRINT ('ERROR')
  END
  ELSE BEGIN
    COMMIT
    PRINT ('BIEN')
  END
GO

/* b) Crea una transacción dentro de un procedimiento almacenado que 
realice un INSERT a la tabla de Production.Products, el procedimiento 
debe tener parámetros de entrada y la transacción debe entregar 
mensajes de ERROR o de BIEN si se hizo un ROLLBACK o un COMMIT
respectivamente.*/
DECLARE @ID INT = 5,
        @NAME NVARCHAR(50) = 'Otro producto',
        @ProductNumber NVARCHAR(25),
        @FinishedGoodsFlag BIT = 0,
        @MakeFlag BIT = 1,

BEGIN TRANSACTION 
 INSERT INTO Production.Product (ProductID,Name , ProductNumber, FinishedGoodsFlag, MakeFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
 VALUES (5, 'Otro producto', 'EC-5254', 0, 1, 'Black', 5000, 750, 0, 0, 1, '1999-11-01')
