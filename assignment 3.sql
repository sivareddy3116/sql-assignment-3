CREATE DATABASE ExerciseDb3
CREATE TABLE Products 
( PID INT PRIMARY KEY,
    PName NVARCHAR(50),
    PQ INT,
    PPrice DECIMAL(10, 2),
    DiscountPercent DECIMAL(5, 2),
    ManufacturingDate DATE)
	INSERT INTO Products (PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)VALUES(1, 'Laptop', 10, 800.00, 10.00, '2022-01-01')
   INSERT INTO Products (PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)VALUES(2, 'Tablet', 5, 300.00, 5.00, '2022-02-15')
   INSERT INTO Products (PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)VALUES (3, 'Smartphone', 20, 500.00, 15.00, '2022-03-10')
    INSERT INTO Products (PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)VALUES(4, 'Headphones', 30, 50.00, 8.00, '2022-04-05')
   INSERT INTO Products (PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)VALUES(5, 'Camera', 8, 1200.00, 12.50, '2022-05-20')
   select * from Products

   CREATE FUNCTION dbo.CalculateDiscountedValue (
    @Price DECIMAL(10, 2),
    @DiscountPercent DECIMAL(5, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @DiscountedValue DECIMAL(10, 2);

    SET @DiscountedValue = @Price - (@Price * @DiscountPercent / 100);

    RETURN @DiscountedValue;
END;

SELECT
    PID,
    PPrice AS Price,
    DiscountPercent AS Discount,
    dbo.CalculateDiscountedValue(PPrice, DiscountPercent) AS PriceAfterDiscount
FROM
    Products;