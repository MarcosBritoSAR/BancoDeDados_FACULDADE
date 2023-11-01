----------------------VIWE--------------------
CREATE VIEW nomeQualquer
AS 
SELECT * FROM produtos

-------TRIGGER----------------
CREATE TRIGGER Testando --NOME DA TRIGGER
ON produtos -- NOME DA TABELA REFERENTE / PODE SER UMA VIEW
FOR INSERT -- QUANDO O EVENDO ACONTECE [FOR/AFTER/INSTEAD OF] [insert/update/delete]
AS
PRINT 'BORA'

INSERT INTO produtos (Descricao, qtd, valor, status) VALUES ('TESTE', 1,1,2) 

--▪ FOR é o valor padrão e faz com o que o gatilho seja disparado junto da ação.
--▪ AFTER faz com que o disparo se dê somente após a ação que o gerou ser concluída.
--▪ INSTEAD OF faz com que o trigger seja executado no lugar da ação que o gerou.

--❑Fluxo de uma transação:
--1) Verificação de identity insert;
--2) Restrição de nulos (null);
--3) Checagem dos tipos de dados;
--4) Execução do trigger instead of (se existir esse trigger no BD) – a execução DML (insert,
--update, delete) para aqui;
--5) Restrição de chave primária (PK);
--6) Restrição de check
--7) Restrição de chave estrangeira (FK);
--8) Execução do DML (insert, update e delete) e atualização do log de transações;
--9) Execução do trigger after (se existir esse trigger no BD);
--10) Commit ou rollback da transação (confirmação)

-- O TEXTO ACIMA ME DEIXOU COM UMA DUVIDA: SERÁ QUE A INSTRUÇÃO AO ENTRAR EM UMA INSTEAD OF
--NÃO SÃO VERIFICADO OS ITENS 5,6,7,8,9,10?

CREATE TRIGGER tirandoDuvida
ON produtos
INSTEAD OF INSERT
AS 
BEGIN 
INSERT INTO produtos (Descricao, qtd, valor, status) VALUES (NULL, NULL,NULL,NULL) 
END

INSERT INTO produtos (Descricao, qtd, valor, status) VALUES ('TESTE', 1,1,2) 


-- AS RESPOISTA É NÃO. ELE VERIFICA SIM OS ITENS