use VendasBD

insert into pessoas values ('Dom Pedro II', '1111010', 1)
insert into pessoas values ('Teresa Cristina', '22222020', 1)
insert into pessoas values ('Luisa Barral', '33333030', 2)
insert into pessoas values ('Samuel Jesus', '44444040', 1)select * from pessoasinsert into clientes values (2, 5500, 1900)
insert into clientes values (4, 4100, 1650)
insert into funcionarios values (1, 2500,null)
insert into funcionarios values (3, 3300,null)

select * from funcionarios


--inserindo produtos ao estoque
insert into produtos values ('Lápis', 100, 1.5, 1)
insert into produtos(descricao, qtd, valor) values ('Caneta', 100, 2,1)
insert into produtos values
('Caderno' , 100, 15, 1),
('Borracha', 100, 3, 1),
('Regua' , 100, 5.5, 1)


--Inserindo pedidos
insert into pedidos (data, clienteId, funcionarioId) values (getdate(), 4, 1)
insert into pedidos (data, clienteId, funcionarioId) values (getdate(), 4, 3)
insert into pedidos (data, clienteId, funcionarioId) values (getdate(), 2, 1)

select * from itensPedido
select * from pedidos
select * from produtos

insert into itensPedido values (1, 4, 3, 3)
insert into itensPedido values (1, 5, 40, 5.3)
insert into itensPedido values (1, 1, 10, 1.5)

update itensPedido set qtd = 3, valor = 3 where pedidoId = 1 and produtoId = 4
update itensPedido set qtd = 40, valor = 5.3 where pedidoId = 1 and produtoId = 5
update itensPedido set qtd = 10, valor = 1.5 where pedidoId = 1 and produtoId = 1


insert into pedidos (data, clienteId, funcionarioId) values (getdate(), 2, 3)
insert into itensPedido values (2, 3, 2, 15)
insert into itensPedido values (2, 4, 5, 3)
update itensPedido set qtd = 2, valor = 15 where pedidoId = 2 and produtoId = 3
update itensPedido set qtd = 5, valor = 3 where pedidoId = 2 and produtoId = 4

-----------------------------------------
update produtos  set status = 1 where idProduto = 7
-----------------------------------------