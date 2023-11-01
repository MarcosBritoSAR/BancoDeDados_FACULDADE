
CREATE PROCEDURE numPrimos (@num INT)
AS 
BEGIN
DECLARE @inicio INT
DECLARE @raiz INT
SET @inicio = 2
SET @raiz = SQRT(@num);

	while(@inicio < @raiz)
	begin
	    if(@num % @inicio = 0)
		begin
		print 'Nao eh um numero primo'
		return
		end
	set @inicio = @inicio +1
	end
print 'Eh um numero primo'
end

exec numPrimos 83

----

--Criar um store procedure para se o triângulo é isósceles, equilátero ou escaleno
 
 use vendasDB

 CREATE PROCEDURE tipoTriangulo (@A INT, @B INT, @C INT)
 AS 
 BEGIN 
	IF(@A = @B AND @B = @C ) 
	BEGIN 
		PRINT 'È UM EQUILÁTERO'
	END 
	ELSE IF(@A = @B OR @B = @C)
	BEGIN
		PRINT 'È UM ISÓCELES'
	END
	ELSE IF(@A <> @B AND @B <> @C)
	BEGIN
		PRINT 'É UM ESCALENO'
	END
END

EXEC tipoTriangulo 3,2,4

