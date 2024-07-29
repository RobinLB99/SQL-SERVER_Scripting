/* CREACION DE TRIGGERS */

USE db_tienda2
GO

/* Triggers */

/* Con FOR, se activa primero el trigger y despues la instruccion DML */
CREATE TRIGGER StockUpdate
ON OrderDetails
FOR INSERT
AS
BEGIN
  DECLARE @Cantidad INT
         ,@ProductoID BIGINT
         ,@Stock INT
  SELECT
    @Cantidad = Unidades_Adquiridas
   ,@ProductoID = ProductoID
  FROM INSERTED
  SELECT
    @Stock = StockProducto
  FROM Productos
  WHERE ProductoID = @ProductoID
  UPDATE Productos
  SET StockProducto = @Stock - @Cantidad
  WHERE ProductoID = @ProductoID
END
GO

CREATE TRIGGER CalculateSubtotalOrderDetails
ON OrderDetails
FOR INSERT
AS
BEGIN
  DECLARE @Cantidad INT
         ,@ProductoID BIGINT
         ,@InsertedID BIGINT
         ,@Subtotal DECIMAL(5,2)
         ,@PrecioUnidad DECIMAL(5,2)
         ,@IVA DECIMAL(5,2)

  SELECT
    @InsertedID = OrderID
   ,@ProductoID = ProductoID
   ,@Cantidad = Unidades_Adquiridas
   ,@Subtotal = SubTotal
  FROM INSERTED

  SELECT
    @PrecioUnidad = PrecioUnidad
  FROM Productos
  WHERE ProductoID = @ProductoID

  SET @Subtotal = dbo.CalcularPrecioConIVA15(@PrecioUnidad) * @Cantidad

  UPDATE OrderDetails
  SET SubTotal = @Subtotal
  WHERE OrderID = @InsertedID
END
GO



/* Con AFTER, se activa primero la instruccion DML y luego el Trigger */