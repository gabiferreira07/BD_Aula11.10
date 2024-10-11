create database ger_join;
use ger_join;

create table funcionarios(
	COD_FUNC int auto_increment primary key,
    NOME varchar(255),
    ESPECIALIDADE varchar(255)
);

create table dependentes(
	COD_DEP int auto_increment primary key,
    NOME varchar(255),
    COD_FUNC int,
    foreign key(COD_FUNC) references funcionarios(COD_FUNC)
);

insert into funcionarios(NOME, ESPECIALIDADE)
	values	("JOSÉ", "ENGENHEIRO"),
			("JOÃO", "MESTRE DE OBRAS"),
			("MARIA", "CONTABILISTA");
    
insert into dependentes(NOME, COD_FUNC)
	values	("PEDRO", 1),
			("ALICE", 1),
			("LUANA", 3);
    
select * from funcionarios;
select * from dependentes;

select funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
from funcionarios
inner join dependentes
on funcionarios.COD_FUNC = dependentes.COD_FUNC;

select funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
from funcionarios
left join dependentes
on funcionarios.COD_FUNC = dependentes.COD_FUNC;

select funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
from funcionarios
left join dependentes
on funcionarios.COD_FUNC = dependentes.COD_FUNC
where dependentes.NOME is null;

select funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
from funcionarios
right join dependentes
on funcionarios.COD_FUNC = dependentes.COD_FUNC;

select funcionarios.NOME NOME_FUNC, dependentes.NOME NOME_DEP
from funcionarios
right join dependentes
on funcionarios.COD_FUNC = dependentes.COD_FUNC
where funcionarios.COD_FUNC is null;