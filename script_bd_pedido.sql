CREATE TABLE tb_cliente
(
	id_cliente  int not null primary key,
	nome       varchar(12)  not null,
	endereco   varchar(35),
	cidade     varchar(20),
	cep        char(9),
	uf         char(2),
	cnpj       char(18),
	ie         char(4)
);

CREATE TABLE tb_vendedor
(
	id_vendedor     int      not null      primary key,
	nome           varchar(12)  not null,
	salario_fixo   float,
	faixa_comissao char(1)
);

CREATE TABLE tb_produto
(
	id_produto      int     not null      primary key,
	descricao      varchar(12) not null,
	unidade        varchar(5),
	valor_unitario float,
	estoque int
);

CREATE TABLE tb_pedido
(
	id_pedido         int     not null      primary key,
	prazo_entrega    int,
	data             date,
	total	numeric(7,2),
	cod_cliente   int     REFERENCES tb_cliente(id_cliente),
	cod_vendedor  int     REFERENCES tb_vendedor(id_vendedor)
);

CREATE TABLE tb_item_pedido
(
	cod_pedido    int     not null     REFERENCES tb_pedido (id_pedido),
	cod_produto   int     not null     REFERENCES tb_produto (id_produto),
	quantidade   int,
    PRIMARY KEY (cod_pedido, cod_produto)
);

INSERT INTO `tb_cliente` (`id_cliente`, `nome`, `endereco`, `cidade`, `cep`, `uf`, `cnpj`, `ie`) VALUES
	(20, 'Alex', 'Av. Climerio n. 45', 'Sao Paulo', '25679-300', 'SP', '32.485.126/7326-08', '9280'),
	(110, 'Alexandre', 'Rua Caiapo 13', 'Curitiba', '30078-500', 'SP', '12.113.231/0001-34', NULL),
	(130, 'Edmar', 'Rua da Praia sn/', 'Salvador', '30079-300', 'BA', '23.463.284/0234-09', '7121'),
	(157, 'Roberto', 'Tv. Moraes c/3', 'Niterói', NULL, 'DF', '32.848.223/0324-02', '1923'),
	(180, 'Livio', 'Av. Beira Mar n. 1256', 'Florianopolis', NULL, 'BA', '16.786.571/2347-04', NULL),
	(222, 'Aline', 'Rua Itabira 123 Loja 9', 'Belo Horizonte', '22124-391', 'MG', '23.113.453/0001-34', '2985'),
	(234, 'Jose', 'Quadra 3 bl. 3 sl. 1003', 'Brasilia', '22841-650', 'DF', '21.763.576/1232-03', '2931');

INSERT INTO `tb_vendedor` (`id_vendedor`, `nome`, `salario_fixo`, `faixa_comissao`) VALUES
	(11, 'Joao', 2780.00, 'C'),
	(101, 'Felipe', 4600.00, 'A'),
	(111, 'Carlos', 2490.00, 'A'),
	(209, 'Jose', 1800.00, 'C'),
	(240, 'Antonio', 9500.00, 'C'),
	(250, 'Mauricio', 2930.00, 'B'),
	(310, 'Josias', 870.00, 'B');

INSERT INTO `tb_pedido` (`id_pedido`, `prazo_entrega`, `data`, `total`, `cod_cliente`, `cod_vendedor`) VALUES
	(91, 20, '2021-05-10', NULL, 20, 11),
	(97, 20, '2022-01-25', NULL, 20, 101),
	(98, 20, '2022-03-10', NULL, 110, 209),
	(101, 15, '2022-01-28', NULL, 130, 101),
	(103, 20, '2021-05-04', NULL, 130, 111),
	(104, 30, '2022-01-01', NULL, 110, 101),
	(120, 15, '2022-03-18', NULL, 220, 240);
	
INSERT INTO `tb_item_pedido` (`cod_pedido`, `cod_produto`, `quantidade`) VALUES
	(91, 77, 40),
	(97, 77, 20),
	(98, 31, 35),
	(98, 77, 5),
	(101, 13, 5),
	(103, 13, 6),
	(103, 77, 40),
	(104, 25, 10),
	(120, 13, 8);

INSERT INTO `tb_produto` (`id_produto`, `descricao`, `unidade`, `valor_unitario`, `estoque`) VALUES
	(13, 'Ouro', 'G', 300.00, 15),
	(22, 'Linho', 'M', 150.00, 200),
	(25, 'Queijo', 'Kg', 30.00, 100),
	(30, 'Acucar', 'SAC', 18.30, 350),
	(31, 'Chocolate', 'G', 5.00, 50);


