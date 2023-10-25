--Criando a primeira function 

create function fcRetornaNomeCliente (@idCliente int)
returns varchar(50)
as
begin 
    declare @retorno varchar(50)
    set @retorno = 
    (
        SELECT p.nome
        FROM Pessoas P 
        WHERE p.idPessoas = @idCliente
    )
    RETURN @retorno
END

SELECT nomeCli = dbo.fcRetornaNomeCliente(3)

---retornando uma tabela 

create funcition fcRetornaPreco (@preco real)
returns TABLE 
as 
    return 
    (
        SELECT id.Codigo, descricao, Produto, vlaor.preco
        from produtos 
        where valor > @preco
    )

--Retornando um tabela temporaria
