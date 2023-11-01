Select idPessoas, nome, cpf, status from Pessoas
select * from Pessoas

update produtos
set qtd = 95, status = 2
where idProduto = 2

update produtos set qtd = qtd - 3 where idProduto = 4
update produtos set qtd = qtd - 40 where idProduto = 5
update produtos set qtd = qtd - 10 where idProduto = 1
update produtos set qtd = qtd - 2 where idProduto = 3
update produtos set qtd = qtd - 5 where idProduto = 4
update pedidos set status = 2, valor = 236 where idPedido = 1
update pedidos set status = 2, valor = 45 where idPedido = 2

select * from produtos

delete from produtos where idProduto = 6