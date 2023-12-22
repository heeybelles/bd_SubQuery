/*EXEMPLO 1*/

create database bd_venda;
use bd_venda;

create table tb_categoria_produto(
id_categoria int primary key auto_increment,
nm_categoria varchar(30) not null
);

create table tb_produto(
id_produto int primary key auto_increment,
nm_produto varchar(30) not null,
vl_preco decimal(5,2) not null,
fk_id_categoria int,
foreign key (fk_id_categoria) references tb_categoria_produto(id_categoria)
);

create table tb_venda_produto(
id_venda_produto int primary key auto_increment,
vl_preco decimal(5,2) not null,
dt_venda date,
fk_id_produto int,
foreign key (fk_id_produto) references tb_produto(id_produto)
);
/*Insert do bd_vendas*/
insert into  tb_categoria_produto(id_categoria,nm_categoria)
values (null,'Infantil'),(null,'Informatica'),(null,'Educacional') ;

select *from tb_categoria_produto;

insert into  tb_produto(id_produto,nm_produto,vl_preco,fk_id_categoria)
values (null,'Bola','35.00',1),(null,'Patinete','120.00',1),(null,'Carrinho','15.00',1),
(null,'Skate','296.00',1),(null,'Notebook','500.00',2),(null,'Monitor LG 19','450.00',2),
(null,'O Diário de Anne Frank','45.00',3),(null,'O dia do Curinga','65.00',3),(null,'O mundo de Sofia','48.00',3),
 (null,'Através do Espelho','38.00',3);
 
 select *from tb_produto;
 
 insert into tb_venda_produto(id_venda_produto,vl_preco,dt_venda,fk_id_produto)
values (null,'35.00','2018-05-15',1),
(null,'35.00','2018-06-15',1),
(null,'35.00','2018-07-15',1),
(null,'120.00','2018-07-15',2), 
(null,'120.00','2018-07-14',2),
(null,'15.00','2018-07-15',3),   
(null,'45.00','2018-07-15',7),
(null,'65.00','2018-07-15',8),
(null,'48.00','2018-07-16',9),
(null,'3500.00','2018-07-16',5),
(null,'3500.00','2018-07-16',5),
(null,'450.00','2018-07-16',6)
 ;

insert into tb_venda_produto(id_venda_produto ,vl_preco,dt_venda,fk_id_produto)
values (null,35.00,'2018-05-15',1),
(null,35.00,'2018-06-15',1),
(null,35.00,'2018-07-15',1),
(null,'120.00','2018-07-15',2),
(null,'120.00','2018-07-14',2),
(null,'15.00','2018-07-15',3),   
(null,'45.00','2018-07-15',7),
(null,'65.00','2018-07-15',8),
(null,'48.00','2018-07-16',9),
(null,'3500.00','2018-07-16',5),
(null,'3500.00','2018-07-16',5),
(null,'450.00','2018-07-16',6);


select *from tb_venda_produto;

/*Insere valores de uma outra consulta,ou seja, da tabela supervisosr*/


SELECT    /*Filtra pesquisa */
 nm_produto,/*É informado o nome das colunas */
 vl_preco
FROM  /*Puxar colunas da tabela produto */
 tb_produto
WHERE   /*Condição de puxar somente resultados do valor coluna preço */
 vl_preco > (  /*trazidos somente resultados
que o valor da coluna preco seja maior que o resultado do select
da linha 8 */
SELECT
 AVG(vl_preco)  /*Traz a média do valor do preço*/
FROM
)
 
 
 SELECT  /*Filtra pesquisa */
 id_produto,    /*É informado o nome das colunas */
 nm_produto,
 MAX(vl_preco) as MAIOR /*Solicita o valor máximo da coluna total_produto*/
FROM (  /*É informado  que a coluna será feita em um outro select */
 SELECT 
 P.id_produto,
 P.nm_produto as P, /*É apelidado as tabelas*/
 (SELECT
 COUNT(VP.id_produto) /*É solicitado a contagem do id_produto*/
 FROM  /* da tabela venda_produto */
tb_venda_produto as VP
 WHERE    
 P.id_produto = VP.id_produto  /*Compara as chaves primária e estrangeira*/
 GROUP BY   /*agrupa o resultado pelo id do produto*/
 P.id_produto
 ) as TOTAL_VENDIDO /*Define que  a tabela se chamará Total_vendido*/
 FROM
 tb_produto as P
 GROUP BY
 P.id_produto
) as /*Atribui um ALIAS para a consulta que esta sendo
utilizada como tabela.8*/

/*EXEMPLO 2*/

create database bd_empresa;
use bd_empresa;

create table tb_gerente(
id_gerente int primary key auto_increment,
nm_gerente varchar(45) not null,
nm_departamento varchar(50) not null,
dt_admissao date
);

create table tb_supervisor(
id_supervisor int primary key auto_increment,
nm_supervisor varchar(45) not null,
nm_departamento varchar(50) not null,
dt_admissao date
);

insert into tb_gerente(id_gerente,nm_gerente,nm_departamento,dt_admissao)values
(null,'Enrique Santos','Tecnologia','2008-09-01'),
(null,'Nadia Cristina','Contratos','2007-05-01');
select *from tb_gerente;

insert into tb_supervisor(id_supervisor,nm_supervisor,nm_departamento,dt_admissao)values
(null,'Marcus Vinicius','Administracao','2012-05-05'),
(null,'Ana Clara','Recepcao','2015-04-01'),
(null,'Kelly Cristina','Faculdade','2015-01-01'),
(null,'Michele Francisca','Faculdade','2017-01-01'),
(null,'Ana Flavia','Comercial','2017-02-01'),
(null,'Sarah Camila','Comercial','2017-01-01')
;
select *from tb_supervisor;

INSERT INTO tb_gerente /*Insere valores na tabela gerente*/ (nm_gerente,nm_departamento,dt_admissao) 
SELECT nm_supervisor,nm_departamento,dt_admissao /*Insere valores de uma outra consulta,ou seja, da tabela supervisor*/
FROM tb_supervisor
 WHERE YEAR(dt_admissao)<2016; /*Com a condição que a data de admissão seja menor que o ano de 2016*/
 
 /*EXEMPLO 3*/

create database bd_servicos;
use bd_servicos;

create table tb_projetos(
id_projeto int auto_increment,
nm_titulo varchar(45) not null,
dt_projeto date not null,
ds_url varchar(100)
);

insert into tb_projetos(id_projeto, nm_titulo, dt_projeto, ds_url) values
(null, 'Criando uma aplicação com React', '2018-04-10', 'https://www.devmedia.com.br/exemplo/api-restreact-mobile-aplicacao-completa-gotour/78'),
(null, 'API RestFUL com Lumen', '2018-05-10', 'https://www.devmedia.com.br/exemplo/criandouma-api-restful-com-lumen/71'),
(null, 'Consumindouma API RestFUL com Laravel', '2018-05-20', 'https://www.devmedia.com.br/exemplo/projetogotour-cliente-web-para-a-api-de-moderacao-deuma-agencia-de-turismo/72'),
(null, 'Documentação SQL', '2028-05-21', 'https://www.devmedia.com.br/exemplo/documentacao-sql/76');


create table tb_usuario(
id_usuario int auto_increment,
nm_usuario varchar(45)
);

insert into tb_usuario(id_usuario, nm_usuario) values
(null, 'Marcos Jose'),
(null, 'Alice da Silva'),
(null, 'Felipe Abraao'),
(null, 'Camila Souza'),
(null, 'João Vitor'),
(null, 'Bianca Fatima');


create table tb_comentario(
id_comentario int auto_increment,
ds_comentario varchar(100) not null,
dt_comentario date not null,
fk_id_projeto int,
fk_id_usuario int,
foreign key (fk_id_projeto) references tb_projetos (id_projeto),
foreign key (fk_id_usuario) references tb_usuario (id_usuario)
);


insert into tb_comentario(id_comentario, ds_comentario, dt_comentario, fk_id_projeto, fk_id_usuario) values
(null, 'Muito legal essa aplicação! Adorei usar o React', '2018-04-10', null, null),
(null, 'React é muito simples! Curti o projeto! parabéns!', '2018-05-10', null, null),
(null, 'Muito top!', '2018-05-20', null, null),
(null, 'Parabéns aos envolvidos!', '2018-05-20', null, null),
(null, 'Muito legal, sempre gostei do Laravel.', '2018-05-20', null, null),
(null, 'Interessante a forma de recueprar as informações. Não sabia. Gostei!', '2018-05-21', null, null),
(null, 'Consigo fazer o mesmo com CodeIgniter?', '2018-05-22', null, null),
(null, 'React é apenas JavaScript, há uma API bem pequena para aprender, apenas algumas funções e como usálas. Depois disso, suas habilidades em JavaScript serão o que te farão um melhor desenvolvedor React', '2018-05-23', null, null);


SELECT p.id_projeto /*Filtra a pesquisa */
FROM tb_projetos as p /*Da tabela tb_projetos e apelida a mesma*/
WHERE p.id_projeto IN ( /* Está verificando se a coluna p.id_projeto está contida na subquery*/
 SELECT C.id_projeto /*Filtra a pesquisa*/
 FROM tb_comentario as C /*Da tabela tb_comentario e apelida a mesma*/
 WHERE C.id_projeto = p.id_projeto ) /*Condição => verifica se existe um vínculo entre os ID's*/
