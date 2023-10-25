use VendasBD -- Cria uma tabela pra fazer "log" de historico de preços de produtos
--será feito um insert nesta tabela toda vez que um preço for alterado
create table historicoPreco (
    idHist int not null,
    data dateTime not null,
    precoAntigo decimal(10, 2) not null,
    precoNovo decimal(10, 2) not null,
    usuario varChar(50) not null,
    primary key(idHist, data)
) 

create trigger tr_gravarPrecos
on Produtos -- tabela onde ocorrerá a transação 
after update -- transação que ira disparar disparar o trigger
as 
begin 
    insert into historicoPreco
    select D.idProduto,
     GETDATE(),
     D.valor,
     I.valor,
     SYSTEM_USER -- o systen user puxa o nome do desktop do cliente
    from delete D, insert I 
    where  D.idProduto = I.idProduto
end
go

--teste trigger-----
update PRODUTOS set valor = valor * 1.10
where idProduto = 2;

update PRODUTOS set valor = valor * 1.10
where idProduto = 5;

update PRODUTOS set valor = 1500
where idProduto = 6

----end

alter trigger tr_gravarPrecos
on produtos
after update 
as begin 
   insert into historicoPreco
    select D.idProduto,
     GETDATE(),
     D.valor,
     I.valor,
     SYSTEM_USER
    from delete D, insert I 
    where  D.idProduto = I.idProduto and D.valor != I.valor 
end

--Criar uma  trigger para qunado ocorrer um exclusão (deletar) na tablela, 
--Ocorra um atualização em vez da exclusão

create trigger tr_deletaPessoa
on Pessoas 
instead of delete 
as begin 
    update PESSOAS set status = 2
    where idPessoas in 
    (
        select idPessoa from deleted
    )
end
go

delete from PESSOAS
where idPessoas = 3
or idPessoas = 6

--Criar uma trigger para quando ocorrer uma exclusção de produto

create trigger tr_deleteProdutos 
on Produtos
instead of delete
as begin 
    update PRODUTOS set status = 2
    where idProduto in 
    (
        select idPessoa from deleted 
    )
end 
go

--atualizndo a trigger
alter trigger tr_deleteProdutos 
on Produtos
instead of delete
as 
begin update PRODUTOS set status = 2
    where idProduto in 
    (
        select idPessoa from deleted 
        where qtd = 0 and status = 1
    )
end 
go    


--Criando tr_ para finalizar pedidos

create trigger tr_finalizarPedidos
on Pedidos
after update
begin 
    update PEDIDOS set valor = 
    (
        select sum(Ipt.valor *  Ipt.qtd)
        from ITENSPEDIDO Ipt, PEDIDOS pedidos
        where Pe.idPedido = Ipt.PedidoId
        and pe.idPedido in
        (
        select idPedido 
        from inserted
        where STATUS = 2
        )
    )

end

