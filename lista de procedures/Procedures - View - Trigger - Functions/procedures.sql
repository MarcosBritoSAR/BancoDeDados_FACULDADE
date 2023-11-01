------------------------------Store Procedure------------------------------------------

--Criar um store procedure para cadastrar um cliente. Lembrando que um cliente também é uma pessoa. O valor de crédito é de 25% do valor da renda.


create procedure sp_cadCliente (@nome varchar(50), @CPF varchar(12), @status int, @renda decimal(10,2))  ---indicar variáveis com @ e qual o tipo
as
begin
	---cadastrar a Pessoa
	insert into PESSOAS (nome, cpf, STATUS)
	values			(@nome, @CPF, @status)

	--- cadastrar Cliente: é necessario capturar o idPessoa gerado
	insert into CLIENTES	(pessoaId, renda, credito)
	values			(@@IDENTITY, @renda, (@renda * 0.25)) 
--- @@identity busca o ultimo id cadastrado
end

exec sp_cadCliente 'Robin', '26364147708', 1, 3500


--Criar uma procedure para cadastrar Produtos.   Cadastrar: 

CREATE PROCEDURE sp_cadProduto (@des VARCHAR(40), @valor REAL, @qtd INT, @status INT)
AS 
BEGIN
    INSERT INTO produtos (Descricao,qtd,valor,status)
    values(@des, @valor, @qtd, @status)
END

EXEC sp_cadProduto 'Impressora', 1500.00, 10, 1
EXEC sp_cadProduto 'SSD md 1Tb', 600.00, 20, 1
EXEC sp_cadProduto 'SSD 1Tb', 500.00, 10, 1


--5) Criar um store procedure para cadastrar um estagiário. Lembrando que um estagiário também é uma pessoa. 
-- (nome, cpf, status, bolsa)
-- 'Tarzan', '21436587932', 3, 1525.60
-- 'Frozen', '65878902501', 1, 1890.60

CREATE PROCEDURE sp_cadEstagiario (@nome VARCHAR(40), @cpf VARCHAR(13), @status INT, @bolsa REAL)
AS
BEGIN 
    INSERT INTO Pessoas (nome, cpf, status)
    VALUES (@nome, @cpf, @status)

    INSERT INTO estagiarios(pessoaId, bolsaEst)
    VALUES (@@IDENTITY, @bolsa)
END

EXEC sp_cadEstagiario 'Tarzan', '21436587932', 3, 1525.60
EXEC sp_cadEstagiario 'Frozen', '65878902501', 1, 1890.60


--     6) Criar uma procedure para cadastrar Funcionários.
-- Cadastrar
-- (nome, CPF, status, salario, nomesupervisor)
-- 'Loke', '12479836799', 2, 1000.00, 'Thor'
-- 'Mulher Gato', '11179836799', 2, 1500.00, 'Wonder Woman'
-- 'Pantera Negra', '15558367909', 2, 10000.00, null

ALTER PROCEDURE sp_cadFuncionario (@nome VARCHAR(40), @cpf VARCHAR(13), @status INT, @salario REAL, @nomesupervisor VARCHAR(40))
AS 
BEGIN
    DECLARE @buscaSurp INT
	DECLARE @buscaPess INT

	IF EXISTS(SELECT cpf FROM Pessoas where cpf = @cpf) 
	BEGIN
		SELECT @buscaPess = idPessoas from Pessoas where cpf = @cpf
	END
	ELSE
	BEGIN

		INSERT INTO Pessoas (nome, cpf, status)
		VALUES (@nome, @cpf, @status)
		set @buscaPess = @@IDENTITY

	END
    SELECT @buscaSurp = idPessoas FROM Pessoas WHERE nome = @nomesupervisor

    INSERT INTO funcionarios (PessoaId,salario, supId)
    VALUES (@buscaPess, @salario, @buscaSurp)
END

EXEC sp_cadFuncionario 'Loke', '12479836799', 2, 1000.00, 'Thor'
EXEC sp_cadFuncionario 'Mulher Gato', '11179836799', 2, 1500.00, 'Wonder Woman'
EXEC sp_cadFuncionario 'Pantera Negra', '15558367909', 2, 10000.00, null


select * from funcionarios
select * from Pessoas

-----exercicios---------------------------------

--1)
--Criar uma procedure para cadastrar Vendedores. Lembrando que todo Vendedor é
--uma Pessoa. Portanto, precisamos cadastrar Pessoa também.
--Cadastrar: 'Ana Maria', '18542796312', 1, 2400.00

EXEC sp_cadFuncionario 'Ana Maria', '18542796312', 1, 2400.00, null

--3) Criar uma procedure para cadastrar Produtos.
--Cadastrar:
--'Coca Cola', 100, 5.00, 2
--'Chocolate', 150, 15.00, 1
--'Sorvete de Baunilha', 200, 25.00, 3
--'Agua com gas', 50, 3.00, 2
--'Doce de Leite', 1000, 2.00, 1

--idPeoduto-Descricao, qtd, valor, status
CREATE PROCEDURE sp_cadProduto (@des VARCHAR(40), @valor REAL, @qtd INT, @status INT)
AS 
BEGIN
    INSERT INTO produtos (Descricao,qtd,valor,status)
    values(@des, @valor, @qtd, @status)
END

EXEC sp_cadProduto 'Coca Cola', 100, 5.00, 2
EXEC sp_cadProduto 'Chocolate', 150, 15.00, 1
EXEC sp_cadProduto 'Sorvete de Baunilha', 200, 25.00, 3
EXEC sp_cadProduto 'Agua com gas', 50, 3.00, 2
EXEC sp_cadProduto 'Doce de Leite', 1000, 2.00, 1