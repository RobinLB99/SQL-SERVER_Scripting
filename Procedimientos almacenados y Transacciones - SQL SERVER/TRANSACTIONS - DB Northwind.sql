BEGIN TRANSACTION
  UPDATE Customers SET PostalCode = '05965' WHERE CustomerID = 'CCMDS'
  INSERT INTO Customers (CustomerID, CompanyName)
    VALUES ('CENC2', 'Centro Comercial 2')
  IF (@@error <> 0)BEGIN
      ROLLBACK
      PRINT ('Error!')
    END
  ELSE BEGIN
      COMMIT
      PRINT ('Transaccion realizada con exito!')
    END
GO