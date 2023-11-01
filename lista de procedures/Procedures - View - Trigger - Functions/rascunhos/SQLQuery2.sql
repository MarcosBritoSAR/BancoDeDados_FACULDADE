CREATE DATABASE VendasBD


USE VendasBD

-- status 1. ativo, 2. inativo, 3, 4 (reservados)
CREATE TABLE Pessoas
(
    idPessoas   INT            NOT NULL    IDENTITY PRIMARY KEY,
    nome        VARCHAR (50)   NOT NULL,
    cpf         VARCHAR (12)   NOT NULL    UNIQUE,
    status      INT,
    CHECK       (status in (1, 2, 3, 4))
)



CREATE TABLE clientes
(
    pessoaId        INT NOT NULL        PRIMARY KEY,
    renda           DECIMAL (10, 2)     NOT NULL DEFAULT 0,
    credito         DECIMAL (10, 2)     DEFAULT 0,
    FOREIGN KEY     (pessoaId)          REFERENCES Pessoas (idPessoas),
    CHECK           (renda>=0),
    CHECK           (credito>=0)
)

CREATE TABLE estagiarios
(
    pessoaId        INT NOT NULL        PRIMARY KEY,
    bolsaEst        DECIMAL (10, 2),
    FOREIGN KEY     (pessoaId)          REFERENCES pessoas (idPessoas),
    CHECK           (bolsaEst>=0)
)

CREATE TABLE funcionarios
(
	PessoaId        INT NOT NULL        PRIMARY key,
	salario         DECIMAL (10, 2)     NOT NULL,
	supId           int, ----id funcion�rio supervisor
	FOREIGN KEY     (pessoaId)          REFERENCES pessoas (idPessoas),
	FOREIGN KEY     (supId)             REFERENCES funcionarios (pessoaId),
	check           (salario > 0)
)

-- status 1. ativo, 2. inativo, 3, 4 reservados
CREATE TABLE produtos
(
	idProduto   INT            NOT NULL    IDENTITY        PRIMARY key,
	Descricao   VARCHAR (50)   NOT NULL,
	qtd         Int,
	valor       DECIMAL (10, 2),
	status      int,
	check       (status in (1, 2, 3, 4))
)

--status 1. ativo, 2. entregue, 3. cancelado, 4. pendente
CREATE TABLE pedidos
(
	idPedido        INT                 NOT NULL    IDENTITY        PRIMARY key,
	data            DATETIME            NOT NULL,
	valor           DECIMAL (10, 2)     check (valor > 0),
	STATUS          int check           (status in (1, 2, 3, 4)),
	clienteId       INT                 NOT NULL,
	funcionarioId   INT                 NOT NULL, 
	estagiarioId    int,
	FOREIGN KEY     (clienteId)         REFERENCES clientes (pessoaId),
	FOREIGN KEY     (funcionarioId)     REFERENCES funcionarios (PessoaId),
	FOREIGN KEY     (estagiarioId)      REFERENCES Estagiarios (pessoaid)
)

create  table itensPedido
(
	pedidoId    INT                 NOT NULL,
	produtoId   INT                 NOT NULL,
	qtd         INT                 NOT NULL,
	valor       DECIMAL (10, 2)     NOT NULL,
	PRIMARY KEY     (pedidoId, produtoId),
	FOREIGN KEY     (pedidoId)          REFERENCES pedidos (idPedido),
	FOREIGN KEY     (produtoId)         REFERENCES produtos (idProduto)
)


