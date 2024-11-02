CREATE PROCEDURE CustomerCountry @Country NVARCHAR(15)
AS
  SELECT * FROM Customers c
  WHERE c.Country = @Country
GO

CREATE PROCEDURE InsertUpdate_Customers @CustomerID NCHAR(5), @CompanyName NVARCHAR(40), 
                                        @ContactName NVARCHAR(30),@ContactTitle NVARCHAR(30),
                                        @Address NVARCHAR(60), @City NVARCHAR(15),
                                        @Region NVARCHAR(15), @PostalCode NVARCHAR(10),
                                        @Country NVARCHAR(15), @Phone NVARCHAR(24),
                                        @Fax NVARCHAR(24) OUTPUT
AS
BEGIN
  IF EXISTS(
  	SELECT c.CustomerID FROM Customers c WHERE c.CustomerID = @CustomerID
  ) BEGIN  
  	UPDATE Customers
      SET CompanyName = @CompanyName,
          ContactName = @ContactName, ContactTitle = @ContactTitle,
          Address = @Address, City = @City, Region = @Region,
          PostalCode = @PostalCode, Country = @Country,
          Phone = @Phone, Fax = @Fax
      WHERE CustomerID = @CustomerID
      PRINT 'Se realizo la actualizacion con exito!'
  END
  ELSE BEGIN
    INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax) 
    VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)
    PRINT 'Se registro un nuevo cliente!'
  END
  SELECT * FROM Customers c WHERE c.CustomerID = @CustomerID
END
GO

