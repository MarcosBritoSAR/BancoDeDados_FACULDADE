create function soma(@a int, @b int)
returns int 
as begin 
    declare @res int 
    set @res = @a+@b
    return @res
end 

SELECT '>>>', dbo.soma(1,3)

print dbo.soma(3,5)

--CRIANDO UMA TABELA TEMPORARIA
create table #testeSoma 
(
    val1 int, val2 int
) go

insert into #testeSoma values(10,2), (4,5), (93,54)

SELECT val1, val2, dbo.soma(val1, val2) as soma
from #testeSoma


--CRIANDO UMA NOVA TABELA

CREATE TABLE saldos 
(
    num_conta varchar(10) not null primary key,
    saldoInicial decimal (10,2) 
    dalsoFinal decimal (10,2)
) go

insert into saldo values
('123-3',1000,1000),
('1234-3', 1000,500),
('234-5', 400, 1000)
go


create function saldoConta(@conta varchar(10),@v1 int, @v2 int)
returns TABELA
as return
